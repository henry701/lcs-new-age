import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activate_regulars.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/basemode/base_mode.dart';
import 'package:lcs_new_age/basemode/flag.dart';
import 'package:lcs_new_age/basemode/plan_site_visit.dart';
import 'package:lcs_new_age/basemode/review_mode.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/common_display/print_party.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/crime_squad.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/clothing.dart';
import 'package:lcs_new_age/items/flag_type.dart';
import 'package:lcs_new_age/justice/crimes.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/title_screen/world.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/vehicles/vehicle.dart';

import '../test_support.dart';

String _consoleText() => console.buffer
    .map((row) => row.map((character) => character.glyph).join().trimRight())
    .join('\n');

String _consoleCells(int y, int start, int end) => console.buffer[y]
    .sublist(start, end)
    .map((character) => character.glyph)
    .join();

KeyDownEvent get _enterKey => const KeyDownEvent(
  physicalKey: PhysicalKeyboardKey.enter,
  logicalKey: LogicalKeyboardKey.enter,
  timeStamp: Duration.zero,
);

Site get _homelessCamp =>
    sites.firstWhere((site) => site.type == SiteType.homelessEncampment);

Creature _founder() {
  final founder = Creature()
    ..align = Alignment.liberal
    ..name = 'Justin Arafata'
    ..type = creatureTypes[CreatureTypeIds.thief]!
    ..equippedClothing = Clothing('CLOTHING_PUNK_JACKET')
    ..location = _homelessCamp
    ..activity = Activity.none()
    ..rawSkill[Skill.security] = 9
    ..rawSkill[Skill.computers] = 2;
  pool.add(founder);

  final founderSquad = Squad()..name = 'The Liberal Crime Squad';
  squads.add(founderSquad);
  founder.squad = founderSquad;
  activeSquad = founderSquad;
  activeSafehouse = _homelessCamp;
  return founder;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    LcsI18n.reset();
    gameState = GameState();
    await LcsI18n.initialize('pt_BR');
    makeWorld();
    erase();
    move(0, 0);
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese party table localizes shared headers and equipment', () {
    _founder();

    printParty(fullParty: true);

    final rendered = _consoleText();
    for (final expected in [
      'HABIL.',
      'ARMA',
      'ROUPA',
      'SAÚDE',
      'TRANSPORTE',
      'Jaqueta Punk',
    ]) {
      expect(rendered, contains(expected));
    }
    for (final leakedEnglish in [
      'SKILL',
      'WEAPON',
      'ARMOR',
      'HEALTH',
      'TRANSPORT',
      'Punk Jacket',
    ]) {
      expect(
        rendered,
        isNot(contains(RegExp('\\b${RegExp.escape(leakedEnglish)}\\b'))),
      );
    }
  });

  test('Portuguese combat outfit labels localize XML short names', () {
    final founder = _founder()
      ..equippedClothing = Clothing('CLOTHING_CHEERLEADER');

    printParty(fullParty: true);

    final rendered = _consoleText();
    expect(rendered, contains('Jaqueta Torci…'));
    expect(rendered, isNot(contains('Cheer Jacket')));
    expect(founder.equippedClothing?.shortName, equals('Cheer Jacket'));
  });

  test('Portuguese security uniform short name is localized', () {
    final founder = _founder();
    founder.equippedClothing = Clothing('CLOTHING_SECURITYUNIFORM');

    printParty(fullParty: true);

    final rendered = _consoleText();
    expect(rendered, contains('Unif. de Segu…'));
    expect(rendered, isNot(contains('Security Unif.')));
  });

  test(
    'Portuguese party table truncates long names before the skill column',
    () {
      final founder = _founder()..name = 'Ayla Probstaaaaaaaaaaa';

      printParty(fullParty: true);

      final nameCell = console.buffer[2]
          .sublist(0, ManagementTableLayout.nameWidth)
          .map((character) => character.glyph)
          .join();
      expect(nameCell, isNot(contains('24/0')));
      expect(nameCell.trimRight(), endsWith('…'));
      expect(
        console.buffer[2][ManagementTableLayout.partySkillX].glyph,
        equals('1'),
      );
      expect(
        console.buffer[2][ManagementTableLayout.partySkillX - 1].glyph,
        equals(' '),
      );
      expect(console.buffer[2][69].glyph, equals(' '));
      expect(founder.name, equals('Ayla Probstaaaaaaaaaaa'));
    },
  );

  test('Portuguese party table preserves weapon separator for mega stats', () {
    final founder = _founder();
    for (final skill in Skill.values) {
      founder.rawSkill[skill] = 30;
    }

    printParty(fullParty: true);

    expect(console.buffer[2][30].glyph, equals('N'));
    expect(
      console.buffer[2].sublist(23, 30).map((c) => c.glyph).join(),
      isNot(contains('Nenhuma')),
    );
  });

  test(
    'Portuguese compact profile labels and health details stay readable',
    () {
      final founder = _founder()
        ..rawAttributes[Attribute.intelligence] = 10
        ..equippedClothing = Clothing('CLOTHING_ARMYARMOR');

      printCreatureInfo(founder);

      final rendered = _consoleText();
      expect(rendered, contains('Força:'));
      expect(rendered, contains('Coração:'));
      expect(rendered, contains('Carisma:'));
      expect(rendered, contains('Sab.:'));
      expect(rendered, contains('Uniforme do Exército'));
      expect(rendered, isNot(contains('Cora:')));
      expect(rendered, isNot(contains('Sab:')));
      expect(rendered, isNot(contains('Car:')));
      expect(rendered, isNot(contains('Army Uniform')));
      erase();
      printHealthStat(0, 0, founder);
      final healthLine = console.buffer.first
          .map((character) => character.glyph)
          .join()
          .trimRight();
      expect(healthLine, matches(RegExp(r'~?\d+/\d+ \+')));
    },
  );

  test('Portuguese compact attribute columns keep a separator', () {
    final founder = _founder()
      ..rawAttributes[Attribute.heart] = 13
      ..rawAttributes[Attribute.wisdom] = 1;

    printCreatureInfo(founder);

    final line = console.buffer[4].map((character) => character.glyph).join();
    expect(line.substring(0, 23), contains('Coração: 15 Sab.: 1'));
    expect(line.substring(0, 23), isNot(contains('13Sab')));
  });

  test('Portuguese transport localizes XML vehicle short names', () {
    final founder = _founder();
    final vehicle = Vehicle('SPORTSCAR');
    vehiclePool.add(vehicle);
    founder.preferredCarId = vehicle.id;

    printParty(fullParty: true);

    final rendered = _consoleText();
    expect(rendered, contains('Esportivo'));
    expect(rendered, isNot(contains('(Sport')));
  });

  test('Portuguese character status localizes shared identity and skills', () {
    final founder = _founder();

    printFullCreatureStats(founder);

    final rendered = _consoleText();
    for (final expected in [
      'Civil',
      'Profissional do Roubo',
      'Cisgênero',
      'Segurança:',
      'Computadores:',
      'Mantendo Discrição',
      'Jaqueta Punk',
    ]) {
      expect(rendered, contains(expected));
    }
    for (final leakedEnglish in [
      'Civilian',
      'Professional Thief',
      'Cisgender',
      'Security:',
      'Computers:',
      'Laying Low',
      'Punk Jacket',
    ]) {
      expect(rendered, isNot(contains(leakedEnglish)));
    }
  });

  test('Portuguese profile navigation controls preserve separators', () async {
    final founder = _founder();
    final second = Creature.fromId(CreatureTypeIds.thief)
      ..align = Alignment.liberal
      ..name = 'Alex Silva'
      ..location = _homelessCamp;
    pool.add(second);
    second.squad = activeSquad;

    console.injectKey('b');

    await fullCreatureInfoScreen(founder);

    final footer = console.buffer[24]
        .map((character) => character.glyph)
        .join()
        .trimRight();
    final navigation = console.buffer[23]
        .map((character) => character.glyph)
        .join()
        .trimRight();
    expect(navigation, contains('ESQUERDA / '));
    expect(footer, contains('CIMA / BAIXO - Mais Info'));
    expect(navigation, isNot(contains('ESQUERDA DIREITA')));
    expect(navigation, isNot(contains('ESQUERDA RIGHT')));
    expect(footer, isNot(contains('CIMA BAIXO')));
  });

  test('Portuguese compact character info localizes clothing metadata', () {
    final founder = _founder();

    printCreatureInfo(founder);

    final rendered = _consoleText();
    expect(rendered, contains('Roupas: Jaqueta Punk'));
    expect(rendered, isNot(contains('Roupas: Punk Jacket')));
  });

  test('Portuguese activity menu localizes its category taxonomy', () async {
    final founder = _founder();
    console.keyEvent(_enterKey);

    await assignTask(founder);

    final rendered = _consoleText();
    for (final expected in [
      'A - Ativismo Liberal',
      'B - Arrecadação Legal',
      'C - Arrecadação Ilegal',
      'D - Recrutamento e Aquisição',
      'E - Educação e Aprendizado',
      'T - Ministrar Aulas',
      'M - Saúde e Apoio',
      'X - Manter Discrição',
    ]) {
      expect(rendered, contains(expected));
    }
    for (final leakedEnglish in [
      'Liberal Activism',
      'Legal Fundraising',
      'Illegal Fundraising',
      'Education and Learning',
      'Teaching Classes',
      'Medical and Support',
      'Lay Low for Now',
    ]) {
      expect(rendered, isNot(contains(leakedEnglish)));
    }
  });

  test(
    'Portuguese teaching footer clears stale activity text and localizes costs',
    () async {
      final founder = _founder();
      console.injectKey('t');
      console.injectKey('1');
      console.injectKey('Enter');

      await assignTask(founder);

      final rendered = _consoleText();
      expect(
        rendered,
        contains('Treina: Escrita, Persuasão, Direito, Religião, Ciência,'),
      );
      expect(rendered, contains('Negócios, Psicologia, Música e Arte'));
      expect(
        rendered,
        contains(
          r'Aulas custam até $20/dia. Todas as pessoas liberais aptas participarão.',
        ),
      );
      expect(rendered, isNot(contains('Classes cost up to')));
      expect(rendered, isNot(contains('nsinando Artes Liberai')));
    },
  );

  test('Portuguese travel localizes shared destination names', () async {
    _founder();
    console.keyEvent(_enterKey);

    await planSiteVisit();

    final rendered = _consoleText();
    for (final expected in [
      'Comércio',
      'Centro de Seattle',
      'Distrito Universitário',
      'Distrito Industrial',
      'Leste de Washington',
    ]) {
      expect(rendered, contains(expected));
    }
    for (final leakedEnglish in [
      'Shopping',
      'Downtown Seattle',
      'University District',
      'Industrial District',
      'Eastern Washington',
    ]) {
      expect(rendered, isNot(contains(leakedEnglish)));
    }
  });

  test('Portuguese site travel stats keep a separator at high heat', () async {
    final founder = _founder();
    final warehouse = sites.firstWhere(
      (site) => site.type == SiteType.warehouse,
    )..heat = 9000;
    founder.location = warehouse;
    founder.base = warehouse;
    activeSafehouse = warehouse;

    final city = warehouse.city;
    final district = warehouse.district;
    final districtKey = String.fromCharCode(
      'a'.codeUnitAt(0) + city.districts.indexOf(district),
    );
    final visibleSites = district.sites.where((site) => !site.hidden).toList()
      ..sort((a, b) => a.controller.index.compareTo(b.controller.index));
    final siteKey = String.fromCharCode(
      'a'.codeUnitAt(0) + visibleSites.indexOf(warehouse),
    );
    console.injectKey(districtKey);
    console.injectKey(siteKey);

    await planSiteVisit();

    final row = 10 + visibleSites.indexOf(warehouse);
    expect(_consoleCells(row, 60, 68), contains('9000'));
    expect(_consoleCells(row, 67, 68), equals(' '));
    expect(_consoleCells(row, 68, 80), startsWith('Sigilo:'));
  });

  test('Portuguese locations localize city names in composite labels', () {
    final newYork = cities.firstWhere((city) => city.name == 'New York, NY');
    final manhattan = newYork.districts.firstWhere(
      (district) => district.name == 'Manhattan Island',
    );

    expect(newYork.getName(), equals('New York, New York'));
    final compositeName = manhattan.getName(includeCity: true);
    expect(compositeName, contains('Ilha de Manhattan'));
    expect(compositeName, contains('New York, New York'));
    expect(compositeName, isNot(contains('New York, NY')));
  });

  test('Portuguese base localizes shared location activity and slogan', () {
    final founder = _founder();
    gameState.lcs.slogan = 'We really need a slogan!';

    locHeader(_homelessCamp);
    printParty(fullParty: true);
    baseModeOptionsDisplay(_homelessCamp);

    final rendered = _consoleText();
    expect(rendered, contains('SEA — Sem-teto'));
    expect(rendered, contains('O Esquadrão do Crime Liberal'));
    expect(rendered, contains('Mantendo Discrição'));
    expect(rendered, contains('Precisamos mesmo de um slogan!'));
    expect(rendered, isNot(contains('Homeless Camp')));
    expect(rendered, isNot(contains('Laying Low')));
    expect(rendered, isNot(contains('We really need a slogan!')));
    expect(founder.activity.type, ActivityType.none);
  });

  test('Portuguese base header keeps the date clear of activity text', () {
    _founder();
    locHeader(_homelessCamp);

    final header = console.buffer[0]
        .sublist(0, 41)
        .map((character) => character.glyph)
        .join()
        .trimRight();
    expect(header.length, lessThanOrEqualTo(40));
    expect(header, isNot(contains('Mantendo Discrição')));
  });

  test('Portuguese flag action stays readable inside the activism column', () {
    _founder();
    baseModeOptionsDisplay(_homelessCamp);

    expect(_consoleText(), contains(r'P - Orgulho: Hastear bandeira ($20)'));
    expect(
      console.buffer[22].map((character) => character.glyph).join(),
      isNot(contains('…')),
    );
  });

  test(
    'Portuguese flag menu localizes metadata and reserves issue columns',
    () async {
      _founder();
      ledger.forceSetFunds(100);
      console.injectKey('Escape');

      await selectAndFlyFlag(_homelessCamp);

      final rendered = _consoleText();
      expect(rendered, contains('Bandeira dos Estados Unidos'));
      expect(rendered, contains('Bandeira do Orgulho LGBTQ+'));
      expect(rendered, contains('Demonstre seu patriotismo'));
      expect(rendered, contains('Questão: Liberdade de Expressão'));
      expect(rendered, contains('Custo: \$20'));
      expect(rendered, contains('Escape - Cancelar'));
      expect(rendered, isNot(contains('United States Flag')));
      expect(rendered, isNot(contains('Demonstrate your patriotism')));
      expect(rendered, isNot(contains('Custo:Custo:')));

      final issueCell = console.buffer[2]
          .sublist(40, 57)
          .map((character) => character.glyph)
          .join();
      expect(issueCell, isNot(contains('0')));
      expect(console.buffer[2][57].glyph, equals('0'));
    },
  );

  test('Portuguese craft flag previews localize non-buyable metadata', () {
    final flag = flagTypes['FLAG_ANARCHIST']!;

    renderFlagPreview(
      flag,
      difficulty: 0,
      costLine: '\$10',
      costColor: lightGreen,
      cancelText: 'Escape - Cancel Making Flag',
    );

    final rendered = _consoleText();
    expect(rendered, contains('Bandeira Negra'));
    expect(rendered, contains('Sem deuses, sem mestres.'));
    expect(rendered, contains('Questão: Comportamento Policial'));
    expect(rendered, contains('Pressão: 0'));
    expect(rendered, contains('Dificuldade: Facílimo'));
    expect(rendered, contains('Escape - Cancelar confecção de bandeira'));
    expect(rendered, isNot(contains('Black Flag')));
    expect(rendered, isNot(contains('No gods, no masters.')));
    expect(rendered, isNot(contains('Police Behavior')));
    expect(rendered, isNot(contains('Heat:')));
  });

  test('Portuguese character profiles localize profession and body labels', () {
    final founder = _founder()
      ..type = creatureTypes[CreatureTypeIds.highschoolDropout]!;

    printFullCreatureStats(founder);

    final rendered = _consoleText();
    expect(rendered, contains('Evadido do Ensino Médio'));
    expect(rendered, contains('Perna esq'));
    expect(rendered, contains('Braço dir'));
    expect(rendered, isNot(contains('Highschool Dropout')));
    expect(rendered, isNot(contains('Left Leg')));
    expect(rendered, isNot(contains('Right Arm')));
  });

  test(
    'Portuguese promotion table localizes contact headers and status legend',
    () async {
      _founder();
      console.injectKey('x');

      await promoteliberals();

      final rendered = _consoleText();
      expect(rendered, contains('CONTATO ATUAL'));
      expect(rendered, contains('CONTATO APÓS PROMOÇÃO'));
      expect(rendered, contains('Recrutados/Seduzidos/Iluminados'));
      expect(rendered, contains('Detidos'));
      expect(rendered, contains('Infiltrado'));
      expect(
        rendered,
        contains(
          'Escolha uma letra para promover. Liberais escondidos não podem.',
        ),
      );
      expect(
        rendered,
        contains(
          'Iluminados seguem qualquer um; Seduzidos seguem apenas seu amante.',
        ),
      );
      expect(rendered, isNot(contains('CURRENT CONTACT')));
      expect(rendered, isNot(contains('CONTACT AFTER PROMOTION')));
      expect(rendered, isNot(contains('Recruited/Seduced/Enlightened')));
    },
  );

  test(
    'Portuguese squad assembly keeps profession and location columns apart',
    () async {
      _founder();
      console.injectKey('x');

      await assembleSquad(null);

      final row = console.buffer[2].map((character) => character.glyph).join();
      expect(row, contains('Profissional do Ro…'));
      expect(row, contains('SEA — Sem-teto'));
      expect(row, isNot(contains('Profissional do RSEA')));
    },
  );

  test('Portuguese profile crime table translates and bounds long charges', () {
    final founder = _founder();
    founder.wantedForCrimes[Crime.flagBurning] = 2;
    founder.wantedForCrimes[Crime.illegalEntry] = 3;

    printFullCreatureCrimes(founder);

    final leftCharge = console.buffer[8]
        .sublist(0, 30)
        .map((character) => character.glyph)
        .join()
        .trimRight();
    final rightCharge = console.buffer[14]
        .sublist(40, 70)
        .map((character) => character.glyph)
        .join()
        .trimRight();
    expect(leftCharge, contains('profanação da bandeira nacio…'));
    expect(rightCharge, contains('entrada ilegal nos Estados U…'));
    expect(_consoleText(), contains('DELITO'));
    expect(_consoleText(), contains('Nº'));
    expect(_consoleText(), isNot(contains('NUM')));
    expect(_consoleText(), isNot(contains('desecration of the national flag')));
    expect(
      _consoleText(),
      isNot(contains('illegal entry into the United States')),
    );
    expect(console.buffer[8][30].glyph, equals('0'));
    expect(console.buffer[14][70].glyph, equals('0'));
  });

  test('Portuguese catalog covers every shared skill label', () {
    for (final skill in Skill.values) {
      expect(
        skill.localizedName,
        isNot(equals(skill.displayName)),
        reason: skill.displayName,
      );
    }
  });

  test(
    'Portuguese catalog covers every shared activity and default slogan',
    () {
      for (final activityType in ActivityType.values) {
        expect(
          LcsI18n.tr(activityType.label),
          isNot(equals(activityType.label)),
          reason: activityType.label,
        );
      }
      for (final slogan in CrimeSquad.defaultSlogans.keys) {
        expect(LcsI18n.tr(slogan), isNot(equals(slogan)), reason: slogan);
      }
    },
  );

  test('English shared vocabulary remains unchanged', () async {
    LcsI18n.reset();
    await LcsI18n.initialize('en_US');
    final founder = _founder();
    gameState.lcs.slogan = 'We really need a slogan!';

    printParty(fullParty: true);

    final rendered = _consoleText();
    expect(rendered, contains('SKILL'));
    expect(rendered, contains('WEAPON'));
    expect(rendered, contains('ARMOR'));
    expect(rendered, contains('HEALTH'));
    expect(rendered, contains('TRANSPORT'));
    expect(rendered, contains('Punk Jacket'));
    expect(founder.title, equals('Civilian'));
    expect(founder.activity.description, equals('Laying Low'));
    expect(_homelessCamp.getName(), equals('Homeless Camp'));
    expect(Skill.computers.localizedName, equals('Computers'));
    expect(gameState.lcs.displaySlogan, equals('We really need a slogan!'));
  });
}
