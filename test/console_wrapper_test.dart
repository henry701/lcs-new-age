import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/console.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

String getConsoleLine(int y) {
  return console.buffer[y].map((ch) => ch.glyph).join().trimRight();
}

void resetConsole() {
  erase();
  move(0, 0);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Console Wrapper Tests - Params Support', () {
    setUp(() async {
      await LcsI18n.initialize('en_US');
      resetConsole();
    });

    tearDown(() async {
      LcsI18n.reset();
    });

    test('addstr with params formats string', () {
      expect(() {
        addstr('You hit the {target}!', params: {'target': 'Conservative'});
      }, returnsNormally);
    });

    test('addstr with count formats string', () {
      expect(() {
        addstr('You have {count} items.', params: {'count': 5});
      }, returnsNormally);
    });

    test('addstr without params works', () {
      expect(() {
        addstr('Press any key to continue.');
      }, returnsNormally);
    });

    test('mvaddstr with params formats string', () {
      expect(() {
        mvaddstr(5, 10, '{name} has been rescued.', params: {'name': 'Jane'});
      }, returnsNormally);
    });

    test('mvaddstr without params works', () {
      expect(() {
        mvaddstr(10, 1, 'Game Over');
      }, returnsNormally);
    });

    test('addstr format actually translates correctly in English', () async {
      resetConsole();
      await LcsI18n.initialize('en_US');
      addstr('You hit the {target}!', params: {'target': 'Conservative'});
      expect(getConsoleLine(0), equals('You hit the Conservative!'));
    });

    test('addstr format actually translates correctly in Portuguese', () async {
      resetConsole();
      await LcsI18n.initialize('pt_BR');
      // Values like creature types may need translation at call site
      final target = LcsI18n.tr('Conservative');
      addstr('You hit the {target}!', params: {'target': target});
      expect(getConsoleLine(0), equals('Você acertou o Conservador!'));
    });

    test(
      'addstr format falls back to English template when not translated in Portuguese',
      () async {
        LcsI18n.reset();
        resetConsole();
        await LcsI18n.initialize('pt_BR');
        addstr('You hit {target}!', params: {'target': 'Conservative'});
        expect(getConsoleLine(0), equals('You hit Conservative!'));
      },
    );

    test(
      'addstr format falls back to English template for untranslated string in Portuguese',
      () async {
        resetConsole();
        await LcsI18n.initialize('pt_BR');
        addstr('You hit {target}!', params: {'target': 'goblin'});
        expect(getConsoleLine(0), equals('You hit goblin!'));
      },
    );

    test(
      'menu options are properly translated through addOptionText',
      () async {
        resetConsole();
        await LcsI18n.initialize('pt_BR');

        // Test that menu options go through translation
        addOptionText(0, 0, "O", "O - Gameplay Options");

        // The translated text should appear on screen
        final line = getConsoleLine(0);
        expect(line, contains('Opções de Jogo')); // Portuguese translation
      },
    );

    test('mvaddstrRight uses visible width when markup is present', () {
      resetConsole();
      mvaddstrRight(0, 'Alert&w', noTranslate: true);
      final rawLine = console.buffer[0].map((ch) => ch.glyph).join();
      expect(rawLine.indexOf('A'), equals(CONSOLE_WIDTH - 'Alert'.length));
    });

    test('addOptionText ignores empty rendered labels safely', () {
      expect(() {
        addOptionText(0, 0, 'X', '', noTranslate: true);
      }, returnsNormally);
    });

    test('addstr with noTranslate and params replaces placeholders', () async {
      resetConsole();
      await LcsI18n.initialize('en_US');
      addstr(
        '{name} has {count} health.',
        params: {'name': 'Jane', 'count': 100},
        noTranslate: true,
      );
      expect(getConsoleLine(0), equals('Jane has 100 health.'));
    });

    test('addstr with multiple params formats correctly', () async {
      resetConsole();
      await LcsI18n.initialize('en_US');
      addstr(
        '{attacker} hits {target} for {damage} damage!',
        params: {'attacker': 'Liberal', 'target': 'Conservative', 'damage': 25},
      );
      expect(
        getConsoleLine(0),
        equals('Liberal hits Conservative for 25 damage!'),
      );
    });

    test(
      'addstr unified path handles both translation and params together',
      () async {
        resetConsole();
        await LcsI18n.initialize('pt_BR');
        // "You hit the {target}!" translates to "Você acertou o {target}!"
        addstr('You hit the {target}!', params: {'target': 'Inimigo'});
        expect(getConsoleLine(0), equals('Você acertou o Inimigo!'));
      },
    );
  });
}
