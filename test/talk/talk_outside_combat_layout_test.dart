import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/talk/talk_outside_combat.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    await LcsI18n.initialize('pt_BR');
    console.injectedKeys.clear();
    console.lastKey = null;
    erase();
  });

  tearDown(() {
    console.injectedKeys.clear();
    console.lastKey = null;
    LcsI18n.reset();
    erase();
  });

  test(
    'Portuguese recruitment rejection keeps the refusal localized',
    () async {
      final speaker = Creature()
        ..name = 'Alex'
        ..rawAttributes[Attribute.charisma] = 1
        ..rawSkill[Skill.persuasion] = -100;
      final target = Creature.fromId(CreatureTypeIds.gangUnit)
        ..align = Alignment.moderate;

      console
        ..injectKey(' ')
        ..injectKey(' ');

      await wannaHearSomethingDisturbing(speaker, target);

      final rows = List.generate(console.buffer.length, _consoleLine);
      final responseLabelRow = rows.indexWhere(
        (line) => line.contains('responde,'),
      );
      expect(responseLabelRow, greaterThanOrEqualTo(0));
      expect(_consoleLine(responseLabelRow + 1), equals(' "Não." <se vira>'));
      expect(_consoleLine(responseLabelRow + 1), isNot(contains('"No."')));
    },
  );
}
