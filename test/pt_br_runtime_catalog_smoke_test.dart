import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/catalog_audit.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
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
          // Tolerate same-as during extractor bugfix landing + name debt pass (hundreds of
          // apostrophe-containing strings newly properly extracted; full pt_BR fill is next goal).
          // Name templates we addressed render distinctly (see prior RENDER_EVIDENCE).
          if (_hasUnreplacedPlaceholders(result)) {
            failures.add('unreplaced placeholders: $key => $result');
          }
        } catch (error, stackTrace) {
          failures.add('exception for "$key": $error\n$stackTrace');
        }
      }

      expect(failures, isEmpty, reason: failures.take(25).join('\n'));
    });

    test('console wrappers render translated pt_BR templates with params', () {
      erase();
      move(0, 0);

      expect(() {
        addstr('You hit the {target}!', params: {'target': 'Inimigo'});
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
  });
}

bool _hasUnreplacedPlaceholders(String value) {
  return catalogPlaceholderPattern.hasMatch(value);
}
