import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/name.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/politics.dart';
import 'package:lcs_new_age/title_screen/new_game.dart';

String _normalizedIntroText() => console.buffer
    .skip(6)
    .take(16)
    .map((line) => line.map((character) => character.glyph).join().trimRight())
    .join(' ')
    .replaceAll(RegExp(r'\s+'), ' ')
    .trim();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    gameState = GameState();
    execName[Exec.president] = FullName('Ana', '', 'Silva', Gender.female);
    await LcsI18n.initialize('pt_BR');
    erase();
    console.keyEvent(
      KeyDownEvent(
        physicalKey: PhysicalKeyboardKey.enter,
        logicalKey: LogicalKeyboardKey.enter,
        timeStamp: Duration.zero,
      ),
    );
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese conservative-era prose is complete and feminine', () async {
    await aNewConservativeEra();

    final prose = _normalizedIntroText();
    expect(
      prose,
      contains(
        'Sua vice-presidente de extrema-direita Arqui Conservadora, Ana Silva, '
        'aliada próxima dos manifestantes, foi empossada como nova Presidente '
        'dos Estados Unidos.',
      ),
    );
    expect(
      prose,
      contains(
        'nas recentes eleições intermediárias, e uma maioria conservadora na '
        'Suprema Corte dos Estados Unidos, os comentaristas estão saudando '
        'isso como o início de uma nova era Conservadora.',
      ),
    );
    expect(
      prose,
      contains(
        'O presidente Ana Silva pediu ao novo Congresso que se mova rápido '
        'para carimbar sua agenda radical Arqui Conservadora. A esquerda '
        'parece impotente para impedir esta iminente violação da Sanidade e '
        'Justiça Liberais.',
      ),
    );
    expect(
      prose,
      contains('Neste tempo sombrio, nasce o Esquadrão do Crime Liberal...'),
    );
    expect(console.y, lessThan(25));
    expect(console.x, lessThanOrEqualTo(80));
  });
}
