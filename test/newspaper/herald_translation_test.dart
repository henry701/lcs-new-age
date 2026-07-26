import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/catalog_audit.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/newspaper/display_news.dart';
import 'package:lcs_new_age/newspaper/layout.dart';
import 'package:lcs_new_age/newspaper/major_event.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/politics/views.dart';
import 'package:lcs_new_age/saveload/load_cpc_images.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(loadCpcGraphics);

  setUp(() async {
    gameState = GameState()..date = DateTime(2023, DateTime.january, 3);
    await LcsI18n.initialize('pt_BR');
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Herald navigation and subscription chrome fit the console', () {
    final story = NewsStory()
      ..publication = Publication.herald
      ..page = 1;

    preparePage(story, false);

    expect(
      _consoleLine(0),
      equals(
        '  EUA  POLÍTICA  NEGÓCIOS  MUNDO  COMIDA  ESTILO DE VIDA'
        '       3 de jan de 2023',
      ),
    );
    expect(_consoleLine(1), endsWith('ASSINE \$3/SEM'));
    expect(_consoleLine(2), endsWith('PARA ACESSO COMPLETO'));
    expect(_consoleLine(3), endsWith('EDIÇÃO DIGITAL'));
    expect(console.buffer.every((line) => line.length == 80), isTrue);
  });

  test('pollution subheadline is localized before newspaper rendering', () {
    final story = NewsStory()..publication = Publication.herald;
    final content = generateMajorEventContent(View.pollution, true, story);

    expect(
      content.subheadline,
      equals('O Rio Cuyahoga está em chamas com o aumento da poluição.'),
    );

    mvaddstrCenter(12, content.subheadline!, noTranslate: true);
    expect(
      _consoleLine(12),
      equals(
        '           O Rio Cuyahoga está em chamas com o aumento da poluição.',
      ),
    );
  });

  test('long Portuguese major-event headlines stay inside the console', () {
    final story = NewsStory()..publication = Publication.herald;

    expect(
      () => displayCenteredNewsFont('MASS SHOOTING', 5, story),
      returnsNormally,
    );
    expect(console.buffer.every((line) => line.length == 80), isTrue);
  });

  test('very long translated headlines are clipped before centering', () {
    final story = NewsStory()..publication = Publication.herald;

    expect(() => displayCenteredNewsFont('A' * 200, 5, story), returnsNormally);
    expect(
      newsFontTextWidth(
        fitNewsTextToWidth('A' * 200, letters3x5, 78),
        letters3x5,
      ),
      lessThanOrEqualTo(78),
    );
    expect(console.buffer.every((line) => line.length == 80), isTrue);
  });

  test('Portuguese major-event story with a long headline renders safely', () {
    final story = NewsStory.unpublished(NewsStories.majorEvent)
      ..publication = Publication.herald
      ..view = View.gunControl;

    expect(
      () => displayMajorEventStory(
        story,
        List<int>.filled(25, 1),
        List<int>.filled(25, 78),
      ),
      returnsNormally,
    );
    expect(console.buffer.every((line) => line.length == 80), isTrue);
  });

  test('Portuguese gun-control story translates the shooter pronoun', () {
    final story = NewsStory.unpublished(NewsStories.majorEvent)
      ..publication = Publication.herald
      ..view = View.gunControl;
    final content = generateMajorEventContent(View.gunControl, false, story);

    expect(content.storyText, isNot(contains('he pudesse')));
    expect(content.storyText, contains('ele pudesse'));
  });

  test('Herald and pollution localization units have catalog coverage', () {
    final english = loadLocaleStringEntries('en_US');
    final portuguese = loadLocaleStringEntries('pt_BR');
    const expected = {
      'The Herald': 'O Arauto',
      'SUBSCRIBE {price} WEEKLY': 'ASSINE {price}/SEM',
      'mass shooting': 'tiroteio em massa',
      'university': 'universidade',
      'The Cuyahoga River is ablaze as pollution increases.':
          'O Rio Cuyahoga está em chamas com o aumento da poluição.',
    };

    for (final entry in expected.entries) {
      expect(english, contains(entry.key));
      expect(portuguese[entry.key], equals(entry.value));
    }
  });

  test(
    'extractor sees Herald and pollution localization units',
    () async {
      final result = await Process.run('dart', [
        'run',
        'scripts/find_translatable_strings.dart',
        '--print-only',
        '--glob=newspaper/layout.dart',
        '--glob=newspaper/major_event.dart',
      ]);

      expect(result.exitCode, 0, reason: result.stderr.toString());
      final output = result.stdout.toString();
      expect(output, contains('"The Herald"'));
      expect(output, contains('"SUBSCRIBE {price} WEEKLY"'));
      expect(
        output,
        contains('"The Cuyahoga River is ablaze as pollution increases."'),
      );
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}
