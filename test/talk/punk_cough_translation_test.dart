import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/utils/colors.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  for (final entry in {'en_US': '*cough*', 'pt_BR': '*tosse*'}.entries) {
    test('punk stage direction is localized for ${entry.key}', () async {
      await LcsI18n.initialize(entry.key);
      erase();
      move(10, 1);
      addstr('"You got anything to smoke on you?" ');
      addstrc(white, '*cough*');
      final line = console.buffer[10].map((cell) => cell.glyph).join().trim();
      expect(line, endsWith(entry.value));
      if (entry.key == 'pt_BR') expect(line, isNot(contains('*cough*')));
    });
  }
}
