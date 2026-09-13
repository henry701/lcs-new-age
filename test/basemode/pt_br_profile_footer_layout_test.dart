import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/creature/body.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';

import '../test_support.dart';

String _line(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    erase();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    console.injectedKeys.clear();
    LcsI18n.reset();
    erase();
  });

  test(
    'Portuguese profile footer does not overwrite the injury overflow marker',
    () async {
      final liberal = Creature()
        ..align = Alignment.liberal
        ..name = 'Liberal One';
      (liberal.body as HumanoidBody)
        ..puncturedHeart = true
        ..puncturedRightLung = true
        ..puncturedLeftLung = true
        ..neck = InjuryState.untreated
        ..upperSpine = InjuryState.untreated
        ..lowerSpine = InjuryState.untreated
        ..missingRightEye = true
        ..missingLeftEye = true
        ..missingNose = true
        ..missingTongue = true
        ..puncturedLiver = true
        ..puncturedRightKidney = true;
      final squad = Squad()..members.add(liberal);
      pool.add(liberal);
      squads.add(squad);
      activeSquad = squad;
      liberal.squad = squad;
      printFullCreatureProfilePage(liberal, 0, reserveFooter: true);
      addOptionText(22, 52, 'A', 'A - Assign a Task');

      expect(_line(22), contains('A - Atribuir uma Tarefa'));
      expect(_line(22), isNot(contains('BAIXO')));
      expect(_line(22), isNot(contains('outras')));
    },
  );
}
