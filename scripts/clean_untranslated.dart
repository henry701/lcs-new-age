#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:collection';
import 'dart:convert';
import 'dart:io';

/// Extract untranslated strings from ARB files and write to a staging file.
///
/// Untranslated strings are those where:
/// - Value equals key (e.g., "Hello": "Hello")
/// - Value is an empty string
///
/// These extracted strings are written to a staging file for translation.
/// The ARB files are then cleaned to contain only properly translated strings.
///
/// Usage:
///   dart clean_untranslated.dart --locale=pt_BR
///   dart clean_untranslated.dart --locale=de --output=staging/de_pending.arb
///   dart clean_untranslated.dart --locale=pt_BR --dry-run  # Preview only

void main(List<String> args) async {
  if (args.contains('--help') || args.contains('-h')) {
    _printHelp();
    return;
  }

  // Parse arguments
  final locale = _getArg(args, 'locale', required: true);
  final outputPath = _getArg(
    args,
    'output',
    defaultValue: 'translation_workspace/untranslated_$locale.arb',
  );
  final dryRun = args.contains('--dry-run') || args.contains('--print-only');
  final arbDirPath = _getArg(args, 'arb-dir', defaultValue: 'lib/l10n/');
  final includeMetadata = !args.contains('--no-metadata');

  final arbDir = Directory(arbDirPath);
  if (!arbDir.existsSync()) {
    print('Error: ARB directory not found: $arbDirPath');
    exit(1);
  }

  // Find all ARB files for the locale
  final localeFiles = <File>[];
  await for (final entity in arbDir.list()) {
    if (entity is File && entity.path.endsWith('.arb')) {
      final filename = entity.path.split('/').last;
      if (_matchesLocale(filename, locale)) {
        localeFiles.add(entity);
      }
    }
  }

  if (localeFiles.isEmpty) {
    print('Error: No ARB files found for locale "$locale"');
    exit(1);
  }

  // Sort for deterministic processing
  localeFiles.sort((a, b) => a.path.compareTo(b.path));

  print('=== Clean Untranslated Strings ===\n');
  print('Locale: $locale');
  print('ARB directory: $arbDirPath');
  print('Output file: $outputPath');
  print('Found ${localeFiles.length} ARB file(s):');
  for (final file in localeFiles) {
    print('  - ${file.path.split('/').last}');
  }
  print('');

  // Load all ARB data
  final allData = <String, Map<String, dynamic>>{};
  for (final file in localeFiles) {
    try {
      final content = await file.readAsString();
      final jsonData = json.decode(content) as Map<String, dynamic>;
      allData[file.path] = jsonData;
    } catch (e) {
      print('Warning: Failed to parse ${file.path}: $e');
    }
  }

  // Find untranslated strings across all files
  final untranslated = <String, dynamic>{};
  final removedFromFile = <String, int>{}; // filepath -> count
  int totalUntranslated = 0;

  for (final fileEntry in allData.entries) {
    final filePath = fileEntry.key;
    final jsonData = fileEntry.value;
    int fileUntranslated = 0;

    final entries = jsonData.entries.toList();
    for (final entry in entries) {
      if (entry.key.startsWith('@')) continue;
      if (entry.value is! String) continue;

      final value = entry.value as String;
      final isUntranslated = (value == entry.key) || value.isEmpty;

      if (isUntranslated) {
        fileUntranslated++;
        totalUntranslated++;

        // Add to untranslated collection
        if (!untranslated.containsKey(entry.key)) {
          untranslated[entry.key] = entry.value;

          // Add metadata if requested and exists
          if (includeMetadata) {
            final metaKey = '@${entry.key}';
            if (jsonData.containsKey(metaKey)) {
              untranslated[metaKey] = jsonData[metaKey];
            }
          }
        }

        // Remove from source file
        jsonData.remove(entry.key);
        jsonData.remove('@${entry.key}'); // Also remove metadata
      }
    }

    if (fileUntranslated > 0) {
      removedFromFile[filePath] = fileUntranslated;
    }
  }

  print('Found $totalUntranslated untranslated string(s)\n');

  if (totalUntranslated == 0) {
    print('✓ All strings are translated! ARB files are clean.');
    return;
  }

  // Summary of what would be removed
  print('Strings to extract from each file:');
  for (final entry in removedFromFile.entries) {
    final filename = entry.key.split('/').last;
    print('  - $filename: ${entry.value} strings');
  }
  print('');

  if (dryRun) {
    print('DRY RUN - No files will be modified\n');
    print('Would write ${untranslated.length} entries to: $outputPath');
  } else {
    // Ensure output directory exists
    final outputFile = File(outputPath);
    final outputDir = outputFile.parent;
    if (!outputDir.existsSync()) {
      outputDir.createSync(recursive: true);
    }

    // Write untranslated strings to staging file
    final sortedUntranslated = SplayTreeMap<String, dynamic>.from(untranslated);
    const encoder = JsonEncoder.withIndent('  ');
    outputFile.writeAsStringSync('${encoder.convert(sortedUntranslated)}\n');
    print('Wrote ${untranslated.length} entries to: $outputPath');

    // Write cleaned ARB files
    print('\nCleaning ARB files...\n');
    for (final fileEntry in allData.entries) {
      final filePath = fileEntry.key;
      final jsonData = fileEntry.value;

      // Skip if nothing was removed
      if (!removedFromFile.containsKey(filePath)) continue;

      final sortedData = SplayTreeMap<String, dynamic>.from(jsonData);
      const encoder = JsonEncoder.withIndent('  ');
      File(filePath).writeAsStringSync('${encoder.convert(sortedData)}\n');

      final filename = filePath.split('/').last;
      print('  Cleaned: $filename (${sortedData.length} remaining entries)');
    }
  }

  print('\n=== Summary ===');
  print('Untranslated strings extracted: $totalUntranslated');
  print('Output file: $outputPath');

  if (!dryRun) {
    print('\nNext steps:');
    print('1. Edit $outputPath and translate the values');
    print(
      '2. Merge back: dart merge_arb_entries.dart --locale=$locale --source=$outputPath',
    );
    print('3. Validate: dart run scripts/clean_arb_duplicates.dart --check');
  }
}

void _printHelp() {
  print('''
Clean Untranslated Strings from ARB Files

Extracts untranslated strings (where value equals key or is empty) from ARB files
and writes them to a staging file. The ARB files are then cleaned to contain
only properly translated strings.

Usage: dart clean_untranslated.dart --locale=LOCALE [options]

Required Arguments:
  --locale=LOCALE         Locale code (e.g., pt_BR, de, en_US)

Options:
  --output=PATH           Output file for untranslated strings
                          (default: translation_workspace/untranslated_<locale>.arb)
  --arb-dir=PATH          ARB directory (default: lib/l10n/)
  --dry-run               Preview changes without modifying files
  --print-only            Alias for --dry-run
  --no-metadata           Don't include metadata (@key entries) in output
  --help, -h              Show this help message

Examples:
  # Extract untranslated strings from Portuguese ARB
  dart clean_untranslated.dart --locale=pt_BR

  # Preview what would be extracted from German
  dart clean_untranslated.dart --locale=de --dry-run

  # Custom output location
  dart clean_untranslated.dart --locale=pt_BR --output=staging/pending.arb

Workflow:
  1. Run this script to extract untranslated strings
  2. Edit the output file and translate the values
  3. Merge back: dart merge_arb_entries.dart --locale=pt_BR --source=<output>
  4. Run clean_arb_duplicates.dart --check to validate

Notes:
  - ARB files will have untranslated entries REMOVED
  - Only properly translated strings remain in ARB files
  - Untranslated strings are saved for later translation
  - Metadata (@key entries) are included by default
''');
}

String _getArg(
  List<String> args,
  String name, {
  String? defaultValue,
  bool required = false,
}) {
  final prefix = '--$name=';
  final arg = args.firstWhere((a) => a.startsWith(prefix), orElse: () => '');
  if (arg.isNotEmpty) {
    return arg.substring(prefix.length);
  }
  if (required) {
    print('Error: --$name is required');
    exit(1);
  }
  return defaultValue ?? '';
}

bool _matchesLocale(String filename, String locale) {
  if (filename.startsWith('app_$locale') ||
      filename.startsWith('app_${locale.replaceAll('_', '-')}') ||
      (locale == 'en_US' && filename == 'app_en.arb')) {
    return true;
  }
  return false;
}
