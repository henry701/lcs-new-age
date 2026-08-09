import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activate_regulars.dart';
import 'package:lcs_new_age/basemode/activate_sleepers.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/basemode/base_mode.dart';
import 'package:lcs_new_age/basemode/review_mode.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/common_display/print_party.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/clothing.dart';
import 'package:lcs_new_age/items/weapon.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/vehicles/vehicle.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

String _consoleText() => console.buffer
    .map((row) => row.map((character) => character.glyph).join())
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

Creature _activeLiberal() {
  return Creature()
    ..align = Alignment.liberal
    ..name = 'Justin Arafata'
    ..activity = Activity(ActivityType.writeGuardian)
    ..rawSkill[Skill.streetSmarts] = 10
    ..rawSkillXP[Skill.streetSmarts] = 50;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    LcsI18n.reset();
    pool.clear();
    squads.clear();
    activeSquad = null;
    erase();
    move(0, 0);
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    pool.clear();
    squads.clear();
    activeSquad = null;
    LcsI18n.reset();
    erase();
  });

  test('Portuguese base actions occupy separate locale-safe cells', () {
    baseModeOptionsDisplay(null);

    expect(_consoleLine(8), contains('N - Próximo Esquadrão'));
    expect(_consoleLine(9), contains('Z - Próxima Localização'));
    expect(_consoleLine(19), contains('E - Equipar Esquadrão'));
    expect(_consoleLine(19), contains('V - Veículos'));
    expect(_consoleLine(21), contains('A - Atribuir Tarefas'));
    expect(_consoleLine(21), isNot(contains('TarefasB')));
    expect(_consoleLine(24), contains('B - Agentes Infiltrados'));
  });

  test(
    'Portuguese base agenda option matches its detail-screen terminology',
    () {
      expect(
        LcsI18n.tr('L - The Status of the Liberal Agenda'),
        equals('L - O status da agenda Liberal'),
      );
      expect(
        LcsI18n.tr('The Status of the Liberal Agenda'),
        equals('O status da agenda Liberal'),
      );
    },
  );

  test('base options clear stale daily-message tails before redrawing', () {
    mvaddstr(
      8,
      0,
      'Uma mensagem diária muito mais longa que os controles atuais',
    );
    mvaddstr(9, 0, 'Texto antigo que não deve permanecer na tela');

    baseModeOptionsDisplay(null);

    expect(_consoleLine(8), isNot(contains('mensagem diária')));
    expect(_consoleLine(9), isNot(contains('Texto antigo')));
    expect(_consoleLine(8), contains('N - Próximo Esquadrão'));
    expect(_consoleLine(9), contains('Z - Próxima Localização'));
  });

  test(
    'Portuguese task table preserves every column and footer action',
    () async {
      pool.add(_activeLiberal());
      console.keyEvent(_enterKey);

      await activateRegulars();

      expect(_consoleCells(1, 4, 23), startsWith('NOME DE CÓDIGO'));
      expect(_consoleCells(1, 24, 31), startsWith('HABIL.'));
      expect(_consoleCells(1, 32, 41), startsWith('SAÚDE'));
      expect(_consoleCells(1, 42, 56), startsWith('LOCAL'));
      expect(_consoleCells(1, 57, 80), startsWith('ATIVIDADE'));

      expect(_consoleCells(2, 0, 23).trim(), contains('Justin Arafata'));
      expect(_consoleCells(2, 23, 24), equals(' '));
      expect(_consoleCells(2, 31, 32), equals(' '));
      expect(_consoleCells(2, 41, 42), equals(' '));
      expect(_consoleCells(2, 56, 57), equals(' '));
      expect(_consoleCells(2, 42, 56).trim(), equals(LcsI18n.tr('In Hiding')));
      expect(
        _consoleCells(2, 57, 80).trim(),
        equals(
          fitConsoleText(
            _activeLiberal().activity.description,
            ManagementTableLayout.trailingWidth,
          ),
        ),
      );

      expect(
        _consoleCells(24, 0, 24).trim(),
        equals('T - Opções de ordenação'),
      );
      expect(
        _consoleCells(24, 40, 80).trim(),
        equals('Z - Atribuir tarefas simples em massa'),
      );
    },
  );

  test('Portuguese bulk activity labels fit the right column', () async {
    final member = _activeLiberal()..activity = Activity.none();
    pool.add(member);

    final activation = activateRegulars();
    console.injectKey('z');
    await Future<void>.delayed(const Duration(milliseconds: 20));

    final bulkColumn = _consoleCells(8, 51, console.width);
    expect(_consoleCells(1, 25, 51), startsWith('ATIVIDADE ATUAL'));
    expect(bulkColumn, contains('7 - Fraude de Cartão de Créd…'));
    expect(bulkColumn.length, lessThanOrEqualTo(console.width - 51));

    console.injectKey('x');
    await Future<void>.delayed(const Duration(milliseconds: 10));
    console.injectKey('x');
    await activation;
  });

  test(
    'Portuguese education skill rows separate values from descriptions',
    () async {
      pool.add(_activeLiberal());

      final activation = activateRegulars();
      console.injectKey('a');
      await Future<void>.delayed(const Duration(milliseconds: 20));
      console.injectKey('e');
      await Future<void>.delayed(const Duration(milliseconds: 20));
      console.injectKey('1');
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect(_consoleCells(2, 34, 35), equals(' '));
      expect(
        _consoleCells(2, 35, console.width).trimLeft(),
        startsWith('Crie obras visuais'),
      );

      console.injectKey('Enter');
      await Future<void>.delayed(const Duration(milliseconds: 10));
      console.injectKey('x');
      await Future<void>.delayed(const Duration(milliseconds: 10));
      console.injectKey('Escape');
      await Future<void>.delayed(const Duration(milliseconds: 10));
      console.injectKey('Escape');
      await activation;
    },
  );

  test(
    'Portuguese active-Liberal row keeps health location and activity apart',
    () async {
      pool.add(_activeLiberal());
      console.keyEvent(_enterKey);

      await reviewMode(ReviewMode.liberals);

      expect(_consoleCells(2, 0, 23).trim(), contains('Justin Arafata'));
      expect(_consoleCells(2, 23, 24), equals(' '));
      expect(_consoleCells(2, 31, 32), equals(' '));
      expect(_consoleCells(2, 41, 42), equals(' '));
      expect(_consoleCells(2, 56, 57), equals(' '));
      expect(_consoleCells(2, 42, 56).trim(), equals(LcsI18n.tr('Away')));
      expect(
        _consoleCells(2, 57, 80).trim(),
        equals(
          fitConsoleText(
            _activeLiberal().activity.description,
            ManagementTableLayout.trailingWidth,
          ),
        ),
      );
    },
  );

  test('Portuguese squad review fits long locations before activity', () async {
    final previousGameState = gameState;
    try {
      gameState = GameState();
      final city = City('Seattle, WA', 'SEA', '');
      gameState.cities = [city];
      final district = city.addDistrict('Comércio', 'Comércio');
      final site = Site(SiteType.warehouse, city, district)
        ..rename('Toy Factory', 'Fabricantes de brinquedos');
      district.sites.add(site);

      final member = _activeLiberal()..location = site;
      final squad = Squad()
        ..name = 'The Liberal Crime Squad'
        ..members.add(member);
      squads.add(squad);
      pool.add(member);
      activeSquad = squad;
      console.keyEvent(_enterKey);

      await reviewAssetsAndFormSquads();

      expect(
        _consoleCells(2, reviewLocationX, reviewActivityX - 1).trim(),
        equals(
          fitConsoleText(
            site.getName(short: true, includeCity: true),
            reviewLocationWidth,
          ),
        ),
      );
      expect(
        _consoleCells(2, reviewActivityX, console.width).trim(),
        equals(
          fitConsoleText(member.activity.description, reviewActivityWidth),
        ),
      );
      expect(console.buffer[2][reviewActivityX - 1].glyph, equals(' '));
    } finally {
      gameState = previousGameState;
    }
  });

  test(
    'Portuguese squad assembly right-aligns its translated header',
    () async {
      final member = _activeLiberal();
      final squad = Squad()
        ..name = 'The Liberal Crime Squad'
        ..members.add(member);
      pool.add(member);
      squads.add(squad);
      activeSquad = squad;
      console.keyEvent(_enterKey);

      await assembleSquad(squad);

      expect(
        _consoleLine(0),
        contains('Esquadrão: O Esquadrão do Crime Liberal'),
      );
      expect(_consoleLine(0).length, lessThanOrEqualTo(console.width));
    },
  );

  test(
    'Portuguese active-Liberal review footer keeps controls separated',
    () async {
      pool.add(_activeLiberal());
      console.keyEvent(_enterKey);

      await reviewMode(ReviewMode.liberals);

      expect(_consoleCells(22, 0, 40), isNot(contains('Z -')));
      expect(_consoleCells(22, 40, 80).trimLeft(), startsWith('Z -'));
      expect(_consoleCells(23, 0, 40), isNot(contains('T -')));
      expect(_consoleCells(23, 40, 80).trimLeft(), startsWith('T -'));
    },
  );

  test('Portuguese party rows cap health before transport', () {
    final liberal = _activeLiberal();
    pool.add(liberal);
    activeSquad = Squad()..members.add(liberal);

    printParty();

    expect(_consoleCells(2, 59, 70), isNot(contains('Esportivo')));
    expect(_consoleCells(2, 70, 80), isNot(contains('Esportivo')));
  });

  test(
    'Portuguese party table caps oversized rosters before the delimiter',
    () {
      final squad = Squad();
      for (var i = 0; i < 8; i++) {
        squad.members.add(_activeLiberal()..name = 'Liberal $i');
      }
      squads.add(squad);
      activeSquad = squad;

      printParty(fullParty: true);

      expect(_consoleCells(7, 0, 8).trim(), equals('+3…'));
      expect(
        _consoleLine(8),
        equals(List.filled(console.width, emDash).join()),
      );
      expect(_consoleText(), isNot(contains('Liberal 5')));
      expect(_consoleText(), isNot(contains('Liberal 7')));
    },
  );

  test('Portuguese transport keeps the driver marker inside its cell', () {
    final liberal = _activeLiberal();
    final vehicle = Vehicle('SPORTSCAR');
    vehiclePool.add(vehicle);
    liberal.preferredCarId = vehicle.id;
    liberal.preferredDriver = true;
    pool.add(liberal);
    final squad = Squad()..members.add(liberal);
    squads.add(squad);
    activeSquad = squad;

    printParty();

    final transport = _consoleCells(
      2,
      ManagementTableLayout.transportX,
      ManagementTableLayout.transportX + ManagementTableLayout.transportWidth,
    );
    expect(transport, contains('-D'));
    expect(transport, isNot(endsWith('-')));
  });

  test('Portuguese party roster keeps skill and weapon cells separated', () {
    final liberal = _activeLiberal()..equippedWeapon = Weapon('WEAPON_M7');
    pool.add(liberal);
    final squad = Squad()..members.add(liberal);
    squads.add(squad);
    activeSquad = squad;

    printParty(fullParty: true);

    expect(_consoleCells(1, 23, 30), startsWith('HABIL.'));
    expect(_consoleCells(1, 29, 30), equals(emDash));
    expect(_consoleCells(1, 30, 44), startsWith('ARMA'));
    expect(_consoleCells(2, 23, 24), equals(' '));
    expect(_consoleCells(2, 29, 30), equals(' '));
    expect(_consoleCells(2, 30, 44).trim(), isNotEmpty);
  });

  test('Portuguese party weapon is fitted before the armor column', () {
    final liberal = _activeLiberal()..giveWeaponAndAmmo('WEAPON_45_HANDGUN', 2);
    final squad = Squad()..members.add(liberal);
    squads.add(squad);
    activeSquad = squad;

    printParty(fullParty: true);

    final weaponCell = _consoleCells(
      2,
      ManagementTableLayout.partyWeaponX,
      ManagementTableLayout.partyArmorX,
    );
    expect(weaponCell.trim(), isNotEmpty);
    expect(weaponCell, isNot(contains('Moda urbana')));
    expect(
      console.buffer[2][ManagementTableLayout.partyArmorX - 1].glyph,
      equals(' '),
    );
  });

  test('Portuguese sleeper review heading is localized', () async {
    final sleeper = _activeLiberal()..sleeperAgent = true;
    pool.add(sleeper);
    console.injectKey('Enter');

    await reviewMode(ReviewMode.sleepers);

    expect(_consoleLine(0), equals('Agentes Infiltrados'));
  });

  test('Portuguese sleeper review option preserves title casing', () async {
    pool.add(_activeLiberal()..sleeperAgent = true);
    console.injectKey('x');

    await reviewAssetsAndFormSquads();

    expect(_consoleLine(6), contains('5 - Agentes Infiltrados (1)'));
  });

  test(
    'Portuguese sleeper activation keeps the name before the job column',
    () async {
      final sleeper =
          Creature.fromId('CREATURE_PRESIDENT', align: Alignment.liberal)
            ..name = 'Presidente Kilbourne'
            ..sleeperAgent = true;
      pool.add(sleeper);
      final city = City('Seattle, WA', 'SEA', 'Birthplace of the LCS');
      cities.add(city);
      console.injectKey('x');

      try {
        await activateSleepers();
      } finally {
        cities.remove(city);
      }

      expect(_consoleCells(1, 24, 42).trim(), startsWith('PROFISSÃO'));
      expect(_consoleCells(1, 42, 58).trim(), startsWith('LOCAL'));
      expect(console.buffer[2][23].glyph, equals(' '));
      expect(_consoleCells(2, 24, 42).trim(), isNotEmpty);

      console.injectKey('x');
      await activateSleepersBulk();

      expect(_consoleCells(1, 20, 35).trim(), startsWith('PROFISSÃO'));
      expect(console.buffer[2][19].glyph, equals(' '));
      expect(_consoleCells(2, 20, 35).trim(), isNotEmpty);
      expect(console.buffer[2][57].glyph, equals(' '));
      expect(_consoleCells(2, 40, 57).trim(), startsWith('Mantendo'));
      expect(_consoleCells(2, 58, 80), contains('Manter Discrição'));
      expect(
        _consoleCells(2, 58, 80),
        isNot(contains('Defender o Liberalismo')),
      );
      expect(_consoleLine(22), endsWith('…'));
    },
  );

  test('Portuguese social-attack weapon labels are localized', () {
    final president = Creature.fromId(
      'CREATURE_PRESIDENT',
      align: Alignment.liberal,
    );

    printCreatureInfo(president);

    expect(_consoleText(), contains('Arma: Voz'));
    expect(_consoleText(), isNot(contains('Arma: Voice')));
  });

  test('Portuguese party armor is fitted before the health column', () {
    final liberal = _activeLiberal()
      ..equippedClothing = Clothing('CLOTHING_SECURITYUNIFORM');
    final squad = Squad()..members.add(liberal);
    squads.add(squad);
    activeSquad = squad;

    printParty(fullParty: true);

    final armor = _consoleCells(
      2,
      ManagementTableLayout.partyArmorX,
      ManagementTableLayout.partyHealthX,
    );
    expect(armor, equals('Unif. de Segu… '));
    expect(
      _consoleCells(
        2,
        ManagementTableLayout.partyHealthX,
        ManagementTableLayout.partyHealthX +
            ManagementTableLayout.partyHealthWidth,
      ).trim(),
      isNotEmpty,
    );
    expect(
      console.buffer[2][ManagementTableLayout.partyHealthX - 1].glyph,
      equals(' '),
    );
  });

  test('Portuguese character details respect field and skill budgets', () {
    final liberal = _activeLiberal()..birthDate = DateTime(2004, 11, 9);

    printFullCreatureStats(liberal);

    expect(_consoleCells(9, 0, 15).trim(), startsWith('Força:'));
    expect(_consoleCells(9, 15, 16), equals(' '));
    expect(_consoleCells(9, 16, 29).trim(), startsWith('Energia:'));
    expect(_consoleCells(9, 29, 30), equals(' '));
    expect(
      _consoleCells(6, 30, 45).trim(),
      equals(fitConsoleText('${Skill.streetSmarts.localizedName}:', 15)),
    );
    expect(_consoleCells(6, 45, 46), equals(' '));
    expect(_consoleCells(6, 46, 52).trim(), isNotEmpty);
    expect(_consoleCells(10, 16, 29).trim(), startsWith('Próximo:'));
    expect(_consoleCells(12, 0, 8), equals('Tarefa: '));
    expect(_consoleCells(12, 8, 29).trim(), isNotEmpty);
    expect(_consoleCells(12, 29, 30), equals(' '));
    expect(_consoleLine(19), contains('Recrutas'));
    expect(_consoleLine(19), contains('Máx'));
    expect(_consoleLine(20), contains('Amantes'));
    expect(_consoleLine(20), contains('Máx'));
    expect(_consoleLine(19), isNot(contains('Recruits')));
    expect(_consoleLine(20), isNot(contains(' Max')));
    expect(_consoleText(), isNot(contains('Liberal (')));
    expect(_consoleLine(3), contains('de novembro'));
    expect(_consoleLine(3), isNot(contains('de Novembro')));
  });

  test('Portuguese character details fit vehicle names before skills', () {
    final liberal = _activeLiberal();
    for (final skill in Skill.values) {
      liberal.rawSkill[skill] = 10;
    }
    final vehicle = Vehicle('SPORTSCAR')
      ..color = 'Beige'
      ..heat = 1;
    vehiclePool.add(vehicle);
    liberal.carId = vehicle.id;
    liberal.preferredCarId = vehicle.id;

    printFullCreatureStats(liberal);

    expect(_consoleLine(16), contains('Carro:'));
    expect(console.buffer[16][29].glyph, equals(' '));
    expect(_consoleCells(16, 0, 30), isNot(contains('31.00')));
  });
}
