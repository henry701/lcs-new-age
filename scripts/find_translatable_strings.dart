#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main(List<String> args) async {
  if (args.contains('--help') || args.contains('-h')) {
    print('Find and manage translatable strings in LCS New Age');
    print('');
    print('Usage: dart find_translatable_strings.dart [options]');
    print('');
    print('Options:');
    print(
      '  --print-only, --dry-run    Print strings without modifying ARB files',
    );
    print(
      '  --no-modify                Do not modify ARB files (print summary only)',
    );
    print(
      '  --generate-arb             Generate ARB JSON for untranslated strings',
    );
    print(
      '  --locale=LOCALE            Target locale (default: all, or en_US, pt_BR, etc.)',
    );
    print(
      '  --glob=PATTERN             Scan only files matching glob pattern (can specify multiple)',
    );
    print(
      '  --max-file-size=N          Max entries per ARB file before creating new file (default: 500)',
    );
    print(
      '  --split-strategy=STRATEGY   Strategy for distributing strings: primary-only, split-evenly (default: primary-only)',
    );
    print('  --help, -h                 Show this help message');
    print('');
    print(
      'Default behavior: Scan all code, update primary ARB files with missing strings',
    );
    print('');
    print('Notes:');
    print(
      '  - Multi-file ARB support: Each locale can have multiple ARB files',
    );
    print(
      '  - File naming: app_<locale>.arb (primary), app_<locale>_part<N>.arb (additional)',
    );
    print('  - Strategies:');
    print('    • primary-only: Add all new strings to primary file (default)');
    print(
      '    • split-evenly: Distribute new strings evenly across existing files',
    );
    print(
      '  - Run clean_arb_duplicates.dart after to validate no duplicates across files',
    );
    print('');
    print('Examples:');
    print(
      '  dart find_translatable_strings.dart                           # Update all ARB files',
    );
    print(
      '  dart find_translatable_strings.dart --print-only             # Print strings only',
    );
    print(
      '  dart find_translatable_strings.dart --generate-arb --locale=pt_BR  # Generate ARB JSON',
    );
    print(
      '  dart find_translatable_strings.dart --glob="**/basemode/**"    # Scan only basemode files',
    );
    print(
      '  dart find_translatable_strings.dart --split-strategy=split-evenly --max-file-size=300',
    );
    return;
  }

  print('Finding translatable strings in LCS New Age...\n');

  final scriptDir = Directory.current;
  Directory libDir;

  if (Directory('lib').existsSync()) {
    libDir = Directory('lib');
  } else if (Directory('..${Platform.pathSeparator}lib').existsSync()) {
    libDir = Directory('..${Platform.pathSeparator}lib');
  } else {
    print(
      'Error: lib/ directory not found (searched in $scriptDir and parent)',
    );
    exit(1);
  }

  if (!libDir.existsSync()) {
    print('Error: lib/ directory not found');
    exit(1);
  }

  // Parse command line arguments
  final printOnly = args.contains('--print-only') || args.contains('--dry-run');
  final noModify = args.contains('--no-modify') || printOnly;
  final generateArb = args.contains('--generate-arb');
  final localeArg = args.firstWhere(
    (arg) => arg.startsWith('--locale='),
    orElse: () => '--locale=all',
  );
  final targetLocale = localeArg.split('=')[1];

  final maxFileSizeArg = args.firstWhere(
    (arg) => arg.startsWith('--max-file-size='),
    orElse: () => '--max-file-size=500',
  );
  final maxFileSize = int.tryParse(maxFileSizeArg.split('=')[1]) ?? 500;

  final splitStrategyArg = args.firstWhere(
    (arg) => arg.startsWith('--split-strategy='),
    orElse: () => '--split-strategy=primary-only',
  );
  final splitStrategy = splitStrategyArg.split('=')[1];

  // Parse file globs
  final globArgs = args.where((arg) => arg.startsWith('--glob='));
  final fileGlobs = globArgs.isNotEmpty
      ? globArgs.map((arg) => arg.split('=')[1]).toList()
      : null;

  // Read existing ARB files to check what's already translated
  final existingTranslations =
      <String, Map<String, dynamic>>{}; // locale -> merged translations
  final localeFileLists = <String, List<File>>{}; // locale -> list of files
  final l10nDir = Directory('${libDir.path}/l10n');
  final l10nPath = l10nDir.path;

  if (l10nDir.existsSync()) {
    await for (final entity in l10nDir.list()) {
      if (entity is File && entity.path.endsWith('.arb')) {
        try {
          final content = await entity.readAsString();
          final arbData = json.decode(content) as Map<String, dynamic>;

          // Extract locale from filename
          final filename = entity.path.split('/').last;
          String? locale;

          if (filename.startsWith('app_')) {
            var localePart = filename.substring(
              4,
              filename.length - 4,
            ); // Remove 'app_' and '.arb'
            // Remove _part<N> suffix
            localePart = localePart.replaceAll(RegExp(r'_part\d+$'), '');
            locale = localePart;
          }

          if (locale != null) {
            existingTranslations.putIfAbsent(locale, () => <String, dynamic>{});
            localeFileLists.putIfAbsent(locale, () => <File>[]);

            // Merge entries into locale's combined translations
            for (final entry in arbData.entries) {
              existingTranslations[locale]![entry.key] = entry.value;
            }

            // Track file for this locale
            localeFileLists[locale]!.add(entity);
          }
        } catch (e) {
          print('Warning: Could not parse ARB file ${entity.path}: $e');
        }
      }
    }
  }

  final stringInfo = <String, StringInfo>{};

  await for (final entity in libDir.list(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final file = entity;
      final relativePath = file.path.replaceFirst('${libDir.path}/', '');

      // Check if file matches glob patterns (if specified)
      if (fileGlobs != null) {
        bool matchesGlob = false;
        for (final glob in fileGlobs) {
          // Simple glob matching - could be enhanced with proper glob library
          if (_matchesGlob(relativePath, glob)) {
            matchesGlob = true;
            break;
          }
        }
        if (!matchesGlob) continue;
      }

      final content = await file.readAsString();
      final lines = content.split('\n');

      // First pass: process line by line for simple cases
      for (int i = 0; i < lines.length; i++) {
        final line = lines[i];
        final lineNumber = i + 1;

        // Find strings passed to console wrapper functions (single-line patterns)
        final consoleCallPatterns = [
          (RegExp(r'\baddstr\s*\(\s*"([^"]+)"'), 'addstr'),
          (RegExp(r"\baddstr\s*\(\s*'([^']+)'"), 'addstr'),
          (RegExp(r'\bmvaddstr\s*\([^,]+,\s*[^,]+,\s*"([^"]+)"'), 'mvaddstr'),
          (RegExp(r"\bmvaddstr\s*\([^,]+,\s*[^,]+,\s*'([^']+)'"), 'mvaddstr'),
          (RegExp(r'\baddstrc\s*\(\s*[^,]+,\s*"([^"]+)"'), 'addstrc'),
          (RegExp(r"\baddstrc\s*\(\s*[^,]+,\s*'([^']+)'"), 'addstrc'),
          // Single-line mvaddstrc patterns
          (
            RegExp(r'\bmvaddstrc\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*"([^"]+)"'),
            'mvaddstrc',
          ),
          (
            RegExp(r"\bmvaddstrc\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*'([^']+)'"),
            'mvaddstrc',
          ),
          (RegExp(r'\baddstrx\s*\(\s*"([^"]+)"'), 'addstrx'),
          (RegExp(r"\baddstrx\s*\(\s*'([^']+)'"), 'addstrx'),
          (RegExp(r'\bmvaddstrx\s*\([^,]+,\s*[^,]+,\s*"([^"]+)"'), 'mvaddstrx'),
          (RegExp(r"\bmvaddstrx\s*\([^,]+,\s*[^,]+,\s*'([^']+)'"), 'mvaddstrx'),
        ];

        for (final entry in consoleCallPatterns) {
          final pattern = entry.$1;
          final function = entry.$2;

          for (final match in pattern.allMatches(line)) {
            final stringLiteral = match.group(1);
            if (stringLiteral != null && _isUserFacing(stringLiteral)) {
              final key = stringLiteral;

              stringInfo.putIfAbsent(
                key,
                () => StringInfo(text: stringLiteral, locations: [], count: 0),
              );

              final info = stringInfo[key]!;
              info.count++;
              if (!info.locations.any((l) => l.contains(relativePath))) {
                info.locations.add('$relativePath:$lineNumber ($function)');
              }
            }
          }
        }

        // Also look for strings on lines that look like they're in function calls
        // These are lines starting with whitespace followed by a quoted string and comma
        // that likely belong to multiline function calls
        // Pattern matches strings containing one or more {param} templates
        final multilineStringPattern = RegExp(r'^\s*"([^"]+)"\s*,?\s*$');
        final multilineStringPattern2 = RegExp(r"^\s*'([^']+)'\s*,?\s*$");

        for (final match in multilineStringPattern.allMatches(line)) {
          final stringLiteral = match.group(1);
          if (stringLiteral != null &&
              _isUserFacing(stringLiteral) &&
              !stringInfo.containsKey(stringLiteral)) {
            // Look backward to find what function this belongs to
            String function = 'multiline';
            for (int j = i - 1; j >= max(0, i - 10); j--) {
              final prevLine = lines[j];
              if (prevLine.contains('mvaddstrc')) {
                function = 'mvaddstrc';
                break;
              } else if (prevLine.contains('addstrc')) {
                function = 'addstrc';
                break;
              } else if (prevLine.contains('mvaddstr')) {
                function = 'mvaddstr';
                break;
              } else if (prevLine.contains('addstr')) {
                function = 'addstr';
                break;
              } else if (prevLine.contains('mvaddstrx')) {
                function = 'mvaddstrx';
                break;
              } else if (prevLine.contains('addstrx')) {
                function = 'addstrx';
                break;
              }
            }

            final key = stringLiteral;
            stringInfo.putIfAbsent(
              key,
              () => StringInfo(text: stringLiteral, locations: [], count: 0),
            );

            final info = stringInfo[key]!;
            info.count++;
            if (!info.locations.any((l) => l.contains(relativePath))) {
              info.locations.add('$relativePath:$lineNumber ($function)');
            }
          }
        }

        // Pattern for strings without template parameters but in multiline calls
        final multilinePlainPattern = RegExp(r'^\s*"([^"]{10,})"\s*,?\s*$');
        final multilinePlainPattern2 = RegExp(r"^\s*'([^']{10,})'\s*,?\s*$");

        for (final match in multilineStringPattern2.allMatches(line)) {
          final stringLiteral = match.group(1);
          if (stringLiteral != null &&
              _isUserFacing(stringLiteral) &&
              !stringInfo.containsKey(stringLiteral)) {
            // Look backward to find what function this belongs to
            String function = 'multiline';
            for (int j = i - 1; j >= max(0, i - 10); j--) {
              final prevLine = lines[j];
              if (prevLine.contains('mvaddstrc')) {
                function = 'mvaddstrc';
                break;
              } else if (prevLine.contains('addstrc')) {
                function = 'addstrc';
                break;
              } else if (prevLine.contains('mvaddstr')) {
                function = 'mvaddstr';
                break;
              } else if (prevLine.contains('addstr')) {
                function = 'addstr';
                break;
              } else if (prevLine.contains('mvaddstrx')) {
                function = 'mvaddstrx';
                break;
              } else if (prevLine.contains('addstrx')) {
                function = 'addstrx';
                break;
              }
            }

            final key = stringLiteral;
            stringInfo.putIfAbsent(
              key,
              () => StringInfo(text: stringLiteral, locations: [], count: 0),
            );

            final info = stringInfo[key]!;
            info.count++;
            if (!info.locations.any((l) => l.contains(relativePath))) {
              info.locations.add('$relativePath:$lineNumber ($function)');
            }
          }
        }

        // Process plain multiline strings (no template params but likely in display calls)
        for (final match in multilinePlainPattern.allMatches(line)) {
          final stringLiteral = match.group(1);
          if (stringLiteral != null &&
              _isUserFacing(stringLiteral) &&
              !stringInfo.containsKey(stringLiteral)) {
            // Look backward to find what function this belongs to
            String function = 'multiline';
            for (int j = i - 1; j >= max(0, i - 10); j--) {
              final prevLine = lines[j];
              if (prevLine.contains('mvaddstrc')) {
                function = 'mvaddstrc';
                break;
              } else if (prevLine.contains('addstrc')) {
                function = 'addstrc';
                break;
              } else if (prevLine.contains('mvaddstr')) {
                function = 'mvaddstr';
                break;
              } else if (prevLine.contains('addstr')) {
                function = 'addstr';
                break;
              } else if (prevLine.contains('mvaddstrx')) {
                function = 'mvaddstrx';
                break;
              } else if (prevLine.contains('addstrx')) {
                function = 'addstrx';
                break;
              }
            }

            final key = stringLiteral;
            stringInfo.putIfAbsent(
              key,
              () => StringInfo(text: stringLiteral, locations: [], count: 0),
            );

            final info = stringInfo[key]!;
            info.count++;
            if (!info.locations.any((l) => l.contains(relativePath))) {
              info.locations.add('$relativePath:$lineNumber ($function)');
            }
          }
        }

        for (final match in multilinePlainPattern2.allMatches(line)) {
          final stringLiteral = match.group(1);
          if (stringLiteral != null &&
              _isUserFacing(stringLiteral) &&
              !stringInfo.containsKey(stringLiteral)) {
            // Look backward to find what function this belongs to
            String function = 'multiline';
            for (int j = i - 1; j >= max(0, i - 10); j--) {
              final prevLine = lines[j];
              if (prevLine.contains('mvaddstrc')) {
                function = 'mvaddstrc';
                break;
              } else if (prevLine.contains('addstrc')) {
                function = 'addstrc';
                break;
              } else if (prevLine.contains('mvaddstr')) {
                function = 'mvaddstr';
                break;
              } else if (prevLine.contains('addstr')) {
                function = 'addstr';
                break;
              } else if (prevLine.contains('mvaddstrx')) {
                function = 'mvaddstrx';
                break;
              } else if (prevLine.contains('addstrx')) {
                function = 'addstrx';
                break;
              }
            }

            final key = stringLiteral;
            stringInfo.putIfAbsent(
              key,
              () => StringInfo(text: stringLiteral, locations: [], count: 0),
            );

            final info = stringInfo[key]!;
            info.count++;
            if (!info.locations.any((l) => l.contains(relativePath))) {
              info.locations.add('$relativePath:$lineNumber ($function)');
            }
          }
        }

        // Find string literals in variable assignments or returns that might be user-facing
        final otherPatterns = [
          RegExp(r'\b([a-zA-Z_]\w*)\s*=\s*"([^"]{10,})"'),
          RegExp(r"\b([a-zA-Z_]\w*)\s*=\s*'([^']{10,})'"),
          RegExp(r'return\s+"([^"]{10,})"'),
          RegExp(r"return\s+'([^']{10,})'"),
        ];

        for (final pattern in otherPatterns) {
          for (final match in pattern.allMatches(line)) {
            final stringLiteral = match.group(match.groupCount);
            if (stringLiteral != null && _isUserFacing(stringLiteral)) {
              final key = stringLiteral;

              stringInfo.putIfAbsent(
                key,
                () => StringInfo(text: stringLiteral, locations: [], count: 0),
              );

              final info = stringInfo[key]!;
              info.count++;
              if (!info.locations.any((l) => l.contains(relativePath))) {
                info.locations.add(
                  '$relativePath:$lineNumber (variable/return)',
                );
              }
            }
          }
        }
      }
    }
  }

  // Output results
  final sortedStrings = stringInfo.values.toList();
  sortedStrings.sort((a, b) => b.count.compareTo(a.count));

  // Print summary
  print('Found ${sortedStrings.length} unique translatable strings in code');
  print('');

  // Handle different output modes
  if (generateArb) {
    await _generateArbOutput(
      sortedStrings,
      existingTranslations,
      targetLocale,
      l10nPath,
    );
  } else if (noModify) {
    _generateTextOutput(sortedStrings);
  } else {
    // Default: modify ARB files
    await _modifyArbFiles(
      sortedStrings,
      existingTranslations,
      localeFileLists,
      targetLocale == 'all' ? null : targetLocale,
      l10nPath,
      maxFileSize,
      splitStrategy,
    );
  }
}

bool _isUserFacing(String str) {
  // Very short strings (likely not meaningful)
  if (str.length < 4) return false;

  // Empty or whitespace only
  if (str.trim().isEmpty) return false;

  // Strings that look like file paths or URLs
  if (str.contains('/') || str.contains('\\')) return false;

  // Strings that look like hex codes or IDs
  if (RegExp(r'^[0-9a-fA-FxX]+$').hasMatch(str)) return false;

  // Strings that look like numeric values
  if (RegExp(r'^[\d.]+$').hasMatch(str)) return false;

  // Common internal/debug strings
  if (str.toUpperCase().startsWith('DEBUG')) return false;
  if (str.toUpperCase().startsWith('TODO')) return false;
  if (str.toUpperCase().startsWith('FIXME')) return false;

  // Strings that are purely technical characters
  final techPattern = RegExp(
    r'^[a-zA-Z0-9_./\\$@#%&*+\-=\[\]{}()|;:<>?,"]+$',
  );
  if (techPattern.hasMatch(str)) {
    return false;
  }

  // Enhanced filtering: spacing-only patterns
  if (RegExp(r'^[\s\t\r\n]+$').hasMatch(str)) return false;

  // Enhanced filtering: one-parameter-only patterns (like "{param}" without context)
  if (RegExp(r'^\{[^}]+\}$').hasMatch(str)) return false;

  // Enhanced filtering: single character patterns (punctuation, symbols)
  if (RegExp(r'^[;|,.<>/?]+$').hasMatch(str)) {
    return false;
  }

  // Enhanced filtering: color codes and formatting patterns
  if (RegExp(r'^&[a-zA-Z]$').hasMatch(str)) return false;

  // CRITICAL: Skip strings with $variable interpolation (not templated yet)
  if (str.contains('\$')) return false;

  // Include if it contains letters and has some meaningful content
  final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(str);
  final hasContent = str.length >= 3;

  return hasLetters && hasContent;
}
void _generateTextOutput(List<StringInfo> sortedStrings) {
  print('Found ${sortedStrings.length} unique translatable strings\n');
  print('Format: STRING_LITERAL (count: N)');
  print('Locations: file.dart:line (context)\n');
  final separator = '=' * 80;
  print(separator);

  for (final info in sortedStrings) {
    print('');
    print('"${info.text}" (count: ${info.count})');
    for (final location in info.locations) {
      print('  $location');
    }
  }

  print('\n$separator');
  print('\nTotal: ${sortedStrings.length} strings');
}

Future<void> _modifyArbFiles(
  List<StringInfo> sortedStrings,
  Map<String, Map<String, dynamic>> existingTranslations,
  Map<String, List<File>> localeFileLists,
  String? targetLocale,
  String l10nPath,
  int maxFileSize,
  String splitStrategy,
) async {
  final localesToProcess = targetLocale != null
      ? [targetLocale]
      : existingTranslations.keys.toList();

  print('Processing ARB files for locales: ${localesToProcess.join(', ')}');
  print('Split strategy: $splitStrategy');
  print('Max file size: $maxFileSize entries\n');

  int totalAdded = 0;
  final summary = <String, Map<String, dynamic>>{};

  for (final locale in localesToProcess) {
    final existingArb = existingTranslations[locale] ?? <String, dynamic>{};
    final files = localeFileLists[locale] ?? [];

    // Find primary file
    File? primaryFile;
    List<File> additionalFiles = [];

    for (final file in files) {
      final filename = file.path.split('/').last;
      if (filename == 'app_$locale.arb' ||
          (locale == 'en_US' && filename == 'app_en.arb')) {
        primaryFile = file;
      } else {
        additionalFiles.add(file);
      }
    }

    // Create primary file if it doesn't exist
    primaryFile ??= File('$l10nPath/app_$locale.arb');

    // Load data from all existing files
    final fileData = <File, Map<String, dynamic>>{};
    for (final file in files) {
      try {
        final content = await file.readAsString();
        fileData[file] = json.decode(content) as Map<String, dynamic>;
      } catch (e) {
        print('Warning: Failed to read ${file.path}: $e');
        fileData[file] = <String, dynamic>{};
      }
    }

    // Identify new strings to add
    final newStrings = <StringInfo>[];
    for (final info in sortedStrings) {
      if (!existingArb.containsKey(info.text)) {
        newStrings.add(info);
      }
    }

    if (newStrings.isEmpty) {
      final totalCount = existingArb.length;
      print(
        '✓ $locale: No new strings to add ($totalCount strings across ${files.length} file(s))',
      );
      summary[locale] = {
        'total': totalCount,
        'files': files.length,
        'added': 0,
      };
      continue;
    }

    // Distribute new strings based on strategy
    final distribution = _distributeStrings(
      newStrings,
      primaryFile,
      additionalFiles,
      l10nPath,
      locale,
      maxFileSize,
      splitStrategy,
      fileData,
    );

    // Write updated files
    int addedToThisLocale = 0;
    for (final entry in distribution.entries) {
      final file = entry.key;
      final newData = entry.value;
      final addedCount = newData.length - (fileData[file]?.length ?? 0);

      if (addedCount > 0) {
        addedToThisLocale += addedCount;

        // Sort keys alphabetically
        final sortedData = SplayTreeMap<String, dynamic>.from(newData);

        // Write back
        const encoder = JsonEncoder.withIndent('  ');
        await file.writeAsString('${encoder.convert(sortedData)}\n');
      }
    }

    totalAdded += addedToThisLocale;

    final finalFiles = <File>[...localeFileLists[locale] ?? []];
    final totalStrings = finalFiles.fold<int>(0, (sum, f) {
      try {
        final content = File(f.path).readAsStringSync();
        final data = json.decode(content) as Map<String, dynamic>;
        return sum + data.length;
      } catch (e) {
        return sum;
      }
    });

    summary[locale] = {
      'total': totalStrings,
      'files': finalFiles.length,
      'added': addedToThisLocale,
    };

    print(
      '✓ $locale: Added $addedToThisLocale strings ($totalStrings total in ${finalFiles.length} file(s))',
    );
  }

  print('\nSummary:');
  print('• Total strings found in code: ${sortedStrings.length}');
  print('• Total strings added across all locales: $totalAdded');

  if (summary.isNotEmpty) {
    print('\nPer-locale breakdown:');
    for (final entry in summary.entries) {
      final locale = entry.key;
      final stats = entry.value;
      print(
        '  $locale: ${stats['total']} strings in ${stats['files']} file(s) (+${stats['added']} new)',
      );
    }
  }

  if (totalAdded > 0) {
    print(
      '\n⚠️  Remember to translate the newly added strings in each ARB file!',
    );
    print('   Validate with: dart run scripts/clean_arb_duplicates.dart');
    print('   Test with: flutter test test/i18n_test.dart');
  }
}

Map<File, Map<String, dynamic>> _distributeStrings(
  List<StringInfo> newStrings,
  File primaryFile,
  List<File> additionalFiles,
  String l10nPath,
  String locale,
  int maxFileSize,
  String splitStrategy,
  Map<File, Map<String, dynamic>> existingFileData,
) {
  final distribution = <File, Map<String, dynamic>>{};

  if (splitStrategy == 'primary-only') {
    // Add all new strings to primary file
    distribution[primaryFile] = Map.from(existingFileData[primaryFile] ?? {});

    for (final info in newStrings) {
      distribution[primaryFile]![info.text] = info.text;
    }
  } else if (splitStrategy == 'split-evenly') {
    // Distribute strings evenly across files
    final allFiles = [primaryFile, ...additionalFiles];
    final fileSizes = <File, int>{};

    // Calculate current file sizes
    for (final file in allFiles) {
      fileSizes[file] = existingFileData[file]?.length ?? 0;
    }

    // Sort files by current size (to fill smallest first)
    final sortedFiles = allFiles.toList()
      ..sort((a, b) => (fileSizes[a] ?? 0).compareTo(fileSizes[b] ?? 0));

    // Distribute strings round-robin, respecting maxFileSize
    int fileIndex = 0;
    for (final info in newStrings) {
      // Find a file with space
      File targetFile;
      bool createNewFile = false;

      while (true) {
        targetFile = sortedFiles[fileIndex % sortedFiles.length];
        final currentSize = fileSizes[targetFile] ?? 0;

        if (currentSize < maxFileSize) {
          break;
        }

        // All files are full, create new one
        if (fileIndex >= sortedFiles.length * 2) {
          createNewFile = true;
          break;
        }

        fileIndex++;
      }

      if (createNewFile) {
        // Create new part file
        final partNumber = additionalFiles.length + 1;
        targetFile = File('$l10nPath/app_${locale}_part$partNumber.arb');
        fileSizes[targetFile] = 0;
        distribution[targetFile] = <String, dynamic>{};
        sortedFiles.add(targetFile);
      }

      // Initialize file data if not exists
      if (!distribution.containsKey(targetFile)) {
        distribution[targetFile] = Map.from(existingFileData[targetFile] ?? {});
      }

      // Add string
      distribution[targetFile]![info.text] = info.text;
      fileSizes[targetFile] = (fileSizes[targetFile] ?? 0) + 1;

      fileIndex++;
    }

    // Add existing data for files that weren't modified
    for (final file in allFiles) {
      if (!distribution.containsKey(file)) {
        distribution[file] = Map.from(existingFileData[file] ?? {});
      }
    }
  } else {
    throw ArgumentError('Unknown split strategy: $splitStrategy');
  }

  return distribution;
}

Future<void> _generateArbOutput(
  List<StringInfo> sortedStrings,
  Map<String, Map<String, dynamic>> existingTranslations,
  String targetLocale,
  String l10nPath,
) async {
  final existingArb = existingTranslations[targetLocale] ?? <String, dynamic>{};
  final newEntries = SplayTreeMap<String, dynamic>();

  print('Generating ARB entries for locale: $targetLocale');
  print('Note: Output shows all strings for the locale across all ARB files\n');
  print('Checking ${sortedStrings.length} strings...\n');

  for (final info in sortedStrings) {
    // Skip if already translated
    if (existingArb.containsKey(info.text)) {
      continue;
    }

    // Generate ARB entry
    newEntries[info.text] = info.text; // Default to same text
  }

  if (newEntries.isEmpty) {
    print(
      'No new strings to translate! All strings are already in $targetLocale ARB file.',
    );
    return;
  }

  print(
    'Found ${newEntries.length ~/ 2 + newEntries.length % 2} new translatable strings for $targetLocale\n',
  );
  print(
    'Add these entries to lib/l10n/app_$targetLocale.arb (or other ARB files for this locale):\n',
  );

  final separator = '=' * 80;
  print(separator);

  // Output as JSON that can be copied
  final output = <String, dynamic>{};
  newEntries.forEach((key, value) {
    output[key] = value;
  });

  const encoder = JsonEncoder.withIndent('  ');
  print(encoder.convert(output));

  print('\n$separator');
  print('\nTo add these to the ARB file:');
  print(
    '1. Open lib/l10n/app_$targetLocale.arb (or run find_translatable_strings.dart)',
  );
  print('2. Add the above JSON entries (merge with existing content)');
  print('3. Translate the string values to $targetLocale');
  print('4. Validate with: dart run scripts/clean_arb_duplicates.dart');
  print('5. Test with: flutter test test/i18n_test.dart');
}

bool _matchesGlob(String path, String glob) {
  // Simple glob matching - convert glob to regex
  // ** matches any path segment, * matches within segment
  // Note: Must replace ** first, but need to use a placeholder to avoid
  // the * in .* being replaced by the next replaceAll
  final regexPattern = glob
      .replaceAll('**', '\x00') // Use null char as placeholder for **
      .replaceAll('*', '[^/]*')
      .replaceAll('\x00', '.*') // Replace placeholder with .*
      .replaceAll('?', '.');
  final regex = RegExp('^$regexPattern\$');
  return regex.hasMatch(path);
}

class StringInfo {
  StringInfo({
    required this.text,
    required this.locations,
    required this.count,
  });

  String text;
  List<String> locations;
  int count;
}
