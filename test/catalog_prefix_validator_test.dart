import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/catalog_audit.dart';

void main() {
  test('detects translated control prefixes that are changed or removed', () {
    final mismatches = findCatalogPrefixMismatches(
      sourceEntries: const {
        r'A - Pay $100': r'A - Pay $100',
        'Enter - Continue...': 'Enter - Continue...',
      },
      targetEntries: const {
        r'A - Pay $100': r'Pagar $100',
        'Enter - Continue...': 'Entre - Continuar...',
      },
    );

    expect(mismatches.map((mismatch) => mismatch.key), <String>[
      r'A - Pay $100',
    ]);
  });

  test('current catalogs contain no altered control prefixes', () {
    final audit = auditArbCatalogs();
    expect(
      audit.prefixMismatches,
      isEmpty,
      reason: const JsonEncoder.withIndent('  ').convert(
        audit.prefixMismatches.map((mismatch) => mismatch.toJson()).toList(),
      ),
    );
  });

  test('completion gate fails when a control prefix is altered', () {
    final audit = CatalogAuditResult(
      sourceLocale: 'en_US',
      targetLocale: 'pt_BR',
      sourceKeys: 1,
      targetKeys: 1,
      translatedAgainstSource: 1,
      untranslatedAgainstSource: 0,
      missingInTarget: 0,
      extraInTarget: 0,
      emptyInTarget: 0,
      coveragePercent: 100,
      untranslatedKeys: const [],
      missingKeys: const [],
      emptyKeys: const [],
      placeholderMismatches: const [],
      rawInterpolationInTarget: const [],
      prefixMismatches: const [
        CatalogPrefixMismatch(
          key: 'A - Continue',
          sourcePrefix: 'A - ',
          targetPrefix: '',
        ),
      ],
      duplicateKeys: const [],
      malformedFiles: const [],
    );

    expect(audit.passesCompletionGate, isFalse);
  });
}
