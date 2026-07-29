import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activate_regulars.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/basemode/base_mode.dart';
import 'package:lcs_new_age/basemode/plan_site_visit.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/common_display/print_party.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/crime_squad.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/clothing.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/title_screen/world.dart';
import 'package:lcs_new_age/vehicles/vehicle.dart';

import '../test_support.dart';

String _consoleText() => console.buffer
    .map((row) => row.map((character) => character.glyph).join().trimRight())
    .join('\n');

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

  test(
    'Portuguese party table truncates long names before the skill column',
    () {
      final founder = _founder()..name = 'Ayla Probstaaaaaaaaaa';

      printParty(fullParty: true);

      final nameCell = console.buffer[2]
          .sublist(0, ManagementTableLayout.nameWidth)
          .map((character) => character.glyph)
          .join();
      expect(nameCell, isNot(contains('24/0')));
      expect(nameCell.trimRight(), endsWith('…'));
      expect(
        console.buffer[2][ManagementTableLayout.skillX].glyph,
        equals('1'),
      );
      expect(founder.name, equals('Ayla Probstaaaaaaaaaa'));
    },
  );

  test('Portuguese party table preserves weapon separator for mega stats', () {
    final founder = _founder();
    for (final skill in Skill.values) {
      founder.rawSkill[skill] = 30;
    }

    printParty(fullParty: true);

    expect(console.buffer[2][29].glyph, equals('N'));
    expect(
      console.buffer[2].sublist(23, 29).map((c) => c.glyph).join(),
      isNot(contains('Nenhuma')),
    );
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

  test('Portuguese travel localizes shared destination names', () async {
    _founder();
    console.keyEvent(_enterKey);

    await planSiteVisit();

    final rendered = _consoleText();
    for (final expected in [
      'Compras',
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
