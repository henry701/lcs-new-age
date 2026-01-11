import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LcsI18n Tests - NCurses Style', () {
    setUp(() async {
      LcsI18n.reset();
    });

    test('initialize with default locale', () async {
      await LcsI18n.initialize();
      expect(LcsI18n.isInitialized, isTrue);
      expect(LcsI18n.currentLocale, equals('en_US'));
    });

    test('initialize with custom locale', () async {
      await LcsI18n.initialize('pt_BR');
      expect(LcsI18n.currentLocale, equals('pt_BR'));
    });

    test('translate simple strings in English', () async {
      await LcsI18n.initialize('en_US');

      expect(LcsI18n.translate('Loading...'), equals('Loading...'));
      expect(LcsI18n.translate('Game Over'), equals('Game Over'));
      expect(
        LcsI18n.translate('Press any key to continue.'),
        equals('Press any key to continue.'),
      );
    });

    test('translate simple strings in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');

      expect(LcsI18n.translate('Loading...'), equals('Carregando...'));
      expect(LcsI18n.translate('Game Over'), equals('Fim de Jogo'));
      expect(
        LcsI18n.translate('Press any key to continue.'),
        equals('Pressione qualquer tecla para continuar.'),
      );
    });

    test('format strings with parameters in English', () async {
      await LcsI18n.initialize('en_US');

      // format() only does placeholder replacement (no translation)
      expect(
        LcsI18n.format("{name}'s corpse has been recovered.", {'name': 'John'}),
        equals("John's corpse has been recovered."),
      );

      expect(
        LcsI18n.format('{name} has been rescued.', {'name': 'Jane'}),
        equals('Jane has been rescued.'),
      );

      expect(
        LcsI18n.format('You hit the {target}!', {'target': 'Conservative'}),
        equals('You hit the Conservative!'),
      );
    });

    test('format strings with parameters in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');

      // format() only does placeholder replacement (no translation)
      // For translation + formatting, use processString()
      expect(
        LcsI18n.processString("John's corpse has been recovered.", {
          'name': 'João',
        }),
        equals('O cadáver de João foi recuperado.'),
      );

      expect(
        LcsI18n.processString('Jane has been rescued.', {'name': 'Maria'}),
        equals('Maria foi resgatado.'),
      );

      // For values that need translation (like alignment names),
      // translate at the call site using LcsI18n.tr()
      final target = LcsI18n.tr('Conservative');
      expect(
        LcsI18n.processString('You hit the {target}!', {'target': target}),
        equals('Você acertou o Conservador!'),
      );
    });

    test('format strings with parameters in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');

      // format() only does placeholder replacement (no translation)
      // For translation + formatting, use processString()
      expect(
        LcsI18n.processString("John's corpse has been recovered.", {
          'name': 'João',
        }),
        equals('O cadáver de João foi recuperado.'),
      );

      expect(
        LcsI18n.processString('Jane has been rescued.', {'name': 'Maria'}),
        equals('Maria foi resgatado.'),
      );

      expect(
        LcsI18n.processString('You hit the {target}!', {
          'target': 'Conservador',
        }),
        equals('Você acertou o Conservador!'),
      );
    });

    test('plural handling - zero in English', () async {
      await LcsI18n.initialize('en_US');
      expect(
        LcsI18n.translate('You have no items.'),
        equals('You have no items.'),
      );
    });

    test('plural handling - one in English', () async {
      await LcsI18n.initialize('en_US');
      expect(
        LcsI18n.translate('You have one item.'),
        equals('You have one item.'),
      );
    });

    test('plural handling - other in English', () async {
      await LcsI18n.initialize('en_US');
      expect(
        LcsI18n.format('You have {count} items.', {'count': 5}),
        equals('You have 5 items.'),
      );
    });

    test('plural handling in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');

      expect(
        LcsI18n.translate('Você não tem itens.'),
        equals('Você não tem itens.'),
      );

      expect(
        LcsI18n.translate('Você tem um item.'),
        equals('Você tem um item.'),
      );

      expect(
        LcsI18n.processString('Você tem {count} itens.', {'count': 5}),
        equals('Você tem 5 itens.'),
      );
    });

    test('complex plural - members escape in English', () async {
      await LcsI18n.initialize('en_US');
      expect(LcsI18n.translate(''), equals(''));
      expect(
        LcsI18n.translate('Another imprisoned LCS member also gets out!'),
        equals('Another imprisoned LCS member also gets out!'),
      );
      expect(
        LcsI18n.format('{count} other LCS members escape in riot!', {
          'count': 5,
        }),
        equals('5 other LCS members escape in riot!'),
      );
    });

    test('complex plural - members escape in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');
      expect(LcsI18n.translate(''), equals(''));
      expect(
        LcsI18n.translate('Outro membro preso do LCS também escapa!'),
        equals('Outro membro preso do LCS também escapa!'),
      );
      expect(
        LcsI18n.processString(
          '{count} outros membros do LCS escapam no motim!',
          {'count': 5},
        ),
        equals('5 outros membros do LCS escapam no motim!'),
      );
    });

    test('shorthand tr() method works', () async {
      await LcsI18n.initialize('en_US');
      expect(LcsI18n.tr('Loading...'), equals('Loading...'));
    });

    test('processString translates and formats in English', () async {
      await LcsI18n.initialize('en_US');
      expect(
        LcsI18n.processString('You hit the {target}!', {
          'target': 'Conservative',
        }),
        equals('You hit the Conservative!'),
      );
    });

    test('processString translates and formats in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');
      expect(
        LcsI18n.processString('You hit the {target}!', {
          'target': 'Conservador',
        }),
        equals('Você acertou o Conservador!'),
      );
    });

    test('processString with noTranslate skips translation', () async {
      await LcsI18n.initialize('pt_BR');
      expect(
        LcsI18n.processString('You hit the {target}!', {
          'target': 'Conservador',
        }, noTranslate: true),
        equals('You hit the Conservador!'),
      );
    });

    test('fallback to English for missing translations', () async {
      await LcsI18n.initialize('pt_BR');
      const untranslated = 'This message does not exist';
      expect(LcsI18n.translate(untranslated), equals(untranslated));
    });

    test('locale switching works', () async {
      await LcsI18n.initialize('en_US');
      expect(LcsI18n.translate('Game Over'), equals('Game Over'));

      await LcsI18n.setLocale('pt_BR');
      expect(LcsI18n.translate('Game Over'), equals('Fim de Jogo'));

      await LcsI18n.setLocale('en_US');
      expect(LcsI18n.translate('Game Over'), equals('Game Over'));
    });

    test('missing translations are tracked', () async {
      await LcsI18n.initialize('pt_BR');
      const missing = 'definitelynotmatchinganypattern';
      LcsI18n.translate(missing);
      // Check immediately before setUp clears it
      final missingSet = LcsI18n.getMissingTranslations();
      expect(missingSet, contains(missing));
    });
  });
}
