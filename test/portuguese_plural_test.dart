import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Portuguese plural handling tests', () {
    setUp(() async {
      // Ensure clean state before each test
      LcsI18n.reset();
    });

    tearDown(() {
      // Clean up after each test
      LcsI18n.reset();
    });

    // Test singular form (uses English source key as lookup)
    test('singular form', () async {
      await LcsI18n.initialize('pt_BR');
      final result = LcsI18n.translate('You have one item.');
      expect(result, 'Você tem um item.');
    });

    // Test plural form with parameter (must use processString for parameter replacement)
    test('plural form with parameter', () async {
      await LcsI18n.initialize('pt_BR');
      final result = LcsI18n.processString('You have {count} items.', {
        'count': '2',
      });
      expect(result, 'Você tem 2 itens.');
    });

    // Test English locale returns English source strings
    test('English locale returns English', () async {
      await LcsI18n.initialize('en_US');
      final result = LcsI18n.translate('You have one item.');
      expect(result, 'You have one item.');
    });

    // Test that unknown strings are returned as-is (not thrown)
    test('unknown strings return original', () async {
      await LcsI18n.initialize('pt_BR');
      final result = LcsI18n.translate('This is a test string not in ARB.');
      expect(result, 'This is a test string not in ARB.');
    });
  });
}
