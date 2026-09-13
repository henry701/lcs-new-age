import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

void main() {
  group('Gender Enum', () {
    test('Gender values have correct pronouns for nonbinary', () {
      expect(Gender.nonbinary.hisHer, equals('their'));
      expect(Gender.nonbinary.heShe, equals('they'));
      expect(Gender.nonbinary.himHer, equals('them'));
      expect(Gender.nonbinary.himselfHerself, equals('themselves'));
      expect(Gender.nonbinary.s, equals(''));
      expect(Gender.nonbinary.manWoman, equals('friend'));
    });

    test('Gender values have correct pronouns for male', () {
      expect(Gender.male.hisHer, equals('his'));
      expect(Gender.male.heShe, equals('he'));
      expect(Gender.male.himHer, equals('him'));
      expect(Gender.male.himselfHerself, equals('himself'));
      expect(Gender.male.s, equals('s'));
      expect(Gender.male.manWoman, equals('man'));
    });

    test('Gender values have correct pronouns for female', () {
      expect(Gender.female.hisHer, equals('her'));
      expect(Gender.female.heShe, equals('she'));
      expect(Gender.female.himHer, equals('her'));
      expect(Gender.female.himselfHerself, equals('herself'));
      expect(Gender.female.s, equals('s'));
      expect(Gender.female.manWoman, equals('woman'));
    });

    test('Gender values have correct pronouns for whiteMalePatriarch', () {
      expect(Gender.whiteMalePatriarch.hisHer, equals('his'));
      expect(Gender.whiteMalePatriarch.heShe, equals('he'));
      expect(Gender.whiteMalePatriarch.himHer, equals('him'));
      expect(Gender.whiteMalePatriarch.himselfHerself, equals('himself'));
      expect(Gender.whiteMalePatriarch.s, equals('s'));
      expect(Gender.whiteMalePatriarch.manWoman, equals('man'));
    });

    test('Gender values have correct pronouns for maleBias', () {
      expect(Gender.maleBias.hisHer, equals('his'));
      expect(Gender.maleBias.heShe, equals('he'));
      expect(Gender.maleBias.himHer, equals('him'));
      expect(Gender.maleBias.himselfHerself, equals('himself'));
      expect(Gender.maleBias.s, equals('s'));
      expect(Gender.maleBias.manWoman, equals('man'));
    });

    test('Gender values have correct pronouns for femaleBias', () {
      expect(Gender.femaleBias.hisHer, equals('her'));
      expect(Gender.femaleBias.heShe, equals('she'));
      expect(Gender.femaleBias.himHer, equals('she'));
      expect(Gender.femaleBias.himselfHerself, equals('herself'));
      expect(Gender.femaleBias.s, equals('s'));
      expect(Gender.femaleBias.manWoman, equals('woman'));
    });

    test('All Gender values have capitalized pronoun getters', () {
      for (final gender in Gender.values) {
        expect(gender.hisHerCap.isNotEmpty, isTrue);
        expect(gender.heSheCap.isNotEmpty, isTrue);
        expect(gender.hisHerCap[0], equals(gender.hisHer[0].toUpperCase()));
        expect(gender.heSheCap[0], equals(gender.heShe[0].toUpperCase()));
      }
    });
  });

  group('Gender simplified getter', () {
    test('nonbinary simplifies to nonbinary', () {
      expect(Gender.nonbinary.simplified, equals(Gender.nonbinary));
    });

    test('male simplifies to male', () {
      expect(Gender.male.simplified, equals(Gender.male));
    });

    test('female simplifies to female', () {
      expect(Gender.female.simplified, equals(Gender.female));
    });

    test('whiteMalePatriarch simplifies to male', () {
      expect(Gender.whiteMalePatriarch.simplified, equals(Gender.male));
    });

    test('maleBias simplifies to male', () {
      expect(Gender.maleBias.simplified, equals(Gender.male));
    });

    test('femaleBias simplifies to female', () {
      expect(Gender.femaleBias.simplified, equals(Gender.female));
    });
  });

  group('forceGenderBinary', () {
    setUp(() {
      reseedRNG(seed: 42);
    });

    test('returns male when given male', () {
      expect(forceGenderBinary(Gender.male), equals(Gender.male));
    });

    test('returns female when given female', () {
      expect(forceGenderBinary(Gender.female), equals(Gender.female));
    });

    test('returns male or female when given nonbinary (50/50 chance)', () {
      reseedRNG(seed: 1);
      final result1 = forceGenderBinary(Gender.nonbinary);
      expect([Gender.male, Gender.female], contains(result1));
    });

    test('returns male or female when given maleBias (75/25 chance)', () {
      int maleCount = 0;
      const trials = 1000;
      reseedRNG(seed: 42);
      for (int i = 0; i < trials; i++) {
        if (forceGenderBinary(Gender.maleBias) == Gender.male) {
          maleCount++;
        }
      }
      final ratio = maleCount / trials;
      expect(ratio, closeTo(0.75, 0.1));
    });

    test('returns male or female when given femaleBias (75/25 chance)', () {
      int femaleCount = 0;
      const trials = 1000;
      reseedRNG(seed: 42);
      for (int i = 0; i < trials; i++) {
        if (forceGenderBinary(Gender.femaleBias) == Gender.female) {
          femaleCount++;
        }
      }
      final ratio = femaleCount / trials;
      expect(ratio, closeTo(0.75, 0.1));
    });

    test('whiteMalePatriarch returns male', () {
      expect(forceGenderBinary(Gender.whiteMalePatriarch), equals(Gender.male));
    });
  });
}
