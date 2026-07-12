import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Portuguese plural handling tests', () {
    setUp(() async {
      // Ensure clean state before each test
      LcsI18n.reset();
    });

    tearDown(LcsI18n.reset);

    test('live singular form', () async {
      await LcsI18n.initialize('pt_BR');
      final result = LcsI18n.translate(
        'Another imprisoned LCS member also gets out!',
      );
      expect(result, 'Outro membro preso do LCS também escapa!');
    });

    test('live plural form with parameter', () async {
      await LcsI18n.initialize('pt_BR');
      final result = LcsI18n.processString(
        '{count} other LCS members escape in the riot!',
        {'count': '2'},
      );
      expect(result, '2 outros membros do LCS escapam no motim!');
    });

    // Test English locale returns English source strings
    test('English locale returns English', () async {
      await LcsI18n.initialize('en_US');
      final result = LcsI18n.translate(
        'Another imprisoned LCS member also gets out!',
      );
      expect(result, 'Another imprisoned LCS member also gets out!');
    });

    // Test that unknown strings are returned as-is (not thrown)
    test('unknown strings return original', () async {
      await LcsI18n.initialize('pt_BR');
      final result = LcsI18n.translate('This is a test string not in ARB.');
      expect(result, 'This is a test string not in ARB.');
    });
  });
}
