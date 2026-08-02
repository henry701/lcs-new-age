import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/daily/siege.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/title_screen/world.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    gameState = GameState();
    makeWorld();
    await LcsI18n.initialize('pt_BR');
    erase();
    move(0, 0);
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese police warning uses a natural questioning phrase', () async {
    final site = sites.first;
    console.injectKey('Enter');

    await stateBrokenLaws(site);

    expect(
      _consoleLine(4).trim(),
      'Você está sendo procurado para interrogatório!',
    );
    expect(_consoleLine(4), isNot(contains('procurado por interrogatório')));
  });
}
