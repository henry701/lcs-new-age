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
    expect(
      catalog['{letter} - Travel to a Different City'],
      '{letter} - Viajar para outra cidade',
    );
    expect(
      catalog['{name} charms the jury into not calling the guards, but fails '],
      contains('júri'),
    );
    expect(
      catalog['{name} knocks on people\'s doors, turned away every time.'],
      contains('rejeitado'),
    );
    expect(catalog['Legislative Agenda {year}'], 'Agenda Legislativa {year}');
    expect(
      catalog['{name} brandishes the {weapon}!'],
      '{name} empunha o {weapon}!',
    );
    expect(
      catalog['a video tour of the Chernobyl dead zone'],
      'um vídeo mostrando a zona morta de Chernobyl',
    );
    expect(catalog['cowers in the corner.'], 'Encolhe-se no canto.');
    expect(
      catalog['crawls off trailing blood...'],
      'Rasteja para longe, deixando um rastro de sangue...',
    );
    expect(
      catalog['issue with you, we\'re not gonna try to bring you to justice '],
      startsWith('político com você'),
    );
    expect(
      catalog['bypass the vault\'s electronic lock'],
      'contornar a fechadura eletrônica do cofre',
    );
  });

  test('possessive and object pronouns keep Portuguese word order', () {
    expect(catalog['{pronoun} cellphone'], 'o celular {pronoun}');
    expect(catalog['{pronoun} goldfish'], 'o peixinho dourado {pronoun}');
    expect(catalog['{pronoun} fursona'], 'a fursona {pronoun}');
    expect(catalog['{pronoun} anime waifu'], 'a waifu de anime {pronoun}');
    expect(
      catalog['{name} will be returned to prison to resume {pronoun} earlier sentence.'],
      '{name} será devolvido à prisão para continuar cumprindo a pena anterior {pronoun}.',
    );
    expect(
      catalog['The ransom money is lost in the chaos, but {lead} manages to escape with {possessive} life.'],
      contains('com a vida {possessive}'),
    );
    expect(
      catalog['{possessive} face was completely caved in'],
      'o rosto {possessive} fosse completamente esmagado',
    );
    expect(
      catalog['{possessive} arm was broken in multiple places'],
      'o braço {possessive} fosse quebrado em vários lugares',
    );
    expect(
      catalog['{subject} was paralyzed from the neck down'],
      '{subject} perdesse os movimentos do pescoço para baixo',
    );
    expect(
      catalog['{subject} was vomiting blood'],
      '{subject} vomitasse sangue',
    );
    expect(
      catalog['looks like {pronoun} might have changed {possessive} mind about some things.'],
      'parece que {pronoun} pode ter mudado o ponto de vista {possessive} sobre algumas coisas.',
    );
    expect(
      catalog['decolonizing {hostagePossessive} mind.'],
      'descolonizando a mente {hostagePossessive}.',
    );
    expect(
      catalog['plays a selection of protest songs on {leadPossessive} cell '],
      'toca uma seleção de músicas de protesto no celular {leadPossessive} ',
    );
    expect(
      catalog['get in touch with {hostagePossessive} true feelings.'],
      'entrar em contato com os verdadeiros sentimentos {hostagePossessive}.',
    );
  });

  test('reviewed action translations preserve their gameplay context', () {
    expect(catalog['{name} unlocks the cell!'], '{name} destranca a cela!');
    expect(
      catalog['President {name} has been impeached for corruption.'],
      'O presidente {name} sofreu impeachment por corrupção.',
    );
    expect(
      catalog['{name} gets high off drugs smuggled into the prison.'],
      '{name} fica chapado com drogas contrabandeadas para a prisão.',
    );
    expect(
      catalog['{name} will hit the streets and cause trouble.'],
      '{name} vai às ruas causar problemas.',
    );
    expect(
      catalog['C - Spend a week and {price} on a cheap vacation (stands up other dates).'],
      'C - Passar uma semana e gastar {price} em férias baratas (cancela outros encontros).',
    );
    expect(
      catalog['CABLE NEWS BIAS REVEALED'],
      'VIÉS DAS NOTÍCIAS A CABO REVELADO',
    );
    expect(
      catalog['{name} asks {lead} if {leadPronoun} ever think about Jesus.'],
      '{name} pergunta a {lead} se {leadPronoun} já pensa em Jesus.',
    );
    expect(
      catalog['{name} asks {lead} if {leadPronoun} ever thinks about Jesus.'],
      '{name} pergunta a {lead} se {leadPronoun} já pensa em Jesus.',
    );
    expect(
      catalog['{leadHisHer} mind if {leadHeShe} thinks '],
      'mente {leadHisHer} se {leadHeShe} pensa ',
    );
    expect(
      catalog['matter to {hostagePronoun}.'],
      'são importantes para {hostagePronoun}.',
    );
    expect(
      catalog['for {hostagePronoun}, then encourages {obj} to '],
      'para {hostagePronoun}, então incentiva {obj} a ',
    );
    expect(
      catalog['What name will you use for this {type} in {pronoun} presence?'],
      'Que nome você usará para este {type} enquanto {pronoun} estiver presente?',
    );
  });
}
