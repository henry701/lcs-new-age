import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activate_regulars.dart';
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
import 'package:lcs_new_age/politics/alignment.dart';

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

  test('Portuguese character details respect field and skill budgets', () {
    final liberal = _activeLiberal();

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
  });
}
