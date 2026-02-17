import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/utils/interface_options.dart';

void main() {
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
}
