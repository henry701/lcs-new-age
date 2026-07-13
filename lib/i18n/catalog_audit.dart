import 'dart:convert';
import 'dart:io';

/// Result of comparing source and target ARB catalogs for localization gates.
class CatalogAuditResult {
  const CatalogAuditResult({
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
    required this.untranslatedKeys,
    required this.missingKeys,
    required this.emptyKeys,
    required this.placeholderMismatches,
    required this.rawInterpolationInTarget,
    required this.prefixMismatches,
    required this.duplicateKeys,
    required this.malformedFiles,
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
  final List<String> untranslatedKeys;
  final List<String> missingKeys;
  final List<String> emptyKeys;
  final List<CatalogPlaceholderMismatch> placeholderMismatches;
  final List<CatalogInterpolationIssue> rawInterpolationInTarget;
  final List<CatalogPrefixMismatch> prefixMismatches;
  final List<String> duplicateKeys;
  final List<String> malformedFiles;

  bool get passesCompletionGate =>
      untranslatedAgainstSource == 0 &&
      missingInTarget == 0 &&
      emptyInTarget == 0 &&
      placeholderMismatches.isEmpty &&
      rawInterpolationInTarget.isEmpty &&
      duplicateKeys.isEmpty &&
      malformedFiles.isEmpty &&
      translatedAgainstSource == sourceKeys &&
      coveragePercent == 100.0;

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
      'placeholderMismatchCount': placeholderMismatches.length,
      'rawInterpolationInTargetCount': rawInterpolationInTarget.length,
      'prefixMismatchCount': prefixMismatches.length,
      'duplicateKeyCount': duplicateKeys.length,
      'malformedFileCount': malformedFiles.length,
      'passesCompletionGate': passesCompletionGate,
    };
  }
}

class CatalogPlaceholderMismatch {
  const CatalogPlaceholderMismatch({
    required this.key,
    required this.sourcePlaceholders,
    required this.targetPlaceholders,
  });

  final String key;
  final List<String> sourcePlaceholders;
  final List<String> targetPlaceholders;
}

class CatalogInterpolationIssue {
  const CatalogInterpolationIssue({required this.key, required this.value});

  final String key;
  final String value;
}

class CatalogPrefixMismatch {
  const CatalogPrefixMismatch({
    required this.key,
    required this.sourcePrefix,
    required this.targetPrefix,
  });

  final String key;
  final String sourcePrefix;
  final String targetPrefix;

  Map<String, String> toJson() => {
    'key': key,
    'sourcePrefix': sourcePrefix,
    'targetPrefix': targetPrefix,
  };
}

final RegExp catalogPlaceholderPattern = RegExp(r'\{(\w+)(?::(\w+))?\}');

final RegExp catalogRawInterpolationPattern = RegExp(r'(?<!\\)\$\{');

/// Prefixes that are part of the game's input/display contract rather than
/// translatable prose. Keep this deliberately narrow to avoid constraining
/// ordinary translated sentences that happen to start with a letter.
final RegExp catalogControlPrefixPattern = RegExp(r'^(?:Enter|[A-Z0-9]) - ');

List<CatalogPrefixMismatch> findCatalogPrefixMismatches({
  required Map<String, String> sourceEntries,
  required Map<String, String> targetEntries,
}) {
  final mismatches = <CatalogPrefixMismatch>[];
  for (final entry in sourceEntries.entries) {
    final sourcePrefix = catalogControlPrefixPattern.stringMatch(entry.key);
    if (sourcePrefix == null) continue;
    final targetValue = targetEntries[entry.key];
    if (targetValue == null) continue;
    final targetPrefix =
        catalogControlPrefixPattern.stringMatch(targetValue) ?? '';
    if (targetPrefix != sourcePrefix) {
      mismatches.add(
        CatalogPrefixMismatch(
          key: entry.key,
          sourcePrefix: sourcePrefix,
          targetPrefix: targetPrefix,
        ),
      );
    }
  }
  mismatches.sort((a, b) => a.key.compareTo(b.key));
  return mismatches;
}

/// Normalize `{name:color}` placeholders to `{name}` for parity checks.
String normalizeCatalogPlaceholders(String template) {
  return template.replaceAllMapped(catalogPlaceholderPattern, (match) {
    // Keep the placeholder syntax explicit for the catalog audit.
    // ignore: prefer_interpolation_to_compose_strings
    return '{${match.group(1)!}}';
  });
}

List<String> extractCatalogPlaceholders(String template) {
  final names = <String>{};
  for (final match in catalogPlaceholderPattern.allMatches(template)) {
    names.add(match.group(1)!);
  }
  final sorted = names.toList()..sort();
  return sorted;
}

/// Audit [sourceLocale] vs [targetLocale] catalogs under [arbDirPath].
CatalogAuditResult auditArbCatalogs({
  String arbDirPath = 'lib/l10n',
  String sourceLocale = 'en_US',
  String targetLocale = 'pt_BR',
}) {
  final arbDir = Directory(arbDirPath);
  if (!arbDir.existsSync()) {
    throw StateError('ARB directory not found: $arbDirPath');
  }

  final sourceLoad = _loadLocaleCatalog(arbDir, sourceLocale);
  final targetLoad = _loadLocaleCatalog(arbDir, targetLocale);

  final sourceEntries = sourceLoad.stringEntries;
  final targetEntries = targetLoad.stringEntries;
  final sourceKeys = sourceEntries.keys.toSet();
  final targetKeys = targetEntries.keys.toSet();

  final missingKeys = sourceKeys.difference(targetKeys).toList()..sort();
  final extraKeys = targetKeys.difference(sourceKeys);

  final untranslatedKeys = <String>[];
  final emptyKeys = <String>[];
  var translatedAgainstSource = 0;

  for (final key in sourceKeys) {
    final value = targetEntries[key];
    if (value == null) {
      continue;
    }
    if (value.isEmpty) {
      emptyKeys.add(key);
      untranslatedKeys.add(key);
      continue;
    }
    if (value == key && catalogControlPrefixPattern.stringMatch(key) == null) {
      untranslatedKeys.add(key);
    } else {
      translatedAgainstSource++;
    }
  }
  untranslatedKeys.sort();
  emptyKeys.sort();

  final placeholderMismatches = <CatalogPlaceholderMismatch>[];
  for (final key in sourceKeys.intersection(targetKeys)) {
    final sourcePlaceholders = extractCatalogPlaceholders(
      normalizeCatalogPlaceholders(sourceEntries[key]!),
    );
    final targetPlaceholders = extractCatalogPlaceholders(
      normalizeCatalogPlaceholders(targetEntries[key]!),
    );
    if (!_listEquals(sourcePlaceholders, targetPlaceholders)) {
      placeholderMismatches.add(
        CatalogPlaceholderMismatch(
          key: key,
          sourcePlaceholders: sourcePlaceholders,
          targetPlaceholders: targetPlaceholders,
        ),
      );
    }
  }

  final rawInterpolationInTarget = <CatalogInterpolationIssue>[];
  for (final entry in targetEntries.entries) {
    if (catalogRawInterpolationPattern.hasMatch(entry.value)) {
      rawInterpolationInTarget.add(
        CatalogInterpolationIssue(key: entry.key, value: entry.value),
      );
    }
  }
  rawInterpolationInTarget.sort((a, b) => a.key.compareTo(b.key));

  final prefixMismatches = findCatalogPrefixMismatches(
    sourceEntries: sourceEntries,
    targetEntries: targetEntries,
  );

  final totalSource = sourceKeys.length;
  final coverage = totalSource == 0
      ? 0.0
      : translatedAgainstSource / totalSource * 100;

  return CatalogAuditResult(
    sourceLocale: sourceLocale,
    targetLocale: targetLocale,
    sourceKeys: totalSource,
    targetKeys: targetKeys.length,
    translatedAgainstSource: translatedAgainstSource,
    untranslatedAgainstSource: untranslatedKeys.length,
    missingInTarget: missingKeys.length,
    extraInTarget: extraKeys.length,
    emptyInTarget: emptyKeys.length,
    coveragePercent: coverage,
    untranslatedKeys: untranslatedKeys,
    missingKeys: missingKeys,
    emptyKeys: emptyKeys,
    placeholderMismatches: placeholderMismatches,
    rawInterpolationInTarget: rawInterpolationInTarget,
    prefixMismatches: prefixMismatches,
    duplicateKeys: [...sourceLoad.duplicateKeys, ...targetLoad.duplicateKeys],
    malformedFiles: [
      ...sourceLoad.malformedFiles,
      ...targetLoad.malformedFiles,
    ],
  );
}

class _LocaleLoadResult {
  const _LocaleLoadResult({
    required this.stringEntries,
    required this.rawEntries,
    required this.duplicateKeys,
    required this.malformedFiles,
  });

  final Map<String, String> stringEntries;
  final Map<String, dynamic> rawEntries;
  final List<String> duplicateKeys;
  final List<String> malformedFiles;
}

_LocaleLoadResult _loadLocaleCatalog(Directory arbDir, String locale) {
  final regex = RegExp('^app_${RegExp.escape(locale)}_part(\\d+)\\.arb\$');
  final files =
      arbDir
          .listSync()
          .whereType<File>()
          .where((file) => regex.hasMatch(_basename(file)))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));

  final mergedRaw = <String, dynamic>{};
  final stringEntries = <String, String>{};
  final keyLocations = <String, List<String>>{};
  final malformedFiles = <String>[];

  for (final file in files) {
    final fileName = _basename(file);
    try {
      final map = json.decode(file.readAsStringSync()) as Map<String, dynamic>;
      for (final entry in map.entries) {
        keyLocations.putIfAbsent(entry.key, () => <String>[]).add(fileName);
        mergedRaw[entry.key] = entry.value;
        if (entry.key.startsWith('@')) continue;
        if (entry.value is String) {
          stringEntries[entry.key] = entry.value as String;
        }
      }
    } catch (_) {
      malformedFiles.add(fileName);
    }
  }

  final duplicateKeys =
      keyLocations.entries
          .where((entry) => entry.value.length > 1)
          .map((entry) => entry.key)
          .toList()
        ..sort();

  return _LocaleLoadResult(
    stringEntries: stringEntries,
    rawEntries: mergedRaw,
    duplicateKeys: duplicateKeys,
    malformedFiles: malformedFiles,
  );
}

bool _listEquals(List<String> left, List<String> right) {
  if (left.length != right.length) return false;
  for (var i = 0; i < left.length; i++) {
    if (left[i] != right[i]) return false;
  }
  return true;
}

String _basename(File file) {
  final segments = file.uri.pathSegments;
  return segments.isEmpty ? file.path : segments.last;
}

/// Synthesize placeholder values for runtime catalog smoke tests.
Map<String, String> synthesizePlaceholderValues(String template) {
  final values = <String, String>{};
  for (final match in catalogPlaceholderPattern.allMatches(template)) {
    final name = match.group(1)!;
    final colorSpec = match.group(2);
    if (colorSpec == 'color') {
      values['${name}Color'] = 'R';
    }
    values[name] = _sampleValueForPlaceholder(name);
  }
  return values;
}

String _sampleValueForPlaceholder(String name) {
  final lower = name.toLowerCase();
  if (lower.contains('count') ||
      lower.contains('num') ||
      lower.contains('index') ||
      lower.endsWith('id')) {
    return '3';
  }
  if (lower.contains('percent') || lower.contains('pct')) {
    return '42';
  }
  if (lower.contains('price') ||
      lower.contains('cost') ||
      lower.contains('fund') ||
      lower.contains('amount')) {
    return '1000';
  }
  if (lower.contains('day') ||
      lower.contains('hour') ||
      lower.contains('year')) {
    return '5';
  }
  return 'Exemplo';
}

/// Load all string entries for a locale from hash-sharded ARB catalogs.
Map<String, String> loadLocaleStringEntries(
  String locale, {
  String arbDirPath = 'lib/l10n',
}) {
  final arbDir = Directory(arbDirPath);
  return _loadLocaleCatalog(arbDir, locale).stringEntries;
}
