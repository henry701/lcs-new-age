import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/sitemode/stealth.dart';
import 'package:lcs_new_age/utils/colors.dart';

import '../test_support.dart';

String _line(int row) =>
    console.buffer[row].map((character) => character.glyph).join().trim();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(ensureGameDataLoaded);

  setUp(() {
    gameState = GameState();
    mode = GameMode.site;
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

  for (final scenario in [
    (
      'pt_BR',
      Alignment.conservative,
      'Trabalhador Não Sindicalizado observa sua atividade Liberal e solta um '
          'grito de alarme Conservador penetrante!',
    ),
    (
      'pt_BR',
      Alignment.moderate,
      'Trabalhador Não Sindicalizado observa sua atividade Liberal e grita por ajuda!',
    ),
    (
      'en_US',
      Alignment.conservative,
      'Nonunion Worker observes your Liberal activity and lets forth a '
          'piercing Conservative alarm cry!',
    ),
    (
      'en_US',
      Alignment.moderate,
      'Nonunion Worker observes your Liberal activity and shouts for help!',
    ),
  ]) {
    test(
      'witness alarm fits both rows in ${scenario.$1}, ${scenario.$2.name}',
      () async {
        await LcsI18n.initialize(scenario.$1);
        final squad = Squad.temporary();
        gameState.lcs.squads.add(squad);
        activeSquad = squad;
        squad.members.add(Creature()..rawSkill[Skill.stealth] = -100);
        encounter.add(
          Creature.fromId(CreatureTypeIds.nonUnionWorker)
            ..name = 'Nonunion Worker'
            ..align = scenario.$2,
        );
        mvaddstr(11, 1, 'ENCOUNTER CONTENT', noTranslate: true);

        var dismissed = false;
        final check = noticeCheck(
          difficulty: 999,
        ).then((_) => dismissed = true);
        await Future<void>.delayed(Duration.zero);

        expect(siteAlarm, isTrue);
        expect(dismissed, isFalse, reason: 'The alarm should wait for a key');
        expect('${_line(9)} ${_line(10)}'.trim(), scenario.$3);
        expect(console.buffer[9][1].foreground, red);
        if (_line(10).isNotEmpty) {
          expect(console.buffer[10][1].foreground, red);
        }
        expect(_line(11), 'ENCOUNTER CONTENT');

        console.injectKey(' ');
        await check;
        expect(dismissed, isTrue);
      },
    );
  }
}
