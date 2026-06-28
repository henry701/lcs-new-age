#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main(List<String> args) async {
  if (args.contains('--help') || args.contains('-h')) {
    print('Interpolation status for localization');
    print('');
    print('Usage: dart run scripts/interpolation_status.dart [options]');
    print('');
    print('Options:');
    print('  --json         Print JSON output');
    print('  --all          Emit every match instead of samples');
    print('  --check        Exit 1 when unclassified matches remain');
    print(
      '  --allowlist=PATH  JSON allowlist of classified non-translatable hits',
    );
    print(
      '  --limit=N      Max rows for top files and sample output (default: 20)',
    );
    print('  --help, -h     Show this help message');
    return;
  }

  final asJson = args.contains('--json');
  final emitAll = args.contains('--all');
  final checkMode = args.contains('--check');
  final allowlistPath = _optionalArg(args, 'allowlist');
  final limit = int.tryParse(_arg(args, 'limit', defaultValue: '20')) ?? 20;
  final allowlist = allowlistPath == null
      ? const <_AllowlistEntry>[]
      : _loadAllowlist(allowlistPath);

  final libDir = Directory('lib');
  if (!libDir.existsSync()) {
    stderr.writeln('Error: lib/ directory not found');
    exit(1);
  }

  final wrapperPatterns = _buildWrapperCallPatterns();
  final contextPatterns = _buildMultilineContextPatterns();
  final allQuotedPatterns = [
    RegExp(r'"((?:[^"\\]|\\.)*)"'),
    RegExp(r"'((?:[^'\\]|\\.)*)'"),
  ];
  final multilineQuotedPatterns = [
    RegExp(r'^\s*"([^"]+)"\s*,?\s*$'),
    RegExp(r"^\s*'([^']+)'\s*,?\s*$"),
  ];

  final allInterpolated = <_MatchRecord>[];
  final wrapperContextInterpolated = <_MatchRecord>[];
  final wrapperArgInterpolated = <_MatchRecord>[];

  final allSeen = <String>{};
  final wrapperContextSeen = <String>{};
  final wrapperArgSeen = <String>{};

  await for (final entity in libDir.list(recursive: true, followLinks: false)) {
    if (entity is! File || !entity.path.endsWith('.dart')) continue;
    if (entity.path.endsWith('.g.dart')) continue;

    final relativePath = entity.path.replaceFirst('${libDir.path}/', '');
    final content = await entity.readAsString();
    final lines = content.split('\n');
    final lineOffsets = _buildLineStartOffsets(content);

    for (final pattern in allQuotedPatterns) {
      for (final match in pattern.allMatches(content)) {
        final literal = match.group(1);
        if (literal == null || !_hasInterpolationMarker(literal)) continue;

        final lineNumber = _lineNumberFromOffset(lineOffsets, match.start);
        final globalKey = '$relativePath:$lineNumber:$literal';
        if (allSeen.add(globalKey)) {
          allInterpolated.add(
            _MatchRecord(
              file: relativePath,
              line: lineNumber,
              text: literal,
              context: null,
            ),
          );
        }
      }
    }

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      final lineNumber = i + 1;
      final trimmed = line.trimLeft();
      if (trimmed.startsWith('//')) continue;

      for (final wrapperPattern in wrapperPatterns) {
        for (final match in wrapperPattern.$1.allMatches(line)) {
          final literal = match.group(1);
          if (literal == null || !_hasInterpolationMarker(literal)) continue;

          final key = '$relativePath:$lineNumber:${wrapperPattern.$2}:$literal';
          if (wrapperArgSeen.add(key)) {
            wrapperArgInterpolated.add(
              _MatchRecord(
                file: relativePath,
                line: lineNumber,
                text: literal,
                context: wrapperPattern.$2,
              ),
            );
          }
        }
      }

      final context = _inferWrapperContext(lines, i, contextPatterns);
      if (context == null) continue;

      for (final pattern in multilineQuotedPatterns) {
        for (final match in pattern.allMatches(line)) {
          final literal = match.group(1);
          if (literal == null || !_hasInterpolationMarker(literal)) continue;

          final key = '$relativePath:$lineNumber:$context:$literal';
          if (wrapperContextSeen.add(key)) {
            wrapperContextInterpolated.add(
              _MatchRecord(
                file: relativePath,
                line: lineNumber,
                text: literal,
                context: context,
              ),
            );
          }
        }
      }
    }
  }

  final fileCounts = <String, int>{};
  for (final record in wrapperArgInterpolated) {
    fileCounts.update(record.file, (count) => count + 1, ifAbsent: () => 1);
  }

  final sortedFiles = fileCounts.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  final sample = wrapperArgInterpolated.toList()
    ..sort((a, b) {
      final fileOrder = a.file.compareTo(b.file);
      if (fileOrder != 0) return fileOrder;
      return a.line.compareTo(b.line);
    });
  final contextualSample = wrapperContextInterpolated.toList()
    ..sort((a, b) {
      final fileOrder = a.file.compareTo(b.file);
      if (fileOrder != 0) return fileOrder;
      return a.line.compareTo(b.line);
    });

  final classifiedContext = <_MatchRecord>[];
  final unclassifiedContext = <_MatchRecord>[];
  for (final record in wrapperContextInterpolated) {
    if (_isAllowlisted(record, allowlist)) {
      classifiedContext.add(record);
    } else {
      unclassifiedContext.add(record);
    }
  }

  final classifiedArgs = <_MatchRecord>[];
  final unclassifiedArgs = <_MatchRecord>[];
  for (final record in wrapperArgInterpolated) {
    if (_isAllowlisted(record, allowlist)) {
      classifiedArgs.add(record);
    } else {
      unclassifiedArgs.add(record);
    }
  }

  final contextRows = emitAll ? contextualSample : contextualSample.take(max(0, limit));
  final argRows = emitAll ? sample : sample.take(max(0, limit));

  final report = {
    'totalInterpolatedLiterals': allInterpolated.length,
    'wrapperContextInterpolatedLiterals': wrapperContextInterpolated.length,
    'wrapperArgumentInterpolatedLiterals': wrapperArgInterpolated.length,
    'classifiedWrapperContextInterpolatedLiterals': classifiedContext.length,
    'unclassifiedWrapperContextInterpolatedLiterals': unclassifiedContext.length,
    'classifiedWrapperArgumentInterpolatedLiterals': classifiedArgs.length,
    'unclassifiedWrapperArgumentInterpolatedLiterals': unclassifiedArgs.length,
    'topFilesByWrapperArgumentInterpolation': sortedFiles
        .take(max(0, limit))
        .map((entry) => {'file': entry.key, 'count': entry.value})
        .toList(),
    'wrapperArgumentInterpolation': argRows
        .map(
          (record) => {
            'file': record.file,
            'line': record.line,
            'context': record.context,
            'text': record.text,
          },
        )
        .toList(),
    'wrapperContextInterpolation': contextRows
        .map(
          (record) => {
            'file': record.file,
            'line': record.line,
            'context': record.context,
            'text': record.text,
          },
        )
        .toList(),
    if (checkMode || emitAll) ...{
      'unclassifiedWrapperArgumentInterpolation': unclassifiedArgs
          .map(
            (record) => {
              'file': record.file,
              'line': record.line,
              'context': record.context,
              'text': record.text,
            },
          )
          .toList(),
      'unclassifiedWrapperContextInterpolation': unclassifiedContext
          .map(
            (record) => {
              'file': record.file,
              'line': record.line,
              'context': record.context,
              'text': record.text,
            },
          )
          .toList(),
    },
    'sampleWrapperArgumentInterpolation': sample
        .take(max(0, limit))
        .map(
          (record) => {
            'file': record.file,
            'line': record.line,
            'context': record.context,
            'text': record.text,
          },
        )
        .toList(),
    'sampleWrapperContextInterpolation': contextualSample
        .take(max(0, limit))
        .map(
          (record) => {
            'file': record.file,
            'line': record.line,
            'context': record.context,
            'text': record.text,
          },
        )
        .toList(),
  };

  if (asJson) {
    print(const JsonEncoder.withIndent('  ').convert(report));
    if (checkMode &&
        (unclassifiedContext.isNotEmpty || unclassifiedArgs.isNotEmpty)) {
      exit(1);
    }
    return;
  }

  print('Interpolation Status');
  print('');
  print('Total interpolated string literals: ${allInterpolated.length}');
  print(
    'Interpolated literals near wrapper context: ${wrapperContextInterpolated.length}',
  );
  print(
    'Interpolated literals in wrapper call string args (high confidence): ${wrapperArgInterpolated.length}',
  );
  print('');
  print('Top files (wrapper call string args):');
  for (final entry in sortedFiles.take(max(0, limit))) {
    print('  ${entry.value.toString().padLeft(3)}  ${entry.key}');
  }
  print('');
  print('Sample matches (wrapper call string args):');
  for (final record in sample.take(max(0, limit))) {
    print('  ${record.file}:${record.line} (${record.context})');
    print('    ${record.text}');
  }
  print('');
  print('Sample matches (near wrapper context):');
  for (final record in contextualSample.take(max(0, limit))) {
    print('  ${record.file}:${record.line} (${record.context})');
    print('    ${record.text}');
  }

  if (checkMode &&
      (unclassifiedContext.isNotEmpty || unclassifiedArgs.isNotEmpty)) {
    print('');
    print(
      'Unclassified wrapper-context hits: ${unclassifiedContext.length}',
    );
    print('Unclassified wrapper-argument hits: ${unclassifiedArgs.length}');
    exit(1);
  }
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

String? _optionalArg(List<String> args, String name) {
  final prefix = '--$name=';
  for (final arg in args) {
    if (arg.startsWith(prefix)) {
      return arg.substring(prefix.length);
    }
  }
  return null;
}

List<_AllowlistEntry> _loadAllowlist(String path) {
  final file = File(path);
  if (!file.existsSync()) {
    stderr.writeln('Error: allowlist not found: $path');
    exit(1);
  }
  final decoded = json.decode(file.readAsStringSync()) as Map<String, dynamic>;
  final entries = decoded['entries'];
  if (entries is! List) {
    stderr.writeln('Error: allowlist must contain an entries array');
    exit(1);
  }
  return [
    for (final entry in entries)
      if (entry is Map<String, dynamic>)
        _AllowlistEntry(
          file: entry['file'] as String? ?? '',
          context: entry['context'] as String? ?? '',
          text: entry['text'] as String? ?? '',
          reason: entry['reason'] as String? ?? '',
        ),
  ];
}

bool _isAllowlisted(_MatchRecord record, List<_AllowlistEntry> allowlist) {
  for (final entry in allowlist) {
    if (entry.file != record.file) continue;
    if (entry.context.isNotEmpty && entry.context != record.context) continue;
    if (entry.text.isNotEmpty && entry.text != record.text) continue;
    return true;
  }
  return false;
}

class _AllowlistEntry {
  const _AllowlistEntry({
    required this.file,
    required this.context,
    required this.text,
    required this.reason,
  });

  final String file;
  final String context;
  final String text;
  final String reason;
}

bool _hasInterpolationMarker(String literal) {
  for (int i = 0; i < literal.length; i++) {
    if (literal.codeUnitAt(i) != 36) continue; // '$'
    final escaped = i > 0 && literal.codeUnitAt(i - 1) == 92; // '\'
    if (escaped) continue;
    if (i + 1 >= literal.length) continue;
    final next = literal.codeUnitAt(i + 1);
    final startsExpression = next == 123; // {
    final startsIdentifier =
        (next >= 65 && next <= 90) || (next >= 97 && next <= 122) || next == 95;
    if (startsExpression || startsIdentifier) return true;
  }
  return false;
}

List<int> _buildLineStartOffsets(String content) {
  final offsets = <int>[0];
  for (int i = 0; i < content.length; i++) {
    if (content.codeUnitAt(i) == 10) {
      offsets.add(i + 1);
    }
  }
  return offsets;
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
    (RegExp(r'\baddstr\s*\(\s*"([^"]+)"'), 'addstr'),
    (RegExp(r"\baddstr\s*\(\s*'([^']+)'"), 'addstr'),
    (RegExp(r'\bmvaddstr\s*\([^,]+,\s*[^,]+,\s*"([^"]+)"'), 'mvaddstr'),
    (RegExp(r"\bmvaddstr\s*\([^,]+,\s*[^,]+,\s*'([^']+)'"), 'mvaddstr'),
    (RegExp(r'\baddstrc\s*\(\s*[^,]+,\s*"([^"]+)"'), 'addstrc'),
    (RegExp(r"\baddstrc\s*\(\s*[^,]+,\s*'([^']+)'"), 'addstrc'),
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
    (RegExp(r'\baddstrcx\s*\(\s*[^,]+,\s*"([^"]+)"'), 'addstrcx'),
    (RegExp(r"\baddstrcx\s*\(\s*[^,]+,\s*'([^']+)'"), 'addstrcx'),
    (
      RegExp(r'\bmvaddstrcx\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*"([^"]+)"'),
      'mvaddstrcx',
    ),
    (
      RegExp(r"\bmvaddstrcx\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*'([^']+)'"),
      'mvaddstrcx',
    ),
    (RegExp(r'\bmvaddstrRight\s*\([^,]+,\s*"([^"]+)"'), 'mvaddstrRight'),
    (RegExp(r"\bmvaddstrRight\s*\([^,]+,\s*'([^']+)'"), 'mvaddstrRight'),
    (RegExp(r'\bmvaddstrCenter\s*\([^,]+,\s*"([^"]+)"'), 'mvaddstrCenter'),
    (RegExp(r"\bmvaddstrCenter\s*\([^,]+,\s*'([^']+)'"), 'mvaddstrCenter'),
    (RegExp(r'\baddparagraph\s*\([^,]+,\s*[^,]+,\s*"([^"]+)"'), 'addparagraph'),
    (RegExp(r"\baddparagraph\s*\([^,]+,\s*[^,]+,\s*'([^']+)'"), 'addparagraph'),
    (
      RegExp(r'\baddOptionText\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*"([^"]+)"'),
      'addOptionText',
    ),
    (
      RegExp(r"\baddOptionText\s*\([^,]+,\s*[^,]+,\s*[^,]+,\s*'([^']+)'"),
      'addOptionText',
    ),
    (
      RegExp(r'\baddInlineOptionText\s*\(\s*[^,]+,\s*"([^"]+)"'),
      'addInlineOptionText',
    ),
    (
      RegExp(r"\baddInlineOptionText\s*\(\s*[^,]+,\s*'([^']+)'"),
      'addInlineOptionText',
    ),
    (
      RegExp(r'\baddCenteredOptionText\s*\([^,]+,\s*[^,]+,\s*"([^"]+)"'),
      'addCenteredOptionText',
    ),
    (
      RegExp(r"\baddCenteredOptionText\s*\([^,]+,\s*[^,]+,\s*'([^']+)'"),
      'addCenteredOptionText',
    ),
  ];
}

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

class _MatchRecord {
  const _MatchRecord({
    required this.file,
    required this.line,
    required this.text,
    required this.context,
  });

  final String file;
  final int line;
  final String text;
  final String? context;
}
