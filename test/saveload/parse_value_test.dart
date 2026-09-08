import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/saveload/parse_value.dart';

void main() {
  group('parseBool', () {
    test('parses canonical boolean values', () {
      expect(parseBool('true'), isTrue);
      expect(parseBool('false'), isFalse);
    });

    test('accepts numeric 1/0 fallback', () {
      expect(parseBool('1'), isTrue);
      expect(parseBool('0'), isFalse);
    });

    test('returns null for unsupported values', () {
      expect(parseBool('yes'), isNull);
      expect(parseBool('2'), isNull);
      expect(parseBool(''), isNull);
    });
  });

  group('parseRange', () {
    test('parses explicit min-max ranges', () {
      expect(parseRange('3-7'), equals((3, 7)));
    });

    test('uses single value for both bounds when max is omitted', () {
      expect(parseRange('5'), equals((5, 5)));
      expect(parseRange('5-'), equals((5, 5)));
    });

    test('returns null when min cannot be parsed', () {
      expect(parseRange('-7'), isNull);
      expect(parseRange('abc-7'), isNull);
    });
  });

  group('parseAlignment', () {
    test('parses short alignment tokens', () {
      expect(parseAlignment('L+'), equals(DeepAlignment.eliteLiberal));
      expect(parseAlignment('l'), equals(DeepAlignment.liberal));
      expect(parseAlignment('M'), equals(DeepAlignment.moderate));
      expect(parseAlignment('c'), equals(DeepAlignment.conservative));
      expect(parseAlignment('C+'), equals(DeepAlignment.archConservative));
    });

    test('parses full alignment labels case-insensitively', () {
      expect(
        parseAlignment('Elite Liberal'),
        equals(DeepAlignment.eliteLiberal),
      );
      expect(parseAlignment('LIBERAL'), equals(DeepAlignment.liberal));
      expect(parseAlignment('moderate'), equals(DeepAlignment.moderate));
      expect(
        parseAlignment('Conservative'),
        equals(DeepAlignment.conservative),
      );
      expect(
        parseAlignment('ARCH CONSERVATIVE'),
        equals(DeepAlignment.archConservative),
      );
    });

    test('returns null for unknown alignments', () {
      expect(parseAlignment('centrist'), isNull);
      expect(parseAlignment(''), isNull);
    });
  });
}
