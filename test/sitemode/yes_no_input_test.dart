import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese yes/no prompts accept the localized affirmative key', () {
    expect(isYesKey(Key.s), isTrue);
    expect(isYesKey(Key.y), isTrue);
    expect(isNoKey(Key.n), isTrue);
    expect(isNoKey(Key.s), isFalse);
  });

  test(
    'English yes/no prompts keep the source-language affirmative key',
    () async {
      await LcsI18n.setLocale('en_US');

      expect(isYesKey(Key.y), isTrue);
      expect(isYesKey(Key.s), isFalse);
      expect(isNoKey(Key.n), isTrue);
    },
  );
}
