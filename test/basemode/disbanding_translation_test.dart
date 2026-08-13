import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/disbanding.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/name.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/politics.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GameState previousGameState;

  setUp(() async {
    previousGameState = gameState;
    gameState = GameState();
    erase();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    gameState = previousGameState;
    LcsI18n.reset();
    erase();
  });

  test(
    'Portuguese disbanding summary translates executive alignment labels',
    () {
      politics.exec[Exec.president] = DeepAlignment.moderate;
      politics.execName[Exec.president] = FullName(
        'Don',
        '',
        'Justice',
        Gender.male,
      );

      printExec();

      expect(_consoleLine(1), contains('Presidente: Don Justice, moderado'));
      expect(_consoleLine(1), isNot(contains('moderate')));
    },
  );

  test('Portuguese disbanding summary translates conservative executives', () {
    politics.exec[Exec.president] = DeepAlignment.conservative;
    politics.execName[Exec.president] = FullName(
      'Aidan',
      '',
      'Woods',
      Gender.male,
    );

    printExec();

    expect(_consoleLine(1), contains('Presidente: Aidan Woods, Conservador'));
    expect(_consoleLine(1), isNot(contains('Conservative')));
  });
}
