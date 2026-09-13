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

  test('Portuguese localizes the nonunion encounter name separately', () {
    expect(LcsI18n.hasTranslation('Nonunion Worker'), isTrue);
    expect(
      localizedCreatureNameValue('Nonunion Worker', 'Factory Worker'),
      'Trabalhador Não Sindicalizado',
    );
  });

  test('Portuguese nonunion talk header fits the console width', () {
    final target = localizedCreatureNameValue(
      'Nonunion Worker',
      'Factory Worker',
    );

    expect(
      strLenX('Willy Snook fala com $target (50s, Masculino):'),
      lessThanOrEqualTo(CONSOLE_WIDTH),
    );
  });

  test('English keeps the nonunion encounter name unchanged', () async {
    LcsI18n.reset();
    await LcsI18n.initialize('en_US');

    expect(
      localizedCreatureNameValue('Nonunion Worker', 'Factory Worker'),
      'Nonunion Worker',
    );
  });
}
