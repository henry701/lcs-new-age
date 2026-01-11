// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main() {
  // Find project root by looking for pubspec.yaml
  final scriptDir = Directory(Platform.script.path).parent;
  Directory? projectRoot = scriptDir;

  while (projectRoot != null) {
    if (File('${projectRoot.path}/pubspec.yaml').existsSync()) {
      break;
    }
    projectRoot = projectRoot.parent;
  }

  if (projectRoot == null) {
    print('Could not find project root (pubspec.yaml not found)');
    print('Searched from: ${scriptDir.path}');
    exit(1);
  }

  final arbDir = Directory('${projectRoot.path}/lib/l10n');
  if (!arbDir.existsSync()) {
    print('ARB directory not found: ${arbDir.path}');
    exit(1);
  }

  // Group files by locale
  final localeFiles = <String, List<File>>{};
  for (final entity in arbDir.listSync()) {
    if (entity is File && entity.path.endsWith('.arb')) {
      final locale = _extractLocale(entity.path);
      localeFiles.putIfAbsent(locale, () => []);
      localeFiles[locale]!.add(entity);
    }
  }

  int totalFilesProcessed = 0;
  int totalEntriesFound = 0;
  int totalUniqueEntries = 0;
  int totalCrossFileDuplicates = 0;

  print('=== ARB Duplicate Cleaner ===\n');

  // Process each locale
  for (final locale in localeFiles.keys.toList()..sort()) {
    final files = localeFiles[locale]!;
    print('Locale: $locale (${files.length} file(s))');

    // Check for duplicates across files
    final crossFileDupes = _checkCrossFileDuplicates(files);
    if (crossFileDupes.isNotEmpty) {
      print(
        '  ERROR: Found ${crossFileDupes.length} duplicate key(s) across files:',
      );
      for (final dupe in crossFileDupes.take(5)) {
        print('    - "${dupe.key}" in: ${dupe.files.join(", ")}');
      }
      if (crossFileDupes.length > 5) {
        print('    ... and ${crossFileDupes.length - 5} more');
      }
      totalCrossFileDuplicates += crossFileDupes.length;
      print('  These must be resolved manually.\n');
      continue; // Skip this locale until duplicates are resolved
    }

    // Process each file
    for (final file in files..sort((a, b) => a.path.compareTo(b.path))) {
      final filename = file.path.split('/').last;
      final result = processArbFile(file);
      totalFilesProcessed++;
      totalEntriesFound += result['originalCount']!;
      totalUniqueEntries += result['uniqueCount']!;

      final duplicatesRemoved = result['duplicatesRemoved']!;
      if (duplicatesRemoved > 0) {
        print(
          '  $filename: ${result['originalCount']} entries → ${result['uniqueCount']} unique (removed $duplicatesRemoved duplicate(s))',
        );
      } else {
        print(
          '  $filename: ${result['originalCount']} entries (no duplicates)',
        );
      }
    }
    print('');
  }

  print('=== Summary ===');
  print('Files processed: $totalFilesProcessed');
  print('Total entries: $totalEntriesFound');
  print('Unique entries: $totalUniqueEntries');
  print('Duplicates removed: ${totalEntriesFound - totalUniqueEntries}');

  if (totalCrossFileDuplicates > 0) {
    print(
      '\nWARNING: $totalCrossFileDuplicates duplicate key(s) found across files',
    );
    print('These require manual resolution.');
    exit(1);
  } else {
    print('\nCross-file validation: OK');
  }
}

class DuplicateInfo {
  DuplicateInfo({required this.key, required this.files});
  final String key;
  final List<String> files;
}

List<DuplicateInfo> _checkCrossFileDuplicates(List<File> files) {
  final keyLocations = <String, List<String>>{};

  for (final file in files) {
    final content = file.readAsStringSync();
    final json = jsonDecode(content) as Map<String, dynamic>;

    for (final entry in json.entries) {
      keyLocations.putIfAbsent(entry.key, () => []);
      keyLocations[entry.key]!.add(file.path.split('/').last);
    }
  }

  final duplicates = <DuplicateInfo>[];
  for (final entry in keyLocations.entries) {
    if (entry.value.length > 1) {
      duplicates.add(DuplicateInfo(key: entry.key, files: entry.value));
    }
  }

  return duplicates;
}

String _extractLocale(String filePath) {
  // Extract locale from path like "lib/l10n/app_pt_BR.arb" -> "pt_BR"
  // or "lib/l10n/app_pt_BR_part1.arb" -> "pt_BR"
  final filename = filePath.split('/').last;
  if (filename.startsWith('app_')) {
    // Remove 'app_' prefix and '.arb' suffix
    var locale = filename.substring(4, filename.length - 4);
    // Remove any _part<N> or _module suffixes
    final partMatch = RegExp(r'_part\d+$').hasMatch(locale);
    if (partMatch) {
      locale = locale.replaceAll(RegExp(r'_part\d+$'), '');
    }
    return locale;
  }
  return filePath.replaceAll('.arb', '');
}

Map<String, int> processArbFile(File file) {
  final content = file.readAsStringSync();
  final json = jsonDecode(content) as Map<String, dynamic>;
  final originalCount = json.length;

  // Process entries in reverse order to keep the last occurrence of each key
  final seenKeys = <String>{};
  final cleanedJson = <String, dynamic>{};

  for (final entry in json.entries.toList().reversed) {
    if (!seenKeys.contains(entry.key)) {
      cleanedJson[entry.key] = entry.value;
      seenKeys.add(entry.key);
    }
  }

  final uniqueCount = cleanedJson.length;

  // Sort keys alphabetically for clean diffs
  final sortedJson = Map.fromEntries(
    cleanedJson.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
  );

  // Write back the cleaned JSON
  final encoder = JsonEncoder.withIndent('  ');
  final newContent = '${encoder.convert(sortedJson)}\n';
  file.writeAsStringSync(newContent);

  // Return statistics
  return {
    'originalCount': originalCount,
    'uniqueCount': uniqueCount,
    'duplicatesRemoved': originalCount - uniqueCount,
  };
}
