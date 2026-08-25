import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/engine/console.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese localizes factory and union worker encounter names', () {
    expect(LcsI18n.hasTranslation('Factory Worker'), isTrue);
    expect(LcsI18n.hasTranslation('Union Worker'), isTrue);
    expect(
      localizedCreatureNameValue('Factory Worker', 'Factory Worker'),
      'Trabalhador de Fábrica',
    );
    expect(
      localizedCreatureNameValue('Union Worker', 'Factory Worker'),
      'Trabalhador Sindicalizado',
    );
  });

  test('Portuguese worker encounter headers fit the console width', () {
    for (final name in <String>[
      localizedCreatureNameValue('Factory Worker', 'Factory Worker'),
      localizedCreatureNameValue('Union Worker', 'Factory Worker'),
    ]) {
      expect(
        strLenX('Willy Snook fala com $name (50s, Masculino):'),
        lessThanOrEqualTo(CONSOLE_WIDTH),
      );
    }
  });

  test('English keeps worker encounter names unchanged', () async {
    LcsI18n.reset();
    await LcsI18n.initialize('en_US');

    expect(
      localizedCreatureNameValue('Factory Worker', 'Factory Worker'),
      'Factory Worker',
    );
    expect(
      localizedCreatureNameValue('Union Worker', 'Factory Worker'),
      'Union Worker',
    );
  });
}
