import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/congress.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    gameState = GameState();
    gameState.politics.house = List.filled(
      gameState.politics.house.length,
      DeepAlignment.archConservative,
    );
    gameState.politics.senate = List.filled(
      gameState.politics.senate.length,
      DeepAlignment.archConservative,
    );
    gameState.politics.laws.updateAll(
      (law, _) => DeepAlignment.archConservative,
    );
    gameState.politics.timeSinceLastConstitutionRepealAttempt = 0;
    console.injectedKeys.clear();
    console.lastKey = null;
    console.flush = () {};
    erase();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    console.injectedKeys.clear();
    console.lastKey = null;
    console.flush = () {};
    LcsI18n.reset();
    erase();
  });

  test('Portuguese no-bill result clears the preceding vote prompt', () async {
    console.injectKey('x');
    console.injectKey('x');
    console.injectKey('x');
    console.injectKey('x');

    await congress();

    expect(
      _consoleLine(23),
      equals('Nenhum dos itens chegou à mesa do Presidente.'),
    );
    expect(_consoleLine(23), isNot(contains('desenrolar da votação')));
    expect(_consoleLine(24), contains('Pressione qualquer tecla'));
  });
}
