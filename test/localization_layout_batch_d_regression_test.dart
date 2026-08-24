import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/district.dart';
import 'package:lcs_new_age/location/location.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/newspaper/display_news.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/saveload/load_cpc_images.dart';

import 'test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);
  setUpAll(loadCpcGraphics);

  setUp(() async {
    LcsI18n.reset();
    erase();
    await LcsI18n.initialize('pt_BR');
    console.injectedKeys.clear();
  });

  tearDown(() {
    console.injectedKeys.clear();
    LcsI18n.reset();
    erase();
  });

  test('PT-443 hospital predicates agree across patient genders', () {
    final expectations = {
      Gender.male: ('transferido', 'queimado'),
      Gender.female: ('transferida', 'queimada'),
      Gender.nonbinary: ('transferide', 'queimade'),
    };

    for (final entry in expectations.entries) {
      final transferred = LcsI18n.processStringGendered(
        '{name} has been transferred to {hospital}.',
        {'name': 'Jamie Doe', 'hospital': 'Centro Médico UW'},
        gender: entry.key,
      );
      final burned = LcsI18n.processStringGendered('{name} is burned!', {
        'name': 'Jamie Doe',
      }, gender: entry.key);

      expect(transferred, contains(entry.value.$1), reason: transferred);
      expect(burned, contains(entry.value.$2), reason: burned);
      expect(transferred, isNot(contains('has been transferred')));
      expect(burned, isNot(contains('is burned')));
    }
  });

  test('PT-444 dating failures agree across rejected Liberal genders', () {
    const offline = [
      '{name} is publicly humiliated.',
      '{name} spends the night getting drunk alone.',
      '{name} gets chased out by an angry mob.',
    ];
    const online = [
      '{name} feels completely humiliated.',
      '{name} is quickly blocked.',
      '{name} sits in the dark feeling dumb.',
    ];
    final participles = {
      Gender.male: ('humilhado', 'embriagado'),
      Gender.female: ('humilhada', 'embriagada'),
      Gender.nonbinary: ('humilhade', 'embriagade'),
    };

    final blocking = {
      Gender.male: 'bloqueado',
      Gender.female: 'bloqueada',
      Gender.nonbinary: 'bloqueade',
    };
    final darkness = {
      Gender.male: 'sentado no escuro, sentindo-se burro',
      Gender.female: 'sentada no escuro, sentindo-se burra',
      Gender.nonbinary: 'sentade no escuro, sentindo-se burde',
    };
    final expulsions = {
      Gender.male: 'expulso',
      Gender.female: 'expulsa',
      Gender.nonbinary: 'expulse',
    };

    for (final entry in participles.entries) {
      for (final template in offline) {
        final rendered = LcsI18n.processStringGendered(template, {
          'name': 'Jamie Doe',
        }, gender: entry.key);
        if (template == offline.first) {
          expect(rendered, contains(entry.value.$1), reason: rendered);
        }
        if (template == offline[1]) {
          expect(rendered, contains(entry.value.$2), reason: rendered);
        }
      }

      final blocked = LcsI18n.processStringGendered(online[1], {
        'name': 'Jamie Doe',
      }, gender: entry.key);
      final dark = LcsI18n.processStringGendered(online.last, {
        'name': 'Jamie Doe',
      }, gender: entry.key);
      expect(blocked, contains(blocking[entry.key]), reason: blocked);
      expect(dark, contains(darkness[entry.key]), reason: dark);

      final chased = LcsI18n.processStringGendered(offline[2], {
        'name': 'Jamie Doe',
      }, gender: entry.key);
      expect(chased, contains(expulsions[entry.key]), reason: chased);
      expect(
        renderedLines(chased),
        everyElement(
          predicate<String>((line) => line.length <= 80, 'length <= 80'),
        ),
      );
    }
  });

  test('PT-445 dangerous-extremist rejection agrees with recruiter', () {
    final phrases = {
      Gender.male: 'um extremista perigoso',
      Gender.female: 'uma extremista perigosa',
      Gender.nonbinary: 'uma pessoa extremista perigosa',
    };
    for (final entry in phrases.entries) {
      final rendered = LcsI18n.processStringGendered(
        '{recruitName} thinks {pName} is dangerous extremist.',
        {'recruitName': 'Alex Roe', 'pName': 'Jamie Doe'},
        gender: entry.key,
      );
      expect(rendered, contains(entry.value), reason: rendered);
      expect(rendered.endsWith('.'), isTrue);
    }
  });

  test('PT-446 recruited profession keeps its gendered noun and article', () {
    final articles = {
      Gender.male: 'um novo Enfermeiro',
      Gender.female: 'uma nova Enfermeira',
      Gender.nonbinary: 'uma nova pessoa Enfermeire',
    };
    for (final entry in articles.entries) {
      final rendered = LcsI18n.processStringGendered(
        '{role} {name} has recruited a new {type}.',
        {
          'role': LcsI18n.trGendered('Sleeper', gender: entry.key),
          'name': 'Jamie Doe',
          'type': LcsI18n.trGendered('Nurse', gender: entry.key),
        },
        gender: entry.key,
      );
      expect(rendered, contains(entry.value), reason: rendered);
      expect(
        LcsI18n.trGendered('Nurse', gender: entry.key),
        contains('Enfermeir'),
      );
    }
  });

  test('PT-447 president cabinet reports are complete and gender aware', () {
    final adoption = _presidentRender(
      'News from our {gender} in the White House: Under '
      'intense pressure from the President, {position:color} '
      '{lastName:color} has agreed to adopt {alignment:color} '
      'policies.',
      Gender.female,
    );
    expect(adoption, startsWith('Notícias da nossa mulher na Casa Branca:'));
    expect(adoption, contains('concordou em adotar'));
    expect(adoption, contains('&RSecretário de Estado&w'));
    expect(adoption, contains('&RRoe&w'));
    expect(adoption, contains('&GLiberal de Elite&w políticas.'));

    final vicePresident = _presidentRender(
      'News from our {gender} in the White House: Under '
      'intense pressure from the President, '
      '{vicePresident:color} is resigning. The President already has '
      'a new second in mind: {newFirstLast:color} is expected to pass '
      'confirmation in both the House and the Senate.',
      Gender.female,
      vicePresident: true,
    );
    expect(vicePresident, contains('está renunciando'));
    expect(vicePresident, contains('A Presidente já tem'));
    expect(vicePresident, isNot(contains('is resigning')));
    expect(vicePresident, isNot(contains('confirmation in both')));

    final resignation = _presidentRender(
      'News from our {gender} in the White House: Under '
      'intense pressure from the President, {position:color} '
      '{oldLast:color} is resigning. The President already has a new '
      'cabinet member in mind: {newFirstLast:color} is expected to pass '
      'confirmation in the Senate.',
      Gender.nonbinary,
    );
    expect(resignation, startsWith('Notícias sobre a nossa'));
    expect(resignation, contains('renunciando'));
    expect(resignation, contains('A Presidência já tem'));

    final holdout = _presidentHoldout(Gender.female);
    expect(holdout, startsWith('Atualização da nossa mulher'));
    expect(holdout, contains('Apesar dos melhores esforços da Presidente'));
    expect(holdout, contains('continua resistindo'));
    expect(holdout, isNot(contains("President's best efforts")));

    for (final rendered in [adoption, vicePresident, resignation, holdout]) {
      expect(rendered.contains(RegExp(r'[,.] {2,}[^\s]')), isFalse);
      erase();
      addparagraph(6, 1, rendered, noTranslate: true);
      for (final line in console.buffer) {
        expect(
          strLenX(line.map((character) => character.glyph).join().trimRight()),
          lessThanOrEqualTo(console.width),
        );
      }
    }
  });

  test('PT-448 self-defense verdict agrees with defendant gender', () {
    final words = {
      Gender.male: 'culpado',
      Gender.female: 'culpada',
      Gender.nonbinary: 'culpade',
    };
    for (final entry in words.entries) {
      final rendered = LcsI18n.processStringGendered(
        '{name} just looks {pronoun} guilty.',
        {'name': 'Jamie Doe', 'pronoun': entry.key.himselfHerself},
        gender: entry.key,
      );
      expect(rendered, contains(entry.value), reason: rendered);
    }
  });

  testWidgets('PT-449 story datelines use localized city display names', (
    tester,
  ) async {
    final seattle = await _addStorySite('Seattle, WA');
    addTearDown(() => gameState.cities.remove(seattle.city));
    console.injectKey('Enter');

    final seattleStory = NewsStory.unpublished(NewsStories.squadEscapedSiege)
      ..publication = Publication.times
      ..publicationAlignment = DeepAlignment.moderate
      ..page = 1
      ..loc = seattle;

    expect(seattleStory.loc?.id, seattle.id);
    await displayStory(seattleStory, null);

    expect(seattleStory.body, startsWith('Seattle, Washington -'));
    expect(seattleStory.body, isNot(contains('Seattle, WA')));

    final losAngeles = await _addStorySite('Los Angeles, CA');
    addTearDown(() => gameState.cities.remove(losAngeles.city));
    console.injectKey('Enter');
    final losAngelesStory = NewsStory.unpublished(NewsStories.squadDefended)
      ..publication = Publication.times
      ..publicationAlignment = DeepAlignment.moderate
      ..page = 1
      ..loc = losAngeles;

    await displayStory(losAngelesStory, null);
    expect(losAngelesStory.body, startsWith('Los Angeles, Califórnia -'));
  });

  test('PT-450 workplace article uses business head, not surname', () {
    final city = City('Seattle, WA', 'SEA', 'Test city');
    gameState.cities.add(city);
    addTearDown(() => gameState.cities.remove(city));
    final district = District('Shopping', 'Shopping', city.id, area: 1);
    city.districts.add(district);
    final site = Site(SiteType.pawnShop, city, district)
      ..name = 'Mira — Casa de penhores e armas';

    expect(localizedAboutLocation(site), startsWith('o Mira —'));
    expect(
      localizedAboutLocation(_FeminineWorkLocation()),
      startsWith('a Loja'),
    );
  });

  test('PT-451 repeal amendment has plural and feminine agreement', () {
    final heading = LcsI18n.tr(
      'REPEAL THE CONSTITUTION.  The former United States are to be',
    );
    final reorganization = LcsI18n.tr(
      'reorganized into the CONFEDERATED STATES OF AMERICA, with new',
    );
    final posts = LcsI18n.tr(
      'they shall nominally hold these posts without end, and all',
    );
    final decisions = LcsI18n.tr(
      'actual decisions shall be made by business representatives,',
    );

    expect('$heading $reorganization', contains('reorganizados nos'));
    expect('$posts $decisions', contains('todas as decisões reais'));
    expect('$posts $decisions', isNot(contains('todos decisões')));
    expect('$posts $decisions', isNot(contains('todas as as decisões')));
    for (final row in [heading, reorganization, posts, decisions]) {
      expect(strLenX(row), lessThanOrEqualTo(console.width), reason: row);
      expect(row.contains(RegExp(r'[,.]{2,}')), isFalse);
    }
  });
}

String _presidentRender(
  String template,
  Gender gender, {
  bool vicePresident = false,
}) {
  return LcsI18n.processStringGendered(template, {
    'gender': _portuguesePerson(gender),
    if (vicePresident)
      'vicePresident': LcsI18n.processString('Vice President {last}', {
        'last': 'Roe',
      })
    else
      'position': LcsI18n.tr('Secretary of State'),
    'oldLast': 'Roe',
    'lastName': 'Roe',
    'newFirstLast': 'Alex Roe',
    'alignment': LcsI18n.tr('Elite Liberal'),
    'positionColor': 'R',
    'lastNameColor': 'R',
    'oldLastColor': 'R',
    'newFirstLastColor': 'R',
    'alignmentColor': 'G',
    'vicePresidentColor': 'R',
  }, gender: gender);
}

String _presidentHoldout(Gender gender) {
  return LcsI18n.processStringGendered(
    "Update from our {gender} in the White House: Despite the "
    "President's best efforts, {position:color} {last:color} continues "
    'to hold out against the internal push for more Liberal policies. '
    'The President is considering other options, but lacks the votes in '
    'Congress to confirm a more Liberal appointment.',
    {
      'gender': _portuguesePerson(gender),
      'position': LcsI18n.tr('Secretary of State'),
      'last': 'Roe',
      'positionColor': 'R',
      'lastColor': 'R',
    },
    gender: gender,
  );
}

String _portuguesePerson(Gender gender) => switch (gender.simplified) {
  Gender.male => LcsI18n.tr('man'),
  Gender.female => LcsI18n.tr('woman'),
  _ => 'pessoa não-binária',
};

Iterable<String> renderedLines(String value) =>
    value.split(RegExp(r'&r|\n')).map((line) => line.trim());

Future<Site> _addStorySite(String cityName) async {
  final city = City(
    cityName,
    cityName == 'Seattle, WA' ? 'SEA' : 'LA',
    'Test city',
  );
  gameState.cities.add(city);
  final district = District('Shopping', 'Shopping', city.id, area: 1);
  city.districts.add(district);
  final site = Site(SiteType.warehouse, city, district);
  district.sites.add(site);
  return site;
}

final class _FeminineWorkLocation extends _BaseWorkLocation {
  @override
  String get name => 'Loja Zhang';
}

abstract base class _BaseWorkLocation implements Location {
  @override
  set name(String value) {}
  @override
  int get area => 0;
  @override
  City get city => throw UnimplementedError();
  @override
  String get idString => 'test-location';
  @override
  void init() {}
  @override
  String getName({bool short = false, bool includeCity = false}) => name;
}
