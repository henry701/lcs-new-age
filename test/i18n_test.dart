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

    test('processString with parameters in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');

      expect(
        LcsI18n.processString('You hit the {target}!', {
          'target': 'Conservador',
        }),
        equals('Você acertou o Conservador!'),
      );

      expect(
        LcsI18n.processString('You have {count} items.', {'count': '5'}),
        equals('Você tem 5 itens.'),
      );
    });

    test(
      'format() does not translate - use processString() for translation',
      () async {
        await LcsI18n.initialize('pt_BR');

        // format() only replaces placeholders, does not translate
        // The template stays in English
        expect(
          LcsI18n.format('Hello {name}!', {'name': 'Maria'}),
          equals('Hello Maria!'),
        );

        // For translation + formatting, use processString()
        expect(
          LcsI18n.processString('Hello {name}!', {'name': 'Maria'}),
          equals('Olá Maria!'),
        );
      },
    );

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
        LcsI18n.translate('You have no items.'),
        equals('Você não tem itens.'),
      );

      expect(
        LcsI18n.translate('You have one item.'),
        equals('Você tem um item.'),
      );

      expect(
        LcsI18n.processString('You have {count} items.', {'count': '5'}),
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
        LcsI18n.translate('Another imprisoned LCS member also gets out!'),
        equals('Outro membro preso do LCS também escapa!'),
      );
      expect(
        LcsI18n.processString('{count} other LCS members escape in the riot!', {
          'count': '5',
        }),
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
      const untranslated = 'xyz_untranslated_test_string_123';
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

    group('Inline Color Syntax Tests', () {
      test(
        'color specs are extracted before translation - static colors',
        () async {
          await LcsI18n.initialize('en_US');

          // Template with color specs - these should be extracted before translation
          // so translators only see "{name} talks to {target}"
          final result = LcsI18n.processStringWithInlineColors(
            "{name:white} talks to {target:color}",
            {
              'name': 'Liberal',
              'target': 'Conservative',
              'targetColor': 'R', // Dynamic color key
            },
            noTranslate: true, // Skip translation for this test
            baseColorKey: 'w',
          );

          // Result should have color markers applied
          expect(result, equals('&WLiberal&w talks to &RConservative&w'));
        },
      );

      test(
        'color specs are extracted before translation - translator sees clean template',
        () async {
          await LcsI18n.initialize('pt_BR');

          // When translating, the ARB file should only have:
          // "{name} talks to {target}": "{name} fala com {target}"
          // NOT: "{name:white} talks to {target:color}": "{name:white} fala com {target:color}"

          final result = LcsI18n.processStringWithInlineColors(
            "{name} talks to {target}", // Clean template (no colors)
            {'name': 'Liberal', 'target': 'Conservador'},
            baseColorKey: 'w',
          );

          // Without color specs, just returns formatted string
          expect(result, equals('Liberal talks to Conservador'));
        },
      );

      test('multiple color specs are handled correctly', () async {
        await LcsI18n.initialize('en_US');

        final result = LcsI18n.processStringWithInlineColors(
          "{attacker:red} attacks {defender:blue} with {weapon:yellow}",
          {'attacker': 'Tank', 'defender': 'Dog', 'weapon': 'Shotgun'},
          noTranslate: true,
          baseColorKey: 'w',
        );

        expect(result, equals('&RTank&w attacks &BDog&w with &YShotgun&w'));
      });

      test('mixed placeholders - some with color, some without', () async {
        await LcsI18n.initialize('en_US');

        final result = LcsI18n.processStringWithInlineColors(
          "{name:white} drops the {item} and {action:lightGreen}",
          {'name': 'Liberal', 'item': 'Weapon', 'action': 'escapes'},
          noTranslate: true,
          baseColorKey: 'w',
        );

        // Only name and action have colors, item does not
        expect(result, equals('&WLiberal&w drops the Weapon and &Gescapes&w'));
      });

      test('dynamic color from param works correctly', () async {
        await LcsI18n.initialize('en_US');

        final result = LcsI18n.processStringWithInlineColors(
          "{name:white} talks to {target:color}",
          {
            'name': 'Liberal',
            'target': 'Conservative',
            'targetColor': 'R', // Dynamic color
          },
          noTranslate: true,
          baseColorKey: 'w',
        );

        expect(result, equals('&WLiberal&w talks to &RConservative&w'));
      });

      test('baseColorKey is restored after each colored segment', () async {
        await LcsI18n.initialize('en_US');

        final result = LcsI18n.processStringWithInlineColors(
          "{name:red} attacks {target:blue}",
          {'name': 'Attacker', 'target': 'Target'},
          noTranslate: true,
          baseColorKey: 'w', // Should restore to 'w' (lightGray)
        );

        expect(result, equals('&RAttacker&w attacks &BTarget&w'));
      });

      test('unknown color specs are ignored gracefully', () async {
        await LcsI18n.initialize('en_US');

        final result = LcsI18n.processStringWithInlineColors(
          "{name:unknownColor} attacks",
          {'name': 'Attacker'},
          noTranslate: true,
          baseColorKey: 'w',
        );

        // Unknown color should just return value without markers
        expect(result, equals('Attacker attacks'));
      });

      test('template without params returns translated string only', () async {
        await LcsI18n.initialize('pt_BR');

        final result = LcsI18n.processStringWithInlineColors(
          "Loading...",
          null,
          baseColorKey: 'w',
        );

        expect(result, equals('Carregando...'));
      });
    });
  });
}
