#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:collection';
import 'dart:convert';
import 'dart:io';

/// Unified ARB maintenance script for LCS New Age translation workflow.
///
/// This script combines the functionality of:
/// - clean_arb_duplicates.dart (deduplication)
/// - find_translatable_strings.dart (splitting)
/// - get_untranslated_strings.dart (extraction)
///
/// All operations are deterministic and can be run periodically.

void main(List<String> args) async {
  if (args.contains('--help') || args.contains('-h') || args.isEmpty) {
    _printHelp();
    return;
  }

  // Parse arguments
  final locale = _getArg(args, 'locale', required: true);
  final operation = _getArg(args, 'operation', defaultValue: 'maintain');
  final maxEntries =
      int.tryParse(_getArg(args, 'max-entries', defaultValue: '400')) ?? 400;
  final dryRun = args.contains('--dry-run') || args.contains('--print-only');
  final extractUntranslated = args.contains('--extract-untranslated');
  final untranslatedOutput = _getArg(
    args,
    'untranslated-output',
    defaultValue: 'untranslated_$locale.arb',
  );

  final arbDirPath = _getArg(args, 'arb-dir', defaultValue: 'lib/l10n/');

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

  // Sort files by name for deterministic processing
  localeFiles.sort((a, b) => a.path.compareTo(b.path));

  print('=== ARB Maintenance for locale: $locale ===\n');
  print('Found ${localeFiles.length} ARB file(s):');
  for (final file in localeFiles) {
    print('  - ${file.path.split('/').last}');
  }
  print('');

  // Load and merge all ARB data
  final (mergedData, sourceInfo) = await _loadAndMergeArbFiles(localeFiles);

  print('Loaded ${mergedData.length} total entries\n');

  switch (operation) {
    case 'maintain':
      await _maintainArb(
        localeFiles,
        mergedData,
        sourceInfo,
        locale,
        arbDirPath,
        maxEntries,
        dryRun,
        extractUntranslated,
        untranslatedOutput,
      );
      return;

    case 'dedupe':
      await _deduplicateOnly(localeFiles, mergedData, locale, dryRun);
      return;

    case 'split':
      await _splitArb(
        localeFiles,
        mergedData,
        locale,
        arbDirPath,
        maxEntries,
        dryRun,
      );
      return;

    case 'extract-untranslated':
      await _extractUntranslatedOnly(mergedData, untranslatedOutput, dryRun);
      return;

    default:
      print('Error: Unknown operation "$operation"');
      print('Valid operations: maintain, dedupe, split, extract-untranslated');
      exit(1);
  }
}

void _printHelp() {
  print('''
ARB Maintenance Script for LCS New Age

This script provides a unified interface for all ARB file maintenance tasks:
- Deduplicate entries within and across files
- Split large ARB files into smaller, deterministic chunks
- Extract untranslated strings to separate files
- Clean up ARB files for translation workflow

Usage: dart maintain_translations.dart --locale=LOCALE [options]

Required Arguments:
  --locale=LOCALE         Locale code (e.g., pt_BR, de, en_US)

Operation Arguments (choose one, defaults to 'maintain'):
  --operation=maintain    Full maintenance: dedupe + split + optional extraction (default)
  --operation=dedupe      Only deduplicate entries within/across files
  --operation=split       Only split ARB files into chunks
  --operation=extract-untranslated  Only extract untranslated strings

Options:
  --max-entries=N         Max entries per ARB file (default: 400)
  --arb-dir=PATH          ARB directory (default: lib/l10n/)
  --dry-run               Print changes without writing files
  --print-only            Alias for --dry-run
  --extract-untranslated  Extract untranslated strings to separate file
  --untranslated-output=PATH  Output path for untranslated strings
  --help, -h              Show this help message

Examples:
  # Full maintenance with untranslated extraction
  dart maintain_translations.dart --locale=pt_BR --extract-untranslated

  # Dry run to see what would change
  dart maintain_translations.dart --locale=de --dry-run

  # Only deduplicate (no splitting)
  dart maintain_translations.dart --locale=pt_BR --operation=dedupe

  # Only split into smaller files
  dart maintain_translations.dart --locale=pt_BR --operation=split --max-entries=200

  # Only extract untranslated strings
  dart maintain_translations.dart --locale=pt_BR --operation=extract-untranslated

Output Files:
  - app_<locale>.arb          Primary ARB file (always kept)
  - app_<locale>_part<N>.arb  Additional split files if needed
  - untranslated_<locale>.arb Untranslated strings (if --extract-untranslated)

Deterministic Splitting:
  Strings are sorted alphabetically and distributed evenly.
  Same input always produces same output - safe for CI/CD.
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

Future<(Map<String, dynamic>, Map<String, String>)> _loadAndMergeArbFiles(
  List<File> localeFiles,
) async {
  final mergedData = <String, dynamic>{};
  final sourceInfo = <String, String>{}; // key -> filename

  for (final file in localeFiles) {
    try {
      final content = await file.readAsString();
      final jsonData = json.decode(content) as Map<String, dynamic>;

      for (final entry in jsonData.entries) {
        if (!mergedData.containsKey(entry.key)) {
          mergedData[entry.key] = entry.value;
          sourceInfo[entry.key] = file.path.split('/').last;
        }
      }
    } catch (e) {
      print('Warning: Failed to parse ${file.path}: $e');
    }
  }

  return (mergedData, sourceInfo);
}

Future<void> _maintainArb(
  List<File> localeFiles,
  Map<String, dynamic> mergedData,
  Map<String, String> sourceInfo,
  String locale,
  String arbDirPath,
  int maxEntries,
  bool dryRun,
  bool extractUntranslated,
  String untranslatedOutput,
) async {
  print('=== Step 1: Deduplicating entries ===\n');

  // Check for cross-file duplicates
  final keyLocations = <String, List<String>>{};
  for (final entry in mergedData.entries) {
    if (!entry.key.startsWith('@')) {
      keyLocations.putIfAbsent(entry.key, () => []);
    }
  }

  // Count entries per file
  for (final file in localeFiles) {
    final content = file.readAsStringSync();
    final jsonData = json.decode(content) as Map<String, dynamic>;
    for (final entry in jsonData.entries) {
      if (!entry.key.startsWith('@')) {
        keyLocations[entry.key]?.add(file.path.split('/').last);
      }
    }
  }

  final crossFileDupes = <String, List<String>>{};
  for (final entry in keyLocations.entries) {
    if (entry.value.length > 1) {
      crossFileDupes[entry.key] = entry.value;
    }
  }

  if (crossFileDupes.isNotEmpty) {
    print('ERROR: Found ${crossFileDupes.length} duplicate keys across files:');
    for (final entry in crossFileDupes.entries.take(5)) {
      print('  - "${entry.key}" in: ${entry.value.join(', ')}');
    }
    if (crossFileDupes.length > 5) {
      print('  ... and ${crossFileDupes.length - 5} more');
    }
    print('\nPlease resolve manually before running maintain.');
    exit(1);
  }

  print('No cross-file duplicates found.\n');

  // Extract untranslated strings if requested
  if (extractUntranslated) {
    print('=== Step 2: Extracting untranslated strings ===\n');
    await _extractUntranslatedOnly(mergedData, untranslatedOutput, dryRun);
  }

  print('=== Step 3: Splitting into deterministic chunks ===\n');

  // Separate metadata entries from translation entries
  final translations = <String, dynamic>{};
  final metadata = <String, dynamic>{};

  for (final entry in mergedData.entries) {
    if (entry.key.startsWith('@')) {
      metadata[entry.key] = entry.value;
    } else {
      translations[entry.key] = entry.value;
    }
  }

  // Sort translations alphabetically for deterministic output
  final sortedTranslations = SplayTreeMap<String, dynamic>.from(translations);

  // Calculate how many files we need
  final entryCount = sortedTranslations.length;
  final fileCount = (entryCount / maxEntries).ceil();

  print('Total translations: $entryCount');
  print('Max entries per file: $maxEntries');
  print('Files needed: $fileCount\n');

  // Distribute entries into files
  final fileData = <String, Map<String, dynamic>>{};
  final fileNames = <String>[];

  // Primary file always exists
  final primaryFileName = 'app_$locale.arb';
  fileNames.add(primaryFileName);
  fileData[primaryFileName] = {};

  // Create additional part files if needed
  for (int i = 2; i <= fileCount; i++) {
    final partFileName = 'app_${locale}_part$i.arb';
    fileNames.add(partFileName);
    fileData[partFileName] = {};
  }

  // Distribute entries round-robin
  final entries = sortedTranslations.entries.toList();
  for (int i = 0; i < entries.length; i++) {
    final fileIndex = i % fileCount;
    final targetFile = fileNames[fileIndex];
    final entry = entries[i];

    fileData[targetFile]![entry.key] = entry.value;

    // Add corresponding metadata if exists
    final metaKey = '@${entry.key}';
    if (metadata.containsKey(metaKey)) {
      fileData[targetFile]![metaKey] = metadata[metaKey];
    }
  }

  // Write files
  if (dryRun) {
    print('DRY RUN - No files written:\n');
    for (final fileName in fileNames) {
      print('  $fileName: ${fileData[fileName]!.length} entries');
    }
  } else {
    print('Writing files...\n');

    // Remove old part files that are no longer needed
    final existingPartFiles = localeFiles.where((f) {
      final name = f.path.split('/').last;
      return name.startsWith('app_${locale}_part') && !fileNames.contains(name);
    });

    for (final oldFile in existingPartFiles) {
      print('  Removing obsolete: ${oldFile.path.split('/').last}');
      oldFile.deleteSync();
    }

    // Write updated files
    for (final fileName in fileNames) {
      final filePath = '$arbDirPath/$fileName';
      final sortedData = SplayTreeMap<String, dynamic>.from(
        fileData[fileName]!,
      );

      const encoder = JsonEncoder.withIndent('  ');
      File(filePath).writeAsStringSync('${encoder.convert(sortedData)}\n');
      print('  Wrote: $fileName (${sortedData.length} entries)');
    }
  }

  print('\n=== Summary ===');
  print('Primary file: app_$locale.arb');
  if (fileCount > 1) {
    print('Additional files: ${fileNames.length - 1} part file(s)');
  }
  if (extractUntranslated && !dryRun) {
    print('Untranslated extracted to: $untranslatedOutput');
  }

  if (!dryRun) {
    print('\nNext steps:');
    print('1. Validate: dart run scripts/clean_arb_duplicates.dart --check');
    print('2. Test: flutter test test/i18n_test.dart');
    if (extractUntranslated) {
      print('3. Translate: Edit $untranslatedOutput then run merge script');
    }
  }
}

Future<void> _deduplicateOnly(
  List<File> localeFiles,
  Map<String, dynamic> mergedData,
  String locale,
  bool dryRun,
) async {
  print('=== Deduplication Mode ===\n');

  int totalRemoved = 0;

  // Deduplicate within each file
  for (final file in localeFiles) {
    final content = file.readAsStringSync();
    final jsonData = json.decode(content) as Map<String, dynamic>;
    final originalCount = jsonData.length;

    final seenKeys = <String>{};
    final cleanedData = <String, dynamic>{};

    // Process in reverse to keep last occurrence
    for (final entry in jsonData.entries.toList().reversed) {
      if (!seenKeys.contains(entry.key)) {
        cleanedData[entry.key] = entry.value;
        seenKeys.add(entry.key);
      }
    }

    final removed = originalCount - cleanedData.length;
    totalRemoved += removed;

    if (!dryRun && removed > 0) {
      final sortedData = SplayTreeMap<String, dynamic>.from(cleanedData);
      const encoder = JsonEncoder.withIndent('  ');
      file.writeAsStringSync('${encoder.convert(sortedData)}\n');
    }
  }

  if (dryRun) {
    print('DRY RUN - Would remove $totalRemoved duplicate entries');
  } else {
    print('Removed $totalRemoved duplicate entries');
    print('\nValidation: Run clean_arb_duplicates.dart --check to verify');
  }
}

Future<void> _splitArb(
  List<File> localeFiles,
  Map<String, dynamic> mergedData,
  String locale,
  String arbDirPath,
  int maxEntries,
  bool dryRun,
) async {
  print('=== Split Mode ===\n');

  // Separate translations from metadata
  final translations = <String, dynamic>{};
  final metadata = <String, dynamic>{};

  for (final entry in mergedData.entries) {
    if (entry.key.startsWith('@')) {
      metadata[entry.key] = entry.value;
    } else {
      translations[entry.key] = entry.value;
    }
  }

  final sortedTranslations = SplayTreeMap<String, dynamic>.from(translations);
  final entryCount = sortedTranslations.length;
  final fileCount = (entryCount / maxEntries).ceil();

  print('Total translations: $entryCount');
  print('Max entries per file: $maxEntries');
  print('Output files: $fileCount\n');

  final fileData = <String, Map<String, dynamic>>{};
  final fileNames = <String>[];

  // Primary file
  fileNames.add('app_$locale.arb');
  fileData['app_$locale.arb'] = {};

  // Additional files
  for (int i = 2; i <= fileCount; i++) {
    final name = 'app_${locale}_part$i.arb';
    fileNames.add(name);
    fileData[name] = {};
  }

  // Distribute
  final entries = sortedTranslations.entries.toList();
  for (int i = 0; i < entries.length; i++) {
    final fileIndex = i % fileCount;
    final targetFile = fileNames[fileIndex];
    final entry = entries[i];

    fileData[targetFile]![entry.key] = entry.value;

    final metaKey = '@${entry.key}';
    if (metadata.containsKey(metaKey)) {
      fileData[targetFile]![metaKey] = metadata[metaKey];
    }
  }

  if (dryRun) {
    print('DRY RUN - Would create $fileCount files:\n');
    for (final name in fileNames) {
      print('  $name: ${fileData[name]!.length} entries');
    }
  } else {
    print('Writing files...\n');
    for (final name in fileNames) {
      final sorted = SplayTreeMap<String, dynamic>.from(fileData[name]!);
      const encoder = JsonEncoder.withIndent('  ');
      File(
        '$arbDirPath/$name',
      ).writeAsStringSync('${encoder.convert(sorted)}\n');
      print('  $name: ${sorted.length} entries');
    }
  }
}

Future<void> _extractUntranslatedOnly(
  Map<String, dynamic> mergedData,
  String outputPath,
  bool dryRun,
) async {
  print('=== Extract Untranslated Mode ===\n');

  final untranslated = <String, dynamic>{};
  int totalUntranslated = 0;

  for (final entry in mergedData.entries) {
    if (entry.key.startsWith('@')) continue;
    if (entry.value is! String) continue;

    final value = entry.value as String;
    if (value == entry.key || value.isEmpty) {
      totalUntranslated++;
      untranslated[entry.key] = entry.value;

      final metaKey = '@${entry.key}';
      if (mergedData.containsKey(metaKey)) {
        untranslated[metaKey] = mergedData[metaKey];
      }
    }
  }

  print('Total untranslated strings: $totalUntranslated');

  if (totalUntranslated == 0) {
    print('No untranslated strings found.\n');
    return;
  }

  if (dryRun) {
    print('DRY RUN - Would extract to: $outputPath');
    print('Entries: ${untranslated.length}');
  } else {
    final outputFile = File(outputPath);
    final sorted = SplayTreeMap<String, dynamic>.from(untranslated);
    const encoder = JsonEncoder.withIndent('  ');
    outputFile.writeAsStringSync('${encoder.convert(sorted)}\n');
    print('Extracted ${untranslated.length} entries to: $outputPath\n');

    print('Next steps:');
    print('1. Edit $outputPath and translate the values');
    print(
      '2. Merge back: dart merge_arb_entries.dart --locale=... --source=$outputPath',
    );
    print('3. Run maintain again to clean up');
  }
}
