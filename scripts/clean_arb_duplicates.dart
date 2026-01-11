import 'dart:convert';
import 'dart:io';

void main() {
  final arbDir = Directory('../lib/l10n');
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

  int totalFiles = 0;
  int totalDuplicatesRemoved = 0;
  int totalCrossFileDuplicates = 0;

  // Process each locale
  for (final locale in localeFiles.keys.toList()..sort()) {
    final files = localeFiles[locale]!;
    print('\n=== Processing locale: $locale (${files.length} file(s)) ===');

    // Check for duplicates across files
    final crossFileDupes = _checkCrossFileDuplicates(files);
    if (crossFileDupes.isNotEmpty) {
      print(
        'ERROR: Found ${crossFileDupes.length} duplicate keys across files:',
      );
      for (final dupe in crossFileDupes.take(10)) {
        print('  - "${dupe.key}" found in: ${dupe.files.join(", ")}');
      }
      if (crossFileDupes.length > 10) {
        print('  ... and ${crossFileDupes.length - 10} more');
      }
      totalCrossFileDuplicates += crossFileDupes.length;
      print('Please resolve duplicates manually before continuing.');
      print('Duplicated keys must exist in only one file per locale.');
      continue; // Skip this locale until duplicates are resolved
    }

    // Process each file
    for (final file in files..sort((a, b) => a.path.compareTo(b.path))) {
      final result = processArbFile(file);
      totalFiles++;
      totalDuplicatesRemoved += result;
      if (result > 0) {
        print(
          'Processed ${file.path.split('/').last}: removed $result duplicates',
        );
      } else {
        print('Processed ${file.path.split('/').last}: no duplicates');
      }
    }
  }

  print('\n=== Summary ===');
  print('Files processed: $totalFiles');
  print('Total duplicates removed (within files): $totalDuplicatesRemoved');
  if (totalCrossFileDuplicates > 0) {
    print('ERROR: $totalCrossFileDuplicates duplicate keys found across files');
    print(
      'These must be resolved manually (duplicates can only exist in one file per locale)',
    );
    exit(1);
  } else {
    print('Cross-file validation: OK (no duplicates found)');
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

int processArbFile(File file) {
  final content = file.readAsStringSync();
  final json = jsonDecode(content) as Map<String, dynamic>;

  // Create a new map, processing entries in reverse order to keep the last occurrence
  final seenKeys = <String>{};
  final cleanedJson = <String, dynamic>{};

  // Process in reverse order to keep the last occurrence
  final reversedEntries = json.entries.toList().reversed;
  for (final entry in reversedEntries) {
    if (!seenKeys.contains(entry.key)) {
      cleanedJson[entry.key] = entry.value;
      seenKeys.add(entry.key);
    }
  }

  // Sort keys alphabetically for clean diffs
  final sortedJson = Map.fromEntries(
    cleanedJson.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
  );

  // Write back the cleaned JSON
  final encoder = JsonEncoder.withIndent('  ');
  final newContent = encoder.convert(sortedJson) + '\n';
  file.writeAsStringSync(newContent);

  // Return number of duplicates removed
  return json.length - cleanedJson.length;
}
