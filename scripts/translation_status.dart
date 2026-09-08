#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:lcs_new_age/i18n/translation_exceptions.dart';

void main(List<String> args) {
  if (args.contains('--help') || args.contains('-h')) {
    print('Translation status for hash-sharded ARB catalogs');
    print('');
    print('Usage: dart run scripts/translation_status.dart [options]');
    print('');
    print('Options:');
    print('  --locale=LOCALE         Target locale (default: pt_BR)');
    print('  --source-locale=LOCALE  Source locale (default: en_US)');
    print(
      '  --part=PART             Limit status to one part (e.g. 1, 01, part01)',
    );
    print(
      '  --per-part              Include per-part file metrics for current scope',
    );
    print('  --json                  Print JSON output');
    print('  --help, -h              Show this help message');
    print('');
    print('Examples:');
    print('  dart run scripts/translation_status.dart');
    print('  dart run scripts/translation_status.dart --per-part');
    print(
      '  dart run scripts/translation_status.dart --locale=pt_BR --part=part07',
    );
    return;
  }

  final targetLocale = _getArg(args, 'locale', defaultValue: 'pt_BR');
  final sourceLocale = _getArg(args, 'source-locale', defaultValue: 'en_US');
  final partArg = _getOptionalArg(args, 'part');
  final includePerPart = args.contains('--per-part');
  final outputJson = args.contains('--json');
  final partFilter = partArg == null ? null : _parsePartArg(partArg);

  if (partArg != null && partFilter == null) {
    stderr.writeln(
      'Error: Invalid --part value "$partArg". Use 1, 01, part01, or app_<locale>_part01.arb',
    );
    exit(1);
  }
  if (partFilter != null && partFilter <= 0) {
    stderr.writeln('Error: --part must be >= 1');
    exit(1);
  }

  final projectRoot = _detectProjectRoot();
  final l10nDir = Directory('${projectRoot.path}/lib/l10n');
  if (!l10nDir.existsSync()) {
    stderr.writeln('Error: lib/l10n directory not found at ${l10nDir.path}');
    exit(1);
  }

  final sourceParts = _loadLocaleParts(l10nDir, sourceLocale);
  final targetParts = _loadLocaleParts(l10nDir, targetLocale);

  if (sourceParts.isEmpty) {
    stderr.writeln('Error: No ARB files found for source locale $sourceLocale');
    exit(1);
  }
  if (targetParts.isEmpty) {
    stderr.writeln('Error: No ARB files found for target locale $targetLocale');
    exit(1);
  }

  final allPartNumbers = <int>{...sourceParts.keys, ...targetParts.keys};
  if (partFilter != null && !allPartNumbers.contains(partFilter)) {
    final formatted = _formatPart(partFilter);
    stderr.writeln(
      'Error: Requested --part=$formatted does not exist in source or target locale files',
    );
    exit(1);
  }

  final scopedPartNumbers = partFilter == null
      ? (() {
          final list = allPartNumbers.toList();
          list.sort();
          return list;
        })()
      : [partFilter];
  final showPerPart = includePerPart || partFilter != null;
  final partPadding = _partPadding(scopedPartNumbers);

  final sourceScoped = _mergePartStrings(sourceParts, scopedPartNumbers);
  final targetScoped = _mergePartStrings(targetParts, scopedPartNumbers);
  final aggregate = _computeStats(
    sourceLocale: sourceLocale,
    targetLocale: targetLocale,
    sourceEntries: sourceScoped,
    targetEntries: targetScoped,
  );

  final perPart = <_PartStatus>[];
  if (showPerPart) {
    for (final part in scopedPartNumbers) {
      final sourceCatalog = sourceParts[part];
      final targetCatalog = targetParts[part];
      final partStats = _computeStats(
        sourceLocale: sourceLocale,
        targetLocale: targetLocale,
        sourceEntries: sourceCatalog?.stringEntries ?? <String, String>{},
        targetEntries: targetCatalog?.stringEntries ?? <String, String>{},
      );
      perPart.add(
        _PartStatus(
          partNumber: part,
          sourceFiles: sourceCatalog?.fileNames ?? const <String>[],
          targetFiles: targetCatalog?.fileNames ?? const <String>[],
          stats: partStats,
        ),
      );
    }
  }

  final stats = {
    'sourceLocale': sourceLocale,
    'targetLocale': targetLocale,
    'scope': partFilter == null ? 'all-parts' : _formatPart(partFilter),
    ...aggregate.toJson(),
    if (showPerPart)
      'perPart': perPart
          .map((status) => status.toJson(partPadding: partPadding))
          .toList(),
  };

  if (outputJson) {
    const encoder = JsonEncoder.withIndent('  ');
    print(encoder.convert(stats));
    return;
  }

  print('Translation Status');
  print('Source locale: $sourceLocale');
  print('Target locale: $targetLocale');
  print('Scope: ${stats['scope']}');
  print('');
  print('Source keys:               ${aggregate.sourceKeys}');
  print('Target keys:               ${aggregate.targetKeys}');
  print('Translated vs source:      ${aggregate.translatedAgainstSource}');
  print('Untranslated vs source:    ${aggregate.untranslatedAgainstSource}');
  print('Missing in target:         ${aggregate.missingInTarget}');
  print('Extra in target:           ${aggregate.extraInTarget}');
  print('Empty values in target:    ${aggregate.emptyInTarget}');
  print(
    'Coverage vs source:       ${aggregate.coveragePercent.toStringAsFixed(2)}%',
  );

  if (showPerPart) {
    print('');
    print(
      'Per-part file metrics (${scopedPartNumbers.length} part${scopedPartNumbers.length == 1 ? '' : 's'}):',
    );
    print(
      'Part${' ' * (partPadding + 1)} Source  Target  Xlat  Unxlat  Missing  Extra  Empty  Coverage',
    );
    for (final status in perPart) {
      final s = status.stats;
      final partLabel = _formatPart(status.partNumber, padding: partPadding);
      print(
        '${partLabel.padRight(partPadding + 6)}'
        '${s.sourceKeys.toString().padLeft(6)}'
        '${s.targetKeys.toString().padLeft(8)}'
        '${s.translatedAgainstSource.toString().padLeft(6)}'
        '${s.untranslatedAgainstSource.toString().padLeft(8)}'
        '${s.missingInTarget.toString().padLeft(9)}'
        '${s.extraInTarget.toString().padLeft(7)}'
        '${s.emptyInTarget.toString().padLeft(7)}'
        '${s.coveragePercent.toStringAsFixed(2).padLeft(10)}%',
      );
    }
  }
}

Directory _detectProjectRoot() {
  var current = Directory.current;
  while (true) {
    final pubspec = File('${current.path}/pubspec.yaml');
    final l10n = Directory('${current.path}/lib/l10n');
    if (pubspec.existsSync() && l10n.existsSync()) {
      return current;
    }

    final parent = current.parent;
    if (parent.path == current.path) {
      return Directory.current;
    }
    current = parent;
  }
}

Map<int, _PartCatalog> _loadLocaleParts(Directory l10nDir, String locale) {
  final regex = RegExp('^app_${RegExp.escape(locale)}_part(\\d+)\\.arb\$');
  final files = l10nDir.listSync().whereType<File>().toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  final parts = <int, _PartCatalog>{};
  for (final file in files) {
    final fileName = _basename(file);
    final match = regex.firstMatch(fileName);
    if (match == null) continue;

    final partNumber = int.tryParse(match.group(1) ?? '');
    if (partNumber == null || partNumber <= 0) continue;

    try {
      final jsonMap =
          json.decode(file.readAsStringSync()) as Map<String, dynamic>;

      final existing = parts[partNumber];
      if (existing == null) {
        parts[partNumber] = _PartCatalog(
          partNumber: partNumber,
          fileNames: [fileName],
          rawEntries: jsonMap,
          stringEntries: _stringEntries(jsonMap),
        );
      } else {
        final mergedRaw = <String, dynamic>{...existing.rawEntries, ...jsonMap};
        parts[partNumber] = _PartCatalog(
          partNumber: partNumber,
          fileNames: [...existing.fileNames, fileName]..sort(),
          rawEntries: mergedRaw,
          stringEntries: _stringEntries(mergedRaw),
        );
      }
    } catch (e) {
      stderr.writeln('Warning: Could not parse ${file.path}: $e');
    }
  }
  return parts;
}

Map<String, String> _mergePartStrings(
  Map<int, _PartCatalog> parts,
  List<int> selectedPartNumbers,
) {
  final merged = <String, String>{};
  final sortedParts = selectedPartNumbers.toList()..sort();
  for (final part in sortedParts) {
    final entries = parts[part]?.stringEntries;
    if (entries == null) continue;
    for (final entry in entries.entries) {
      merged[entry.key] = entry.value;
    }
  }
  return merged;
}

Map<String, String> _stringEntries(Map<String, dynamic> arb) {
  final result = <String, String>{};
  for (final entry in arb.entries) {
    if (entry.key.startsWith('@')) continue;
    if (entry.value is! String) continue;
    result[entry.key] = entry.value as String;
  }
  return result;
}

_TranslationStats _computeStats({
  required String sourceLocale,
  required String targetLocale,
  required Map<String, String> sourceEntries,
  required Map<String, String> targetEntries,
}) {
  final sourceKeys = sourceEntries.keys.toSet();
  final targetKeys = targetEntries.keys.toSet();

  final missingInTarget = sourceKeys.difference(targetKeys);
  final extraInTarget = targetKeys.difference(sourceKeys);

  int translatedAgainstSource = 0;
  int untranslatedAgainstSource = 0;
  int emptyInTarget = 0;

  for (final key in sourceKeys) {
    final value = targetEntries[key];
    if (value == null) {
      continue;
    }
    if (value.isEmpty) {
      emptyInTarget++;
      untranslatedAgainstSource++;
      continue;
    }
    if (value == key && !structuralTranslationKeys.contains(key)) {
      untranslatedAgainstSource++;
    } else {
      translatedAgainstSource++;
    }
  }

  final totalSource = sourceKeys.length;
  final coverage = totalSource == 0
      ? 0.0
      : translatedAgainstSource / totalSource * 100;

  return _TranslationStats(
    sourceLocale: sourceLocale,
    targetLocale: targetLocale,
    sourceKeys: totalSource,
    targetKeys: targetKeys.length,
    translatedAgainstSource: translatedAgainstSource,
    untranslatedAgainstSource: untranslatedAgainstSource,
    missingInTarget: missingInTarget.length,
    extraInTarget: extraInTarget.length,
    emptyInTarget: emptyInTarget,
    coveragePercent: coverage,
  );
}

int? _parsePartArg(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) return null;

  final fileMatch = RegExp(
    r'^app_[A-Za-z0-9_]+_part(\d+)\.arb$',
    caseSensitive: false,
  ).firstMatch(trimmed);
  if (fileMatch != null) {
    return int.tryParse(fileMatch.group(1)!);
  }

  final partMatch = RegExp(
    r'^part(\d+)$',
    caseSensitive: false,
  ).firstMatch(trimmed);
  if (partMatch != null) {
    return int.tryParse(partMatch.group(1)!);
  }

  if (RegExp(r'^\d+$').hasMatch(trimmed)) {
    return int.tryParse(trimmed);
  }

  return null;
}

String _formatPart(int partNumber, {int padding = 2}) {
  return 'part${partNumber.toString().padLeft(padding, '0')}';
}

int _partPadding(Iterable<int> partNumbers) {
  var maxPart = 0;
  for (final part in partNumbers) {
    if (part > maxPart) maxPart = part;
  }
  return maxPart <= 0 ? 2 : maxPart.toString().length.clamp(2, 8);
}

String _basename(File file) {
  final segments = file.uri.pathSegments;
  if (segments.isEmpty) return file.path;
  final name = segments.last;
  return name.isEmpty && segments.length > 1
      ? segments[segments.length - 2]
      : name;
}

String _getArg(List<String> args, String name, {required String defaultValue}) {
  for (final arg in args) {
    if (arg.startsWith('--$name=')) {
      return arg.substring('--$name='.length);
    }
  }
  return defaultValue;
}

String? _getOptionalArg(List<String> args, String name) {
  for (final arg in args) {
    if (arg.startsWith('--$name=')) {
      return arg.substring('--$name='.length);
    }
  }
  return null;
}

class _PartCatalog {
  const _PartCatalog({
    required this.partNumber,
    required this.fileNames,
    required this.rawEntries,
    required this.stringEntries,
  });

  final int partNumber;
  final List<String> fileNames;
  final Map<String, dynamic> rawEntries;
  final Map<String, String> stringEntries;
}

class _TranslationStats {
  const _TranslationStats({
    required this.sourceLocale,
    required this.targetLocale,
    required this.sourceKeys,
    required this.targetKeys,
    required this.translatedAgainstSource,
    required this.untranslatedAgainstSource,
    required this.missingInTarget,
    required this.extraInTarget,
    required this.emptyInTarget,
    required this.coveragePercent,
  });

  final String sourceLocale;
  final String targetLocale;
  final int sourceKeys;
  final int targetKeys;
  final int translatedAgainstSource;
  final int untranslatedAgainstSource;
  final int missingInTarget;
  final int extraInTarget;
  final int emptyInTarget;
  final double coveragePercent;

  Map<String, dynamic> toJson() {
    return {
      'sourceLocale': sourceLocale,
      'targetLocale': targetLocale,
      'sourceKeys': sourceKeys,
      'targetKeys': targetKeys,
      'translatedAgainstSource': translatedAgainstSource,
      'untranslatedAgainstSource': untranslatedAgainstSource,
      'missingInTarget': missingInTarget,
      'extraInTarget': extraInTarget,
      'emptyInTarget': emptyInTarget,
      'coveragePercent': coveragePercent,
    };
  }
}

class _PartStatus {
  const _PartStatus({
    required this.partNumber,
    required this.sourceFiles,
    required this.targetFiles,
    required this.stats,
  });

  final int partNumber;
  final List<String> sourceFiles;
  final List<String> targetFiles;
  final _TranslationStats stats;

  Map<String, dynamic> toJson({required int partPadding}) {
    return {
      'part': _formatPart(partNumber, padding: partPadding),
      'partNumber': partNumber,
      'sourceFiles': sourceFiles,
      'targetFiles': targetFiles,
      ...stats.toJson(),
    };
  }
}
