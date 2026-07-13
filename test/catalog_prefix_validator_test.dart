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

    expect(
      mismatches.map((mismatch) => mismatch.key),
      containsAll(<String>[r'A - Pay $100', 'Enter - Continue...']),
    );
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
}
