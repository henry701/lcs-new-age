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

  final catalogFiles = await _collectCatalogFiles(arbDir);
  final localeFiles = catalogFiles.partFiles;
  final legacyFiles = catalogFiles.legacyPrimaryFiles;

  if (localeFiles.isEmpty && legacyFiles.isEmpty) {
    print('No ARB catalog files found in $arbDirPath');
    return;
  }

  final locales = {...localeFiles.keys, ...legacyFiles.keys}.toList()..sort();
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
    final files = (localeFiles[locale] ?? <File>[])
      ..sort((a, b) => a.path.compareTo(b.path));
    final localeLegacyFiles = (legacyFiles[locale] ?? <File>[])
      ..sort((a, b) => a.path.compareTo(b.path));
    final result = await _processLocale(
      locale: locale,
      files: files,
      legacyFiles: localeLegacyFiles,
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
  required List<File> legacyFiles,
  required String arbDirPath,
  required int hashShards,
  required bool checkMode,
  required bool fixMode,
}) async {
  print(
    'Locale: $locale (${files.length} shard file(s), ${legacyFiles.length} legacy file(s))',
  );

  if (files.isEmpty && legacyFiles.isNotEmpty) {
    final maxPart = hashShards.toString().padLeft(2, '0');
    print(
      '  ERROR: Only legacy unlabeled files found. Expected app_${locale}_part01..part$maxPart.arb',
    );
    print('  Manual migration required to avoid losing data.');
    return const _LocaleProcessResult(hadErrors: true, changed: false);
  }

  if (legacyFiles.isNotEmpty && checkMode) {
    final names = legacyFiles.map((f) => f.path.split('/').last).join(', ');
    print('  ERROR: Legacy unlabeled files are forbidden: $names');
    print(
      '    Fix with: dart run scripts/maintain_arb_catalogs.dart --fix --locale=$locale',
    );
    return const _LocaleProcessResult(hadErrors: true, changed: false);
  }

  bool changedLegacy = false;
  if (legacyFiles.isNotEmpty && fixMode) {
    for (final file in legacyFiles) {
      await file.delete();
      changedLegacy = true;
    }
    print('  FIXED: removed ${legacyFiles.length} legacy unlabeled file(s)');
  }

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
    return _LocaleProcessResult(hadErrors: false, changed: changedLegacy);
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
      '    Fix with: dart run scripts/maintain_arb_catalogs.dart --fix --locale=$locale',
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

Future<_CatalogFileScan> _collectCatalogFiles(Directory arbDir) async {
  final partFiles = <String, List<File>>{};
  final legacyPrimaryFiles = <String, List<File>>{};
  await for (final entity in arbDir.list()) {
    if (entity is! File || !entity.path.endsWith('.arb')) continue;
    final fileName = entity.path.split('/').last;
    final partLocale = _extractLocaleFromPart(fileName);
    if (partLocale != null) {
      partFiles.putIfAbsent(partLocale, () => <File>[]).add(entity);
      continue;
    }

    final legacyLocale = _extractLocaleFromLegacy(fileName);
    if (legacyLocale != null) {
      legacyPrimaryFiles.putIfAbsent(legacyLocale, () => <File>[]).add(entity);
    }
  }
  return _CatalogFileScan(
    partFiles: partFiles,
    legacyPrimaryFiles: legacyPrimaryFiles,
  );
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

String? _extractLocaleFromPart(String fileName) {
  final match = RegExp(
    r'^app_([A-Za-z0-9_]+?)_part\d{2}\.arb$',
  ).firstMatch(fileName);
  if (match == null) return null;
  return match.group(1);
}

String? _extractLocaleFromLegacy(String fileName) {
  final match = RegExp(r'^app_([A-Za-z0-9_]+?)\.arb$').firstMatch(fileName);
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

class _CatalogFileScan {
  const _CatalogFileScan({
    required this.partFiles,
    required this.legacyPrimaryFiles,
  });

  final Map<String, List<File>> partFiles;
  final Map<String, List<File>> legacyPrimaryFiles;
}
