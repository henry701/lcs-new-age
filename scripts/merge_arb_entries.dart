#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:lcs_new_age/i18n/catalog_layout.dart';

Future<void> main(List<String> args) async {
  if (args.contains('--help') || args.contains('-h')) {
    _printHelp();
    return;
  }

  final locale = _requiredArg(args, 'locale');
  final sourcePath = _requiredArg(args, 'source');
  final arbDirPath = _arg(args, 'arb-dir', defaultValue: 'lib/l10n');
  final hashShards =
      int.tryParse(
        _arg(args, 'hash-shards', defaultValue: '$defaultArbCatalogShardCount'),
      ) ??
      defaultArbCatalogShardCount;

  if (hashShards <= 0) {
    print('Error: --hash-shards must be > 0');
    exit(1);
  }

  if (args.any((arg) => arg.startsWith('--target='))) {
    print(
      'Warning: --target is ignored. Entries are always routed by hash shard.',
    );
  }

  final sourceFile = File(sourcePath);
  if (!sourceFile.existsSync()) {
    print('Error: Source file not found: $sourcePath');
    exit(1);
  }

  final arbDir = Directory(arbDirPath);
  if (!arbDir.existsSync()) {
    print('Error: ARB directory not found: $arbDirPath');
    exit(1);
  }

  final localeFiles = await _findLocaleFiles(arbDir, locale);
  if (localeFiles.isEmpty) {
    print('Error: No ARB files found for locale "$locale"');
    exit(1);
  }

  final existingCatalogs = <Map<String, dynamic>>[];
  final existingByFile = <String, Map<String, dynamic>>{};
  for (final file in localeFiles) {
    try {
      final map =
          json.decode(await file.readAsString()) as Map<String, dynamic>;
      existingCatalogs.add(map);
      existingByFile[file.path.split('/').last] = map;
    } catch (e) {
      print('Error: Failed to parse ${file.path}: $e');
      exit(1);
    }
  }

  final duplicateKeys = _crossFileDuplicateKeys(existingByFile);
  if (duplicateKeys.isNotEmpty) {
    print(
      'Error: Found ${duplicateKeys.length} duplicate key(s) across locale files.',
    );
    for (final entry in duplicateKeys.entries.take(10)) {
      print('  - "${entry.key}" in ${entry.value.join(', ')}');
    }
    exit(1);
  }

  final sourceData =
      json.decode(await sourceFile.readAsString()) as Map<String, dynamic>;
  final mergedBefore = mergeArbCatalogMaps(existingCatalogs);
  final mergedAfter = mergeArbCatalogMaps([mergedBefore, sourceData]);

  int added = 0;
  int updated = 0;
  int unchanged = 0;
  for (final entry in sourceData.entries) {
    if (!mergedBefore.containsKey(entry.key)) {
      added++;
      continue;
    }
    if (mergedBefore[entry.key] == entry.value) {
      unchanged++;
    } else {
      updated++;
    }
  }

  final shards = await buildArbCatalogShards(
    locale: locale,
    catalogMaps: [mergedAfter],
    shardCount: hashShards,
  );

  await _writeCanonicalLocaleFiles(
    locale: locale,
    arbDirPath: arbDir.path,
    existingFiles: localeFiles,
    shards: shards,
  );

  print('Merged source: $sourcePath');
  print('Locale: $locale');
  print('Hash shards: $hashShards');
  print('Added: $added');
  print('Updated: $updated');
  print('Unchanged: $unchanged');
  print('Catalog files written: ${shards.length}');
  print('\nValidate with: dart run scripts/clean_arb_duplicates.dart --check');
}

void _printHelp() {
  print(
    'Merge partial ARB entries into canonical hash-sharded locale catalogs.',
  );
  print('');
  print('Usage: dart merge_arb_entries.dart [options]');
  print('');
  print('Options:');
  print('  --locale=LOCALE         Locale code (required)');
  print('  --source=PATH           Source partial ARB JSON file (required)');
  print('  --arb-dir=PATH          ARB directory (default: lib/l10n)');
  print(
    '  --hash-shards=N         Number of deterministic hash shards (default: $defaultArbCatalogShardCount)',
  );
  print('  --help, -h              Show this help message');
  print('');
  print('Notes:');
  print('  - --target is deprecated and ignored');
  print(
    '  - Output is always canonical: hash-sharded + recursively key-sorted JSON',
  );
}

Future<List<File>> _findLocaleFiles(Directory arbDir, String locale) async {
  final files = <File>[];
  await for (final entity in arbDir.list()) {
    if (entity is! File || !entity.path.endsWith('.arb')) continue;
    final name = entity.path.split('/').last;
    if (_isLocaleArbFile(name, locale)) {
      files.add(entity);
    }
  }
  files.sort((a, b) => a.path.compareTo(b.path));
  return files;
}

Map<String, List<String>> _crossFileDuplicateKeys(
  Map<String, Map<String, dynamic>> fileMaps,
) {
  final locations = <String, List<String>>{};
  for (final entry in fileMaps.entries) {
    final fileName = entry.key;
    final map = entry.value;
    for (final key in map.keys) {
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

Future<void> _writeCanonicalLocaleFiles({
  required String locale,
  required String arbDirPath,
  required List<File> existingFiles,
  required List<ArbCatalogShard> shards,
}) async {
  final expectedNames = shards.map((s) => s.fileName).toSet();

  for (final file in existingFiles) {
    final name = file.path.split('/').last;
    if (_isLocaleArbFile(name, locale) && !expectedNames.contains(name)) {
      await file.delete();
    }
  }

  const encoder = JsonEncoder.withIndent('  ');
  for (final shard in shards) {
    final file = File('$arbDirPath/${shard.fileName}');
    await file.writeAsString('${encoder.convert(shard.entries)}\n');
  }
}

bool _isLocaleArbFile(String fileName, String locale) {
  final regex = RegExp('^app_${RegExp.escape(locale)}(?:_part\\d+)?\\.arb\$');
  if (regex.hasMatch(fileName)) return true;
  return locale == 'en_US' && fileName == 'app_en.arb';
}

String _requiredArg(List<String> args, String name) {
  final value = _arg(args, name, defaultValue: '');
  if (value.isEmpty) {
    print('Error: --$name is required');
    exit(1);
  }
  return value;
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
