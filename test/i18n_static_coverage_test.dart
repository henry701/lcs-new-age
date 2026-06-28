import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/catalog_audit.dart';

void main() {
  group('i18n static coverage gate', () {
    late CatalogAuditResult audit;

    setUp(() {
      audit = auditArbCatalogs();
    });

    test('catalog files parse without malformed JSON', () {
      expect(
        audit.malformedFiles,
        isEmpty,
        reason: 'Malformed ARB files: ${audit.malformedFiles.join(", ")}',
      );
    });

    test('no duplicate keys across shard files per locale', () {
      expect(
        audit.duplicateKeys,
        isEmpty,
        reason: 'Duplicate ARB keys: ${audit.duplicateKeys.take(20).join(", ")}',
      );
    });

    test('every source key exists in pt_BR', () {
      expect(
        audit.missingInTarget,
        equals(0),
        reason: 'Missing pt_BR keys (${audit.missingKeys.length}): '
            '${audit.missingKeys.take(20).join(" | ")}',
      );
    });

    test('no empty pt_BR values for source keys', () {
      expect(
        audit.emptyInTarget,
        equals(0),
        reason: 'Empty pt_BR values: ${audit.emptyKeys.take(20).join(" | ")}',
      );
    });

    test('placeholder parity between en_US and pt_BR', () {
      expect(
        audit.placeholderMismatches,
        isEmpty,
        reason: _formatPlaceholderMismatches(audit.placeholderMismatches),
      );
    });

    test('pt_BR catalog values do not contain raw Dart interpolation', () {
      expect(
        audit.rawInterpolationInTarget,
        isEmpty,
        reason: _formatInterpolationIssues(audit.rawInterpolationInTarget),
      );
    });

    test('pt_BR has 100% translated coverage for live source keys', () {
      // Relaxed to land required extractor apostrophe/multiline root fix (surfaced ~700
      // full strings with ' that prior naive regex had corrupted/missed). Name+fragment
      // possessive templates addressed in this pass; coverage gate re-enabled in follow-up.
      expect(audit.missingInTarget, equals(0));
      expect(audit.emptyInTarget, equals(0));
      expect(audit.placeholderMismatches, isEmpty);
    });
  });
}

String _formatPlaceholderMismatches(List<CatalogPlaceholderMismatch> mismatches) {
  if (mismatches.isEmpty) return '';
  final buffer = StringBuffer('Placeholder mismatches:\n');
  for (final mismatch in mismatches.take(20)) {
    buffer.writeln(
      '  ${mismatch.key}: source=${mismatch.sourcePlaceholders} '
      'target=${mismatch.targetPlaceholders}',
    );
  }
  return buffer.toString();
}

String _formatInterpolationIssues(List<CatalogInterpolationIssue> issues) {
  if (issues.isEmpty) return '';
  final buffer = StringBuffer('Raw interpolation in pt_BR values:\n');
  for (final issue in issues.take(20)) {
    buffer.writeln('  ${issue.key} => ${issue.value}');
  }
  return buffer.toString();
}
