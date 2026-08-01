import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/i18n/untranslated_logger.dart';
import 'package:lcs_new_age/utils/game_options.dart';

Future<Map<String, dynamic>> _waitForLoggedEntry(
  String key,
  Directory logDirectory,
) async {
  for (var attempt = 0; attempt < 120; attempt++) {
    if (logDirectory.existsSync()) {
      for (final entity in logDirectory.listSync()) {
        if (entity is! File) {
          continue;
        }

        final fileName = entity.uri.pathSegments.last;
        if (!fileName.startsWith('untranslated_strings_') ||
            !fileName.endsWith('.json')) {
          continue;
        }

        try {
          final content = entity.readAsStringSync();
          if (content.trim().isEmpty) {
            continue;
          }

          final decoded = json.decode(content) as Map<String, dynamic>;
          final entry = decoded[key];
          if (entry is Map<String, dynamic>) {
            return entry;
          }
        } catch (_) {
          // Ignore files being rewritten while async logging is in flight.
        }
      }
    }

    await Future<void>.delayed(const Duration(milliseconds: 25));
  }

  throw TestFailure('Timed out waiting for untranslated entry "$key"');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LcsI18n Tests - NCurses Style', () {
    setUp(() async {
      LcsI18n.reset();
      gameOptions.logUntranslatedStrings = false;
      UntranslatedStringLogger.setLogDirectoryOverrideForTesting(null);
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

    test(
      'initialize keeps the previous locale until async load completes',
      () async {
        final initializeFuture = LcsI18n.initialize('pt_BR');

        expect(LcsI18n.currentLocale, equals('en_US'));

        await initializeFuture;
        expect(LcsI18n.currentLocale, equals('pt_BR'));
      },
    );

    test('translate simple strings in English', () async {
      await LcsI18n.initialize('en_US');

      expect(LcsI18n.translate('Game Over'), equals('Game Over'));
      expect(LcsI18n.translate('Game Over'), equals('Game Over'));
      expect(
        LcsI18n.translate('Press any key to continue.'),
        equals('Press any key to continue.'),
      );
    });

    test('translate simple strings in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');

      expect(
        LcsI18n.translate('Loading Liberal Crime Squad...'),
        equals('Carregando Esquadrão do Crime Liberal...'),
      );
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
        LcsI18n.format('{attacker} hits {target}.', {
          'attacker': 'Alice',
          'target': 'Conservative',
        }),
        equals('Alice hits Conservative.'),
      );
    });

    test('processString with parameters in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');

      expect(
        LcsI18n.processString('{attacker} hits {target}.', {
          'attacker': 'Alice',
          'target': 'Conservador',
        }),
        equals('Alice acerta Conservador.'),
      );

      expect(
        LcsI18n.processString('{count} other LCS members escape in the riot!', {
          'count': '5',
        }),
        equals('5 outros membros do LCS escapam no motim!'),
      );
    });

    test('processString translates raw English pronoun parameters', () async {
      await LcsI18n.initialize('pt_BR');

      final result = LcsI18n.processString(
        'seems to have been waiting for this {hisHer} whole life.',
        {'hisHer': 'his'},
      );

      expect(
        result,
        equals('parece estar esperando por isso durante toda a vida dele.'),
      );
    });

    test('distinguishes feminine possessive and object pronouns', () async {
      await LcsI18n.initialize('pt_BR');

      final possessive = LcsI18n.processString(
        'seems to have been waiting for this {hisHer} whole life.',
        {'hisHer': 'her'},
      );
      final object = LcsI18n.processString(
        'B - Try to charm {himHer} with online dating.',
        {'himHer': 'her'},
      );

      expect(
        possessive,
        equals('parece estar esperando por isso durante toda a vida dela.'),
      );
      expect(object, equals('B - Tente encantar ela com namoro online.'));
    });

    test(
      'translates subject and masculine object pronoun parameters',
      () async {
        await LcsI18n.initialize('pt_BR');

        expect(
          LcsI18n.processString('says {heShe} needs more time to think.', {
            'heShe': 'she',
          }),
          equals('diz que ela precisa de mais tempo para pensar.'),
        );
        expect(
          LcsI18n.processString(
            'B - Try to charm {himHer} with online dating.',
            {'himHer': 'him'},
          ),
          equals('B - Tente encantar ele com namoro online.'),
        );
        expect(
          LcsI18n.processString('looks like {heShe} might be convinced.', {
            'heShe': 'they',
          }),
          equals('parece que elu está se convencendo.'),
        );
      },
    );

    test('translates standalone subject pronouns', () async {
      await LcsI18n.initialize('pt_BR');

      expect(LcsI18n.tr('he'), equals('ele'));
      expect(LcsI18n.tr('she'), equals('ela'));
      expect(LcsI18n.tr('they'), equals('elu'));
    });

    test('translates pronouns according to grammatical role', () async {
      await LcsI18n.initialize('pt_BR');

      expect(
        LcsI18n.translatePronoun('her', role: PronounRole.possessive),
        equals('dela'),
      );
      expect(
        LcsI18n.translatePronoun('her', role: PronounRole.object),
        equals('ela'),
      );
      expect(
        LcsI18n.translatePronoun('they', role: PronounRole.subject),
        equals('elu'),
      );
      expect(
        LcsI18n.translatePronoun('their', role: PronounRole.possessive),
        equals('delu'),
      );
    });

    test(
      'format() does not translate - use processString() for translation',
      () async {
        await LcsI18n.initialize('pt_BR');

        // format() only replaces placeholders, does not translate
        // The template stays in English
        expect(
          LcsI18n.format('{attacker} hits {target}.', {
            'attacker': 'Alice',
            'target': 'Maria',
          }),
          equals('Alice hits Maria.'),
        );

        // For translation + formatting, use processString()
        expect(
          LcsI18n.processString('{attacker} hits {target}.', {
            'attacker': 'Alice',
            'target': 'Maria',
          }),
          equals('Alice acerta Maria.'),
        );
      },
    );

    test('plural handling - zero in English', () async {
      await LcsI18n.initialize('en_US');
      expect(
        LcsI18n.translate('Another imprisoned LCS member also gets out!'),
        equals('Another imprisoned LCS member also gets out!'),
      );
    });

    test('plural handling - one in English', () async {
      await LcsI18n.initialize('en_US');
      expect(
        LcsI18n.translate('You have escaped!'),
        equals('You have escaped!'),
      );
    });

    test('plural handling - other in English', () async {
      await LcsI18n.initialize('en_US');
      expect(
        LcsI18n.format('{count} other LCS members escape in the riot!', {
          'count': 5,
        }),
        equals('5 other LCS members escape in the riot!'),
      );
    });

    test('plural handling in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');

      expect(
        LcsI18n.translate('Another imprisoned LCS member also gets out!'),
        equals('Outro membro preso do LCS também escapa!'),
      );

      expect(LcsI18n.translate('You have escaped!'), equals('Você escapou!'));

      expect(
        LcsI18n.processString('{count} other LCS members escape in the riot!', {
          'count': '5',
        }),
        equals('5 outros membros do LCS escapam no motim!'),
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
        LcsI18n.format('{count} other LCS members escape in the riot!', {
          'count': 5,
        }),
        equals('5 other LCS members escape in the riot!'),
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
      expect(LcsI18n.tr('Game Over'), equals('Game Over'));
    });

    test('processString translates and formats in English', () async {
      await LcsI18n.initialize('en_US');
      expect(
        LcsI18n.processString('{attacker} hits {target}.', {
          'attacker': 'Alice',
          'target': 'Conservative',
        }),
        equals('Alice hits Conservative.'),
      );
    });

    test('processString translates and formats in Portuguese', () async {
      await LcsI18n.initialize('pt_BR');
      expect(
        LcsI18n.processString('{attacker} hits {target}.', {
          'attacker': 'Alice',
          'target': 'Conservador',
        }),
        equals('Alice acerta Conservador.'),
      );
    });

    test(
      'processString translates media overview counts in Portuguese',
      () async {
        await LcsI18n.initialize('pt_BR');
        expect(
          LcsI18n.processString(
            'M - Media Overview & Impact &C({unreadNewsCount})',
            {'unreadNewsCount': 3},
          ),
          equals('M - Visão geral da mídia e impacto &C(3)'),
        );
      },
    );

    test(
      'processString translates fight templates with named placeholders',
      () async {
        await LcsI18n.initialize('pt_BR');
        expect(
          LcsI18n.processString(
            '{attacker} punches the {ism} out of {target}!',
            {'attacker': 'Alice', 'ism': 'conservadorismo', 'target': 'Bob'},
          ),
          equals('Alice arranca o conservadorismo de Bob no soco!'),
        );
        expect(
          LcsI18n.processString(
            '{attacker} strikes true on {target}, {description} {times} times.',
            {
              'attacker': 'Alice',
              'target': 'o braço',
              'description': 'sem hesitar',
              'times': '2',
            },
          ),
          equals('Alice acerta o braço em cheio, sem hesitar 2 vezes.'),
        );
        expect(
          LcsI18n.processString(
            '{attacker} hits {target}, {description} {times} times.',
            {
              'attacker': 'Alice',
              'target': 'o braço',
              'description': 'sem hesitar',
              'times': '2',
            },
          ),
          equals('Alice acerta o braço, sem hesitar 2 vezes.'),
        );
        expect(
          LcsI18n.processString("{name} drops {prisonerName}'s body.", {
            'name': 'Alice',
            'prisonerName': 'Bob',
          }),
          equals('Alice deixa cair o corpo de Bob.'),
        );
        expect(
          LcsI18n.translate('the bloody mess'),
          equals('a bagunça ensanguentada'),
        );
        expect(
          LcsI18n.processString("By {journalist}", {
            'journalist': 'Maria Santos',
          }),
          equals('Por Maria Santos'),
        );
        expect(
          LcsI18n.processString(
            "You've found the {level} prison control room.",
            {'level': LcsI18n.translate('high security')},
          ),
          equals(
            'Você encontrou a sala de controle da prisão de nível alta segurança.',
          ),
        );
      },
    );

    test('processString with noTranslate skips translation', () async {
      await LcsI18n.initialize('pt_BR');
      expect(
        LcsI18n.processString('{attacker} hits {target}.', {
          'attacker': 'Alice',
          'target': 'Conservador',
        }, noTranslate: true),
        equals('Alice hits Conservador.'),
      );
    });

    test('fallback to English for missing translations', () async {
      await LcsI18n.initialize('pt_BR');
      const untranslated = 'xyz_untranslated_test_string_123';
      expect(LcsI18n.translate(untranslated), equals(untranslated));
    });

    test(
      'English fallback entries are tracked as missing translations',
      () async {
        await LcsI18n.initialize('zz_ZZ');

        const fallbackKey = 'Game Over';
        expect(LcsI18n.translate(fallbackKey), equals('Game Over'));
        expect(LcsI18n.getMissingTranslations(), contains(fallbackKey));
      },
    );

    test(
      'English fallback logging only writes each missing key once',
      () async {
        const fallbackKey = 'Game Over';
        final tempWorkingDirectory = await Directory.systemTemp.createTemp(
          'i18n_missing_log_test_',
        );
        final tempLogDirectory = Directory(
          '${tempWorkingDirectory.path}/translation_workspace',
        );

        try {
          UntranslatedStringLogger.setLogDirectoryOverrideForTesting(
            tempLogDirectory.path,
          );
          gameOptions.logUntranslatedStrings = true;

          await LcsI18n.initialize('zz_ZZ');

          expect(LcsI18n.translate(fallbackKey), equals('Game Over'));
          final firstEntry = await _waitForLoggedEntry(
            fallbackKey,
            tempLogDirectory,
          );

          await Future<void>.delayed(const Duration(milliseconds: 25));
          expect(LcsI18n.translate(fallbackKey), equals('Game Over'));

          await Future<void>.delayed(const Duration(milliseconds: 50));
          final secondEntry = await _waitForLoggedEntry(
            fallbackKey,
            tempLogDirectory,
          );

          expect(secondEntry['timestamp'], equals(firstEntry['timestamp']));
        } finally {
          UntranslatedStringLogger.setLogDirectoryOverrideForTesting(null);
          if (tempWorkingDirectory.existsSync()) {
            await tempWorkingDirectory.delete(recursive: true);
          }
        }
      },
    );

    test(
      'missing translations can be logged after logging is enabled later',
      () async {
        const missingKey = 'definitelynotmatchinganypattern';
        final tempWorkingDirectory = await Directory.systemTemp.createTemp(
          'i18n_missing_late_log_test_',
        );
        final tempLogDirectory = Directory(
          '${tempWorkingDirectory.path}/translation_workspace',
        );

        try {
          UntranslatedStringLogger.setLogDirectoryOverrideForTesting(
            tempLogDirectory.path,
          );

          await LcsI18n.initialize('pt_BR');
          expect(LcsI18n.translate(missingKey), equals(missingKey));

          gameOptions.logUntranslatedStrings = true;
          expect(LcsI18n.translate(missingKey), equals(missingKey));

          final entry = await _waitForLoggedEntry(missingKey, tempLogDirectory);
          expect(entry['original'], equals(missingKey));
          expect(entry['locale'], equals('pt_BR'));
        } finally {
          UntranslatedStringLogger.setLogDirectoryOverrideForTesting(null);
          if (tempWorkingDirectory.existsSync()) {
            await tempWorkingDirectory.delete(recursive: true);
          }
        }
      },
    );

    test('translated catalog entries are not logged as untranslated', () async {
      const translatedCatalogKey = 'White Plains, NY';
      final tempWorkingDirectory = await Directory.systemTemp.createTemp(
        'i18n_translated_catalog_log_test_',
      );
      final tempLogDirectory = Directory(
        '${tempWorkingDirectory.path}/translation_workspace',
      );

      try {
        UntranslatedStringLogger.setLogDirectoryOverrideForTesting(
          tempLogDirectory.path,
        );
        gameOptions.logUntranslatedStrings = true;

        await LcsI18n.initialize('pt_BR');

        expect(
          LcsI18n.translate(translatedCatalogKey),
          equals('White Plains, New York'),
        );

        await Future<void>.delayed(const Duration(milliseconds: 75));
        expect(tempLogDirectory.existsSync(), isFalse);
      } finally {
        UntranslatedStringLogger.setLogDirectoryOverrideForTesting(null);
        if (tempWorkingDirectory.existsSync()) {
          await tempWorkingDirectory.delete(recursive: true);
        }
      }
    });

    test(
      'translated catalog entries are not logged after logging is enabled later',
      () async {
        const translatedCatalogKey = 'White Plains, NY';
        final tempWorkingDirectory = await Directory.systemTemp.createTemp(
          'i18n_translated_catalog_late_log_test_',
        );
        final tempLogDirectory = Directory(
          '${tempWorkingDirectory.path}/translation_workspace',
        );

        try {
          UntranslatedStringLogger.setLogDirectoryOverrideForTesting(
            tempLogDirectory.path,
          );

          await LcsI18n.initialize('pt_BR');
          expect(
            LcsI18n.translate(translatedCatalogKey),
            equals('White Plains, New York'),
          );

          gameOptions.logUntranslatedStrings = true;
          expect(
            LcsI18n.translate(translatedCatalogKey),
            equals('White Plains, New York'),
          );

          await Future<void>.delayed(const Duration(milliseconds: 75));
          expect(tempLogDirectory.existsSync(), isFalse);
        } finally {
          UntranslatedStringLogger.setLogDirectoryOverrideForTesting(null);
          if (tempWorkingDirectory.existsSync()) {
            await tempWorkingDirectory.delete(recursive: true);
          }
        }
      },
    );

    test('locale switching works', () async {
      await LcsI18n.initialize('en_US');
      expect(LcsI18n.translate('Game Over'), equals('Game Over'));

      await LcsI18n.setLocale('pt_BR');
      expect(LcsI18n.translate('Game Over'), equals('Fim de Jogo'));

      await LcsI18n.setLocale('en_US');
      expect(LcsI18n.translate('Game Over'), equals('Game Over'));
    });

    test('setLocale initializes translations when called first', () async {
      await LcsI18n.setLocale('pt_BR');
      expect(LcsI18n.translate('Game Over'), equals('Fim de Jogo'));
    });

    test('setLocale reports missing keys not present in any catalog', () async {
      final logLines = <String>[];
      const missingKey = 'Squad: ';

      await runZoned(
        () async {
          await LcsI18n.setLocale('pt_BR');
          expect(LcsI18n.translate(missingKey), equals(missingKey));
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            logLines.add(line);
          },
        ),
      );

      expect(
        logLines,
        contains('LcsI18n: Missing translation for "$missingKey" in pt_BR'),
      );
    });

    test(
      'setLocale keeps the old locale until the new one is loaded',
      () async {
        await LcsI18n.initialize('en_US');

        final switchFuture = LcsI18n.setLocale('pt_BR');
        expect(LcsI18n.currentLocale, equals('en_US'));

        await switchFuture;
        expect(LcsI18n.currentLocale, equals('pt_BR'));
      },
    );

    test(
      'missing translations are cleared when the active locale changes',
      () async {
        await LcsI18n.initialize('pt_BR');
        const missing = 'definitelynotmatchinganypattern';

        LcsI18n.translate(missing);
        expect(LcsI18n.getMissingTranslations(), contains(missing));

        await LcsI18n.setLocale('en_US');
        expect(LcsI18n.getMissingTranslations(), isEmpty);
      },
    );

    test('missing translations are tracked', () async {
      await LcsI18n.initialize('pt_BR');
      const missing = 'definitelynotmatchinganypattern';
      LcsI18n.translate(missing);
      // Check immediately before setUp clears it
      final missingSet = LcsI18n.getMissingTranslations();
      expect(missingSet, contains(missing));
    });

    test(
      'long generated prose is not tracked as a missing translation',
      () async {
        await LcsI18n.initialize('pt_BR');
        const longBody =
            'This generated article body is long enough to be treated as prose '
            'instead of a stable translation key and should not be added to the '
            'missing translation tracker during gameplay logging.';

        expect(LcsI18n.translate(longBody), equals(longBody));
        expect(LcsI18n.getMissingTranslations(), isNot(contains(longBody)));
      },
    );

    group('Inline Color Syntax Tests', () {
      test(
        'color specs are extracted before translation - static colors',
        () async {
          await LcsI18n.initialize('en_US');

          // Template with color specs - these should be extracted before translation
          // so translators only see "{name} talks to {target}"
          final result = LcsI18n.processString(
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

          final result = LcsI18n.processString(
            "{name} talks to {target}", // Clean template (no colors)
            {'name': 'Liberal', 'target': 'Conservador'},
            baseColorKey: 'w',
          );

          // Without color specs, just returns formatted string
          expect(result, equals('Liberal fala com Conservador'));
        },
      );

      test(
        'colorized source templates translate through normalized ARB entries',
        () async {
          await LcsI18n.initialize('pt_BR');

          final result = LcsI18n.processString(
            "{support:color}% support the Liberal Crime Squad",
            {'support': '12', 'supportColor': 'G'},
            baseColorKey: 'w',
          );

          expect(result, equals('&G12&w% apoiam o Esquadrão do Crime Liberal'));
        },
      );

      test('multiple color specs are handled correctly', () async {
        await LcsI18n.initialize('en_US');

        final result = LcsI18n.processString(
          "{attacker:red} attacks {defender:blue} with {weapon:yellow}",
          {'attacker': 'Tank', 'defender': 'Dog', 'weapon': 'Shotgun'},
          noTranslate: true,
          baseColorKey: 'w',
        );

        expect(result, equals('&RTank&w attacks &BDog&w with &YShotgun&w'));
      });

      test('mixed placeholders - some with color, some without', () async {
        await LcsI18n.initialize('en_US');

        final result = LcsI18n.processString(
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

        final result = LcsI18n.processString(
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

        final result = LcsI18n.processString(
          "{name:red} attacks {target:blue}",
          {'name': 'Attacker', 'target': 'Target'},
          noTranslate: true,
          baseColorKey: 'w', // Should restore to 'w' (lightGray)
        );

        expect(result, equals('&RAttacker&w attacks &BTarget&w'));
      });

      test('unknown color specs are ignored gracefully', () async {
        await LcsI18n.initialize('en_US');

        final result = LcsI18n.processString(
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

        final result = LcsI18n.processString(
          "Loading Liberal Crime Squad...",
          null,
          baseColorKey: 'w',
        );

        expect(result, equals('Carregando Esquadrão do Crime Liberal...'));
      });

      test(
        'template without params still normalizes inline color placeholders before translation',
        () async {
          await LcsI18n.initialize('pt_BR');

          final result = LcsI18n.processString(
            "{name:white} talks to {target:color}",
            null,
            baseColorKey: 'w',
          );

          expect(result, equals('{name} fala com {target}'));
        },
      );
    });
  });
}
