#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:lcs_new_age/i18n/catalog_layout.dart';

Future<void> main(List<String> args) async {
  final fixMode = args.contains('--fix');
  final checkMode = args.contains('--check') || !fixMode;
  final arbDirPath = _arg(args, 'arb-dir', defaultValue: 'lib/l10n');
  final hashShards =
      int.tryParse(
        _arg(args, 'hash-shards', defaultValue: '$defaultArbCatalogShardCount'),
      ) ??
      defaultArbCatalogShardCount;
  final localeArgs = args
      .where((arg) => arg.startsWith('--locale='))
      .map((arg) => arg.substring('--locale='.length))
      .toSet();

  if (hashShards <= 0) {
    print('Error: --hash-shards must be > 0');
    exit(1);
  }

  final arbDir = Directory(arbDirPath);
  if (!arbDir.existsSync()) {
    print('Error: ARB directory not found: $arbDirPath');
    exit(1);
  }

  final localeFiles = await _collectLocaleFiles(arbDir);
  if (localeFiles.isEmpty) {
    print('No ARB files found in $arbDirPath');
    return;
  }

  final locales = localeFiles.keys.toList()..sort();
  final selectedLocales =
      localeArgs.isEmpty ? locales : locales.where(localeArgs.contains).toList()
        ..sort();

  if (selectedLocales.isEmpty) {
    print('No matching locales for --locale filters: ${localeArgs.join(", ")}');
    return;
  }

  print('=== ARB Catalog Validation ===');
  print('Mode: ${fixMode ? "fix" : "check"}');
  print('Hash shards: $hashShards');
  print('Locales: ${selectedLocales.join(", ")}\n');

  int localesWithErrors = 0;
  int localesChanged = 0;

  for (final locale in selectedLocales) {
    final files = localeFiles[locale]!
      ..sort((a, b) => a.path.compareTo(b.path));
    final result = await _processLocale(
      locale: locale,
      files: files,
      arbDirPath: arbDir.path,
      hashShards: hashShards,
      checkMode: checkMode,
      fixMode: fixMode,
    );

    if (result.hadErrors) {
      localesWithErrors++;
    }
    if (result.changed) {
      localesChanged++;
    }
  }

  print('\n=== Summary ===');
  print('Locales processed: ${selectedLocales.length}');
  print('Locales changed: $localesChanged');
  print('Locales with errors: $localesWithErrors');

  if (localesWithErrors > 0) {
    exit(1);
  }
}

Future<_LocaleProcessResult> _processLocale({
  required String locale,
  required List<File> files,
  required String arbDirPath,
  required int hashShards,
  required bool checkMode,
  required bool fixMode,
}) async {
  print('Locale: $locale (${files.length} file(s))');

  final fileMaps = <String, Map<String, dynamic>>{};
  for (final file in files) {
    final fileName = file.path.split('/').last;
    try {
      final map =
          json.decode(await file.readAsString()) as Map<String, dynamic>;
      fileMaps[fileName] = map;
    } catch (e) {
      print('  ERROR: Failed to parse $fileName: $e');
      return const _LocaleProcessResult(hadErrors: true, changed: false);
    }
  }

  final duplicates = _findCrossFileDuplicates(fileMaps);
  if (duplicates.isNotEmpty) {
    print('  ERROR: ${duplicates.length} duplicate key(s) across files');
    for (final entry in duplicates.entries.take(10)) {
      print('    - "${entry.key}" in ${entry.value.join(", ")}');
    }
    return const _LocaleProcessResult(hadErrors: true, changed: false);
  }

  final merged = mergeArbCatalogMaps(fileMaps.values);
  final expectedShards = await buildArbCatalogShards(
    locale: locale,
    catalogMaps: [merged],
    shardCount: hashShards,
  );

  const encoder = JsonEncoder.withIndent('  ');
  final expectedContent = <String, String>{
    for (final shard in expectedShards)
      shard.fileName: '${encoder.convert(shard.entries)}\n',
  };

  final currentContent = <String, String>{};
  for (final file in files) {
    final name = file.path.split('/').last;
    currentContent[name] = await file.readAsString();
  }

  final expectedNames = expectedContent.keys.toSet();
  final currentNames = currentContent.keys.toSet();
  final missingFiles = expectedNames.difference(currentNames).toList()..sort();
  final extraFiles = currentNames.difference(expectedNames).toList()..sort();

  final changedFiles = <String>[];
  for (final name
      in expectedNames.intersection(currentNames).toList()..sort()) {
    if (currentContent[name] != expectedContent[name]) {
      changedFiles.add(name);
    }
  }

  final hasDrift =
      missingFiles.isNotEmpty ||
      extraFiles.isNotEmpty ||
      changedFiles.isNotEmpty;

  if (!hasDrift) {
    print('  OK: canonical');
    return const _LocaleProcessResult(hadErrors: false, changed: false);
  }

  if (checkMode) {
    print('  ERROR: catalog layout drift detected');
    if (missingFiles.isNotEmpty) {
      print('    Missing files: ${missingFiles.join(", ")}');
    }
    if (extraFiles.isNotEmpty) {
      print('    Unexpected files: ${extraFiles.join(", ")}');
    }
    if (changedFiles.isNotEmpty) {
      print(
        '    Files needing canonical sort/partition: ${changedFiles.join(", ")}',
      );
    }
    print(
      '    Fix with: dart run scripts/clean_arb_duplicates.dart --fix --locale=$locale',
    );
    return const _LocaleProcessResult(hadErrors: true, changed: false);
  }

  if (!fixMode) {
    return const _LocaleProcessResult(hadErrors: true, changed: false);
  }

  for (final name in extraFiles) {
    await File('$arbDirPath/$name').delete();
  }
  for (final entry in expectedContent.entries) {
    await File('$arbDirPath/${entry.key}').writeAsString(entry.value);
  }

  print(
    '  FIXED: wrote ${expectedContent.length} file(s), removed ${extraFiles.length}',
  );
  return const _LocaleProcessResult(hadErrors: false, changed: true);
}

Future<Map<String, List<File>>> _collectLocaleFiles(Directory arbDir) async {
  final localeFiles = <String, List<File>>{};
  await for (final entity in arbDir.list()) {
    if (entity is! File || !entity.path.endsWith('.arb')) continue;
    final fileName = entity.path.split('/').last;
    final locale = _extractLocale(fileName);
    if (locale == null) continue;
    localeFiles.putIfAbsent(locale, () => <File>[]).add(entity);
  }
  return localeFiles;
}

Map<String, List<String>> _findCrossFileDuplicates(
  Map<String, Map<String, dynamic>> fileMaps,
) {
  final locations = <String, List<String>>{};
  for (final fileEntry in fileMaps.entries) {
    final fileName = fileEntry.key;
    for (final key in fileEntry.value.keys) {
      locations.putIfAbsent(key, () => <String>[]).add(fileName);
    }
  }

  final duplicates = <String, List<String>>{};
  for (final entry in locations.entries) {
    if (entry.value.length > 1) {
      duplicates[entry.key] = entry.value;
    }
  }
  return duplicates;
}

String? _extractLocale(String fileName) {
  final match = RegExp(
    r'^app_([A-Za-z0-9_]+?)(?:_part\d+)?\.arb$',
  ).firstMatch(fileName);
  if (match == null) return null;
  return match.group(1);
}

String _arg(List<String> args, String name, {required String defaultValue}) {
  final prefix = '--$name=';
  for (final arg in args) {
    if (arg.startsWith(prefix)) {
      return arg.substring(prefix.length);
    }
  }
  return defaultValue;
}

class _LocaleProcessResult {
  const _LocaleProcessResult({required this.hadErrors, required this.changed});

  final bool hadErrors;
  final bool changed;
}
