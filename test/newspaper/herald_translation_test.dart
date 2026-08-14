import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/name_lists.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/catalog_audit.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/newspaper/display_news.dart';
import 'package:lcs_new_age/newspaper/layout.dart';
import 'package:lcs_new_age/newspaper/major_event.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/laws.dart';
import 'package:lcs_new_age/politics/views.dart';
import 'package:lcs_new_age/saveload/load_cpc_images.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

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
    expect(_consoleLine(1), endsWith('ASSINE US\$ 3/SEM'));
    expect(_consoleLine(2), endsWith('PARA ACESSO COMPLETO'));
    expect(_consoleLine(3), endsWith('EDIÇÃO DIGITAL'));
    expect(console.buffer.every((line) => line.length == 80), isTrue);
  });

  test('Cable News header reserves space for the Portuguese date', () {
    final story = NewsStory()
      ..publication = Publication.cableNews
      ..page = 1;
    gameState.date = DateTime(2023, DateTime.january, 7);

    preparePage(story, false);

    final line = _consoleLine(0);
    expect(line, contains('DINHEIRO'));
    expect(line, contains('7 de jan de 2023'));
    expect(line, isNot(contains('DINHEIRO7')));
    expect(console.buffer.every((row) => row.length == 80), isTrue);
  });

  test('translated right-hand newspaper mastheads fit their fixed cells', () {
    conservativeStarTop();

    expect(_consoleLine(2).substring(68), equals('NÓS CONHECE…'));
    expect(_consoleLine(2).length, equals(80));

    erase();
    thePostTop();

    expect(_consoleLine(2).substring(61), equals('NOSSO PRÊMIO PULIT…'));
    expect(_consoleLine(2).length, equals(80));
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

  test('article impact labels use localized political issue names', () {
    expect(LcsI18n.tr(View.gunControl.label), equals('Controle de Armas'));
    expect(LcsI18n.tr(View.deathPenalty.label), equals('Pena de Morte'));
    expect(LcsI18n.tr(View.housing.label), equals('Moradia'));
    expect(
      LcsI18n.tr(View.womensRights.label),
      equals('Direitos das Mulheres'),
    );
    expect(LcsI18n.tr(View.taxes.label), equals('Impostos'));
    expect(LcsI18n.tr(View.drugs.label), equals('Drogas'));
    expect(LcsI18n.tr(View.ceoSalary.label), equals('Desigualdade de Renda'));
  });

  test('Portuguese police-behavior headlines preserve their tone', () {
    expect(LcsI18n.tr('BASTARDS'), equals('CANALHAS'));
    expect(LcsI18n.tr('[JERKS]'), equals('[BABACAS]'));

    final story = NewsStory.unpublished(NewsStories.majorEvent)
      ..publication = Publication.herald;
    final content = generateMajorEventContent(
      View.policeBehavior,
      false,
      story,
    );
    expect(['CANALHAS', '[BABACAS]'], contains(LcsI18n.tr(content.headline)));
  });

  test('Justice Amok uses a grammatical Portuguese possessive clause', () {
    const template =
        r'''{city} - The conviction of confessed serial killer {serialKiller} was overturned by a federal judge yesterday.  Judge {judge} of the notoriously liberal court of appeals here made the decision based on {judgePossessive} {judgeReason}, despite the confession of {serialKillerLast}, which even Judge {judgeLast} grants was not coerced in any way.&r  Ten years ago, {serialKillerLast} was convicted of the now-infamous {slayingName} slayings.  After an intensive manhunt, {serialKillerLast} was found with the murder weapon covered in the victims' blood.  {serialKillerLast} confessed and was sentenced to life, saying "Thank you for saving me from myself.  If I were to be released, I would surely kill again."&r  A spokesperson for the district attorney has stated that the case will not be retried, due to the current economic doldrums that have left the state completely strapped for cash.&r''';
    final translatedTemplate = LcsI18n.tr(template);
    final rendered = LcsI18n.processString(translatedTemplate, {
      'judgePossessive': 'dele',
      'judgeReason':
          'crença de que os crimes foram uma vasta conspiração de direita',
    }, noTranslate: true);

    expect(rendered, contains('na opinião dele'));
    expect(rendered, isNot(contains('dele crença')));
  });

  test(
    'generated country titles use Portuguese names in military articles',
    () {
      for (final title in countryTitles) {
        expect(LcsI18n.tr(title), isNot(equals(title)));
      }

      final story = NewsStory.unpublished(NewsStories.majorEvent)
        ..publication = Publication.herald
        ..view = View.military;
      for (var i = 0; i < 30; i++) {
        final content = generateMajorEventContent(View.military, false, story);
        expect(content.storyText, isNot(contains('Islands')));
      }
    },
  );

  test('military hostage incidents compose translated fragments', () {
    expect(
      translateMilitaryIncident(
        'somehow managed to shoot every one of the hostages and none of the '
        'captors during a hostage rescue mission',
      ),
      'de alguma forma conseguiu atirar em todos os reféns e em nenhum dos '
      'captores durante uma missão de resgate de reféns',
    );
  });

  test(
    'abortion article call to action uses the complete Portuguese phrase',
    () {
      laws[Law.abortion] = DeepAlignment.moderate;
      final story = NewsStory.unpublished(NewsStories.majorEvent)
        ..publication = Publication.herald
        ..view = View.womensRights;

      final content = generateMajorEventContent(
        View.womensRights,
        false,
        story,
      );

      expect(content.storyText, contains('aprovar novas leis'));
      expect(content.storyText, isNot(contains('pass new laws')));
    },
  );

  test('drug-study article uses grammatical Portuguese composition', () {
    expect(LcsI18n.tr('legalizing'), equals('a legalização de '));
    expect(LcsI18n.tr('decriminalizing'), equals('a descriminalização de '));
    expect(LcsI18n.tr('subsidizing'), equals('o subsídio de '));
    expect(LcsI18n.tr('building parks'), equals('construir parques'));
    expect(LcsI18n.tr('supporting the arts'), equals('apoiar as artes'));
    expect(LcsI18n.tr(View.drugs.label), equals('Drogas'));
  });

  test(
    'Portuguese retirement stories keep generated organizations neutral',
    () {
      reseedRNG(seed: 20260813);
      for (var i = 0; i < 200; i++) {
        final story = NewsStory.unpublished(NewsStories.majorEvent)
          ..publication = Publication.herald
          ..view = View.retirement;
        final text = generateMajorEventContent(
          View.retirement,
          false,
          story,
        ).storyText!;

        expect(text, contains('porta-voz da organização '));
        expect(text, isNot(contains('porta-voz do ')));
        expect(text, isNot(contains('Parceria Unido')));
        expect(text, isNot(contains('a spokesperson for the')));
      }
    },
  );

  test(
    'pollution think-tank prose uses a neutral Portuguese organization name',
    () {
      for (var i = 0; i < 30; i++) {
        final story = NewsStory.unpublished(NewsStories.majorEvent)
          ..publication = Publication.herald;
        final content = generateMajorEventContent(View.pollution, false, story);
        expect(content.storyText, contains('A organização '));
        expect(content.storyText, isNot(contains('O Família')));
      }
    },
  );

  test('Portuguese FM obscenity stories avoid a repeated radio label', () {
    reseedRNG(seed: 20260814);
    final story = NewsStory.unpublished(NewsStories.majorEvent)
      ..publication = Publication.herald
      ..view = View.amRadio;

    final content = generateMajorEventContent(View.amRadio, false, story);

    expect(content.storyText, isNot(contains('radialista de rádio FM')));
    expect(content.storyText, contains('radialista de uma rádio FM'));
    expect(content.storyText, isNot(contains('Infamous FM radio shock jock')));
  });

  test('major-event filler starts after a paragraph separator', () {
    final story = NewsStory.unpublished(NewsStories.majorEvent)
      ..publication = Publication.herald
      ..view = View.housing
      ..liberalSpin = false;
    displayMajorEventStory(
      story,
      List<int>.filled(25, 1),
      List<int>.filled(25, 78),
    );

    expect(story.body, contains('\n\n'));
    expect(story.body, isNot(matches(RegExp(r'casas\.[A-Z]'))));
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

  test('long Portuguese picture captions render safely', () {
    final story = NewsStory.unpublished(NewsStories.majorEvent)
      ..publication = Publication.herald
      ..view = View.sweatshops
      ..liberalSpin = true;

    expect(
      () => displayMajorEventStory(
        story,
        List<int>.filled(25, 1),
        List<int>.filled(25, 78),
      ),
      returnsNormally,
    );
    expect(console.buffer.every((line) => line.length == 80), isTrue);
    expect(_consoleLine(12), contains('…'));
  });

  test('Portuguese gun-control story translates the shooter pronoun', () {
    final story = NewsStory.unpublished(NewsStories.majorEvent)
      ..publication = Publication.herald
      ..view = View.gunControl;
    final content = generateMajorEventContent(View.gunControl, false, story);

    expect(content.storyText, isNot(contains('he pudesse')));
    expect(content.storyText, contains('ele pudesse'));
  });

  test('Portuguese gun-control stories contract school articles by type', () {
    reseedRNG(seed: 20260812);
    const schoolPhrases = [
      'na escola primária',
      'na escola fundamental',
      'no ensino médio',
      'na universidade',
    ];
    final seen = <String>{};
    for (var i = 0; i < 500; i++) {
      final story = NewsStory.unpublished(NewsStories.majorEvent)
        ..publication = Publication.herald
        ..view = View.gunControl;
      final text = generateMajorEventContent(
        View.gunControl,
        true,
        story,
      ).storyText!;

      expect(text, isNot(contains('já tinha matou')));
      expect(text, isNot(contains('em escola ')));
      expect(text, isNot(contains('em ensino ')));
      expect(text, isNot(contains('em universidade ')));
      for (final phrase in schoolPhrases) {
        if (text.contains('dois professores $phrase') &&
            text.contains('entrou $phrase')) {
          seen.add(phrase);
        }
      }
    }

    expect(seen, containsAll(schoolPhrases));
  });

  test('Portuguese civil-rights stories localize generated gender words', () {
    var sawWokeHire = false;
    for (var i = 0; i < 200; i++) {
      final story = NewsStory.unpublished(NewsStories.majorEvent)
        ..publication = Publication.herald;
      final content = generateMajorEventContent(View.civilRights, false, story);
      if (content.headline != 'WOKE HIRE') continue;
      sawWokeHire = true;
      expect(content.storyText, isNot(contains(' (man)')));
      expect(content.storyText, isNot(contains(' (woman)')));
      expect(content.storyText, isNot(contains(' (homem)')));
      expect(content.storyText, isNot(contains(' (mulher)')));
      expect(content.storyText, contains('uma pessoa negra'));
      expect(content.storyText, matches(RegExp(r'que é (homem|mulher)')));
      expect(content.storyText, isNot(contains('He probably')));
      expect(content.storyText, isNot(contains('She probably')));
      expect(content.storyText, isNot(contains('probably just')));
      expect(content.storyText, contains('provavelmente'));
    }
    expect(sawWokeHire, isTrue);
  });

  test(
    'Portuguese civil-rights articles keep branch-specific noun articles',
    () {
      MajorEventContent? jammedUpStory(Publication publication) {
        reseedRNG(seed: 20260815);
        for (var i = 0; i < 100; i++) {
          final story = NewsStory.unpublished(NewsStories.majorEvent)
            ..publication = publication;
          final content = generateMajorEventContent(
            View.civilRights,
            false,
            story,
          );
          if (content.headline == 'JAMMED UP') return content;
        }
        return null;
      }

      final neutral = jammedUpStory(Publication.herald);
      final archConservative = jammedUpStory(Publication.amRadio);

      expect(neutral, isNotNull);
      expect(archConservative, isNotNull);
      expect(
        neutral!.storyText,
        contains('Uma grande marcha pelos direitos civis bloqueou'),
      );
      expect(neutral.storyText, contains('Embora os manifestantes tenham'));
      expect(
        archConservative!.storyText,
        contains('Um monte de pessoas negras bloqueou'),
      );
      expect(
        archConservative.storyText,
        contains('Embora as pessoas negras tenham'),
      );
      expect(archConservative.storyText, isNot(contains('Uma um monte')));
      expect(archConservative.storyText, isNot(contains('os pessoas')));
    },
  );

  test(
    'Portuguese child-killing conditions agree with the feminine plural subject',
    () {
      expect(
        LcsI18n.tr('carved with satanic symbols'),
        equals('esculpidas com símbolos satânicos'),
      );
      expect(LcsI18n.tr('sexually mutilated'), equals('mutiladas sexualmente'));
    },
  );

  test('Portuguese sweatshop seasonal copy is translated', () {
    expect(
      LcsI18n.tr('Fall fashions hit the stores across the country.'),
      equals('A moda de outono chega às lojas de todo o país.'),
    );
    expect(
      LcsI18n.tr('Fall fashions are previewed in stores across the country.'),
      equals('A moda de outono é apresentada nas lojas de todo o país.'),
    );
  });

  test('Portuguese hostage templates translate role words and participles', () {
    expect(LcsI18n.tr('rapist'), equals('estuprador'));
    expect(LcsI18n.tr('himself'), equals('ele mesmo'));
    expect(LcsI18n.tr('herself'), equals('ela mesma'));
    expect(
      LcsI18n.translatePronoun('her', role: PronounRole.possessive),
      equals('dela'),
    );
    expect(
      LcsI18n.tr('slit the guard\'s throat with a shank'),
      equals('cortado a garganta do guarda com uma faca improvisada'),
    );
    final portuguese = loadLocaleStringEntries('pt_BR');
    final hostageTemplate = portuguese.entries
        .firstWhere(
          (entry) => entry.key.startsWith('{city} - The hostage crisis'),
        )
        .value;
    expect(hostageTemplate, contains('o {rapist} condenado {perpFullName}'));
    expect(hostageTemplate, contains('se barricou com o guarda'));
    expect(hostageTemplate, contains('{perpPronounSelf}'));
  });

  test('Portuguese drug-panic interpolation translates the intensity word', () {
    expect(LcsI18n.tr('hell'), equals('caramba'));
    expect(LcsI18n.tr('[heaven]'), equals('caramba'));
    final story = 'É engraçado pra ${LcsI18n.tr('hell')}.';
    expect(story, equals('É engraçado pra caramba.'));
    expect(story, isNot(contains('hell')));
  });

  test(
    'Portuguese drug-panic choices translate dynamic drugs and infinitives',
    () {
      const expectedDrugs = {
        'cocaine': 'cocaína',
        'heroin': 'heroína',
        'methamphetamine': 'metanfetamina',
        'fentanyl': 'fentanil',
      };

      for (final entry in expectedDrugs.entries) {
        expect(LcsI18n.tr(entry.key), equals(entry.value), reason: entry.key);
      }

      expect(LcsI18n.tr('instantly die'), equals('morrer instantaneamente'));
      expect(
        'vai ${LcsI18n.tr('instantly die')}.',
        equals('vai morrer instantaneamente.'),
      );
    },
  );

  test('Herald and pollution localization units have catalog coverage', () {
    final english = loadLocaleStringEntries('en_US');
    final portuguese = loadLocaleStringEntries('pt_BR');
    const expected = {
      'The Herald': 'O Arauto',
      'SUBSCRIBE {price} WEEKLY': 'ASSINE {price}/SEM',
      'mass shooting': 'tiroteio em massa',
      'killed {count} and wounded dozens more':
          'matado {count} e ferido dezenas de outras pessoas',
      'university': 'universidade',
      'The Cuyahoga River is ablaze as pollution increases.':
          'O Rio Cuyahoga está em chamas com o aumento da poluição.',
      'hell': 'caramba',
      '[heaven]': 'caramba',
      'it will be seeking the death penalty': 'buscará a pena de morte',
      'pass new laws to protect the most vulnerable children in our society from being slaughtered by Liberals':
          'aprovar novas leis para proteger as crianças mais vulneráveis da nossa sociedade de serem massacradas pelos Liberais',
      "Women's Rights": 'Direitos das Mulheres',
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
