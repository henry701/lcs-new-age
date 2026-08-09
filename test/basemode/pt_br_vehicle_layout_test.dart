import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/base_actions.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/vehicles/vehicle.dart';

import '../test_support.dart';

String _line(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

String _screenText() => console.buffer
    .map((row) => row.map((character) => character.glyph).join().trimRight())
    .join('\n');

Creature _liberal(String name) => Creature()
  ..align = Alignment.liberal
  ..name = name;

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

  test('Portuguese vehicle assignment keeps the footer inside the console', () async {
    final first = _liberal('Liberal One');
    final second = _liberal('Liberal Two');
    final squad = Squad()..members.addAll([first, second]);
    pool.addAll([first, second]);
    squads.add(squad);
    activeSquad = squad;
    vehiclePool.add(Vehicle('SPORTSCAR'));
    console.injectKey('Escape');

    await setVehicles();

    expect(_line(24), contains('Entre - Concluído'));
    expect(_screenText(), contains('Amarelo: outro esquadrão; vermelho: ambos;'));
    expect(_screenText(), isNot(contains('These cars may be used')));
    expect(_screenText(), isNot(contains('Choose a Liberal')));
  });

  test('Portuguese vehicle assignment prompts use passenger vocabulary', () {
    expect(
      LcsI18n.tr('Choose a Liberal to drive it.'),
      equals('Escolha um Liberal para dirigir.'),
    );
    expect(
      LcsI18n.tr('Choose a Liberal to be a passenger.'),
      equals('Escolha um Liberal para ser passageiro.'),
    );
  });
}
