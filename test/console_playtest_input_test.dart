import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/console.dart';

void main() {
  test('headless playtest key injection wakes a blocked getkey call', () async {
    final testConsole = Console();
    final key = testConsole.getkey();

    testConsole.injectKey('a');

    expect(await key, equals('a'));
  });

  test('headless playtest key injection is available to checkkey', () {
    final testConsole = Console();

    testConsole.injectKey('Enter');

    expect(testConsole.checkkey(), equals('Enter'));
  });

  test(
    'headless playtest key injection supports getKeyEvent screens',
    () async {
      final testConsole = Console();
      final key = testConsole.getKeyEvent();

      testConsole.injectKey(']');

      final event = await key;
      expect(keyEventToString(event), equals(']'));
    },
  );

  test(
    'headless playtest named browser keys normalize to console keys',
    () async {
      final testConsole = Console();
      final key = testConsole.getKeyEvent();

      testConsole.injectKey('ArrowLeft');

      final event = await key;
      expect(keyEventToString(event), equals('Left'));
    },
  );
}
