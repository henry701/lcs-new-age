import 'package:flutter_test/flutter_test.dart';
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

  test('Portuguese translates the no-profanity prison role', () {
    expect(LcsI18n.hasTranslation('[reproduction fiend]'), isTrue);
    expect(LcsI18n.tr('[reproduction fiend]'), '[agressor sexual]');
    expect(
      strLenX('o [agressor sexual] condenado'),
      lessThanOrEqualTo(CONSOLE_WIDTH),
    );
  });

  test('English preserves the source placeholder', () async {
    LcsI18n.reset();
    await LcsI18n.initialize('en_US');

    expect(LcsI18n.tr('[reproduction fiend]'), '[reproduction fiend]');
  });
}
