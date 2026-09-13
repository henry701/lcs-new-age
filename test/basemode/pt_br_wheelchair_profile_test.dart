import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/creature/body.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

import '../test_support.dart';

String _consoleText() => console.buffer
    .map((row) => row.map((character) => character.glyph).join().trimRight())
    .join('\n');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    erase();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese compact and full profiles localize wheelchair status', () {
    final liberal = Creature()..hasWheelchair = true;
    (liberal.body as HumanoidBody)
      ..leftLeg.cleanOff = true
      ..rightLeg.cleanOff = true;

    printCreatureInfo(liberal, showCarPrefs: ShowCarPrefs.onFoot);
    final compactProfile = _consoleText();
    expect(compactProfile, contains('Transporte: Cadeira de rodas'));
    expect(compactProfile, isNot(contains('Wheelchair')));

    erase();
    printFullCreatureStats(liberal, showCarPrefs: ShowCarPrefs.onFoot);
    final fullProfile = _consoleText();
    expect(fullProfile, contains('Carro: Cadeira de rodas'));
    expect(fullProfile, isNot(contains('Wheelchair')));
  });
}
