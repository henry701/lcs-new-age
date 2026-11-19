import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/sitemode/map_specials.dart';
import 'package:lcs_new_age/sitemode/sitemap.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

import '../test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    mode = GameMode.site;
    final city = City('Seattle, WA', 'SEA', '');
    gameState.cities = [city];
    final district = city.addDistrict('District', 'District');
    final site = Site(SiteType.nursingHome, city, district);
    district.sites.add(site);
    activeSite = site;
    final team = Squad();
    squads.add(team);
    activeSquad = team;
    locx = 35;
    locy = 10;
    locz = 0;
    siteAlarm = false;
    await LcsI18n.initialize('en_US');
    console.injectedKeys.clear();
    erase();
  });

  tearDown(() {
    console.injectedKeys.clear();
    console.lastKey = null;
    LcsI18n.reset();
    erase();
  });

  Creature member(String name, int level) {
    final person = Creature()..name = name;
    for (final skill in Skill.values) {
      person.rawSkill[skill] = level;
    }
    pool.add(person);
    return person;
  }

  Future<String> visitPatient({int seed = 7}) async {
    nextRngSeed = seed;
    currentTile.special = TileSpecial.nursingHomePatient;
    console
      ..injectKey(' ')
      ..injectKey(' ');
    await specialNursingHomePatient();
    return console.buffer
        .map((row) => row.map((cell) => cell.glyph).join())
        .join('\n');
  }

  test('the better skilled squad member helps regardless of order', () async {
    final novice = member('Novice', 0);
    final expert = member('Expert', 5);
    for (final members in [
      [novice, expert],
      [expert, novice],
    ]) {
      activeSquad!.members
        ..clear()
        ..addAll(members);
      erase();
      final result = await visitPatient();
      expect(result, contains('Expert'));
      expect(result, isNot(contains('Novice')));
    }
  });

  test('equal skills retain the first squad member as helper', () async {
    final first = member('First', 5);
    final second = member('Second', 5);
    activeSquad!.members.addAll([first, second]);
    final result = await visitPatient();
    expect(result, contains('First'));
    expect(result, isNot(contains('Second')));
  });

  test('a deceased squad member cannot be selected as helper', () async {
    final deceased = member('Deceased', 8)..alive = false;
    final living = member('Living', 0);
    activeSquad!.members.addAll([deceased, living]);
    final result = await visitPatient();
    expect(result, contains('Living'));
    expect(result, isNot(contains('Deceased')));
  });

  test('the relevant skill determines which specialist helps', () async {
    final psychologist = member('Psychologist', 0)
      ..rawSkill[Skill.psychology] = 8
      ..rawSkill[Skill.firstAid] = 1;
    final medic = member('Medic', 0)
      ..rawSkill[Skill.psychology] = 1
      ..rawSkill[Skill.firstAid] = 8;
    activeSquad!.members.addAll([psychologist, medic]);
    var psychologyObserved = false;
    var firstAidObserved = false;

    for (var seed = 0; seed < 64; seed++) {
      erase();
      final result = await visitPatient(seed: seed);
      if (result.contains('is lonely and feels isolated here') ||
          result.contains('is glad to have a visitor')) {
        psychologyObserved = true;
        expect(result, contains('Psychologist'));
        expect(result, isNot(contains('Medic')));
      } else if (result.contains('has been lying in the same position') ||
          result.contains("says the pills don't look right") ||
          result.contains('has been left in soiled clothing')) {
        firstAidObserved = true;
        expect(result, contains('Medic'));
        expect(result, isNot(contains('Psychologist')));
      }
    }

    expect(psychologyObserved, isTrue);
    expect(firstAidObserved, isTrue);
  });
}
