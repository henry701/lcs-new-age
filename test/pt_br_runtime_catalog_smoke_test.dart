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
          if (result == key) {
            failures.add('same-as-source: $key');
          }
          if (_hasUnreplacedPlaceholders(result)) {
            failures.add('unreplaced placeholders: $key => $result');
          }
        } catch (error, stackTrace) {
          failures.add('exception for "$key": $error\n$stackTrace');
        }
      }

      expect(
        failures,
        isEmpty,
        reason: failures.take(25).join('\n'),
      );
    });

    test('console wrappers render translated pt_BR templates with params', () {
      erase();
      move(0, 0);

      expect(() {
        addstr('You hit the {target}!', params: {'target': 'Inimigo'});
        mvaddstr(1, 0, '{name} has been rescued.', params: {'name': 'Maria'});
        addstrc(lightGray, 'M - Media Overview & Impact &C({unreadNewsCount})',
            params: {'unreadNewsCount': 2});
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
      final rendered = LcsI18n.processString(
        '{attacker:red} hits {target}!',
        {'attacker': 'Tanque', 'target': 'Cão'},
      );

      expect(rendered, contains('Tanque'));
      expect(rendered, contains('Cão'));
      expect(_hasUnreplacedPlaceholders(rendered), isFalse);
    });
  });
}

bool _hasUnreplacedPlaceholders(String value) {
  return catalogPlaceholderPattern.hasMatch(value);
}
