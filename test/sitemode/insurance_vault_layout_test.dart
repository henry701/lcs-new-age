import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/sitemode/map_specials.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test(
    'insurance-safe and bank-vault messages fit Portuguese console rows',
    () async {
      const insuranceSafeMessage =
          "The squad has found documents detailing the insurance company's malfeasance.";
      const bankVaultMessage =
          'The squad will need a security expert, a computer ';
      const bankVaultLine2 = 'expert, and one of the bank managers.';

      final localizedInsuranceSafe = LcsI18n.tr(insuranceSafeMessage);
      final localizedBankVault = LcsI18n.tr(bankVaultMessage);
      final localizedBankVaultLine2 = LcsI18n.tr(bankVaultLine2);

      expect(
        localizedInsuranceSafe,
        'O esquadrão encontrou documentos que detalham a má conduta da companhia de seguros.',
      );
      expect(
        localizedBankVault,
        'A equipe precisará de um especialista em segurança, um especialista em informática ',
      );
      expect(localizedBankVaultLine2, 'e um dos gerentes do banco.');
      expect(localizedInsuranceSafe.length, greaterThan(console.width));
      expect(localizedBankVault.length, greaterThan(console.width));

      console.injectKey('x');
      await encounterMessage(insuranceSafeMessage, fitToWidth: true);
      expect(
        _consoleLine(9),
        equals(' ${fitConsoleText(localizedInsuranceSafe, console.width - 1)}'),
      );
      expect(_consoleLine(9).length, lessThanOrEqualTo(console.width));

      console.injectKey('x');
      await encounterMessage(
        bankVaultMessage,
        line2: bankVaultLine2,
        fitToWidth: true,
      );
      expect(
        _consoleLine(9),
        equals(' ${fitConsoleText(localizedBankVault, console.width - 1)}'),
      );
      expect(_consoleLine(10), equals(' $localizedBankVaultLine2'));
      expect(_consoleLine(9).length, lessThanOrEqualTo(console.width));
      expect(_consoleLine(10).length, lessThanOrEqualTo(console.width));
    },
  );

  test('the affected map specials opt into bounded encounter rendering', () {
    final source = File('lib/sitemode/map_specials.dart').readAsStringSync();

    expect(
      RegExp(
        r'Future<void> specialInsuranceSafe\(\) async \{[\s\S]*?'
        r'fitToWidth: true',
      ).hasMatch(source),
      isTrue,
    );
    expect(
      RegExp(
        r'Future<void> specialBankVault\(\) async \{[\s\S]*?'
        r'fitToWidth: true',
      ).hasMatch(source),
      isTrue,
    );
  });
}
