import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

void main() {
  group('lcsRandom', () {
    setUp(() {
      reseedRNG(seed: 42);
    });

    test('returns 0 when max is 0', () {
      expect(lcsRandom(0), equals(0));
    });

    test('returns positive values within range for positive max', () {
      for (int i = 0; i < 100; i++) {
        final result = lcsRandom(10);
        expect(result, inInclusiveRange(0, 9));
      }
    });

    test('returns negative values for negative max', () {
      reseedRNG(seed: 123);
      final result = lcsRandom(-5);
      expect(result, lessThanOrEqualTo(0));
      expect(result, greaterThanOrEqualTo(-4));
    });

    test('handles edge cases', () {
      reseedRNG(seed: 1);
      expect(lcsRandom(1), inInclusiveRange(0, 0));
      expect(lcsRandom(2), inInclusiveRange(0, 1));
    });
  });

  group('oneIn', () {
    setUp(() {
      reseedRNG(seed: 42);
    });

    test('oneIn returns correct probability behavior', () {
      int hits = 0;
      const trials = 10000;
      reseedRNG(seed: 42);
      for (int i = 0; i < trials; i++) {
        if (oneIn(10)) hits++;
      }
      final ratio = hits / trials;
      expect(ratio, closeTo(0.1, 0.05));
    });
  });

  group('lcsRandomDouble', () {
    setUp(() {
      reseedRNG(seed: 42);
    });

    test('returns 0 when max is 0', () {
      expect(lcsRandomDouble(0), equals(0.0));
    });

    test('returns positive values in range for positive max', () {
      for (int i = 0; i < 100; i++) {
        final result = lcsRandomDouble(10);
        expect(result, inInclusiveRange(0.0, 9.999999999999998));
      }
    });

    test('returns positive values in range for negative max', () {
      double? result;
      for (int i = 0; i < 10; i++) {
        result = lcsRandomDouble(-5);
        if (result > 0) break;
      }
      expect(result, greaterThan(0.0));
    });
  });

  group('rollInterval', () {
    setUp(() {
      reseedRNG(seed: 42);
    });

    test('returns value within inclusive range', () {
      for (int i = 0; i < 100; i++) {
        final result = rollInterval(5, 10);
        expect(result, inInclusiveRange(5, 10));
      }
    });

    test('handles single-element range', () {
      for (int i = 0; i < 100; i++) {
        expect(rollInterval(7, 7), equals(7));
      }
    });
  });

  group('rollIntervalDouble', () {
    setUp(() {
      reseedRNG(seed: 42);
    });

    test('returns value within inclusive range', () {
      for (int i = 0; i < 100; i++) {
        final result = rollIntervalDouble(1.5, 3.5);
        expect(result, inInclusiveRange(1.5, 3.5));
      }
    });
  });

  group('extension RollInterval', () {
    setUp(() {
      reseedRNG(seed: 42);
    });

    test('roll works on int tuple', () {
      final tuple = (5, 10);
      final result = tuple.roll();
      expect(result, inInclusiveRange(5, 10));
    });

    test('rollDouble works on double tuple', () {
      final tuple = (3.0, 7.0);
      final result = tuple.roll();
      expect(result, inInclusiveRange(3.0, 7.0));
    });
  });

  group('Iterable random extension', () {
    setUp(() {
      reseedRNG(seed: 42);
    });

    test('random returns element within iterable', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.random;
      expect(list, contains(result));
    });

    test('randomOrNull returns null for empty iterable', () {
      final emptyList = <int>[];
      expect(emptyList.randomOrNull, isNull);
    });

    test('randomOrNull returns element for non-empty iterable', () {
      final list = [1, 2, 3];
      final result = list.randomOrNull;
      expect(list, contains(result));
    });

    test('randomWhere returns matching element', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.randomWhere((e) => e > 3);
      expect(result, greaterThan(3));
    });
  });

  group('List random extension', () {
    setUp(() {
      reseedRNG(seed: 42);
    });

    test('random returns element within list', () {
      final list = [1, 2, 3, 4, 5];
      final result = list.random;
      expect(list, contains(result));
    });

    test('randomOrNull returns null for empty list', () {
      final emptyList = <int>[];
      expect(emptyList.randomOrNull, isNull);
    });

    test('randomPop removes and returns element', () {
      final list = [1, 2, 3, 4, 5];
      final initialLength = list.length;
      final result = list.randomPop();
      expect(list.length, equals(initialLength - 1));
      expect(1, lessThanOrEqualTo(result));
      expect(5, greaterThanOrEqualTo(result));
    });

    test('randomSeeded returns deterministic result based on seed', () {
      final list = [1, 2, 3, 4, 5];
      final result1 = list.randomSeeded(100);
      final result2 = list.randomSeeded(100);
      final result3 = list.randomSeeded(200);
      expect(result1, equals(result2));
      expect(result1, isNot(equals(result3)));
    });
  });

  group('lcsRandomWeighted', () {
    setUp(() {
      reseedRNG(seed: 42);
    });

    test('returns key from map based on weight', () {
      final weights = {'a': 90.0, 'b': 10.0};
      int aCount = 0;
      const trials = 1000;
      for (int i = 0; i < trials; i++) {
        if (lcsRandomWeighted(weights) == 'a') aCount++;
      }
      expect(aCount / trials, closeTo(0.9, 0.1));
    });

    test('returns first key when sum is zero', () {
      final weights = <String, num>{};
      expect(() => lcsRandomWeighted(weights), throwsA(anything));
    });

    test('handles single element map', () {
      final weights = {'only': 1.0};
      expect(lcsRandomWeighted(weights), equals('only'));
    });

    test('handles integer weights', () {
      final weights = {'a': 1, 'b': 1};
      final result = lcsRandomWeighted(weights);
      expect(['a', 'b'], contains(result));
    });
  });

  group('reseedRNG', () {
    test('produces deterministic sequence after reseed', () {
      reseedRNG(seed: 100);
      final first = lcsRandom(100);
      reseedRNG(seed: 100);
      final second = lcsRandom(100);
      expect(first, equals(second));
    });
  });
}
