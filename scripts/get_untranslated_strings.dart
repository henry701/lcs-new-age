#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  if (args.contains('--help') || args.contains('-h')) {
    print('Get untranslated strings from ARB file(s) for a locale');
    print('');
    print('Usage: dart get_untranslated_strings.dart [options]');
    print('');
    print('Options:');
    print('  --locale=LOCALE         Locale code (e.g., pt_BR, de) (required)');
    print(
      '  --output=PATH          Path to output partial ARB JSON (default: untranslated_<locale>.arb)',
    );
    print(
      '  --limit=N               Maximum number of strings to extract (default: 100)',
    );
    print('  --arb-dir=PATH          ARB directory (default: lib/l10n/)');
    print('  --help, -h              Show this help message');
    print('');
    print('Note: This script scans ALL ARB files for the specified locale.');
    print('Untranslated strings are those where:');
    print('  - Value equals key (default placeholder)');
    print('  - Value is an empty string');
    print('');
    print('Example:');
    print('  dart get_untranslated_strings.dart --locale=pt_BR --limit=50');
    return;
  }

  // Parse arguments
  String locale = '';
  String outputPath = '';
  int limit = 100;
  String arbDirPath = 'lib/l10n/';

  for (final arg in args) {
    if (arg.startsWith('--locale=')) {
      locale = arg.split('=')[1];
    } else if (arg.startsWith('--output=')) {
      outputPath = arg.split('=')[1];
    } else if (arg.startsWith('--limit=')) {
      limit = int.tryParse(arg.split('=')[1]) ?? 100;
    } else if (arg.startsWith('--arb-dir=')) {
      arbDirPath = arg.split('=')[1];
    }
  }

  if (locale.isEmpty) {
    print('Error: --locale=LOCALE is required');
    exit(1);
  }

  if (outputPath.isEmpty) {
    outputPath = 'untranslated_$locale.arb';
  }

  print('Scanning ARB files for locale: $locale');
  print('Output will be saved to: $outputPath');
  print('Limit: $limit strings\n');

  final arbDir = Directory(arbDirPath);
  if (!await arbDir.exists()) {
    print('Error: ARB directory not found: $arbDirPath');
    exit(1);
  }

  // Find all ARB files for the locale
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
  for (final file in localeFiles) {
    print('  - ${file.path.split('/').last}');
  }
  print('');

  // Load and merge all ARB files for the locale
  final mergedArbData = <String, dynamic>{};
  final fileKeyMap = <String, String>{}; // Track which file each key came from

  for (final file in localeFiles) {
    try {
      final content = await file.readAsString();
      final jsonData = json.decode(content) as Map<String, dynamic>;

      for (final entry in jsonData.entries) {
        if (mergedArbData.containsKey(entry.key)) {
          print(
            'WARNING: Duplicate key "${entry.key}" found in ${file.path.split('/').last}',
          );
          print('  Previously found in: ${fileKeyMap[entry.key]}');
        } else {
          mergedArbData[entry.key] = entry.value;
          fileKeyMap[entry.key] = file.path.split('/').last;
        }
      }
    } catch (e) {
      print('Error: Failed to parse ${file.path}: $e');
    }
  }

  print('Loaded ${mergedArbData.length} total entries from all files\n');

  // Find untranslated strings
  final untranslated = <String, dynamic>{};
  int count = 0;
  int totalUntranslated = 0;

  for (final entry in mergedArbData.entries) {
    // Skip metadata entries (starting with @)
    if (entry.key.startsWith('@')) continue;

    // Skip if value is not a string (could be nested object for pluralization)
    if (entry.value is! String) continue;

    final value = entry.value as String;

    // Check if untranslated:
    // 1. Value equals key (default placeholder)
    // 2. Value is empty string
    final bool isUntranslated = (value == entry.key) || value.isEmpty;

    if (isUntranslated) {
      totalUntranslated++;

      if (count < limit) {
        untranslated[entry.key] = entry.value;

        // Also copy metadata entry if it exists
        final metaKey = '@${entry.key}';
        if (mergedArbData.containsKey(metaKey)) {
          untranslated[metaKey] = mergedArbData[metaKey];
        }

        count++;
      }
    }
  }

  print('Found $totalUntranslated untranslated strings (extracting $count)');

  if (count == 0) {
    print('No untranslated strings found!');
    print('All strings appear to be translated.');
    return;
  }

  // Write output
  final outputFile = File(outputPath);
  const encoder = JsonEncoder.withIndent('  ');
  await outputFile.writeAsString(encoder.convert(untranslated) + '\n');

  print('Wrote $count entries to: $outputPath');
  print('');
  print('Next steps:');
  print('1. Translate strings in $outputPath');
  print(
    '2. Merge using: dart merge_arb_entries.dart --locale=$locale --source=$outputPath',
  );
}
