import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/common_display/print_party.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/title_screen/world.dart';

import '../test_support.dart';

String _consoleText() => console.buffer
    .map((row) => row.map((character) => character.glyph).join().trimRight())
    .join('\n');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    makeWorld();
    mode = GameMode.base;
    await LcsI18n.initialize('pt_BR');
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  Creature addObserver() {
    final observer =
        Creature.fromId(CreatureTypeIds.agent, align: Alignment.liberal)
          ..name = 'Observador'
          ..activity = Activity.none()
          ..juice = 0
          ..birthDate = DateTime(
            gameState.date.year - 18,
            gameState.date.month,
            gameState.date.day,
          );
    pool.add(observer);
    return observer;
  }

  Creature addDeadOverkillTarget() {
    final target =
        Creature.fromId(CreatureTypeIds.agent, align: Alignment.liberal)
          ..name = 'Vítima'
          ..activity = Activity.none();
    pool.add(target);
    target.blood = -1;
    target.die();
    return target;
  }

  test(
    'Portuguese health cells survive dead overkill at precision skills 5, 6, and 7',
    () {
      final observer = addObserver();
      final target = addDeadOverkillTarget();
      expect(target.blood, lessThan(0));

      for (final skill in [5, 6, 7]) {
        observer.rawAttributes[Attribute.intelligence] = skill;
        expect(observer.attribute(Attribute.intelligence), equals(skill));
        erase();

        expect(
          () => printHealthStat(0, 0, target, small: true, maxWidth: 6),
          returnsNormally,
          reason: 'precision skill $skill must render dead overkill',
        );
        final rendered = console.buffer.first
            .map((character) => character.glyph)
            .join()
            .trimRight();
        expect(rendered, matches(RegExp(r'~\s*0')));
        expect(rendered, isNot(contains('-')));
        expect(console.buffer.every((row) => row.length == 80), isTrue);
      }
    },
  );

  test('Portuguese health cells retain positive and healthy values', () {
    final observer = addObserver();
    final target =
        Creature.fromId(CreatureTypeIds.agent, align: Alignment.liberal)
          ..name = 'Saudável'
          ..activity = Activity.none();
    pool.add(target);

    for (final skill in [5, 6, 7]) {
      observer.rawAttributes[Attribute.intelligence] = skill;
      target.blood = target.maxBlood - 1;
      erase();

      printHealthStat(0, 0, target);

      final rendered = console.buffer.first
          .map((character) => character.glyph)
          .join()
          .trimRight();
      expect(rendered, matches(RegExp(r'~?\d+/\d+')));
      expect(rendered, isNot(contains('-')));
      expect(console.buffer.every((row) => row.length == 80), isTrue);
    }
  });

  test('combat redraw keeps Portuguese party and profile rendering intact', () {
    final observer = addObserver()..rawAttributes[Attribute.intelligence] = 7;
    final target = addDeadOverkillTarget();
    final testSquad = Squad()..name = 'The Liberal Crime Squad';
    squads.add(testSquad);
    target.squad = testSquad;
    activeSquad = testSquad;

    printParty(fullParty: true);
    final partyText = _consoleText();
    expect(partyText, contains('SAÚDE'));
    expect(partyText, isNot(contains('-1')));
    expect(console.buffer.every((row) => row.length == 80), isTrue);

    erase();
    expect(() => printCreatureInfo(target), returnsNormally);
    final profileText = _consoleText();
    expect(profileText.replaceAll(' ', ''), contains('~0/'));
    expect(profileText, contains('Transporte:'));
    expect(profileText, isNot(contains('-1')));
    expect(console.buffer.every((row) => row.length == 80), isTrue);
    expect(observer.alive, isTrue);
  });
}
