#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:lcs_new_age/i18n/catalog_layout.dart';

final _placeholderPattern = RegExp(r'\{(\w+)(?::(\w+))?\}');
const _escapedDollarSentinel = '\u0000';

String _normalizeColorizedPlaceholders(String template) => template
    .replaceAllMapped(_placeholderPattern, (match) => '{${match.group(1)!}}');

String _normalizeArbKey(String key) {
  if (key.startsWith('@')) {
    return '@${_normalizeColorizedPlaceholders(key.substring(1))}';
  }
  return _normalizeColorizedPlaceholders(key);
}

dynamic _normalizeArbValue(dynamic value) {
  if (value is String) {
    return _normalizeColorizedPlaceholders(value);
  }
  return value;
}

/// Unescape a captured string literal content (handles \' and \" etc from Dart source).
String _unescapeStringLiteral(String raw) => raw
    .replaceAll(r'\$', _escapedDollarSentinel)
    .replaceAllMapped(RegExp(r'\\(.)'), (m) => m.group(1)!);

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
      '  --prune-dead               Remove catalog keys absent from the extracted live key set',
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
      '  --hash-shards=N            Number of deterministic hash shards per locale (default: $defaultArbCatalogShardCount)',
    );
    print('  --help, -h                 Show this help message');
    print('');
    print(
      'Default behavior: Scan all code, add missing keys, and rewrite locale catalogs in canonical hash-sharded order',
    );
    print('');
    print('Notes:');
    print(
      '  - Multi-file ARB support: Each locale can have multiple ARB files',
    );
    print(
      '  - File naming: app_<locale>_part01.arb ... app_<locale>_part32.arb (canonical)',
    );
    print(
      '  - Partitioning: key hash determines target file, ensuring deterministic sharding and stable diffs',
    );
    print(
      '  - Run maintain_arb_catalogs.dart --check after sync to validate canonical shard layout',
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
    print('  dart find_translatable_strings.dart --hash-shards=32');
    return;
  }

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
  final outputJson = args.contains('--json');
  final noModify = args.contains('--no-modify') || printOnly || outputJson;
  final pruneDead = args.contains('--prune-dead');
  if (pruneDead && noModify) {
    stderr.writeln(
      'Error: --prune-dead cannot be combined with read-only output modes',
    );
    exit(1);
  }
  final generateArb = args.contains('--generate-arb');
  final localeArg = args.firstWhere(
    (arg) => arg.startsWith('--locale='),
    orElse: () => '--locale=all',
  );
  final targetLocale = localeArg.split('=')[1];

  final hashShardsArg = args.firstWhere(
    (arg) => arg.startsWith('--hash-shards='),
    orElse: () => '--hash-shards=$defaultArbCatalogShardCount',
  );
  final hashShards =
      int.tryParse(hashShardsArg.split('=')[1]) ?? defaultArbCatalogShardCount;
  if (hashShards <= 0) {
    print('Error: --hash-shards must be > 0');
    exit(1);
  }

  if (!outputJson) {
    print('Finding translatable strings in LCS New Age...\n');
  }

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
  final localeFilenamePattern = RegExp(
    r'^app_([A-Za-z0-9_]+?)_part\d{2}\.arb$',
  );

  if (l10nDir.existsSync()) {
    await for (final entity in l10nDir.list()) {
      if (entity is File && entity.path.endsWith('.arb')) {
        try {
          final content = await entity.readAsString();
          final arbData = json.decode(content) as Map<String, dynamic>;

          // Extract locale from filename
          final filename = entity.path.split('/').last;
          final match = localeFilenamePattern.firstMatch(filename);
          final locale = match?.group(1);

          if (locale != null) {
            existingTranslations.putIfAbsent(locale, () => <String, dynamic>{});
            localeFileLists.putIfAbsent(locale, () => <File>[]);

            // Merge entries into locale's combined translations
            for (final entry in arbData.entries) {
              existingTranslations[locale]![_normalizeArbKey(entry.key)] =
                  _normalizeArbValue(entry.value);
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
  final wrapperCallPatterns = _buildWrapperCallPatterns();
  final tripleQuotedProcessStringPatterns =
      _buildTripleQuotedProcessStringPatterns();
  final multilineContextPatterns = _buildMultilineContextPatterns();
  final multilineQuotedPatterns = [
    RegExp(r'^\s*"((?:[^"\\]|\\.)*)"\s*[,;]?\s*$'),
    RegExp(r"^\s*'((?:[^'\\]|\\.)*)'\s*[,;]?\s*$"),
  ];

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
      final lineOffsets = _buildLineStartOffsets(content);

      // Extract random source strings from list literals and list variables
      // selected with `.random` or `[lcsRandom(...)]`.
      _extractRandomSourceStrings(
        content: content,
        lines: lines,
        lineOffsets: lineOffsets,
        stringInfo: stringInfo,
        relativePath: relativePath,
      );

      for (final pattern in tripleQuotedProcessStringPatterns) {
        for (final match in pattern.allMatches(content)) {
          final raw = match.group(1);
          if (raw == null) continue;
          final stringLiteral = _unescapeStringLiteral(raw);
          if (_isUserFacing(stringLiteral)) {
            _recordString(
              stringInfo,
              stringLiteral,
              relativePath,
              _lineNumberAtOffset(content, match.start),
              'LcsI18n.processString',
            );
          }
        }
      }

      // First pass: process line by line for simple cases
      for (int i = 0; i < lines.length; i++) {
        final line = lines[i];
        final lineNumber = i + 1;

        // Single-line wrapper calls (addstr/mvaddstr/addOptionText/etc.)
        for (final entry in wrapperCallPatterns) {
          final pattern = entry.$1;
          final function = entry.$2;

          for (final match in pattern.allMatches(line)) {
            final raw = match.group(1);
            if (raw == null) continue;
            final stringLiteral = _unescapeStringLiteral(raw);
            final allowHeadlineTokens =
                function == 'LcsI18n.tr' ||
                function == 'displayCenteredNewsFont' ||
                function == 'headline';
            if (function == 'headline' &&
                (stringLiteral.length > 48 ||
                    stringLiteral.startsWith('The ') ||
                    stringLiteral.startsWith('A '))) {
              continue;
            }
            if (_isUserFacing(
              stringLiteral,
              minLength: allowHeadlineTokens ? 3 : 4,
              // Tabloid headlines are often ALL CAPS tokens like "CCS MASSACRE".
              allowSingleWord: allowHeadlineTokens,
            )) {
              _recordString(
                stringInfo,
                stringLiteral,
                relativePath,
                lineNumber,
                function,
              );
            }
          }
        }

        // Multiline strings. Prefer wrapper context when detected; otherwise
        // keep a conservative fallback for standalone prose in lists/maps.
        final contextFunction = _inferWrapperContext(
          lines,
          i,
          multilineContextPatterns,
        );
        for (final pattern in multilineQuotedPatterns) {
          for (final match in pattern.allMatches(line)) {
            final raw = match.group(1);
            if (raw == null) continue;
            final stringLiteral = _unescapeStringLiteral(raw);
            if (!_isUserFacing(stringLiteral)) {
              continue;
            }

            final context = contextFunction ?? 'multiline';
            final shouldCaptureFallback =
                contextFunction != null || stringLiteral.length >= 10;
            if (shouldCaptureFallback) {
              _recordString(
                stringInfo,
                stringLiteral,
                relativePath,
                lineNumber,
                context,
              );
            }
          }
        }

        // Find string literals in variable assignments or returns that might be user-facing
        final otherPatterns = [
          RegExp(
            r'\b([a-zA-Z_]\w*)\s*=\s*"((?:[^"\\]|\\.)*)"',
            multiLine: false,
          ),
          RegExp(
            r"\b([a-zA-Z_]\w*)\s*=\s*'((?:[^'\\]|\\.)*)'",
            multiLine: false,
          ),
          RegExp(r'=>\s*"((?:[^"\\]|\\.)*)"', multiLine: false),
          RegExp(r"=>\s*'((?:[^'\\]|\\.)*)'", multiLine: false),
          RegExp(r'return\s+"((?:[^"\\]|\\.)*)"', multiLine: false),
          RegExp(r"return\s+'((?:[^'\\]|\\.)*)'", multiLine: false),
        ];

        for (final pattern in otherPatterns) {
          for (final match in pattern.allMatches(line)) {
            final raw = match.group(match.groupCount);
            if (raw == null) continue;
            final stringLiteral = _unescapeStringLiteral(raw);
            if (_isUserFacing(stringLiteral)) {
              _recordString(
                stringInfo,
                stringLiteral,
                relativePath,
                lineNumber,
                'variable/return',
              );
            }
          }
        }
      }
    }
  }

  // Output results
  final sortedStrings = stringInfo.values.toList();
  sortedStrings.sort((a, b) => b.count.compareTo(a.count));

  if (outputJson) {
    const encoder = JsonEncoder.withIndent('  ');
    print(encoder.convert(sortedStrings.map((info) => info.toJson()).toList()));
    return;
  }

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
      hashShards,
      pruneDead,
    );
  }
}

void _extractRandomSourceStrings({
  required String content,
  required List<String> lines,
  required List<int> lineOffsets,
  required Map<String, StringInfo> stringInfo,
  required String relativePath,
}) {
  // Single-line list literals selected randomly.
  final inlineRandomListPattern = RegExp(
    r'\[([^\]]+)\]\s*(?:\.random\b|\[\s*lcsRandom\s*\()',
  );
  for (int i = 0; i < lines.length; i++) {
    final line = lines[i];
    for (final match in inlineRandomListPattern.allMatches(line)) {
      final listBody = match.group(1);
      if (listBody == null || listBody.isEmpty) continue;
      _recordStringsFromChunk(
        chunk: listBody,
        baseLine: i + 1,
        context: 'random-list-literal',
        stringInfo: stringInfo,
        relativePath: relativePath,
      );
    }
  }

  // Direct list literals used with `.random` or `[lcsRandom(...)]`, including
  // multiline forms inside interpolated strings.
  final literalRandomListPattern = RegExp(
    r'\[([\s\S]*?)\]\s*(?:\.random\b|\[\s*lcsRandom\s*\()',
    multiLine: true,
  );

  for (final match in literalRandomListPattern.allMatches(content)) {
    final listBody = match.group(1);
    if (listBody == null || listBody.isEmpty) continue;
    if (!listBody.contains('\n')) continue;
    if (listBody.contains(';')) continue;
    final baseLine = _lineNumberFromOffset(lineOffsets, match.start);
    _recordStringsFromChunk(
      chunk: listBody,
      baseLine: baseLine,
      context: 'random-list-literal',
      stringInfo: stringInfo,
      relativePath: relativePath,
    );
  }

  // Variables selected with `.random` or `[lcsRandom(...)]` can point to
  // multiline list declarations elsewhere in the file.
  final randomListVariables = _findRandomListVariables(content);
  for (final variableName in randomListVariables) {
    final assignmentPattern = RegExp(
      '\\b${RegExp.escape(variableName)}\\s*=\\s*\\[([\\s\\S]*?)\\]\\s*;',
      multiLine: true,
    );

    for (final match in assignmentPattern.allMatches(content)) {
      final listBody = match.group(1);
      if (listBody == null || listBody.isEmpty) continue;
      final baseLine = _lineNumberFromOffset(lineOffsets, match.start);
      _recordStringsFromChunk(
        chunk: listBody,
        baseLine: baseLine,
        context: 'random-list-variable:$variableName',
        stringInfo: stringInfo,
        relativePath: relativePath,
      );
    }
  }
}

Set<String> _findRandomListVariables(String content) {
  final variables = <String>{};

  final randomPropertyPattern = RegExp(r'\b([a-zA-Z_]\w*)\s*\.random\b');
  for (final match in randomPropertyPattern.allMatches(content)) {
    final variableName = match.group(1);
    if (variableName != null) {
      variables.add(variableName);
    }
  }

  final randomIndexPattern = RegExp(r'\b([a-zA-Z_]\w*)\s*\[\s*lcsRandom\s*\(');
  for (final match in randomIndexPattern.allMatches(content)) {
    final variableName = match.group(1);
    if (variableName != null) {
      variables.add(variableName);
    }
  }

  return variables;
}

void _recordStringsFromChunk({
  required String chunk,
  required int baseLine,
  required String context,
  required Map<String, StringInfo> stringInfo,
  required String relativePath,
}) {
  for (final literalMatch in _scanQuotedStringLiterals(chunk)) {
    final suffix = chunk.substring(literalMatch.end).trimLeft();
    if (suffix.startsWith(':')) {
      continue;
    }
    final value = _unescapeStringLiteral(literalMatch.rawContent);
    if (!_isUserFacing(value, minLength: 3, allowSingleWord: true)) {
      continue;
    }

    final prefix = chunk.substring(0, literalMatch.start);
    final relativeLine = '\n'.allMatches(prefix).length;
    final lineNumber = baseLine + relativeLine;
    _recordString(stringInfo, value, relativePath, lineNumber, context);
  }
}

List<_ChunkStringLiteral> _scanQuotedStringLiterals(String chunk) {
  final literals = <_ChunkStringLiteral>[];
  for (int i = 0; i < chunk.length; i++) {
    final quote = chunk[i];
    if (quote != '"' && quote != "'") {
      continue;
    }

    final start = i;
    final buffer = StringBuffer();
    i++;
    while (i < chunk.length) {
      final char = chunk[i];
      if (chunk.codeUnitAt(i) == 92 && i + 1 < chunk.length) {
        buffer
          ..write(char)
          ..write(chunk[i + 1]);
        i += 2;
        continue;
      }
      if (char == quote) {
        literals.add(_ChunkStringLiteral(start, i + 1, buffer.toString()));
        break;
      }
      buffer.write(char);
      i++;
    }
  }
  return literals;
}

class _ChunkStringLiteral {
  const _ChunkStringLiteral(this.start, this.end, this.rawContent);

  final int start;
  final int end;
  final String rawContent;
}

List<int> _buildLineStartOffsets(String content) {
  final lineOffsets = <int>[0];
  for (int i = 0; i < content.length; i++) {
    if (content.codeUnitAt(i) == 10) {
      lineOffsets.add(i + 1);
    }
  }
  return lineOffsets;
}

int _lineNumberFromOffset(List<int> lineOffsets, int offset) {
  int low = 0;
  int high = lineOffsets.length - 1;

  while (low <= high) {
    final mid = low + ((high - low) >> 1);
    if (lineOffsets[mid] <= offset) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return high + 1;
}

List<(RegExp, String)> _buildWrapperCallPatterns() {
  return [
    // addstr family
    (RegExp(r'\baddstr\s*\(\s*"((?:[^"\\]|\\.)*)"'), 'addstr'),
    (RegExp(r"\baddstr\s*\(\s*'((?:[^'\\]|\\.)*)'"), 'addstr'),
    (
      RegExp(r'\bmvaddstr\s*\([^,]+,\s*[^,]+,\s*"((?:[^"\\]|\\.)*)"'),
      'mvaddstr',
    ),
    (
      RegExp(r"\bmvaddstr\s*\([^,]+,\s*[^,]+,\s*'((?:[^'\\]|\\.)*)'"),
      'mvaddstr',
    ),
    (RegExp(r'\baddstrc\s*\(\s*[^,]+,\s*"((?:[^"\\]|\\.)*)"'), 'addstrc'),
    (RegExp(r"\baddstrc\s*\(\s*[^,]+,\s*'((?:[^'\\]|\\.)*)'"), 'addstrc'),
    (
      RegExp(r'\bmvaddstrc\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*"((?:[^"\\]|\\.)*)"'),
      'mvaddstrc',
    ),
    (
      RegExp(r"\bmvaddstrc\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*'((?:[^'\\]|\\.)*)'"),
      'mvaddstrc',
    ),
    (RegExp(r'\baddstrx\s*\(\s*"((?:[^"\\]|\\.)*)"'), 'addstrx'),
    (RegExp(r"\baddstrx\s*\(\s*'((?:[^'\\]|\\.)*)'"), 'addstrx'),
    (
      RegExp(r'\bmvaddstrx\s*\([^,]+,\s*[^,]+,\s*"((?:[^"\\]|\\.)*)"'),
      'mvaddstrx',
    ),
    (
      RegExp(r"\bmvaddstrx\s*\([^,]+,\s*[^,]+,\s*'((?:[^'\\]|\\.)*)'"),
      'mvaddstrx',
    ),
    (RegExp(r'\baddstrcx\s*\(\s*[^,]+,\s*"((?:[^"\\]|\\.)*)"'), 'addstrcx'),
    (RegExp(r"\baddstrcx\s*\(\s*[^,]+,\s*'((?:[^'\\]|\\.)*)'"), 'addstrcx'),
    (
      RegExp(
        r'\bmvaddstrcx\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*"((?:[^"\\]|\\.)*)"',
      ),
      'mvaddstrcx',
    ),
    (
      RegExp(
        r"\bmvaddstrcx\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*'((?:[^'\\]|\\.)*)'",
      ),
      'mvaddstrcx',
    ),
    (
      RegExp(r'\bmvaddstrRight\s*\([^,]+,\s*"((?:[^"\\]|\\.)*)"'),
      'mvaddstrRight',
    ),
    (
      RegExp(r"\bmvaddstrRight\s*\([^,]+,\s*'((?:[^'\\]|\\.)*)'"),
      'mvaddstrRight',
    ),
    (
      RegExp(r'\bmvaddstrCenter\s*\([^,]+,\s*"((?:[^"\\]|\\.)*)"'),
      'mvaddstrCenter',
    ),
    (
      RegExp(r"\bmvaddstrCenter\s*\([^,]+,\s*'((?:[^'\\]|\\.)*)'"),
      'mvaddstrCenter',
    ),
    (
      RegExp(r'\baddparagraph\s*\([^,]+,\s*[^,]+,\s*"((?:[^"\\]|\\.)*)"'),
      'addparagraph',
    ),
    (
      RegExp(r"\baddparagraph\s*\([^,]+,\s*[^,]+,\s*'((?:[^'\\]|\\.)*)'"),
      'addparagraph',
    ),

    // Option wrapper family
    (
      RegExp(
        r'\baddOptionText\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*"((?:[^"\\]|\\.)*)"',
      ),
      'addOptionText',
    ),
    (
      RegExp(
        r"\baddOptionText\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*'((?:[^'\\]|\\.)*)'",
      ),
      'addOptionText',
    ),
    (
      RegExp(r'\baddInlineOptionText\s*\(\s*[^,]+,\s*"((?:[^"\\]|\\.)*)"'),
      'addInlineOptionText',
    ),
    (
      RegExp(r"\baddInlineOptionText\s*\(\s*[^,]+,\s*'((?:[^'\\]|\\.)*)'"),
      'addInlineOptionText',
    ),
    (
      RegExp(
        r'\baddCenteredOptionText\s*\([^,]+,\s*[^,]+,\s*"((?:[^"\\]|\\.)*)"',
      ),
      'addCenteredOptionText',
    ),
    (
      RegExp(
        r"\baddCenteredOptionText\s*\([^,]+,\s*[^,]+,\s*'((?:[^'\\]|\\.)*)'",
      ),
      'addCenteredOptionText',
    ),

    // Newspaper tabloid headlines (5x5 caps font; translated inside displayCenteredNewsFont)
    (
      RegExp(
        r'\bdisplayCenteredNewsFont\s*\(\s*"((?:[^"\\]|\\.)*)"',
      ),
      'displayCenteredNewsFont',
    ),
    (
      RegExp(
        r"\bdisplayCenteredNewsFont\s*\(\s*'((?:[^'\\]|\\.)*)'",
      ),
      'displayCenteredNewsFont',
    ),
    (
      RegExp(r'\bheadline:\s*"((?:[^"\\]|\\.)*)"'),
      'headline',
    ),
    (
      RegExp(r"\bheadline:\s*'((?:[^'\\]|\\.)*)'"),
      'headline',
    ),

    // LcsI18n.tr() calls for dynamic translations
    (RegExp(r'\bLcsI18n\.tr\s*\(\s*"((?:[^"\\]|\\.)*)"\s*\)'), 'LcsI18n.tr'),
    (RegExp(r"\bLcsI18n\.tr\s*\(\s*'((?:[^'\\]|\\.)*)'\s*\)"), 'LcsI18n.tr'),
    // LcsI18n.processString() for templated user-facing generated text (site names etc)
    (
      RegExp(r'LcsI18n\.processString\s*\(\s*"((?:[^"\\]|\\.)*)"'),
      'LcsI18n.processString',
    ),
    (
      RegExp(r"LcsI18n\.processString\s*\(\s*'((?:[^'\\]|\\.)*)'"),
      'LcsI18n.processString',
    ),
  ];
}

List<RegExp> _buildTripleQuotedProcessStringPatterns() => [
  RegExp(r'LcsI18n\.processString\s*\(\s*"""([\s\S]*?)"""'),
  RegExp("LcsI18n\\.processString\\s*\\(\\s*'''([\\s\\S]*?)'''"),
];

int _lineNumberAtOffset(String content, int offset) =>
    '\n'.allMatches(content.substring(0, offset)).length + 1;

List<(String, RegExp)> _buildMultilineContextPatterns() {
  const wrapperFunctions = [
    'addstr',
    'mvaddstr',
    'addstrc',
    'mvaddstrc',
    'addstrx',
    'mvaddstrx',
    'addstrcx',
    'mvaddstrcx',
    'mvaddstrRight',
    'mvaddstrCenter',
    'addparagraph',
    'addOptionText',
    'addInlineOptionText',
    'addCenteredOptionText',
    'processString',
  ];

  return [
    for (final function in wrapperFunctions)
      (function, RegExp('\\b$function\\s*\\(')),
  ];
}

String? _inferWrapperContext(
  List<String> lines,
  int lineIndex,
  List<(String, RegExp)> contextPatterns,
) {
  for (int j = lineIndex - 1; j >= max(0, lineIndex - 12); j--) {
    final prevLine = lines[j];
    for (final context in contextPatterns) {
      if (context.$2.hasMatch(prevLine)) {
        return context.$1;
      }
    }
  }
  return null;
}

void _recordString(
  Map<String, StringInfo> stringInfo,
  String text,
  String relativePath,
  int lineNumber,
  String context,
) {
  final normalizedText = _normalizeColorizedPlaceholders(
    text.replaceAll(_escapedDollarSentinel, r'$'),
  );
  final key = normalizedText;
  stringInfo.putIfAbsent(
    key,
    () => StringInfo(
      text: normalizedText,
      locations: [],
      count: 0,
      occurrenceKeys: {},
    ),
  );

  final info = stringInfo[key]!;
  final occurrenceKey = '$relativePath:$lineNumber';
  if (info.occurrenceKeys.add(occurrenceKey)) {
    info.count++;
    info.locations.add('$relativePath:$lineNumber ($context)');
  }
}

bool _isUserFacing(
  String str, {
  int minLength = 4,
  bool allowSingleWord = false,
}) {
  // Very short strings (likely not meaningful)
  if (str.length < minLength) return false;

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

  if (!allowSingleWord) {
    // Strings that are purely technical characters.
    final techPattern = RegExp(
      r'^[a-zA-Z0-9_./\\$@#%&*+\-=\[\]{}()|;:<>?,"]+$',
    );
    if (techPattern.hasMatch(str)) {
      return false;
    }
  } else {
    // Skip obvious constant-like IDs from data tables (e.g. WEAPON_AK102).
    final constantLike = RegExp(r'^[A-Z0-9]+(?:_[A-Z0-9]+)+$');
    if (constantLike.hasMatch(str)) return false;
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

  // Fix for apostrophe/multiline fragment bug: reject obvious name+flavor suffix/prefix
  // fragments (e.g. "'s lifeless body...", " slams into...", leading whitespace starters).
  // These must only appear inside complete {name}... or {vehicle}... templates.
  // This prevents resyncs from reintroducing corrupt fragment keys into the catalogs.
  final trimmedLeft = str.trimLeft();
  if (trimmedLeft.startsWith("'")) {
    return false;
  }
  if (str.startsWith(RegExp(r'\s')) &&
      RegExp(r'^[a-z]').hasMatch(trimmedLeft)) {
    return false;
  }

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
  int hashShards,
  bool pruneDead,
) async {
  final localesToProcess = targetLocale != null
      ? [targetLocale]
      : existingTranslations.keys.toList();
  localesToProcess.sort();

  print('Processing ARB files for locales: ${localesToProcess.join(', ')}');
  print('Hash shards per locale: $hashShards\n');

  int totalAdded = 0;
  final summary = <String, Map<String, dynamic>>{};

  for (final locale in localesToProcess) {
    final existingArb = Map<String, dynamic>.from(
      existingTranslations[locale] ?? <String, dynamic>{},
    );
    final files = localeFileLists[locale] ?? [];
    int addedToThisLocale = 0;
    int prunedFromThisLocale = 0;
    if (pruneDead) {
      final liveKeys = sortedStrings.map((info) => info.text).toSet();
      final deadKeys = existingArb.keys
          .where((key) => !key.startsWith('@') && !liveKeys.contains(key))
          .toList();
      for (final key in deadKeys) {
        existingArb.remove(key);
      }
      prunedFromThisLocale = deadKeys.length;
    }
    for (final info in sortedStrings) {
      if (!existingArb.containsKey(info.text)) {
        existingArb[info.text] = info.text;
        addedToThisLocale++;
      }
    }

    final shards = await buildArbCatalogShards(
      locale: locale,
      catalogMaps: [existingArb],
      shardCount: hashShards,
    );

    await _writeCanonicalLocaleFiles(
      locale: locale,
      l10nPath: l10nPath,
      shards: shards,
      existingFiles: files,
    );

    totalAdded += addedToThisLocale;
    final totalStrings = existingArb.keys
        .where((k) => !k.startsWith('@'))
        .length;

    summary[locale] = {
      'total': totalStrings,
      'files': shards.length,
      'added': addedToThisLocale,
      'pruned': prunedFromThisLocale,
    };

    print(
      '✓ $locale: Added $addedToThisLocale strings, pruned $prunedFromThisLocale dead keys '
      '($totalStrings total in ${shards.length} file(s))',
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
        '  $locale: ${stats['total']} strings in ${stats['files']} file(s) '
        '(+${stats['added']} new, -${stats['pruned']} dead)',
      );
    }
  }

  if (totalAdded > 0) {
    print(
      '\n⚠️  Remember to translate the newly added strings in each ARB file!',
    );
    print(
      '   Validate with: dart run scripts/maintain_arb_catalogs.dart --check',
    );
    print('   Test with: flutter test test/i18n_test.dart');
  }
}

Future<void> _writeCanonicalLocaleFiles({
  required String locale,
  required String l10nPath,
  required List<ArbCatalogShard> shards,
  required List<File> existingFiles,
}) async {
  final expectedFileNames = shards.map((s) => s.fileName).toSet();

  for (final existing in existingFiles) {
    final fileName = existing.path.split('/').last;
    if (!expectedFileNames.contains(fileName) &&
        _isLocaleArbOrLegacyFile(fileName, locale)) {
      await existing.delete();
    }
  }

  const encoder = JsonEncoder.withIndent('  ');
  for (final shard in shards) {
    final filePath = '$l10nPath/${shard.fileName}';
    final file = File(filePath);
    await file.writeAsString('${encoder.convert(shard.entries)}\n');
  }
}

bool _isLocaleArbOrLegacyFile(String filename, String locale) {
  final shardRegex = RegExp('^app_${RegExp.escape(locale)}_part\\d{2}\\.arb\$');
  if (shardRegex.hasMatch(filename)) return true;

  // Legacy unlabeled file form (no longer canonical, removed on write).
  final legacyRegex = RegExp('^app_${RegExp.escape(locale)}\\.arb\$');
  return legacyRegex.hasMatch(filename);
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
    'Found ${newEntries.length} new translatable strings for $targetLocale\n',
  );
  print(
    'Add these entries to the canonical shard files in lib/l10n/app_${targetLocale}_part01..part32.arb:\n',
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
    '1. Run find_translatable_strings.dart to route entries to canonical shard files',
  );
  print('2. Add the above JSON entries (merge with existing content)');
  print('3. Translate the string values to $targetLocale');
  print(
    '4. Validate with: dart run scripts/maintain_arb_catalogs.dart --check',
  );
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
    required this.occurrenceKeys,
  });

  String text;
  List<String> locations;
  int count;
  Set<String> occurrenceKeys;

  Map<String, dynamic> toJson() => {
    'text': text,
    'count': count,
    'locations': locations,
  };
}
