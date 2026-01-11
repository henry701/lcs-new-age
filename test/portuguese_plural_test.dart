import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Initialize i18n
  await LcsI18n.initialize('pt_BR');

  group('Portuguese plural handling tests', () {
    // Test singular form (should work)
    test('singular form', () async {
      await LcsI18n.initialize('pt_BR');
      final result = LcsI18n.translate('Você tem um item.');
      expect(result, 'Você tem um item.');
    });

    // Test plural form (should work with Portuguese plural translation)
    test('plural form', () async {
      await LcsI18n.initialize('pt_BR');
      final result = LcsI18n.translate('Você tem {count} itens.');
      expect(result, 'Você tem 2 itens.');
    });

    // Test that algorithm correctly rejects Portuguese string for English locale
    test('rejects Portuguese string for English locale', () async {
      await LcsI18n.initialize('en_US');
      expect(
        () => LcsI18n.translate('Você tem um item.'),
        throwsA(isA<LcsI18nException>),
      );
    });
  });
}
