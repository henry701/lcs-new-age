import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/title_screen/high_scores.dart';
import 'package:lcs_new_age/title_screen/launch_game.dart';
import 'package:lcs_new_age/title_screen/title_screen.dart';
import 'package:lcs_new_age/utils/game_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(LcsI18n.reset);

  test('startup consumes persisted pt_BR before painting the title', () async {
    SharedPreferences.setMockInitialValues({'language': 'pt_BR'});
    LcsI18n.reset();

    await initializeStartupLocale();
    erase();
    move(0, 0);
    printTitleScreen(HighScores(universalRecruits: 12));

    expect(gameOptions.language, equals('pt_BR'));
    expect(LcsI18n.currentLocale, equals('pt_BR'));
    expect(_consoleLine(2), contains('ESQUADRÃO DO CRIME LIBERAL: NOVA ERA'));
    expect(_consoleLine(17), contains('Estatísticas Liberais Universais'));
    expect(_consoleLine(18), contains('Total de Liberais Recrutados: 12'));
    expect(
      LcsI18n.tr('Select an Option to Pursue your Liberal Agenda'),
      equals('Selecione uma opção para seguir sua agenda liberal'),
    );
    expect(
      LcsI18n.tr('C - Continue Last Game'),
      equals('C - Continuar Último Jogo'),
    );
    expect(
      LcsI18n.tr('A - Language Selection'),
      equals('A - Seleção de Idioma'),
    );
  });
}
