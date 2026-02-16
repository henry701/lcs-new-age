#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  final targetLocale = _getArg(args, 'locale', defaultValue: 'pt_BR');
  final sourceLocale = _getArg(args, 'source-locale', defaultValue: 'en_US');
  final outputJson = args.contains('--json');

  final projectRoot = _detectProjectRoot();
  final l10nDir = Directory('${projectRoot.path}/lib/l10n');
  if (!l10nDir.existsSync()) {
    stderr.writeln('Error: lib/l10n directory not found at ${l10nDir.path}');
    exit(1);
  }

  final source = _loadMergedLocale(l10nDir, sourceLocale);
  final target = _loadMergedLocale(l10nDir, targetLocale);

  if (source.isEmpty) {
    stderr.writeln('Error: No ARB files found for source locale $sourceLocale');
    exit(1);
  }
  if (target.isEmpty) {
    stderr.writeln('Error: No ARB files found for target locale $targetLocale');
    exit(1);
  }

  final sourceEntries = _stringEntries(source);
  final targetEntries = _stringEntries(target);

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
    if (value == key) {
      untranslatedAgainstSource++;
    } else {
      translatedAgainstSource++;
    }
  }

  final totalSource = sourceKeys.length;
  final coverage = totalSource == 0
      ? 0.0
      : translatedAgainstSource / totalSource * 100;

  final stats = {
    'sourceLocale': sourceLocale,
    'targetLocale': targetLocale,
    'sourceKeys': totalSource,
    'targetKeys': targetKeys.length,
    'translatedAgainstSource': translatedAgainstSource,
    'untranslatedAgainstSource': untranslatedAgainstSource,
    'missingInTarget': missingInTarget.length,
    'extraInTarget': extraInTarget.length,
    'emptyInTarget': emptyInTarget,
    'coveragePercent': coverage,
  };

  if (outputJson) {
    const encoder = JsonEncoder.withIndent('  ');
    print(encoder.convert(stats));
    return;
  }

  print('Translation Status');
  print('Source locale: $sourceLocale');
  print('Target locale: $targetLocale');
  print('');
  print('Source keys:               ${stats['sourceKeys']}');
  print('Target keys:               ${stats['targetKeys']}');
  print('Translated vs source:      ${stats['translatedAgainstSource']}');
  print('Untranslated vs source:    ${stats['untranslatedAgainstSource']}');
  print('Missing in target:         ${stats['missingInTarget']}');
  print('Extra in target:           ${stats['extraInTarget']}');
  print('Empty values in target:    ${stats['emptyInTarget']}');
  print('Coverage vs source:       ${coverage.toStringAsFixed(2)}%');
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

Map<String, dynamic> _loadMergedLocale(Directory l10nDir, String locale) {
  final regex = RegExp('^app_${RegExp.escape(locale)}(?:_part\\d+)?\\.arb\$');
  final files =
      l10nDir
          .listSync()
          .whereType<File>()
          .where((file) => regex.hasMatch(file.path.split('/').last))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));

  final merged = <String, dynamic>{};
  for (final file in files) {
    try {
      final jsonMap =
          json.decode(file.readAsStringSync()) as Map<String, dynamic>;
      for (final entry in jsonMap.entries) {
        merged[entry.key] = entry.value;
      }
    } catch (e) {
      stderr.writeln('Warning: Could not parse ${file.path}: $e');
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

String _getArg(List<String> args, String name, {required String defaultValue}) {
  for (final arg in args) {
    if (arg.startsWith('--$name=')) {
      return arg.substring('--$name='.length);
    }
  }
  return defaultValue;
}
