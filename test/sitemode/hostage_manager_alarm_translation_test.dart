import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese hostage-manager alarm variants are localized', () {
    const translations = {
      '"It\'s them!  They\'re back!  SECURITY, HELP ME!!!"':
          '"São eles! Eles voltaram! SEGURANÇA, AJUDEM-ME!!!"',
      '"It\'s them!  They\'re back!  NURSES, HELP ME!!!"':
          '"São eles! Eles voltaram! ENFERMEIROS, AJUDEM-ME!!!"',
      '"It\'s them!  They\'re back for me again!  Help!!!"':
          '"São eles! Voltaram para me pegar de novo! SOCORRO!!!"',
    };

    for (final entry in translations.entries) {
      expect(LcsI18n.tr(entry.key), entry.value);
    }
  });
}
