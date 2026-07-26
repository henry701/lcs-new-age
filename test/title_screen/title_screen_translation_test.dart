import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/title_screen/title_screen.dart';
import 'package:lcs_new_age/utils/colors.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
    erase();
    move(0, 0);
  });

  tearDown(LcsI18n.reset);

  test(
    'Portuguese title highlights its translated suffix without duplication',
    () {
      printTitleScreen(null);

      final title = _consoleLine(2);
      expect(title, contains('ESQUADRÃO DO CRIME LIBERAL: NOVA ERA'));
      expect(title, isNot(contains('NNOVA ERA')));
      expect(RegExp('NOVA ERA').allMatches(title), hasLength(1));

      final suffixStart = title.indexOf('NOVA ERA');
      expect(
        console.buffer[2]
            .skip(suffixStart)
            .take('NOVA ERA'.length)
            .map((character) => character.foreground),
        everyElement(RainbowFlag.lightBlue),
      );
    },
  );
}
