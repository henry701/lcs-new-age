import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/utils/game_options.dart';
import 'package:lcs_new_age/utils/interface_options.dart';

String getConsoleLine(int y) {
  return console.buffer[y].map((ch) => ch.glyph).join().trimRight();
}

void resetConsole() {
  erase();
  move(0, 0);
}

void main() {
  late String originalInterfacePgUp;

  setUp(() {
    originalInterfacePgUp = gameOptions.interfacePgUp;
    resetConsole();
  });

  tearDown(() {
    gameOptions.interfacePgUp = originalInterfacePgUp;
    resetConsole();
  });

  group('aOrAn', () {
    test('returns "an" for words starting with vowels', () {
      expect(aOrAn('apple'), equals('an'));
      expect(aOrAn('elephant'), equals('an'));
      expect(aOrAn('iguana'), equals('an'));
      expect(aOrAn('orange'), equals('an'));
      expect(aOrAn('umbrella'), equals('an'));
    });

    test('returns "a" for words starting with consonants', () {
      expect(aOrAn('banana'), equals('a'));
      expect(aOrAn('car'), equals('a'));
      expect(aOrAn('dog'), equals('a'));
      expect(aOrAn('fox'), equals('a'));
      expect(aOrAn('guitar'), equals('a'));
    });

    test('handles uppercase vowels correctly', () {
      expect(aOrAn('Apple'), equals('an'));
      expect(aOrAn('ELEPHANT'), equals('an'));
      expect(aOrAn('IgLoO'), equals('an'));
    });

    test('handles uppercase consonants correctly', () {
      expect(aOrAn('Banana'), equals('a'));
      expect(aOrAn('CAR'), equals('a'));
    });
  });

  group('isPageUp', () {
    test('returns true for page up keys', () {
      expect(isPageUp('['.codeUnitAt(0)), isTrue);
      expect(isPageUp(';'.codeUnitAt(0)), isTrue);
      expect(isPageUp(','.codeUnitAt(0)), isTrue);
    });

    test('returns false for non-page-up keys', () {
      expect(isPageUp(']'.codeUnitAt(0)), isFalse);
      expect(isPageUp('.'.codeUnitAt(0)), isFalse);
      expect(isPageUp('a'.codeUnitAt(0)), isFalse);
      expect(isPageUp('1'.codeUnitAt(0)), isFalse);
    });
  });

  group('isPageDown', () {
    test('returns true for page down keys', () {
      expect(isPageDown(']'.codeUnitAt(0)), isTrue);
      expect(isPageDown('.'.codeUnitAt(0)), isTrue);
    });

    test('returns false for non-page-down keys', () {
      expect(isPageDown('['.codeUnitAt(0)), isFalse);
      expect(isPageDown(';'.codeUnitAt(0)), isFalse);
      expect(isPageDown(','.codeUnitAt(0)), isFalse);
      expect(isPageDown('a'.codeUnitAt(0)), isFalse);
    });
  });

  group('isBackKey', () {
    test('returns true for back keys', () {
      expect(isBackKey(Key.x), isTrue);
      expect(isBackKey(Key.enter), isTrue);
      expect(isBackKey(Key.escape), isTrue);
      expect(isBackKey(Key.space), isTrue);
    });

    test('returns false for non-back keys', () {
      expect(isBackKey(Key.a), isFalse);
      expect(isBackKey(Key.b), isFalse);
      expect(isBackKey(Key.upArrow), isFalse);
      expect(isBackKey(Key.downArrow), isFalse);
    });
  });

  group('page key mappings', () {
    test('maps bracket interface keys to bracket paging strings', () {
      gameOptions.interfacePgUp = '[';

      expect(interfacePgDown, equals(']'));
      expect(previousPageStr, equals('[ - Previous'));
      expect(nextPageStr, equals('] - Next'));
      expect(pageStr, equals('[] - View other Liberal pages'));
      expect(
        pageStrWithCurrentAndMax(2, 9),
        equals('[] - View other Liberal pages (2/9)'),
      );
      expect(
        pageStrWithCurrentAndMaxX(2, 9),
        equals('&B[]&x - View other Liberal pages (2/9)'),
      );
    });

    test('maps semicolon interface keys to semicolon paging strings', () {
      gameOptions.interfacePgUp = ';';

      expect(interfacePgDown, equals('.'));
      expect(previousPageStr, equals('; - Previous'));
      expect(nextPageStr, equals('. - Next'));
      expect(pageStr, equals(';. - View other Liberal pages'));
      expect(
        pageStrWithCurrentAndMax(3, 7),
        equals(';. - View other Liberal pages (3/7)'),
      );
      expect(
        pageStrWithCurrentAndMaxX(3, 7),
        equals('&B;.&x - View other Liberal pages (3/7)'),
      );
    });

    test('maps comma interface keys to comma paging strings', () {
      gameOptions.interfacePgUp = ',';

      expect(interfacePgDown, equals('.'));
      expect(previousPageStr, equals(', - Previous'));
      expect(nextPageStr, equals('. - Next'));
      expect(pageStr, equals(',. - View other Liberal pages'));
      expect(
        pageStrWithCurrentAndMax(1, 4),
        equals(',. - View other Liberal pages (1/4)'),
      );
      expect(
        pageStrWithCurrentAndMaxX(1, 4),
        equals('&B,.&x - View other Liberal pages (1/4)'),
      );
    });

    test('falls back to PGUP/PGDN for unknown key layout', () {
      gameOptions.interfacePgUp = 'PGUP';

      expect(interfacePgDown, equals('PGDN'));
      expect(previousPageStr, equals('PGUP - Previous'));
      expect(nextPageStr, equals('PGDN - Next'));
      expect(pageStr, equals('PGUP/PGDN - View other Liberal pages'));
      expect(
        pageStrWithCurrentAndMax(5, 5),
        equals('PGUP/PGDN - View other Liberal pages (5/5)'),
      );
      expect(
        pageStrWithCurrentAndMaxX(5, 5),
        equals('&BPGUP/PGDN&x - View other Liberal pages (5/5)'),
      );
    });
  });

  group('addPageButtons', () {
    test(
      'uses current cursor when coordinates are omitted and renders short labels with counter',
      () {
        gameOptions.interfacePgUp = '[';
        move(4, 3);

        addPageButtons(current: 2, max: 5, short: true);

        final line = getConsoleLine(4);
        expect(line, contains('[ - Prev'));
        expect(line, contains('] - Next'));
        expect(line, contains('(2/5)'));
      },
    );

    test('renders long labels for fallback PGUP/PGDN layout', () {
      gameOptions.interfacePgUp = 'PGUP';

      addPageButtons(y: 6, x: 1);

      final line = getConsoleLine(6);
      expect(line, contains('PGUP - Previous Page'));
      expect(line, contains('PGDN - Next Page'));
      expect(line, isNot(contains('(')));
    });

    test('renders semicolon and comma layouts with period for next page', () {
      for (final layout in [';', ',']) {
        resetConsole();
        gameOptions.interfacePgUp = layout;

        addPageButtons(y: 2, x: 0);

        final line = getConsoleLine(2);
        expect(line, contains('$layout - Previous Page'));
        expect(line, contains('. - Next Page'));
      }
    });
  });

  group('addBackButton', () {
    test('uses current cursor and default text when arguments are omitted', () {
      move(8, 2);

      addBackButton();

      expect(getConsoleLine(8), contains('Enter - Back'));
    });

    test('uses explicit coordinates and custom text', () {
      addBackButton(y: 9, x: 1, text: 'Enter - Return');

      expect(getConsoleLine(9), contains('Enter - Return'));
    });
  });
}
