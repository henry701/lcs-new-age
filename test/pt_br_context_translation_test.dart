import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

Map<String, String> _loadPortugueseCatalog() {
  final entries = <String, String>{};
  for (final file in Directory('lib/l10n').listSync().whereType<File>()) {
    if (!RegExp(r'app_pt_BR_part\d+\.arb$').hasMatch(file.path)) continue;
    final decoded = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    for (final entry in decoded.entries) {
      if (entry.key.startsWith('@') || entry.value is! String) continue;
      entries[entry.key] = entry.value as String;
    }
  }
  return entries;
}

void main() {
  final catalog = _loadPortugueseCatalog();

  test('ballot measure labels use Portuguese noun order', () {
    for (final key in [
      'AZ Amendment {number}',
      'AR Amendment {number}',
      'CO Proposition {number}',
      'ID Amendment {number}',
      'ME Question {number}',
      'MA Question {number}',
      'MI Proposal {number}',
      'MO Amendment {number}',
      'MT Amendment {number}',
      'NV Question {number}',
      'OK Question {number}',
      'OR Measure {number}',
      'SD Measure {number}',
      'ND Measure {number}',
      'UT Amendment {number}',
      'WY Amendment {number}',
      'AK Measure {number}',
      'CA Proposition {number}',
    ]) {
      expect(
        catalog[key],
        isNot(
          matches(
            RegExp(r'^[A-Z]{2} (Emenda|Questão|Proposta|Medida|Proposição)'),
          ),
        ),
      );
    }
  });

  test('context-sensitive UI phrases are idiomatic Brazilian Portuguese', () {
    expect(catalog['NO LOVE LOST'], 'INIMIZADE DECLARADA');
    expect(catalog['LIGHTS OUT'], 'LUZES APAGADAS');
    expect(catalog['No ammo required!'], 'Não requer munição!');
    expect(catalog['A fruit seller is squashed!'], contains('esmagado'));
    expect(
      catalog['do not trust Conservative Cable News'],
      'não confiam nas notícias conservadoras da TV a cabo',
    );
    expect(
      catalog['The sooner we can move to a single payer system, the better.'],
      contains('sistema de saúde'),
    );
  });
}
