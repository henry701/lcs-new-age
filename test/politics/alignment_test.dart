import 'package:flutter/material.dart' hide Alignment;
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/utils/colors.dart';

void main() {
  group('Alignment Enum', () {
    test('Alignment values are correct', () {
      expect(Alignment.values.length, equals(3));
      expect(Alignment.values, contains(Alignment.liberal));
      expect(Alignment.values, contains(Alignment.moderate));
      expect(Alignment.values, contains(Alignment.conservative));
    });

    test('Alignment.liberal has correct properties', () {
      expect(Alignment.liberal.color, equals(lightGreen));
      expect(Alignment.liberal.colorKey, equals(ColorKey.lightGreen));
      expect(Alignment.liberal.label, equals('liberal'));
      expect(Alignment.liberal.ism, equals('Liberalism'));
    });

    test('Alignment.moderate has correct properties', () {
      expect(Alignment.moderate.color, equals(yellow));
      expect(Alignment.moderate.colorKey, equals(ColorKey.yellow));
      expect(Alignment.moderate.label, equals('moderate'));
      expect(Alignment.moderate.ism, equals('moderation'));
    });

    test('Alignment.conservative has correct properties', () {
      expect(Alignment.conservative.color, equals(red));
      expect(Alignment.conservative.colorKey, equals(ColorKey.red));
      expect(Alignment.conservative.label, equals('conservative'));
      expect(Alignment.conservative.ism, equals('Conservatism'));
    });
  });

  group('DeepAlignment Enum', () {
    test('DeepAlignment values are in correct order', () {
      expect(DeepAlignment.values.length, equals(5));
      expect(DeepAlignment.values[0], equals(DeepAlignment.archConservative));
      expect(DeepAlignment.values[1], equals(DeepAlignment.conservative));
      expect(DeepAlignment.values[2], equals(DeepAlignment.moderate));
      expect(DeepAlignment.values[3], equals(DeepAlignment.liberal));
      expect(DeepAlignment.values[4], equals(DeepAlignment.eliteLiberal));
    });

    test('DeepAlignment.archConservative has correct properties', () {
      expect(DeepAlignment.archConservative.color, equals(red));
      expect(DeepAlignment.archConservative.colorKey, equals(ColorKey.red));
      expect(DeepAlignment.archConservative.label, equals('Arch Conservative'));
      expect(DeepAlignment.archConservative.short, equals('Con+'));
      expect(DeepAlignment.archConservative.veryShort, equals('C+'));
      expect(
        DeepAlignment.archConservative.shallow,
        equals(Alignment.conservative),
      );
    });

    test('DeepAlignment.conservative has correct properties', () {
      expect(DeepAlignment.conservative.color, equals(purple));
      expect(DeepAlignment.conservative.colorKey, equals(ColorKey.purple));
      expect(DeepAlignment.conservative.label, equals('Conservative'));
      expect(DeepAlignment.conservative.short, equals('Con'));
      expect(DeepAlignment.conservative.veryShort, equals('C '));
      expect(
        DeepAlignment.conservative.shallow,
        equals(Alignment.conservative),
      );
    });

    test('DeepAlignment.moderate has correct properties', () {
      expect(DeepAlignment.moderate.color, equals(yellow));
      expect(DeepAlignment.moderate.colorKey, equals(ColorKey.yellow));
      expect(DeepAlignment.moderate.label, equals('moderate'));
      expect(DeepAlignment.moderate.short, equals('mod'));
      expect(DeepAlignment.moderate.veryShort, equals('m '));
      expect(DeepAlignment.moderate.shallow, equals(Alignment.moderate));
    });

    test('DeepAlignment.liberal has correct properties', () {
      expect(DeepAlignment.liberal.color, equals(lightBlue));
      expect(DeepAlignment.liberal.colorKey, equals(ColorKey.lightBlue));
      expect(DeepAlignment.liberal.label, equals('Liberal'));
      expect(DeepAlignment.liberal.short, equals('Lib'));
      expect(DeepAlignment.liberal.veryShort, equals('L '));
      expect(DeepAlignment.liberal.shallow, equals(Alignment.liberal));
    });

    test('DeepAlignment.eliteLiberal has correct properties', () {
      expect(DeepAlignment.eliteLiberal.color, equals(lightGreen));
      expect(DeepAlignment.eliteLiberal.colorKey, equals(ColorKey.lightGreen));
      expect(DeepAlignment.eliteLiberal.label, equals('Elite Liberal'));
      expect(DeepAlignment.eliteLiberal.short, equals('Lib+'));
      expect(DeepAlignment.eliteLiberal.veryShort, equals('L+'));
      expect(DeepAlignment.eliteLiberal.shallow, equals(Alignment.liberal));
    });
  });

  group('DeepAlignment Comparison Operators', () {
    test('greater than operator works correctly', () {
      expect(DeepAlignment.liberal > DeepAlignment.conservative, isTrue);
      expect(DeepAlignment.conservative > DeepAlignment.liberal, isFalse);
      expect(DeepAlignment.moderate > DeepAlignment.moderate, isFalse);
      expect(
        DeepAlignment.eliteLiberal > DeepAlignment.archConservative,
        isTrue,
      );
    });

    test('less than operator works correctly', () {
      expect(DeepAlignment.conservative < DeepAlignment.liberal, isTrue);
      expect(DeepAlignment.liberal < DeepAlignment.conservative, isFalse);
      expect(DeepAlignment.moderate < DeepAlignment.moderate, isFalse);
      expect(
        DeepAlignment.archConservative < DeepAlignment.eliteLiberal,
        isTrue,
      );
    });

    test('greater than or equal operator works correctly', () {
      expect(DeepAlignment.liberal >= DeepAlignment.conservative, isTrue);
      expect(DeepAlignment.liberal >= DeepAlignment.liberal, isTrue);
      expect(DeepAlignment.conservative >= DeepAlignment.liberal, isFalse);
    });

    test('less than or equal operator works correctly', () {
      expect(DeepAlignment.conservative <= DeepAlignment.liberal, isTrue);
      expect(DeepAlignment.conservative <= DeepAlignment.conservative, isTrue);
      expect(DeepAlignment.liberal <= DeepAlignment.conservative, isFalse);
    });

    test('compareTo works correctly', () {
      expect(
        DeepAlignment.liberal.compareTo(DeepAlignment.conservative),
        greaterThan(0),
      );
      expect(
        DeepAlignment.conservative.compareTo(DeepAlignment.liberal),
        lessThan(0),
      );
      expect(
        DeepAlignment.moderate.compareTo(DeepAlignment.moderate),
        equals(0),
      );
    });

    test('shallow conversion works for all values', () {
      expect(
        DeepAlignment.archConservative.shallow,
        equals(Alignment.conservative),
      );
      expect(
        DeepAlignment.conservative.shallow,
        equals(Alignment.conservative),
      );
      expect(DeepAlignment.moderate.shallow, equals(Alignment.moderate));
      expect(DeepAlignment.liberal.shallow, equals(Alignment.liberal));
      expect(DeepAlignment.eliteLiberal.shallow, equals(Alignment.liberal));
    });
  });

  group('Alignment Consistency', () {
    test('all DeepAlignment colors match their colorKeys', () {
      for (final alignment in DeepAlignment.values) {
        final expectedColor = colorMap[alignment.colorKey];
        expect(
          alignment.color,
          equals(expectedColor),
          reason: '${alignment.name} color should match its colorKey',
        );
      }
    });

    test('all Alignment colors match their colorKeys', () {
      for (final alignment in Alignment.values) {
        final expectedColor = colorMap[alignment.colorKey];
        expect(
          alignment.color,
          equals(expectedColor),
          reason: '${alignment.name} color should match its colorKey',
        );
      }
    });

    test('shallow mapping is consistent', () {
      final archConShallow = DeepAlignment.archConservative.shallow;
      final conShallow = DeepAlignment.conservative.shallow;
      expect(archConShallow, equals(conShallow));
      expect(archConShallow, equals(Alignment.conservative));

      final libShallow = DeepAlignment.liberal.shallow;
      final eliteLibShallow = DeepAlignment.eliteLiberal.shallow;
      expect(libShallow, equals(eliteLibShallow));
      expect(libShallow, equals(Alignment.liberal));
    });
  });
}
