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

Map<String, String> _loadEnglishCatalog() {
  final entries = <String, String>{};
  for (final file in Directory('lib/l10n').listSync().whereType<File>()) {
    if (!RegExp(r'app_en_US_part\d+\.arb$').hasMatch(file.path)) continue;
    final decoded = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    for (final entry in decoded.entries) {
      if (entry.key.startsWith('@') || entry.value is! String) continue;
      entries[entry.key] = entry.value as String;
    }
  }
  return entries;
}

Map<String, int> _placeholderCounts(String text) {
  final counts = <String, int>{};
  for (final match in RegExp(r'\{(\w+)\}').allMatches(text)) {
    final name = match.group(1)!;
    counts[name] = (counts[name] ?? 0) + 1;
  }
  return counts;
}

void main() {
  final englishCatalog = _loadEnglishCatalog();
  final catalog = _loadPortugueseCatalog();

  test(
    'Portuguese translations preserve every source placeholder occurrence',
    () {
      for (final entry in englishCatalog.entries) {
        expect(
          _placeholderCounts(catalog[entry.key] ?? ''),
          _placeholderCounts(entry.value),
          reason: 'Placeholder mismatch for ${entry.key}',
        );
      }
    },
  );

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
      'NE Initiative {number}',
      'WA Initiative {number}',
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
    expect(
      catalog['AM RADIO PROPAGANDA EXPOSED'],
      'PROPAGANDA DE RÁDIO AM EXPOSTA',
    );
    expect(
      catalog['Defund Healthcare Programs'],
      'Cortar o Financiamento de Programas de Saúde',
    );
    expect(
      catalog['Drug Addiction Treatment'],
      'Tratamento da Dependência Química',
    );
    expect(catalog['ER visit'], 'Visita ao Pronto-Socorro');
    expect(catalog['Protect LGBTQ+ Rights'], 'Proteger os Direitos LGBTQ+');
    expect(catalog['DNA'], 'DNA');
    expect(
      catalog["Couldn't organize a piss-up in a brewery"],
      'Não conseguiria organizar nem uma festa numa cervejaria.',
    );
    expect(
      catalog["Wouldn't trust 'em to run a bath"],
      'Não confiaria neles nem para preparar um banho.',
    );
    expect(
      catalog['I have some sweet pens we can sign the paperwork with, and we '],
      'Tenho umas canetas bacanas com as quais podemos assinar a papelada, e ',
    );
    expect(catalog['DEO VINDICE'], 'DEO VINDICE');
    expect(catalog['{name1} {versus} {name2}'], '{name1} {versus} {name2}');
    expect(
      catalog['Preview — arrow keys move, Esc exits · Floor '],
      'Prévia — use as setas para mover, Esc para sair · Andar ',
    );
    expect(
      catalog['The pursuing headlights flash in your mirrors.'],
      'Os faróis dos carros que perseguem você piscam nos seus retrovisores.',
    );
    expect(
      catalog['is forced into a headlock!'],
      'é imobilizado com uma chave de cabeça!',
    );
    expect(
      catalog['media, the Conservative masses are pouring into {district} '],
      'sociais, as massas conservadoras invadem {district} ',
    );
    expect(
      catalog['speaks into a loudspeaker: "Liberal Crime Squad! We\'re here '],
      'fala em um alto-falante: "Esquadrão do Crime Liberal! Estamos aqui.',
    );
    expect(catalog['"Huh?" <looks dumbfounded>'], '"Hã?" <parece estupefato>');
    expect(
      catalog.values.where((value) => value.contains('se autodenominam')),
      isEmpty,
    );
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
      catalog['{subject} lost all of {possessive} teeth'],
      '{subject} perdeu todos os dentes {possessive}',
    );
    expect(
      catalog['everything {pronoun} feels guilty or ashamed of, '],
      'tudo pelo que {pronoun} sente culpa ou vergonha, ',
    );
    expect(
      catalog['if {pronoun} is interested in that sort of thing.'],
      'se {pronoun} tem interesse nesse tipo de coisa.',
    );
    expect(
      catalog['mutters "fuck yes" under {hisHer} breath.'],
      'murmura "foda-se, sim" por entre os dentes {hisHer}.',
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
    expect(
      catalog['UNDER ATTACK: ESCAPE OR ENGAGE'],
      'SOB ATAQUE: FUGIR OU ENFRENTAR',
    );
    expect(
      catalog['a secluded park bench at night'],
      'um banco de praça isolado à noite',
    );
    expect(
      catalog['pedophile and a groomer, by the way."'],
      'pedófilo e aliciador de menores, aliás."',
    );
    expect(
      catalog['The defense is really slick.'],
      'A defesa é muito bem articulada.',
    );
    expect(
      catalog['"That meme is older than dirt." <shakes head>'],
      '"Esse meme é mais velho que a própria terra." <balança a cabeça>',
    );
    expect(
      catalog['{city} - A new book has quickly risen to the top of the bestseller lists, {bookTitle}.  The author, a former abortion doctor, has dedicated {authorPossessive} retirement to discouraging women from having abortions.  The book includes many stories about women who regret having abortions and interviews with adult survivors of failed abortions.  Reviews say that the book is powerful and moving, and many readers have changed the way they think about the morality of abortion.&r  According to U.S. Representative {politicianName}, one of the most vocal pro-life representatives in Congress, the book is "a clear message to Americans, calling on us to {callToAction}."&r'],
      contains('ex-médica que realizava abortos'),
    );
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
    expect(
      catalog['B - {name} expects to be paid for {hisHer} time.'],
      'B - {name} espera receber pelo tempo {hisHer}.',
    );
    expect(
      catalog['looks like {heShe} might be convinced.'],
      'parece que {heShe} está se convencendo.',
    );
    expect(catalog['bastard'], 'canalha');
    expect(catalog['[jerk]'], '[babaca]');
    expect(catalog['immigrant'], 'imigrante');
    expect(
      catalog.values.singleWhere(
        (value) => value.startsWith('{city} - A caçada nacional terminou'),
      ),
      contains('A pessoa tinha o status de {immigrationStatus}'),
    );
    expect(
      catalog.values.singleWhere(
        (value) => value.startsWith('{city} - Uma empresa local foi acusada'),
      ),
      contains('que é uma pessoa negra ({person})'),
    );
  });

  test('site action labels translate as complete options', () {
    const expected = {
      'W,A,D,X - Move, ': 'W,A,D,X - Mover, ',
      'G - Get, ': 'G - Pegar, ',
      'M - Map, ': 'M - Mapa, ',
      'E - Equip, ': 'E - Equipar, ',
      'S - Stall, ': 'S - Parar, ',
      'L - Load, ': 'L - Carregar, ',
      'O - Order, ': 'O - Ordenar, ',
      'U - Graffiti, ': 'U - Fazer grafite, ',
      'U - Use, ': 'U - Usar, ',
      'V - Sneak, ': 'V - Esgueirar-se, ',
      'V - Flee, ': 'V - Fugir, ',
      'F - Fight, ': 'F - Lutar, ',
      'K - Kidnap, ': 'K - Sequestrar, ',
      'T - Talk, ': 'T - Falar, ',
      'R - Rescue, ': 'R - Resgatar, ',
      'R - Release, ': 'R - Libertar, ',
      'R - Reorganize, ': 'R - Reorganizar, ',
    };

    for (final entry in expected.entries) {
      expect(catalog[entry.key], entry.value, reason: entry.key);
    }
  });

  test('short contextual phrases keep their intended meaning', () {
    expect(
      catalog['a SWAT team descends on the location'],
      'uma equipe da SWAT invade o local',
    );
    expect(catalog['Fuck The Police Day'], 'Dia de FODA-SE A POLÍCIA');
    expect(
      catalog['make shy children fit in'],
      'fazer crianças tímidas se enturmarem',
    );
    expect(
      catalog['The Liberal Guardian runs a story featuring salacious love letters from a major CEO '],
      'O Guardião Liberal publica uma matéria com cartas de amor picantes de um CEO importante ',
    );
  });

  test('reviewed UI and dialogue translations preserve gameplay context', () {
    expect(
      catalog["\"Are you Jamaican?  Cuz Jamaican me horny.\""],
      '"Você é jamaicano? Porque você me deixa excitado."',
    );
    expect(
      catalog["\"I can't let you take that in.\""],
      '"Não posso deixar você levar isso para dentro."',
    );
    expect(catalog['Eyedropper (I)'], 'Conta-gotas (I)');
    expect(catalog[' (Under Siege)'], ' (Sob Cerco)');
    expect(catalog['"[Yes.  Yes, I do.]"'], '"[Sim. Sim, tenho.]"');
    expect(catalog['"[No!] '], '"[Não!] ');
    expect(
      catalog['"Do you work for the post office? '],
      '"Trabalha para os correios? ',
    );
    expect(
      catalog['THIS IS THE VIPER!   STAND AWAY!'],
      'ESTE É O VIPER!   AFASTE-SE!',
    );
    expect(
      catalog.values.where((value) => RegExp(r'\bECL\b').hasMatch(value)),
      isEmpty,
    );
  });
}
