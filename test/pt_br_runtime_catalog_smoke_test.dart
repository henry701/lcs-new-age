import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/catalog_audit.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/i18n/translation_exceptions.dart';
import 'package:lcs_new_age/utils/colors.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('pt_BR runtime catalog smoke', () {
    late Map<String, String> sourceEntries;

    setUpAll(() async {
      sourceEntries = loadLocaleStringEntries('en_US');
      await LcsI18n.initialize('pt_BR');
    });

    tearDownAll(LcsI18n.reset);

    test('every source key processes without exception via processString', () {
      final failures = <String>[];

      for (final key in sourceEntries.keys) {
        final params = synthesizePlaceholderValues(key);
        try {
          final result = LcsI18n.processString(key, params);
          if (result == key && !structuralTranslationKeys.contains(key)) {
            failures.add('same-as-source translation: $key');
          }
          if (_hasUnreplacedPlaceholders(result)) {
            failures.add('unreplaced placeholders: $key => $result');
          }
        } catch (error, stackTrace) {
          failures.add('exception for "$key": $error\n$stackTrace');
        }
      }

      expect(failures, isEmpty, reason: failures.take(25).join('\n'));
      expect(
        LcsI18n.getMissingTranslations(),
        isEmpty,
        reason: 'pt_BR runtime fallback/missing keys were recorded',
      );
    });

    test('console wrappers render translated pt_BR templates with params', () {
      erase();
      move(0, 0);

      expect(() {
        addstr(
          '{attacker} hits {target}.',
          params: {'attacker': 'Alice', 'target': 'Inimigo'},
        );
        mvaddstr(1, 0, '{name} has been rescued.', params: {'name': 'Maria'});
        addstrc(
          lightGray,
          'M - Media Overview & Impact &C({unreadNewsCount})',
          params: {'unreadNewsCount': 2},
        );
        addOptionText(3, 0, 'O', 'O - Gameplay Options');
        addparagraph(5, 0, 'Press any key to continue.');
      }, returnsNormally);

      expect(
        console.buffer[0].map((ch) => ch.glyph).join().trimRight(),
        contains('Inimigo'),
      );
      expect(
        console.buffer[3].map((ch) => ch.glyph).join(),
        contains('Opções'),
      );
    });

    test('colorized placeholder templates survive pt_BR translation', () {
      final rendered = LcsI18n.processString('{attacker:red} hits {target}!', {
        'attacker': 'Tanque',
        'target': 'Cão',
      });

      expect(rendered, contains('Tanque'));
      expect(rendered, contains('Cão'));
      expect(_hasUnreplacedPlaceholders(rendered), isFalse);
    });

    test(
      'targeted pt_BR name+fragment renders (no orphan fragments, no double space, correct order)',
      () {
        final cases = <String, Map<String, String>>{
          '{name} Prison': {'name': 'Silva'},
          '{name} Army Base': {'name': 'Costa'},
          '{adjective} {noun} Forced Labor Camp': {
            'adjective': 'Feliz',
            'noun': 'Vale',
          },
          '{adjective} {siteType}': {
            'adjective': 'Abandonado',
            'siteType': 'Armazém',
          },
          '{actor} marched downtown to protest wealth inqueality!': {
            'actor': 'Maria',
          },
          '{actor} marched downtown chanting Black Lives Matter!': {
            'actor': 'O grupo de ativistas',
          },
          '{name} is seized, thrown to the ground, and TAZED TO DEATH!': {
            'name': 'João',
          },
          '{name} leads a riot with dozens of prisoners chanting the LCS slogan!':
              {'name': 'Ana'},
          "{ribminus} of {name}'s ribs are broken!": {
            'ribminus': '3',
            'name': 'Pedro',
          },
          "{name}'s {showName}": {'name': 'Lúcia', 'showName': 'Alerta Livre'},
        };
        for (final entry in cases.entries) {
          final result = LcsI18n.processString(entry.key, entry.value);
          // ignore: avoid_print
          print('RENDER_EVIDENCE: ${entry.key} => $result');
          expect(
            _hasUnreplacedPlaceholders(result),
            isFalse,
            reason: entry.key,
          );
          // no doubled spaces or leading fragment artifacts
          expect(result.contains('  '), isFalse, reason: entry.key);
          expect(
            result.trimLeft().startsWith(RegExp(r"[ 's]")),
            isFalse,
            reason: entry.key,
          );
        }
      },
    );

    test('kidnap news story templates render before layout in pt_BR', () {
      final lead = LcsI18n.processString(
        '{city} - The disappearance of {name} is now considered a kidnapping, according to a police spokesperson.',
        {'city': 'Curitiba', 'name': 'João'},
      );
      final statement = LcsI18n.processString(
        '  {spokesperson}, speaking on behalf of the police department, stated "We now believe that {name} was taken {days} days ago, by a person or persons as yet undetermined.  We have several leads and are confident that we will bring {name} back home and bring the kidnappers to justice.  As the investigation is ongoing, I cannot be more specific at this time.  To the citizens, please contact the department if you have any additional information."',
        {'spokesperson': 'Roberta Silva', 'name': 'João', 'days': '12'},
      );

      // ignore: avoid_print
      print('RENDER_EVIDENCE: kidnap lead => $lead');
      // ignore: avoid_print
      print('RENDER_EVIDENCE: kidnap statement => $statement');

      expect(lead, contains('O desaparecimento de João'));
      expect(lead, contains('sequestro'));
      expect(lead, contains('segundo uma porta-voz da polícia'));
      expect(statement, contains('Roberta Silva, falando em nome'));
      expect(statement, contains('João foi levado há 12 dias'));
      expect(statement, contains('traremos João de volta para casa'));
      expect(_hasUnreplacedPlaceholders('$lead$statement'), isFalse);
    });
  });
}

bool _hasUnreplacedPlaceholders(String value) {
  return catalogPlaceholderPattern.hasMatch(value);
}
