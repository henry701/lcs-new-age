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

  test('Portuguese localizes the mail carrier encounter role', () {
    expect(LcsI18n.hasTranslation('Mail Carrier'), isTrue);
    expect(
      localizedCreatureNameValue('Mail Carrier', 'Mail Carrier'),
      'Carteiro',
    );
  });

  test('Portuguese mail carrier talk header fits the console width', () {
    final target = localizedCreatureNameValue('Mail Carrier', 'Mail Carrier');

    expect(
      strLenX('Denise Smyth fala com $target (50s, Masculino):'),
      lessThanOrEqualTo(CONSOLE_WIDTH),
    );
  });

  test('English keeps the mail carrier encounter role unchanged', () async {
    LcsI18n.reset();
    await LcsI18n.initialize('en_US');

    expect(LcsI18n.hasTranslation('Mail Carrier'), isTrue);
    expect(
      localizedCreatureNameValue('Mail Carrier', 'Mail Carrier'),
      'Mail Carrier',
    );
  });
}
