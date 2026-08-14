import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

const _affectedMessages = [
  'The Conservative scum block the door.',
  'The squad sprays Liberal Graffiti!',
  'The squad has found a Desert Eagle.',
  r'This guy sure had a lot of $100 bills.',
  'The squad Liberates some expensive jewelry.',
  'There are some drugs here.',
  'These documents show serious tax evasion.',
  "Wow, it's empty.  That sucks.",
  'Jackpot! The squad found an M250 Machine Gun!',
  'The squad finds some M7 Assault Rifles.',
  'The squad finds some M4 Carbines.',
  'The squad finds some body armor.',
  "It's a trap!  The armory is empty.",
  'The guards are coming!',
  'The Squad has found some very interesting files.',
  "The President isn't here...",
  'The President is in the Oval Office.',
  "Cool boss arena. It's empty at the moment.",
  'The CCS leader is ready for you!',
  'The CCS leader is here.',
  'The squad picks up an item from the safehouse.',
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('affected site specials have canonical Portuguese catalog entries', () {
    for (final source in _affectedMessages) {
      expect(LcsI18n.hasTranslation(source), isTrue, reason: source);
      final translated = LcsI18n.tr(source);
      expect(translated, isNot(equals(source)), reason: source);
      expect(
        translated.length,
        lessThanOrEqualTo(console.width),
        reason: source,
      );
    }
  });

  test('Oval Office quote variants are translated and preserve width', () {
    const quoteVariants = [
      '"You got brass fucking balls, I\'ll give you that."',
      '"You\'re a brave fucking girl, I\'ll give you that."',
    ];

    for (final quote in quoteVariants) {
      final translated = LcsI18n.tr(quote);
      expect(LcsI18n.hasTranslation(quote), isTrue, reason: quote);
      expect(translated, isNot(equals(quote)), reason: quote);
      expect(
        translated.length,
        lessThanOrEqualTo(console.width),
        reason: quote,
      );
    }
  });

  test(
    'map-special source retains the encounter wrapper for every affected key',
    () {
      final source = File(
        'lib/sitemode/map_specials.dart',
      ).readAsStringSync().replaceAll(r'\$', r'$');
      for (final key in _affectedMessages) {
        expect(source, contains('encounterMessage("$key"'), reason: key);
      }
    },
  );
}
