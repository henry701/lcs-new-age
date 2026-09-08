import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/talk/talk_about_issues.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    nextRngSeed = 1;
    await LcsI18n.initialize('pt_BR');
    console.injectedKeys.clear();
    console.lastKey = null;
    erase();
    mode = GameMode.base;
  });

  tearDown(() {
    console.injectedKeys.clear();
    console.lastKey = null;
    LcsI18n.reset();
    erase();
  });

  test(
    'failed issue-talk response starts below its localized response label',
    () async {
      final speaker = Creature()
        ..name = 'Alex'
        ..rawAttributes[Attribute.intelligence] = 100000
        ..rawAttributes[Attribute.charisma] = 1
        ..rawSkill[Skill.persuasion] = -100;
      final target = Creature.fromId(CreatureTypeIds.gangUnit)
        ..align = Alignment.moderate;

      console
        ..injectKey(' ')
        ..injectKey(' ');

      await talkAboutIssues(speaker, target);

      final rows = List.generate(console.buffer.length, _consoleLine);
      final responseLabelRow = rows.indexWhere(
        (line) => line.contains('responde,'),
      );
      expect(responseLabelRow, greaterThanOrEqualTo(0));
      expect(
        _consoleLine(responseLabelRow + 1),
        equals(' "Tanto faz." <se vira>'),
      );
    },
  );
}
