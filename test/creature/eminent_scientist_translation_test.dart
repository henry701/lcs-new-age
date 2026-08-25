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

  test('Portuguese localizes the eminent scientist encounter role', () {
    expect(LcsI18n.hasTranslation('Eminent Scientist'), isTrue);
    expect(
      localizedCreatureNameValue('Eminent Scientist', 'Eminent Scientist'),
      'Cientista Eminente',
    );
  });

  test('Portuguese eminent scientist combat text fits the console width', () {
    final target = localizedCreatureNameValue(
      'Eminent Scientist',
      'Eminent Scientist',
    );

    expect(
      strLenX('Fabio Reid atira em $target com Rifle AK-102!'),
      lessThanOrEqualTo(CONSOLE_WIDTH),
    );
  });

  test(
    'English keeps the eminent scientist encounter role unchanged',
    () async {
      LcsI18n.reset();
      await LcsI18n.initialize('en_US');

      expect(
        localizedCreatureNameValue('Eminent Scientist', 'Eminent Scientist'),
        'Eminent Scientist',
      );
    },
  );
}
