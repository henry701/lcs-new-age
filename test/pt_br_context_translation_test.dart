import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

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
  TestWidgetsFlutterBinding.ensureInitialized();
  final englishCatalog = _loadEnglishCatalog();
  final catalog = _loadPortugueseCatalog();

  setUpAll(() async {
    await LcsI18n.initialize('pt_BR');
  });
  tearDownAll(LcsI18n.reset);

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
    expect(
      catalog['{squad} has arrived at {site}.'],
      '{squad} chegou ao destino: {site}.',
    );
    expect(catalog['UW Medical'], 'Hospital UW');
    expect(catalog['SWAT Officer'], 'Policial da SWAT');
    expect(
      catalog['{name} looks at the Squad suspiciously.'],
      '{name} olha para o Esquadrão com suspeita.',
    );
    expect(catalog['month'], 'mês');
    expect(catalog['months'], 'meses');
    expect(
      catalog['I learned what it took to survive.  When to move on, where to hide.'],
      'Eu aprendi o que era preciso para sobreviver: quando seguir em frente e onde me esconder.',
    );
    expect(catalog['United States Flag'], 'Bandeira dos Estados Unidos');
    expect(catalog['Rainbow Pride Flag'], 'Bandeira do Orgulho LGBTQ+');
    expect(catalog['Transgender Pride Flag'], 'Bandeira do Orgulho Trans');
    expect(catalog['Feminist Flag'], 'Bandeira Feminista');
    expect(catalog['Pan-African Flag'], 'Bandeira Pan-Africana');
    expect(
      catalog['Demonstrate your patriotism by flying the national flag.'],
      'Demonstre seu patriotismo hasteando a bandeira nacional.',
    );
    expect(
      catalog['{name} is still on your tail!'],
      '{name} ainda está no seu encalço!',
    );
    expect(
      catalog['and I went to live with my dad.  I learned gun safety the hard way.'],
      'e fui morar com meu pai. Aprendi do jeito difícil a ter cuidado com armas.',
    );
    expect(catalog['decriminalizing'], 'a descriminalização de ');
    expect(catalog['legalizing'], 'a legalização de ');
    expect(catalog['subsidizing'], 'o subsídio de ');
    expect(
      catalog['Fortify the compound for a siege'],
      'Fortificar o complexo para um cerco',
    );
    expect(
      catalog['reduced stress and anxiety'],
      'uma redução do estresse e da ansiedade',
    );
    expect(
      catalog['learned to communicate with plants'],
      contains('aprenderam'),
    );
    expect(
      catalog['Generated think-tank name: {first} {second} {third}{preposition}'],
      '{third} {first}{preposition}{second}',
    );
    expect(catalog['NO LOVE LOST'], 'INIMIZADE DECLARADA');
    expect(
      catalog['{member} acted with {squad} instead of recruiting.'],
      '{member} agiu com {squad} em vez de recrutar.',
    );
    expect(
      catalog['{member} acted with {squad} instead of carrying out the planned activity.'],
      '{member} agiu com {squad} em vez de cumprir a atividade planejada.',
    );
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
    expect(
      catalog['A - Spend a hundred bucks to take {firstName} out on the town.'],
      'A - Gastar cem dólares para sair com {firstName}.',
    );
    expect(catalog["You're in for it now!"], 'Você está encrencado agora!');
    expect(catalog['PUNDITS DOWN'], 'COMENTARISTAS DERRUBADOS');
    expect(
      catalog['Rent stabilization laws and subsidies are in place to keep housing affordable.'],
      'Existem leis de estabilização de aluguéis e subsídios para manter a habitação acessível.',
    );
    expect(
      catalog['a busy downtown intersection'],
      'um cruzamento movimentado no centro',
    );
    expect(
      catalog['"A human after my own heart, in more ways than one."'],
      '"Uma pessoa feita à minha medida, de várias maneiras."',
    );
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
    expect(catalog['engaged in '], 'se envolveu em ');
    expect(
      catalog['gun ownership would help to bring violence like this to '],
      'o aumento da posse de armas ajudaria a pôr fim a uma violência como esta ',
    );
    expect(catalog['an end.&r'], 'de vez.&r');
    expect(
      catalog['A gang of heavily armed vigilantes calling themselves the Conservative Crime Squad went on a suicidal rampage yesterday, according to a spokesperson from the police department.&r'],
      contains('iniciou ontem uma onda de violência suicida'),
    );
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
    expect(
      catalog['The power of the Arch Conservative far right is growing...'],
      'O poder da extrema-direita Arqui Conservadora está crescendo...',
    );
    expect(
      catalog['But the Arch Conservative far right also gained seats.'],
      'Mas a extrema-direita Arqui Conservadora também ganhou assentos.',
    );
    expect(
      catalog['But the Arch Conservative far right still gained seats.'],
      'Mas a extrema-direita Arqui Conservadora ainda conquistou assentos.',
    );
  });

  test(
    'founder biography bonuses keep Portuguese punctuation and date casing',
    () {
      const expected = {
        '+2 Agility, June 30th': '+2 Agilidade, 30 de junho',
        '+2 Strength, September 5th': '+2 Força, 5 de setembro',
        '+2 Intelligence, November 9th': '+2 Inteligência, 9 de novembro',
        '+2 Charisma, October 8th': '+2 Carisma, 8 de outubro',
        '+2 Heart, May 17th': '+2 Coração, 17 de maio',
        '+4 Int, +2 Science Computers Writing and Teaching, +1 Business and Law':
            '+4 Int., +2 Ciência, Computação, Escrita e Ensino, +1 Negócios e Lei',
        '+4 Heart, +1 Intelligence Strength Agility and Charisma':
            '+4 Coração, +1 Inteligência, Força, Agilidade e Carisma',
      };
      for (final entry in expected.entries) {
        expect(catalog[entry.key], entry.value, reason: entry.key);
      }
    },
  );

  test('management data vocabulary is localized', () {
    for (final entry in {
      'Beige': 'Bege',
      'Black': 'Preto',
      'Red': 'Vermelho',
      'White': 'Branco',
      'Pawnshop': 'Casa de Penhores',
      '1 Daily Ration': '1 Ração diária',
      '1 day of Food Left.': '1 dia de comida restante.',
      '{days} days of Food Left.': '{days} dias de comida restante.',
      '{rations} Daily Rations': '{rations} Rações diárias',
      'treason': 'traição',
      'illegal entry into the United States':
          'entrada ilegal nos Estados Unidos',
    }.entries) {
      expect(LcsI18n.tr(entry.key), entry.value);
    }
  });

  test('site destination names are translated in Portuguese', () {
    expect(catalog['Police Station'], 'Delegacia de Polícia');
    expect(catalog['Courthouse'], 'Fórum');
    expect(catalog['First American Bank'], 'Primeiro Banco Americano');
    expect(catalog['AM Radio Station'], 'Estação de Rádio AM');
    expect(catalog['Health Insurance HQ'], 'Sede do Seguro Saúde');
  });

  test('playtest save, score, and crash copy stays compact and consistent', () {
    expect(catalog['Error - Crash Expected'], 'Erro - Falha esperada');
    expect(
      catalog['Manage Conservatively Broken Saved Game'],
      'Gerenciar Salvamento Corrompido com Cautela',
    );
    expect(catalog['Flags Bought: {count}'], 'Bandeiras compr.: {count}');
    expect(catalog['Flags Burned: {count}'], 'Bandeiras queim.: {count}');
    expect(catalog[r'$ Spent: {count}'], r'Gastos: R$ {count}');
    expect(catalog[r'$ Taxed: {count}'], r'Impostos: R$ {count}');
    expect(
      catalog['Fastest Victory: {month} {year}'],
      'Vitória mais rápida: {month}/{year}',
    );
    expect(
      catalog['Are you SURE you want to delete this saved game?'],
      'Tem CERTEZA de que quer excluir este salvamento?',
    );
  });

  test('playtest combat and kidnapping fragments stay localized', () {
    expect(catalog['Club Security'], 'Segurança de Boate');
    expect(catalog['Naked'], 'Nu');
    expect(catalog['flails at'], 'golpeia');
    expect(catalog["{name}'s {armor}"], '{armor} de {name}');
    expect(catalog['Overalls'], 'Macacão');
    expect(catalog['Police Uniform'], 'Uniforme Policial');
    expect(catalog['Police Gang Unit'], 'Unidade Policial');
    expect(LcsI18n.hasTranslation('Police Gang Unit'), isTrue);
    expect(
      localizedCreatureNameValue('Police Gang Unit', 'Different type name'),
      'Unidade Policial',
    );
    expect(
      localizedCreatureNameValue('SWAT Officer', 'SWAT Officer'),
      'Policial da SWAT',
    );
    expect(
      localizedCreatureNameValue('College Student', 'College Student'),
      'Estudante Universitário',
    );
    expect(catalog['responds'], 'responde');
    expect(catalog['openly stares'], 'encara abertamente');
    expect(
      catalog['eyeing the Liberals with suspicion.'],
      'encarando os Liberais com desconfiança.',
    );
    expect(
      catalog['but {target2} writhes away!'],
      'mas {target2} se contorce e escapa!',
    );
    expect(catalog['he'], 'ele');
    expect(catalog['she'], 'ela');
    expect(
      catalog['You are about to exit the compound to lift the Conservative'],
      'Você está prestes a sair do complexo para acabar com o',
    );
    expect(
      catalog['+2 Martial Arts, +1 Strength, Katana and Wakizashi'],
      '+2 Artes Marciais, +1 Força, Katana e Wakizashi',
    );
  });

  test('plural tooth injuries use complete Portuguese templates', () {
    expect(
      catalog["All {teethminus} of {name}'s teeth are shot out!"],
      'Todos os {teethminus} dentes de {name} foram arrancados!',
    );
    expect(
      catalog["{teethminus} of {name}'s teeth are burned away!"],
      '{teethminus} dentes de {name} foram queimados!',
    );
    expect(
      catalog["All {teethminus} of {name}'s teeth are knocked out!"],
      'Todos os {teethminus} dentes de {name} foram derrubados!',
    );
  });

  test('headline translations preserve Portuguese accents and context', () {
    const expected = {
      'ARMY ROLLS OUT': 'EXÉRCITO TOMA AS RUAS',
      'DIRTY COP': 'POLICIAL SUJO',
      'CLINIC MURDER': 'ASSASSINATO NA CLÍNICA',
      'FBI HUNTS CCS': 'FBI CAÇA A CCS',
      'INTELLIGENCE FILES LEAKED': 'ARQUIVOS DE INTELIGÊNCIA VAZADOS',
      'UNDER SIEGE: ESCAPE OR ENGAGE': 'CERCO: FUGIR OU ENFRENTAR',
      'HATE RALLY': 'COMÍCIO DE ÓDIO',
      'NEWS ANCHOR': 'ÂNCORA DE TV',
      'AM IMPLOSION': 'IMPLOSÃO AM',
      'TAX EVASION': 'EVASÃO FISCAL',
      'CRIME OF HATE': 'CRIME DE ÓDIO',
      'SPARK OF HOPE': 'FAÍSCA DE ESPERANÇA',
      'WOKE HIRE': 'CONTRATAÇÃO WOKE',
      'LIBERAL WIN': 'VITÓRIA LIBERAL',
      'HEROES RISE': 'HERÓIS SURGEM',
      'TRAGIC END': 'FIM TRÁGICO',
      'DRUG PANIC': 'PÂNICO DAS DROGAS',
      'WHAT THE LOVE': 'QUE AMOR É ESSE',
      'DODGED BULLET': 'ESCAPOU POR POUCO',
      'NHS CRISIS': 'CRISE DO NHS',
      'APE EXPLORERS': 'EXPERIMENTOS COM MACACOS',
      'DRUG STUDY': 'ESTUDO SOBRE DROGAS',
      'GM FOOD FAIRE': 'FEIRA DE ALIMENTOS GM',
      'FINALLY GONE': 'FINALMENTE CAPTURADO',
      'RAIDS END CCS': 'RAIDES ACABAM COM A CCS',
      'RELEASING PRISONERS': 'LIBERTAÇÃO DE PRESOS',
      'INTERVIEW: LCS UNDER SIEGE': 'ENTREVISTA: LCS SOB CERCO',
      'LAB CRUELTY': 'CRUELDADE NO LABORATÓRIO',
      'DYING DENIAL': 'NEGATIVA FATAL',
      'LAVISH LIES': 'MENTIRAS EXTRAVAGANTES',
    };
    for (final entry in expected.entries) {
      expect(catalog[entry.key], entry.value, reason: entry.key);
    }
    expect(catalog['LCS FIGHTS'], 'LCS LUTA');
  });

  test('recent context audit fixes agreement and idiomatic phrasing', () {
    expect(
      catalog['All manner of military weapons can be bought and sold freely.'],
      'Todas as armas militares podem ser compradas e vendidas livremente.',
    );
    expect(
      catalog['Immigration is illegal, and noncitizens are shipped to Mexico at gunpoint.'],
      'A imigração é ilegal, e não cidadãos são enviados para o México sob a mira de uma arma.',
    );
    expect(
      catalog['The other power community service has is that it can forge civilians '],
      'Outra vantagem do serviço comunitário é transformar civis ',
    );
    expect(
      catalog['│   in Los Angeles.  The entire thing is caught on  │'],
      '│   em Los Angeles.  Tudo é filmado  │',
    );
  });

  test('new-game opening fragments compose into grammatical Portuguese', () {
    final opening = [
      'Following a series of violent protests from the far right, Conservative',
      'President {name} has resigned in disgrace.  His hardcore',
      'Arch-Conservative Vice President, {name}, a close ally of the',
      'rioters, has been sworn in as the new President of the United States.',
    ].map((key) => catalog[key]).join(' ');

    expect(
      opening,
      'Após uma série de protestos violentos da extrema direita, o '
      'presidente Conservador {name} renunciou em desgraça. Seu '
      'vice-presidente arqui-conservador, {name}, aliado próximo dos '
      'manifestantes, foi empossado como novo Presidente dos Estados Unidos.',
    );

    const openingKey =
        'Following a series of violent protests from the far right, '
        'Conservative President {oldPresident} has resigned in disgrace. '
        'His hardcore Arch-Conservative Vice President, {president}, a close '
        'ally of the rioters, has been sworn in as the new President of the '
        'United States.';
    expect(
      catalog[openingKey],
      'Após uma série de protestos violentos da extrema direita, o presidente '
      'Conservador {oldPresident} renunciou em desgraça. Seu vice-presidente '
      'de extrema-direita Arqui Conservadora, {president}, aliado próximo dos '
      'manifestantes, foi empossado como novo Presidente dos Estados Unidos.',
    );
  });

  test(
    'generated names and contextual labels avoid translator annotations',
    () {
      expect(catalog['Guatemala'], 'Guatemala');
      expect(catalog['Honduras'], 'Honduras');
      expect(catalog['Haiti'], 'Haiti');
      expect(catalog['El Salvador'], 'El Salvador');
      expect(catalog['Natural'], 'Natural');
      expect(catalog['Primal'], 'Primitivo');
      expect(catalog['Inquirer'], 'Inquirer');
      expect(catalog['Fort'], 'Forte');
      expect(catalog['Fore'], 'Fore');
      expect(catalog['Mega'], 'Mega');
      expect(catalog['Franken'], 'Franken');
      expect(catalog['Donald J. Trump'], 'Donald J. Trump');
      expect(catalog['National Mall'], 'National Mall');
      expect(catalog['Venezuela'], 'Venezuela');
      expect(catalog['Ply'], 'Ply');
      expect(catalog['Rio'], 'Rio');
      expect(catalog['United'], 'Unido');
      expect(catalog['Wizard'], 'Mago');
      expect(catalog['Fandango'], 'Fandango');
      expect(catalog['Thing'], 'Coisa');
      expect(catalog['Secret'], 'Secreto');
      expect(catalog['Star'], 'Estrela');
      expect(catalog['Friend'], 'Amigo');
      expect(catalog['Inter'], 'Inter');
      expect(catalog['Uni'], 'Uni');
      expect(catalog['Inc.'], 'Inc.');
      expect(catalog['L.L.C.'], 'L.L.C.');
      expect(catalog['Dis'], 'Dis');
      expect(catalog['Hill'], 'Colina');
      expect(catalog['MBC'], 'MBC');
      expect(catalog['MedStar Washington'], 'MedStar Washington');
    },
  );

  test('event and selection labels preserve their intended context', () {
    expect(catalog['Black And Proud Day'], 'Dia do Orgulho Negro');
    expect(catalog["I'm A Liberal Day"], 'Dia de Ser Liberal');
    expect(catalog['Adopt-A-Conservative Day'], 'Dia de Adotar um Conservador');
    expect(
      catalog['Choose a Liberal squad member to SPEND.'],
      'Escolha um membro Liberal do esquadrão para PAGAR.',
    );
    expect(
      catalog['"Trans men are men, {comment}. Get out."'],
      '"Homens trans são homens, {comment}. Cai fora."',
    );
    expect(catalog['You some kinda queer?'], 'Você é algum tipo de viado?');
    expect(
      catalog['a deserted transit station'],
      'uma estação de transporte público abandonada',
    );
    expect(
      catalog['The Liberal Crime Squad was in permanent hiding in {month} {year}.'],
      'O Esquadrão do Crime Liberal ficou permanentemente escondido em {month} de {year}.',
    );
    expect(
      catalog['The LCS has &G{funds}&w available.'],
      'O LCS tem &G{funds}&w disponíveis.',
    );
  });

  test('title-screen copy preserves names and uses idiomatic sentence case', () {
    expect(
      catalog['Bay 12 Games, IsaacG, SlatersQuest, TheCheshireCat, Kamal-Sadek,'],
      'Bay 12 Games, IsaacG, SlatersQuest, TheCheshireCat, Kamal-Sadek,',
    );
    expect(
      catalog['Select an Option to Pursue your Liberal Agenda'],
      'Selecione uma opção para seguir sua agenda liberal',
    );
    expect(catalog['Let Me Choose'], 'Deixe-me escolher');
    expect(
      catalog['What is your name to the people?'],
      'Como você será conhecido pelo povo?',
    );
  });

  test('generated commerce names use phrase-level Portuguese templates', () {
    expect(catalog['{name} Pawn & Gun'], '{name} — Casa de penhores e armas');
    expect(
      catalog['{adjective} {noun} Insurance'],
      'Seguros {noun} {adjective}',
    );
    expect(
      catalog['{adjective} {noun} Latte Stand'],
      'Quiosque de Latte {noun} de {adjective}',
    );
  });

  test('generated commerce names compose with Portuguese word order', () {
    expect(
      LcsI18n.processString('{name} Pawn & Gun', {'name': 'Towne'}),
      'Towne — Casa de penhores e armas',
    );
    expect(
      LcsI18n.processString('{adjective} {noun} Insurance', {
        'adjective': LcsI18n.tr('Human'),
        'noun': LcsI18n.tr('Care'),
      }),
      'Seguros Cuidado Humano',
    );
    expect(
      LcsI18n.processString('{adjective} {noun} Latte Stand', {
        'adjective': LcsI18n.tr('Caffeine'),
        'noun': LcsI18n.tr('Mug'),
      }),
      'Quiosque de Latte Caneca de Cafeína',
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
      'murmura "caralho, sim" baixinho, no fôlego {hisHer}.',
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
    expect(
      catalog['gets away by the skin of {possessive} teeth'],
      'escapa por um triz, por pouco não perde os dentes {possessive}',
    );
    expect(
      catalog['{name} is beginning to see the error of {possessive} ways.'],
      '{name} está começando a perceber os próprios erros {possessive}.',
    );
    expect(
      catalog['brings in gardening supplies and teaches {hostage} how to grow {hostagePossessive} own '],
      'traz suprimentos de jardinagem e ensina {hostage} a cultivar a própria comida {hostagePossessive} ',
    );
    expect(
      catalog['unleashes {gender_his_her} Stand on'],
      'libera {gender_his_her} Stand contra',
    );
    expect(
      catalog['sacrificed the guard on a makeshift {religion} altar'],
      'sacrificado o guarda em um altar {religion} improvisado',
    );
    expect(
      catalog['{name} ODs on smuggled drugs, then breaks out of the medical ward!'],
      '{name} sofre uma overdose de drogas contrabandeadas e depois foge da enfermaria médica!',
    );
  });

  test('reviewed action translations preserve their gameplay context', () {
    expect(
      catalog["\"Dude... that's like... totally bumming me.\""],
      "\"Cara... isso está me deixando muito para baixo.\"",
    );
    expect(
      catalog["\"Hey, you wanna go rub one off?\""],
      "\"Ei, quer bater uma?\"",
    );
    expect(
      catalog["\"Absolutely not. Clean up a bit.\""],
      "\"De jeito nenhum. Dê uma limpada.\"",
    );
    expect(
      catalog["\"Fine.  Clear out your room.\""],
      "\"Tudo bem. Desocupe seu quarto.\"",
    );
    expect(
      catalog["\"Can't come through here, youngster.\""],
      "\"Você não pode passar por aqui, jovem.\"",
    );
    expect(
      catalog["\"Not after I do this.\" <shits pants>"],
      "\"Não depois que eu fizer isto.\" <caga nas calças>",
    );
    expect(
      catalog["\"Non-targets please leave the site.\""],
      "\"Pessoas que não são alvos, por favor, saiam do local.\"",
    );
    expect(
      catalog["\"Stand still so I can pick you up!\""],
      "\"Fique parado para eu poder te cantar!\"",
    );
    expect(catalog['at the Shopping Mall'], 'no shopping center');
    expect(catalog['blood draining'], 'drenagem de sangue');
    expect(
      catalog['being fed into a meat processing plant'],
      'ser enviados para uma fábrica de processamento de carne',
    );
    expect(
      catalog['hundreds of Liberal elites were supposedly generating forgeries, '],
      'centenas de elites Liberais supostamente estavam gerando falsificações, ',
    );
    expect(
      catalog['Your traps will harass the enemy, but not the Squad.'],
      'Suas armadilhas vão atormentar o inimigo, mas não o Esquadrão.',
    );
    expect(
      catalog['to be served consecutively with your existing sentence.'],
      'para ser cumprida consecutivamente à sua pena atual.',
    );
    expect(
      catalog['Squad has no base to return to and no homeless camp found. Canceling departure.'],
      'O esquadrão não tem base para retornar e nenhum acampamento de desabrigados foi encontrado. Cancelando a saída.',
    );
    expect(
      catalog["instructing a female anchor to 'slim down or get a new job'."],
      "instruindo uma apresentadora a 'emagrecer ou conseguir um novo emprego'.",
    );
    expect(
      catalog["\"All we are saying is give fleas a chance.\""],
      "\"Tudo o que dizemos é: deem uma chance às pulgas.\"",
    );
    expect(
      catalog["\"All we are saying is give peace a chance.\""],
      "\"Tudo o que dizemos é: deem uma chance à paz.\"",
    );
    expect(
      catalog["\"Keep Calm and Carry On\""],
      "\"Mantenha a calma e siga em frente\"",
    );
    expect(
      catalog["\"Put some clothes on before I call the cops.\""],
      "\"Vista-se antes que eu chame a polícia.\"",
    );
    expect(
      catalog["\"You got it. Let them go, and we're done.\""],
      "\"Isso mesmo. Solte-os e acabamos.\"",
    );
    expect(
      catalog['the heat your hackers bring onto their safehouse can be very '],
      'a atenção policial que seus hackers atraem para o esconderijo deles pode ser muito ',
    );
    expect(catalog['strike down anti-drug laws'], 'revogar leis antidrogas');
    expect(
      catalog['strike down redistributive taxes'],
      'revogar impostos redistributivos',
    );
    expect(
      catalog['Uses Computers.  Requires a Hacker Den.'],
      'Usa Computadores.  Requer um Covil de Hackers.',
    );
    expect(catalog['HACKER DEN'], 'COVIL DE HACKERS');
    expect(
      catalog["Oh, uh... I don't think we can date, I don't have a pronoun."],
      'Ah, hum... Acho que não podemos namorar; não tenho um pronome.',
    );
    expect(
      catalog["\"Uh, maybe you should wash... replace... those clothes.\""],
      "\"Hum, talvez você devesse lavar... substituir... essas roupas.\"",
    );
    expect(
      catalog["Nah, I don't find you trans folks attractive."],
      'Não, não acho vocês pessoas trans atraentes.',
    );
    expect(
      catalog['a crowded movie theater lobby'],
      'um saguão de cinema lotado',
    );
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
      contains('ex-médico abortista'),
    );
    expect(catalog['{name} unlocks the cell!'], '{name} destranca a cela!');
    expect(
      catalog['President {name} has been impeached for corruption.'],
      'O presidente {name} sofreu impeachment por corrupção.',
    );
    expect(
      catalog['secret intelligence files'],
      'arquivos de inteligência secreta',
    );
    expect(
      catalog['compromising files about another Judge'],
      'arquivos comprometedores sobre outro juiz',
    );
    expect(catalog['No one can do the job.'], 'Ninguém pode fazer o trabalho.');
    expect(
      catalog['All of the targets are too dangerous.'],
      'Todos os alvos são perigosos demais.',
    );
    expect(catalog['Police Officer'], 'Oficial de Polícia');
    expect(catalog['Chief of Police'], 'Chefe de Polícia');
    expect(catalog['via video chat.'], 'por videochamada.');
    expect(catalog['questioning'], 'interrogatório');
    expect(catalog['murder'], 'homicídio');
    expect(
      catalog['{name} is reporting in at the {location}.'],
      '{name} está se apresentando em {location}.',
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
    expect(
      catalog['some neo-Nazi memorabilia'],
      'alguns itens de memorabilia neonazista',
    );
    expect(
      catalog['some Conservative memoribilia'],
      'alguns itens de memorabilia conservadora',
    );
    expect(
      catalog['Welcome to the NPP Nuclear Plant. Please enjoy'],
      'Bem-vindo à Usina Nuclear NPP. Por favor, aproveite',
    );
    expect(catalog['V - View Changelog'], 'V - Ver registro de alterações');
  });

  test('reviewed UI and dialogue translations preserve gameplay context', () {
    expect(
      catalog["\"Are you Jamaican?  Cuz Jamaican me horny.\""],
      '"Você é da Jamaica? Porque já me deixou com tesão."',
    );
    expect(
      catalog["\"Let's play trains...  you can sit on my face and I will chew chew chew.\""],
      '"Vamos brincar de trem... você pode sentar na minha cara e eu vou fazer tchu-tchu-tchu."',
    );
    expect(
      catalog["\"Are you tired?  You've been running around in my thoughts all day.\""],
      '"Você está cansado? Você passou o dia todo correndo pela minha cabeça."',
    );
    expect(
      catalog["\"If I said you had a nice body, would you hold it against me?\""],
      '"Se eu dissesse que você tem um corpo bonito, deixaria eu encostar ele em mim?"',
    );
    expect(
      catalog['"Bi~ the way, are you free tonight?"'],
      '"Bi~ falando nisso, você está livre esta noite?"',
    );
    expect(
      catalog['"I\'d love to see something swell."'],
      '"Adoraria ver uma coisa crescer."',
    );
    expect(
      catalog['"Do you want to see something swell?"'],
      '"Quer ver uma coisa crescer?"',
    );
    expect(
      catalog['"What do you say we go behind a rock and get a little boulder?"'],
      '"O que você acha de irmos atrás de um rochedo e ficarmos um pouquinho mais ousados?"',
    );
    expect(catalog['"Fucking LCS bullshit..."'], '"Que merda de LCS..."');
    expect(
      catalog['rumbles disinterestedly.'],
      'ronca o motor com desinteresse.',
    );
    expect(
      catalog['"Daaaaaamn {girl}, I want to wrap your legs around my face and '],
      '"Caramba, {girl}, eu quero envolver suas pernas em volta do meu rosto e ',
    );
    expect(
      catalog['"If I could change the alphabet baby, I would put the U and I together!"'],
      '"Se eu pudesse mudar o alfabeto, baby, eu uniria o U e o I!"',
    );
    expect(
      catalog['"Wanna play army?  You lie down and I\'ll blow you away."'],
      '"Quer brincar de soldado? Deite-se que eu te explodo."',
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

  test('recent context audit keeps idioms and composed fragments grammatical', () {
    expect(
      catalog["\"That's sick.  I can do sick tonight.\""],
      '"Isso é doentio. Posso fazer algo doentio hoje à noite."',
    );
    expect(
      catalog["\"Were you dropped as a child?\""],
      '"Você caiu de cabeça quando era criança?"',
    );
    expect(
      catalog["\"You got anything to smoke on you?\" "],
      '"Você tem algo para fumar aí?" ',
    );
    expect(catalog['The CCS has been broken!'], 'O CCS foi desmantelado!');
    expect(catalog['Great Person'], 'Pessoa Notável');
    expect(
      catalog['You see a display case containing {item}.'],
      'Você vê uma vitrine contendo {item}.',
    );
    expect(
      catalog['{pName} seizes {eName} from behind and warns {himHer} {warnMessage}'],
      '{pName} agarra {eName} por trás e avisa {himHer} {warnMessage}',
    );
    expect(
      catalog['the owner of the house seemed very frantic about some missing property.'],
      'o dono da casa parecia muito aflito por causa de alguns bens desaparecidos.',
    );
    expect(
      catalog['looks around cautiously, unsure what to make of this.'],
      'olha ao redor com cautela, sem saber o que pensar disso.',
    );
    expect(
      catalog['Your artists will put their own names out there and gain in street '],
      'Seus artistas divulgarão seus próprios nomes e ganharão ',
    );
    expect(
      catalog['credibility, gaining juice over time. Tagging caps out at 50 '],
      'credibilidade nas ruas, ganhando energia com o tempo. As pichações chegam ao limite de 50 ',
    );
    expect(
      catalog['Recruiting is a safe way to meet people of a specific job.  Not '],
      'Recrutar é uma forma segura de conhecer pessoas de uma profissão específica.  Não ',
    );
    expect(
      catalog['looking out of place. Obvious displays of heavier armor are '],
      'parecer fora de lugar. Sinais óbvios de armaduras mais pesadas são ',
    );
    expect(
      catalog['The entire thing is caught on video by a passerby and it '],
      'Tudo é gravado em vídeo por um transeunte e ',
    );
    expect(
      catalog['world has been changed by the experience.'],
      'mundo foi mudada pela experiência.',
    );
    expect(catalog['Intel computer'], 'Computador Intel');
    expect(catalog['delivery worker'], 'entregador');
    expect(
      catalog['"Stop, drop and roll, baby.  You are on fire."'],
      '"Pare, deite-se e role, querida. Você está pegando fogo."',
    );
    expect(
      catalog['and edgy your merch is. You\'re just not cool enough for your merch '],
      'e ousada é sua mercadoria. Você simplesmente não é descolado o suficiente para sua mercadoria ',
    );
    expect(
      catalog['edgy your art is. You\'re just not cool enough for your art to draw '],
      'ousada é sua arte. Você simplesmente não é descolado o suficiente para sua arte atrair ',
    );
    expect(
      catalog['some blog posts up on the internet, but it will take a long time '],
      'algumas publicações em blogs na internet, mas vai levar muito tempo ',
    );
    expect(
      catalog['anyone write or stream regularly to publish a special edition, but '],
      'alguém escreva ou transmita regularmente para publicar uma edição especial, mas ',
    );
    expect(
      catalog['The government works to accommodate potential immigrants.'],
      'O governo trabalha para acolher potenciais imigrantes.',
    );
    expect(
      catalog['  The events took place {locationPhrase}, known for its rich and snooty residents.  '],
      '  Os eventos ocorreram {locationPhrase}, local conhecido por seus moradores ricos e esnobes.  ',
    );
    expect(
      catalog['  The events took place {locationPhrase}, known for its Extreme Conservative Bias.  '],
      '  Os eventos ocorreram {locationPhrase}, local conhecido por seu viés conservador extremo.  ',
    );
    expect(
      catalog['The road is lined with trees, their branches a blur.'],
      'A estrada é ladeada por árvores; os galhos passam como borrões.',
    );
    expect(catalog['The broadcast is mediocre.'], 'A transmissão é medíocre.');
  });

  test('pickup-line success responses preserve puns and innuendo', () {
    expect(
      catalog['"Let\'s play squirrel.  I\'ll bust a nut in your hole."'],
      '"Vamos brincar de esquilo. Vou gozar no seu buraco."',
    );
    expect(
      catalog['Because I could have sworn you were checking out my package."'],
      '"Porque eu poderia jurar que você estava secando meu pacote."',
    );
    expect(
      catalog['"Yeah, and you\'re going to repay me tonight."'],
      '"É, e você vai ter que me retribuir isso hoje à noite."',
    );
    expect(
      catalog['"I hope we\'re shooting blanks, soldier.  I\'m out of condoms."'],
      '"Espero que estejamos atirando em branco, soldado. Estou sem camisinhas."',
    );
    expect(
      catalog['"They make a yummy bedtime snack."'],
      '"Eles dariam um quitute delicioso na hora de dormir."',
    );
    expect(
      catalog['"Can\'t help you there, but I can show you something slick."'],
      '"Não posso te ajudar nisso, mas posso te mostrar algo bem escorregadio."',
    );
    expect(
      catalog['"As long as you handle your letters with care, I\'m all for it."'],
      '"Desde que una o U e o I com cuidado, por mim tudo bem."',
    );
    expect(
      catalog['"My sex could do even more."'],
      '"Meu sexo poderia te deixar ainda mais nervoso."',
    );
    expect(
      catalog['"Want me to keep \'em on in bed?"'],
      '"Quer que eu deixe os sapatos na cama?"',
    );
    expect(
      catalog['"Sounds like conditions are right for me'],
      '"Parece que as condições estão maduras para mim',
    );
    expect(
      catalog['to seize your means of reproduction."'],
      'expropriar os seus meios de reprodução."',
    );
  });

  test(
    'pickup-line failure responses preserve insults, puns, and stage directions',
    () {
      expect(
        catalog["'Cause you're inspiring an uprising in my lower class.\""],
        'Porque você está inspirando um levante na minha classe trabalhadora."',
      );
      expect(
        catalog["'Cause I seem to be inspiring an uprising in your lower class.\""],
        'Porque parece que estou inspirando um levante na sua classe trabalhadora."',
      );
      expect(
        catalog["'Cause you're bringing some heat to my lower class.\""],
        'Porque você está esquentando a minha classe trabalhadora."',
      );
      expect(
        catalog['"You\'re such an asshole!" <pouts>'],
        '"Você é um babaca!" <faz beicinho>',
      );
      expect(
        catalog['"You\'re big everywhere, fatass." <laughs>'],
        '"Você é grandão em tudo, seu gorducho." <risada>',
      );
      expect(
        catalog['"I don\'t approve of your hi-carb diet." <starts ranting about nutrition>'],
        '"Não curto sua dieta de bolinho industrializado." <começa a discursar sobre nutrição>',
      );
      expect(
        catalog['"I\'m way outta your league, scumbag." <grabs pepper spray>'],
        '"Estou muito acima do seu nível, canalha." <pega o spray de pimenta>',
      );
      expect(
        catalog['"Not after I do this." <shits pants>'],
        '"Não depois que eu fizer isto." <caga nas calças>',
      );
      expect(
        catalog['"Sure, here ya go..." <writes wrong number>'],
        '"Claro, aqui está..." <anota um número errado>',
      );
      expect(
        catalog['"These boxes aren\'t addressed to you." <turns away>'],
        '"Estas caixas não são endereçadas a você." <se afasta>',
      );
      expect(
        catalog['"Eew, no, gross." <turns away>'],
        '"Eca, não, nojento." <se afasta>',
      );
      expect(
        catalog['"If I could change the alphabet baby, I would put the U and I together!"'],
        '"Se eu pudesse mudar o alfabeto, baby, eu uniria o U e o I!"',
      );
      expect(
        catalog['"Hot damn.  You\'re built like a brick shithouse, {honey}."'],
        '"Caramba. Você é forte que nem uma latrina de tijolo, {honey}."',
      );
    },
  );

  test('LGBT rejection pool preserves idioms and insult tone', () {
    expect(catalog["No, I'm no chaser."], 'Não, não sou chaser.');
    expect(catalog["I don't swing that way."], 'Não curto desse lado.');
    expect(
      catalog["Did somebody tell you I'm gay? 'Cause I'm not."],
      'Alguém te disse que sou gay? Porque não sou.',
    );
    expect(
      catalog["Heh, that's funny. And gay."],
      'Heh, isso é engraçado. E gay.',
    );
    expect(
      catalog["I'm only bi when I'm drunk, and I'm not drunk."],
      'Eu só sou bissexual quando estou bêbado, e não estou bêbado.',
    );
    expect(
      catalog['Oh lawd have mercy, the libs are tryin\' ta trans my gender.'],
      'Oh meu Deus, tem misericórdia, os liberais estão tentando transicionar meu gênero.',
    );
  });

  test('newspaper satire keeps ironic police and pundit voice', () {
    expect(
      catalog.values.singleWhere(
        (value) => value.contains('Fábrica de Confissões'),
      ),
      allOf(
        contains('notícias falsas'),
        contains('verdadeira confissão falsa'),
        contains('licença remunerada'),
      ),
    );
    expect(
      catalog.values.singleWhere(
        (value) =>
            value.startsWith('Washington, DC - O FBI pode estar de olho'),
      ),
      allOf(
        contains('indesejáveis'),
        contains('há privacidade e há privacidade'),
        contains('espalhando acusações por aí'),
      ),
    );
  });

  test('meme and pun pickups keep source flavor where possible', () {
    expect(
      catalog['All my base, are belong to you."'],
      'Toda a sua base são pertencem a você."',
    );
    expect(
      catalog['"If you were a laser, you\'d be set on \'stunning\'."'],
      '"Se você fosse um laser, estaria no modo \'atordoante\'."',
    );
    expect(
      catalog['"Is that a keg in your pants?  Cuz I\'d love to tap that ass."'],
      '"É um barril nas suas calças? Porque eu adoraria abrir essa torneira."',
    );
    expect(
      catalog["it's a blin wayzo thing, you wouldn't understand."],
      'é coisa de blin wayzo, você não entenderia.',
    );
    expect(catalog['Cuba'], 'Cuba');
    expect(
      catalog['the fruits, nuts, and flakes of the environmentalist left'],
      'as frutas, as nozes e os malucos da esquerda ambientalista',
    );
    expect(
      catalog['"It\'s you!!  Somebody set up us the bomb.  Move \'Zig\'.  For great justice."'],
      '"É você!! Alguém nos armou a bomba. Move \'Zig\'. Por grande justiça."',
    );
    expect(
      catalog['"Not my problem..." {name} <turns away>'],
      '"Não é problema meu..." {name} <se afasta>',
    );
  });

  test('additional pickup-line failure responses preserve stage directions', () {
    expect(
      catalog['"Go use a real bathroom, ya hick." <points towards bathroom>'],
      '"Vá usar um banheiro de verdade, seu caipira." <aponta para o banheiro>',
    );
    expect(
      catalog['"You fuck squirrels?" <looks dumbfounded>'],
      '"Você fode esquilos?" <parece estupefato>',
    );
    expect(
      catalog['"I hate puns!  You suck at comedy." <frowns>'],
      '"Odeio trocadilhos! Você é péssimo em comédia." <franze a testa>',
    );
    expect(
      catalog['"Yes, now go away." <points to exit>'],
      '"Sim, agora vá embora." <aponta para a saída>',
    );
    expect(
      catalog['"We got a kindergarten dropout over here!" <points and laughs>'],
      '"Temos um aluno que abandonou o jardim de infância aqui!" <aponta e ri>',
    );
    expect(
      catalog['"I\'m about to put a voodoo curse on yo ass..." <starts chanting>'],
      '"Vou lançar uma maldição vodu na sua bunda..." <começa a entoar cantos>',
    );
    expect(
      catalog['"No, I don\'t want to infect anyone else with herpes." <sighs>'],
      '"Não, não quero infectar mais ninguém com herpes." <suspira>',
    );
    expect(
      catalog['"That meme is older than dirt." <shakes head>'],
      '"Esse meme é mais velho que a própria terra." <balança a cabeça>',
    );
    expect(
      catalog['"Touch me and you\'ll regret it." <crosses arms>'],
      '"Toque-me e você se arrependerá." <cruza os braços>',
    );
    expect(
      catalog['"Yes, I\'m an alien, you inferior Earth scum." <reaches for ray gun>'],
      '"Sim, sou um alienígena, sua escória inferior da Terra." <pega a arma de raios>',
    );
    expect(
      catalog['"I don\'t believe in astrology, you ignoramus." <blinds you with science>'],
      '"Eu não acredito em astrologia, seu ignorante." <cega você com a ciência>',
    );
    expect(
      catalog['"At least then you\'d be liquidated." <stares intently>'],
      '"Pelo menos você seria liquefeito." <olha fixamente>',
    );
    expect(
      catalog['"This ain\'t Brokeback Mountain, son."'],
      '"Isto não é a Montanha Brokeback, filho."',
    );
    expect(
      catalog['"The last thing I need is another sex scandal."'],
      '"A última coisa que preciso é de outro escândalo sexual."',
    );
  });

  test('major newspaper satire keeps ironic voice and grammar', () {
    expect(
      catalog.values.singleWhere(
        (value) => value.contains('assassino em série confesso'),
      ),
      allOf(
        contains('tribunal de apelações notoriamente liberal daqui'),
        contains('Obrigado por me salvar de mim mesmo'),
        contains('crise econômica atual'),
      ),
    );
    expect(
      catalog.values.singleWhere(
        (value) =>
            value.contains('indústria de alimentos geneticamente modificados'),
      ),
      allOf(
        contains('este incrível novo produto na verdade {benefit}'),
        contains('pura {hooey}'),
        contains('padrão ético superior'),
      ),
    );
    expect(
      catalog.values.singleWhere(
        (value) =>
            value.startsWith('{city} - A poluição talvez não seja tão ruim'),
      ),
      contains('só precisa tirar um fôlego neste caso'),
    );
    expect(
      catalog.values.singleWhere(
        (value) => value.startsWith('{city} - Agentes mascarados da ICE'),
      ),
      allOf(
        contains('Não merecem ser tratadas assim'),
        contains('deixar nossas comunidades serem aterrorizadas'),
      ),
    );
  });

  test('pickup puns stay consistent across variants', () {
    expect(
      catalog['"Winter\'s coming.  You\'d better bust more than one."'],
      '"O inverno está chegando. É melhor estourar mais de uma."',
    );
    expect(
      catalog['"Winter\'s coming.  I\'d better bust more than one."'],
      '"O inverno está chegando. É melhor eu estourar mais de um."',
    );
    expect(
      catalog['"Hey pop tart, fancy coming in my toaster of love?"'],
      '"Ei, tortinha, gostaria de entrar na minha torradeira do amor?"',
    );
    expect(
      catalog['"Hey, fancy letting my pop tart into your toaster of love?"'],
      '"Que tal deixar minha tortinha entrar na sua torradeira do amor?"',
    );
    expect(
      catalog['"Come to me armed, and I\'ll tell you to take a hike."'],
      '"Venha armado falar comigo e eu mando você cair fora."',
    );
    expect(
      catalog['"If I said you had a nice body, would you hold it against me?"'],
      '"Se eu dissesse que você tem um corpo bonito, deixaria eu encostar ele em mim?"',
    );
    expect(
      catalog['"Are you Jamaican?  Cuz Jamaican me horny."'],
      '"Você é da Jamaica? Porque já me deixou com tesão."',
    );
    expect(
      catalog['"What do you say we go behind a rock and get a little boulder?"'],
      '"O que você acha de irmos atrás de um rochedo e ficarmos um pouquinho mais ousados?"',
    );
    expect(
      catalog['"Oooo, we should get stoned too!  He he."'],
      '"Oooo, a gente também devia ficar chapado! He he."',
    );
    expect(
      catalog['"Tonight?  I can make space for a gay old time."'],
      '"Hoje à noite? Posso abrir espaço para uma noitada bem gay."',
    );
  });

  test('pickup innuendo and CEO critique fragments stay idiomatic', () {
    expect(
      catalog['"Wanna play army?  You lie down and I\'ll blow you away."'],
      '"Quer brincar de soldado? Deite-se que eu te explodo."',
    );
    expect(
      catalog['"Do you want to see something swell?"'],
      '"Quer ver uma coisa crescer?"',
    );
    expect(
      catalog['"I\'d love to see something swell."'],
      '"Adoraria ver uma coisa crescer."',
    );
    expect(
      catalog['"I\'d rather feel something swell."'],
      '"Prefiro sentir uma coisa crescer."',
    );
    expect(
      catalog['"I\'d rather let you feel something swell."'],
      '"Prefiro deixar você sentir uma coisa crescer."',
    );
    expect(
      catalog['"Stand still so I can pick you up!"'],
      '"Fique parado para eu poder te cantar!"',
    );
    expect(
      catalog['Because I can\'t help but check out your package."'],
      'Porque não consigo deixar de secar seu pacote."',
    );
    expect(
      catalog['"Because I could have sworn you were checking out my packages."'],
      '"Porque eu poderia jurar que você estava secando meus pacotes."',
    );
    expect(
      catalog['"I know I\'ve seen you on the back of a milk carton, '],
      '"Sei que já te vi na caixa de leite de desaparecido, ',
    );
    expect(
      catalog['imprisoned and tortured an intern'],
      'prendeu e torturou um estagiário',
    );
    expect(
      catalog['breastfed from a lactating woman'],
      'mamou numa mulher lactante',
    );
    expect(
      catalog['I just tried it myself and I feel like a million bucks!  *Coughs up blood*  I\'m OK, that\'s just ketchup'],
      contains('ketchup'),
    );
    expect(
      catalog['leftists suffering from the mental disorder chemophobia'],
      contains('quimofobia'),
    );
  });

  test('major_event and pickup fragments compose without grammar bugs', () {
    final pensionKey = englishCatalog.keys.singleWhere(
      (key) => key.contains('cutting pensions {cutAmount}'),
    );
    final pensionStory = catalog[pensionKey]!;
    for (final cutAmount in {
      'by 50%': 'em 50%',
      'by 75%': 'em 75%',
      'entirely': 'por completo',
    }.entries) {
      final composed = pensionStory.replaceAll(
        '{cutAmount}',
        catalog[cutAmount.key]!,
      );
      expect(
        composed,
        contains('cortaria as pensões ${cutAmount.value}'),
        reason: cutAmount.key,
      );
    }
    expect(pensionStory, isNot(contains('em {cutAmount}')));

    expect(catalog['fucked'], 'fodeu');
    expect(
      catalog['the arresting officers "favors"'],
      '"favores" aos policiais que prenderam',
    );
    expect(
      catalog['to let the officers join in'],
      'deixar os oficiais participarem',
    );
    expect(catalog['lost his {swear} mind'], 'perdeu o juízo, {swear}');
    expect(
      catalog["'Cause you're inspiring an uprising in my lower class.\""],
      'Porque você está inspirando um levante na minha classe trabalhadora."',
    );
    expect(
      catalog['"Hot damn.  You\'re built like a brick shithouse, {honey}."'],
      '"Caramba. Você é forte que nem uma latrina de tijolo, {honey}."',
    );
    expect(
      catalog['screamed "Fuck the police those goddamn motherfuckers.  I got a fucking ticket this morning and I\'m fucking pissed as shit."'],
      contains('multa'),
    );
    expect(
      catalog['pass new laws to protect the most vulnerable children '],
      'aprovar novas leis para proteger as crianças mais vulneráveis ',
    );
    expect(
      catalog['in our society from being slaughtered by Liberals'],
      'em nossa sociedade de serem massacrados pelos Liberais',
    );
  });

  test('newspaper fragments and pickup idioms avoid literal mistranslations', () {
    expect(
      catalog['"Fuck me if I\'m wrong but you want to kiss me, right?"'],
      '"Me fode se eu estiver errado, mas você quer me beijar, certo?"',
    );
    expect(
      catalog['"This isn\'t a goth club, ripped clothes don\'t cut it here."'],
      '"Isto não é um clube gótico; roupas rasgadas não servem aqui."',
    );
    expect(
      catalog['"This isn\'t a goth club, bloody clothes don\'t cut it here."'],
      '"Isto não é um clube gótico; roupas ensanguentadas não servem aqui."',
    );
    expect(
      catalog['documenting a conspiracy to coordinate rents across multiple major land ownership companies.'],
      startsWith('documentando'),
    );
    expect(
      catalog['documenting the use of an AI system specifically designed to coordinate rent price fixing.'],
      startsWith('documentando'),
    );
    expect(
      catalog['documenting overmedication as a form of chemical restraint.'],
      startsWith('documentando'),
    );
    expect(
      catalog['Ho, shit! I dig it, but you know... I could never be seen sayin\' yes.'],
      'Puta merda, curti! Mas sabe... nunca poderia ser visto dizendo sim.',
    );
    expect(
      catalog.values.singleWhere(
        (value) => value.contains('preguiçoso de merda'),
      ),
      contains('Me passaram para trás'),
    );
    expect(
      catalog.values.singleWhere(
        (value) => value.contains('ex-médico abortista'),
      ),
      allOf(contains('O autor'), isNot(contains('A autora'))),
    );
    expect(
      catalog['tampering with lab animals'],
      'maus-tratos a animais de laboratório',
    );
    expect(catalog['an end.&r'], 'de vez.&r');
    expect(catalog['One vehicle crashed.  '], 'Um veículo bateu.  ');
  });

  test('monthly loot expose fragments translate before story assembly', () {
    expect(
      catalog['showing a pattern of unfair evictions.'],
      'mostrando um padrão de despejos injustos.',
    );
    expect(
      catalog['documenting neglect caused by chronic understaffing.'],
      'documentando negligência causada por falta crônica de pessoal.',
    );
    expect(
      catalog['sexually assaulting animals.'],
      'agredindo sexualmente animais.',
    );
    expect(
      catalog['mandating negative coverage of Liberal politicians.'],
      'determinando cobertura negativa de políticos Liberais.',
    );
    expect(
      catalog['to systematically promote hostility toward Black people.'],
      'para promover sistematicamente hostilidade contra pessoas negras.',
    );
    expect(
      catalog['cheerfully describing foreign corporate sweatshops.'],
      'descrevendo alegremente oficinas exploradoras corporativas no exterior.',
    );
    expect(catalog['guardian article'], 'o artigo');
    expect(catalog['guardian stream'], 'a transmissão');
    expect(catalog['guardian piece'], 'a peça');
    expect(
      catalog["{name}'s {article} about this is electrifying. "],
      '{article} de {name} sobre isso é eletrizante. ',
    );
    expect(
      catalog['│   by impressive advertising, America tunes in.    │'],
      contains('sintoniza'),
    );
    expect(
      catalog['│   by impressive advertising, America tunes in.    │'],
      isNot(contains('ajusta')),
    );
  });

  test('dynamic eagerness translations avoid gendered agreement', () {
    expect(
      catalog['In fact, {eName} is eager to fight alongside {pName}!'],
      'Na verdade, {eName} quer lutar ao lado de {pName}!',
    );
    expect(
      catalog['{name} looks forward serving the Liberal cause!'],
      '{name} quer servir à causa Liberal!',
    );
    expect(
      catalog['seems eager to get away as quickly as possible.'],
      'parece querer ir embora o mais rápido possível.',
    );
  });

  test(
    'dynamic template params translate hack, learning, and traumatize actions',
    () {
      expect(
        catalog['burns a disk of top secret files'],
        'queima um disco de arquivos ultrassecretos',
      );
      expect(
        catalog['bypass the supercomputer security'],
        'ignorar a segurança do supercomputador',
      );
      expect(catalog['an introductory'], 'uma introdução');
      expect(catalog['a high-level'], 'um alto nível');
      expect(catalog['execution'], 'execução');
      expect(catalog['death'], 'morte');
      expect(catalog['unknown skill'], 'habilidade desconhecida');
    },
  );

  test('activity menus translate Portuguese labels and prompts', () {
    const expected = {
      '1 - Community Service': '1 - Serviço Comunitário',
      '2 - Liberal Disobedience': '2 - Desobediência Liberal',
      '3 - Graffiti': '3 - Grafite',
      '4 - Hacking (Need Den)': '4 - Hackeamento (Precisa de Covil)',
      '6 - Stream Guardian TV (Need Studio)':
          '6 - TV Guardião (Precisa de Estúdio)',
      '1 - Solicit Donations': '1 - Solicitar Doações',
      '2 - Make and Sell Clothing': '2 - Fazer e Vender Roupas',
      '3 - Make and Sell Art': '3 - Fazer e Vender Arte',
      '4 - Perform Live Music': '4 - Fazer Música ao Vivo',
      '1 - Recruiting': '1 - Recrutar',
      '2 - Steal a Car': '2 - Roubar um Carro',
      '3 - Make Clothing': '3 - Fazer Roupas',
      '1 - Practice a Skill (Free)': '1 - Praticar uma Habilidade (Grátis)',
      '2 - Take Paid Classes (\$30/day)': '2 - Fazer Aulas Pagas (\$30/dia)',
      '1 - Teach Liberal Arts': '1 - Ensinar Artes Liberais',
      '2 - Teach Covert Ops': '2 - Ensinar Operações Secretas',
      '3 - Teach Fighting': '3 - Ensinar Luta',
      '1 - Go to the Hospital': '1 - Ir ao Hospital',
      'COST': 'CUSTO',
      'DIFFICULTY': 'DIFICULDADE',
      'FLAG': 'BANDEIRA',
      'ISSUE': 'QUESTÃO',
      'HEAT': 'CALOR',
      'DESCRIPTION': 'DESCRIÇÃO',
      'HOSTAGE NAME': 'NOME DO REFÉM',
      'What skill will {name} practice?': 'Que habilidade {name} vai praticar?',
      'What skill will {name} take classes in?':
          'Em qual habilidade {name} vai fazer aulas?',
      'Painting, color theory, and more.': 'Pintura, teoria das cores e mais.',
      'Economics and business management.': 'Economia e gestão de negócios.',
      'Computer science and programming.': 'Informática e programação.',
      'Acting. Theater. Become a character.':
          'Atuação, teatro e criação de personagens.',
      'Master dancing. Move like water.': 'Domine a dança. Mova-se como água.',
      'Advanced vehicle handling and racing.': 'Direção avançada e corridas.',
      'Identify and treat injuries.': 'Identifique e trate ferimentos.',
      'Criminal justice law and procedure.':
          'Direito e procedimentos criminais.',
      'Train with your body and melee weapons.':
          'Treine o corpo e armas brancas.',
      'Play instruments and learn music theory.':
          'Toque instrumentos e aprenda teoria musical.',
      'Make speeches, learn rhetoric and debate.':
          'Discursos, retórica e debates.',
      'Safely maintain and shoot firearms.':
          'Manutenção e uso seguro de armas de fogo.',
      'Study of the human mind and its functions.':
          'Estudo da mente humana e suas funções.',
      'Theology and religious studies.': 'Teologia e estudos religiosos.',
      'Chemistry, biology, physics, and more.':
          'Química, biologia, física e mais.',
      'Sewing, pattern making, and more.': 'Costura, modelagem e mais.',
      'The method and practice of pedagogy.': 'Métodos e prática da pedagogia.',
      'Creative writing and essays.': 'Escrita criativa e redação.',
      'Press a Letter to select a Type of Clothing':
          'Pressione uma letra para selecionar um tipo de roupa',
      'Crafted flags are stored in your safehouse inventory.':
          'Bandeiras criadas ficam no inventário do esconderijo.',
      'Press a Letter to select a Skill':
          'Pressione uma letra para selecionar uma habilidade',
      'Which hostage will {name} be watching over?':
          'Qual refém {name} vai vigiar?',
      'Press a Letter to select a Hostage':
          'Pressione uma letra para selecionar um refém',
      'What type of car will {name} try to find and steal today?':
          'Que tipo de carro {name} tentará encontrar e roubar hoje?',
      'DIFFICULTY TO FIND UNATTENDED': 'DIFICULDADE DE ENCONTRAR',
      'Press a Letter to select a Type of Car':
          'Pressione uma letra para selecionar um tipo de carro',
      'DIFFICULTY TO ARRANGE MEETING': 'DIFICULDADE PARA MARCAR',
      'Press a Letter to select a Profession':
          'Pressione uma letra para selecionar uma profissão',
      'Do you want to publish secrets in the Liberal Guardian?':
          'Deseja publicar segredos no Guardião Liberal?',
      'SECRETS POSSESSED': 'SEGREDOS EM POSSE',
    };
    for (final entry in expected.entries) {
      expect(catalog[entry.key], entry.value, reason: entry.key);
    }
  });

  test('siege and election alerts are translated in context', () {
    const expected = {
      'A skilled pilot gets through!': 'Um piloto habilidoso consegue passar!',
      'Congressional Elections are being held today!':
          'As eleições para o Congresso acontecem hoje!',
      'Explosions rock the compound!': 'Explosões sacodem o complexo!',
      'Fortunately, no one was hurt.': 'Felizmente, ninguém ficou ferido.',
      'Local elections are being held today!':
          'As eleições locais acontecem hoje!',
      'Planes streak overhead!': 'Aviões riscam o céu!',
      'TYPE': 'TIPO',
      'The Presidential Election is being held today!':
          'A eleição presidencial acontece hoje!',
      'The Supreme court is handing down decisions!':
          'A Suprema Corte está proferindo decisões!',
      'The anti-aircraft gun takes a direct hit!':
          'O canhão antiaéreo é atingido em cheio!',
      'The generator takes a direct hit!': 'O gerador é atingido em cheio!',
      'The lights fade and all goes dark...':
          'As luzes se apagam e tudo fica escuro...',
      'The solar panels take a direct hit!':
          'Os painéis solares são atingidos em cheio!',
      "There's nothing left but smoking wreckage...":
          'Não resta nada além de destroços fumegantes...',
      'Your Liberals are starving!': 'Seus Liberais estão passando fome!',
    };
    for (final entry in expected.entries) {
      expect(catalog[entry.key], entry.value, reason: entry.key);
    }
  });

  test('combat fragments agree with their Portuguese sentence prefixes', () {
    expect(catalog['burned away!'], 'queimado!');
    expect(catalog['cut out!'], 'cortado!');
    expect(catalog['goes wide!'], 'passa longe!');
    expect(catalog['hits the road!'], 'atinge a estrada!');
    expect(catalog['is too high!'], 'foi alto demais!');
    expect(
      catalog["{name} notices before the attack connects!"],
      '{name} percebe antes de o ataque acertar!',
    );
    const expected = {
      '{name} gasps a last breath and [makes a mess].':
          '{name} dá o último suspiro e suja o chão.',
      '{name} gasps a last breath and soils the floor.':
          '{name} dá o último suspiro e suja o chão.',
      '{name} speaks these final words: {slogan}':
          '{name} profere suas últimas palavras: {slogan}',
      '{name} speaks these final words: "A plague on both your houses..."':
          '{name} profere suas últimas palavras: "Uma praga sobre as duas casas..."',
      '{name} speaks these final words: "Better dead than liberal..."':
          '{name} profere suas últimas palavras: "Melhor morrer do que ser liberal..."',
      '{name} sweats profusely, murmurs something [good] about Jesus, and dies.':
          '{name} sua muito, murmura algo positivo sobre Jesus e morre.',
      '{name} sweats profusely, murmurs something about Jesus, and dies.':
          '{name} sua muito, murmura algo sobre Jesus e morre.',
    };
    for (final entry in expected.entries) {
      expect(catalog[entry.key], entry.value, reason: entry.key);
    }
  });
}
