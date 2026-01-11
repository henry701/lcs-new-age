#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  if (args.contains('--help') || args.contains('-h')) {
    print('Merge partial ARB JSON entries into ARB file(s) for a locale');
    print('');
    print('Usage: dart merge_arb_entries.dart [options]');
    print('');
    print('Options:');
    print('  --locale=LOCALE         Locale code (e.g., pt_BR, de) (required)');
    print('  --source=PATH          Path to partial ARB JSON file (required)');
    print(
      '  --target=PATH          Target ARB file (optional, defaults to primary file)',
    );
    print('  --arb-dir=PATH         ARB directory (default: lib/l10n/)');
    print('  --help, -h             Show this help message');
    print('');
    print('Notes:');
    print(
      '  - If --target is not specified, script merges into primary file (app_<locale>.arb)',
    );
    print(
      '  - Script checks for duplicates across all files for the locale before merging',
    );
    print('  - Existing keys in target file are updated, new keys are added');
    print('');
    print('Example:');
    print(
      '  dart merge_arb_entries.dart --locale=pt_BR --source=untranslated_pt_BR.arb',
    );
    print(
      '  dart merge_arb_entries.dart --locale=pt_BR --source=partial.arb --target=lib/l10n/app_pt_BR_part1.arb',
    );
    return;
  }

  // Parse arguments
  String locale = '';
  String sourcePath = '';
  String targetPath = '';
  String arbDirPath = 'lib/l10n/';

  for (final arg in args) {
    if (arg.startsWith('--locale=')) {
      locale = arg.split('=')[1];
    } else if (arg.startsWith('--source=')) {
      sourcePath = arg.split('=')[1];
    } else if (arg.startsWith('--target=')) {
      targetPath = arg.split('=')[1];
    } else if (arg.startsWith('--arb-dir=')) {
      arbDirPath = arg.split('=')[1];
    }
  }

  if (locale.isEmpty) {
    print('Error: --locale=LOCALE is required');
    exit(1);
  }

  if (sourcePath.isEmpty) {
    print('Error: --source=PATH is required');
    exit(1);
  }

  print('Reading source file: $sourcePath');
  print('Locale: $locale\n');

  final sourceFile = File(sourcePath);
  if (!await sourceFile.exists()) {
    print('Error: Source file not found: $sourcePath');
    exit(1);
  }

  // Find all ARB files for locale
  final arbDir = Directory(arbDirPath);
  if (!await arbDir.exists()) {
    print('Error: ARB directory not found: $arbDirPath');
    exit(1);
  }

  final localeFiles = <File>[];
  await for (final entity in arbDir.list()) {
    if (entity is File && entity.path.endsWith('.arb')) {
      final filename = entity.path.split('/').last;
      if (filename.startsWith('app_$locale') ||
          filename.startsWith('app_${locale.replaceAll('_', '-')}') ||
          (locale == 'en_US' && filename == 'app_en.arb')) {
        localeFiles.add(entity);
      }
    }
  }

  if (localeFiles.isEmpty) {
    print('Error: No ARB files found for locale "$locale"');
    exit(1);
  }

  print('Found ${localeFiles.length} ARB file(s) for locale $locale:');

  // Determine target file
  File targetFile;
  if (targetPath.isEmpty) {
    // Default to primary file (app_<locale>.arb)
    targetFile = localeFiles.firstWhere(
      (f) => f.path.split('/').last == 'app_$locale.arb',
      orElse: () => localeFiles.first,
    );
    print('Auto-selected target: ${targetFile.path.split('/').last}');
  } else {
    targetFile = File(targetPath);
    if (!await targetFile.exists()) {
      print('Error: Target file not found: $targetPath');
      exit(1);
    }
    print('Using specified target: ${targetFile.path.split('/').last}');
  }

  // Load all locale files to check for duplicates
  final allLocaleData = <String, Map<String, dynamic>>{};
  for (final file in localeFiles) {
    try {
      final content = await file.readAsString();
      final jsonData = json.decode(content) as Map<String, dynamic>;
      allLocaleData[file.path.split('/').last] = jsonData;
      print('  - ${file.path.split('/').last} (${jsonData.length} entries)');
    } catch (e) {
      print('  Warning: Failed to parse ${file.path}: $e');
    }
  }

  print('');

  // Read source file
  final sourceContent = await sourceFile.readAsString();
  Map<String, dynamic> sourceData;

  try {
    sourceData = json.decode(sourceContent) as Map<String, dynamic>;
  } catch (e) {
    print('Error: Failed to parse source JSON: $e');
    exit(1);
  }

  // Check for duplicates across locale files
  print('Checking for duplicates across locale files...');
  final duplicateKeys = <String, List<String>>{};
  for (final entry in sourceData.entries) {
    if (entry.key.startsWith('@')) continue; // Skip metadata

    for (final fileEntry in allLocaleData.entries) {
      final filename = fileEntry.key;
      final fileData = fileEntry.value;
      if (fileData.containsKey(entry.key) &&
          filename != targetFile.path.split('/').last) {
        duplicateKeys.putIfAbsent(entry.key, () => []);
        duplicateKeys[entry.key]!.add(filename);
      }
    }
  }

  if (duplicateKeys.isNotEmpty) {
    print('');
    print(
      'ERROR: Found ${duplicateKeys.length} keys that exist in other files:',
    );
    for (final entry in duplicateKeys.entries.take(5)) {
      print('  - "${entry.key}" exists in: ${entry.value.join(", ")}');
    }
    if (duplicateKeys.length > 5) {
      print('  ... and ${duplicateKeys.length - 5} more');
    }
    print('');
    print('Keys must be unique across all files for a locale.');
    print('Please resolve duplicates manually before merging.');
    exit(1);
  }

  print('No duplicates found. Proceeding with merge...\n');

  // Get target data
  final targetData = allLocaleData[targetFile.path.split('/').last]!;

  // Merge source entries into target
  int mergedCount = 0;
  int skippedCount = 0;

  for (final entry in sourceData.entries) {
    if (targetData.containsKey(entry.key)) {
      // Key already exists - update value
      if (targetData[entry.key] != entry.value) {
        targetData[entry.key] = entry.value;
        mergedCount++;
      } else {
        skippedCount++;
      }
    } else {
      // New key - add to target
      targetData[entry.key] = entry.value;
      mergedCount++;
    }
  }

  print('Merge results:');
  print('  Merged/updated: $mergedCount entries');
  print('  Skipped (identical): $skippedCount entries');
  print('  Total entries in target: ${targetData.length}');

  // Sort keys alphabetically for clean diffs
  final sortedTarget = Map<String, dynamic>.fromEntries(
    targetData.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
  );

  // Write back to target file with proper formatting
  const encoder = JsonEncoder.withIndent('  ');
  await targetFile.writeAsString(encoder.convert(sortedTarget) + '\n');

  print('');
  print(
    'Successfully wrote merged entries to: ${targetFile.path.split('/').last}',
  );
  print('');
  print('Next steps:');
  print('1. Verify translations with: flutter test test/i18n_test.dart');
  print(
    '2. Validate no duplicates: dart run scripts/clean_arb_duplicates.dart',
  );
  print('3. Repeat process for next batch');
}
