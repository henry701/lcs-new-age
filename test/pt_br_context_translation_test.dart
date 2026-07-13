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

  test('audited phrases do not retain literal or non-Portuguese wording', () {
    expect(catalog['{letter} - Travel to a Different City'],
        '{letter} - Viajar para outra cidade');
    expect(catalog['{name} charms the jury into not calling the guards, but fails '],
        contains('júri'));
    expect(catalog['{name} knocks on people\'s doors, turned away every time.'],
        contains('rejeitado'));
    expect(catalog['Legislative Agenda {year}'], 'Agenda Legislativa {year}');
    expect(catalog['{name} brandishes the {weapon}!'],
        '{name} empunha o {weapon}!');
    expect(catalog['a video tour of the Chernobyl dead zone'],
        'um vídeo mostrando a zona morta de Chernobyl');
    expect(catalog['cowers in the corner.'], 'Encolhe-se no canto.');
    expect(catalog['crawls off trailing blood...'],
        'Rasteja para longe, deixando um rastro de sangue...');
    expect(catalog['issue with you, we\'re not gonna try to bring you to justice '],
        startsWith('político com você'));
    expect(catalog['bypass the vault\'s electronic lock'],
        'contornar a fechadura eletrônica do cofre');
  });
}
