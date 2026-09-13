import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/media_overview.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/views.dart';
import 'package:lcs_new_age/title_screen/high_scores.dart';
import 'package:lcs_new_age/title_screen/title_screen.dart';

import 'test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

String _consoleCells(int y, int start, int end) => console.buffer[y]
    .sublist(start, end)
    .map((character) => character.glyph)
    .join();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    LcsI18n.reset();
    erase();
    move(0, 0);
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    console.injectedKeys.clear();
    LcsI18n.reset();
    erase();
  });

  test('carrying-hostage profile clause is fully Portuguese', () {
    final carrier = Creature.fromId(CreatureTypeIds.politicalActivist)
      ..align = Alignment.liberal
      ..name = 'Alex Roe';
    carrier.prisoner = Creature.fromId(CreatureTypeIds.cop)..name = 'Jamie Doe';

    printCreatureInfo(carrier, showCarPrefs: ShowCarPrefs.onFoot);

    final line = _consoleLine(1);
    expect(line, contains(', com Jamie Doe,'));
    expect(line, isNot(contains('holding')));
    expect(line.length, lessThanOrEqualTo(console.width));
  });

  test('ballot yes and no results contain only Portuguese qualifiers', () {
    final yes = LcsI18n.processString('Yes: {yesPercent}%', {
      'yesPercent': '50.0',
      'yes': 'Yes',
    });
    final no = LcsI18n.processString('No: {noPercent}%', {
      'noPercent': '49.9',
      'no': 'No',
    });

    expect(yes, equals('Sim: 50.0%'));
    expect(no, equals('Não: 49.9%'));
    expect(yes, isNot(contains('Yes')));
    expect(no, isNot(contains('No')));
  });

  test('trial self-defense reflexives localize for every gender', () {
    const template = '{name} just looks {pronoun} guilty.';
    final expectations = {
      Gender.male: 'ele mesmo',
      Gender.female: 'ela mesma',
      Gender.nonbinary: 'elu mesme',
    };

    for (final entry in expectations.entries) {
      final verdict = LcsI18n.processString(template, {
        'name': 'Alex Roe',
        'pronoun': entry.key.himselfHerself,
      });

      expect(
        verdict,
        equals('Alex Roe parece culpado até para ${entry.value}.'),
      );
      expect(verdict, isNot(contains(entry.key.himselfHerself)));
    }
  });

  test('all dating vacation options retain their closing punctuation', () {
    final options = <String, Map<String, dynamic>>{
      'C - Spend a week and {price} on a cheap vacation '
          '(stands up other dates).': {
        'price': '1000',
      },
      'C - Spend {price} to visit {firstName} for a week '
          '(stands up other dates).': {
        'price': '1000',
        'firstName': 'Jamie Doe',
      },
      'C - Spend a week and {price} on a cheap vacation '
          '(must be uninjured).': {
        'price': '1000',
      },
    };
    var index = 0;
    for (final entry in options.entries) {
      final y = 13 + index++;
      addOptionTextFitted(
        y,
        0,
        'C',
        entry.key,
        console.width,
        params: entry.value,
      );
      final line = _consoleLine(y);

      expect(line, endsWith('.'));
      expect(line, startsWith('C - '));
      expect(line.length, lessThanOrEqualTo(80));
    }
  });

  test(
    'media article impact cells stay separated within the console',
    () async {
      final story = NewsStory()
        ..publication = Publication.times
        ..body = 'Corpo de teste.'
        ..effects.addAll({
          View.freeSpeech: -12.4,
          View.policeBehavior: -23.9,
          View.lcsKnown: 3.5,
        });

      console.injectKey('Enter');
      await readNewsStory(story);

      final impacts = _consoleLine(4);
      final remainder = _consoleLine(5);
      expect(impacts, startsWith('Liberdade de Expressão:  -12.4%'));
      expect(impacts, contains('Comportamento Policial:  -23.9%'));
      expect(remainder, equals('Conhecimento do LCS:  +3.5%'));
      expect(impacts, isNot(contains('Expressão: -Comportamento')));
      expect(impacts.length, lessThanOrEqualTo(console.width));
      expect(remainder.length, lessThanOrEqualTo(console.width));
    },
  );

  test('five-digit universal title counts preserve the right frame', () {
    final highScores = HighScores()
      ..universalLosses = 10000
      ..universalVictories = 10000;
    titleScreenFrame(bottom: 23);
    titleScreenScores(highScores, startY: 17);

    expect(
      _consoleCells(18, 43, 78).trim(),
      equals('Americanos Perdidos: 10000'),
    );
    expect(
      _consoleCells(19, 43, 78).trim(),
      equals('Americanos Salvos: 10000'),
    );
    expect(_consoleCells(18, 78, 80), equals('  '));
    expect(_consoleCells(19, 78, 80), equals('  '));
    expect(_consoleLine(18).length, lessThanOrEqualTo(80));
    expect(_consoleLine(19).length, lessThanOrEqualTo(80));
  });
}
