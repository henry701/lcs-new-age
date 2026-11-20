import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/basemode/base_mode.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/name.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/elections.dart';
import 'package:lcs_new_age/politics/politics.dart';
import 'package:lcs_new_age/saveload/save_load.dart';
import 'package:lcs_new_age/title_screen/world.dart';

import '../test_support.dart';

void main() {
  setUpAll(ensureGameDataLoaded);
  late Site safehouse;
  late Creature former;

  setUp(() async {
    await LcsI18n.initialize('en_US');
    gameState = GameState();
    makeWorld();
    for (final site in sites) {
      if (site.controller == SiteController.lcs) {
        site.controller = SiteController.unaligned;
      }
    }
    safehouse = sites.firstWhere((s) => s.type == SiteType.warehouse)
      ..controller = SiteController.lcs;
    politics.execName[Exec.president] = FullName(
      'Cliff',
      'X',
      'Schuster',
      Gender.male,
    );
    former = uniqueCreatures.president
      ..align = Alignment.liberal
      ..sleeperAgent = true
      ..activity = Activity(ActivityType.sleeperLiberal)
      ..base = sites.firstWhere((s) => s.type == SiteType.whiteHouse);
    pool.add(former);
  });

  test(
    'election retires the former sleeper without changing the winner',
    () async {
      politics.execTerm = 2;
      cantSeeReason = CantSeeReason.other;
      await presidentialElection();
      final winner = politics.execName[Exec.president]!.firstLast;
      expect(winner, isNot(former.properName));
      expect(former.sleeperAgent, isFalse);
      expect(former.activity.type, ActivityType.none);
      expect(former.base, safehouse);
      expect(former.location, safehouse);
      expect(uniqueCreatures.president.properName, winner);
      expect(politics.execName[Exec.president]!.firstLast, winner);
    },
  );

  test('loading repairs a previously replaced president and is idempotent', () {
    politics.execName[Exec.president] = FullName(
      'Louis',
      'Ernst',
      'Sanders',
      Gender.male,
    );
    final data =
        jsonDecode(jsonEncode(gameState.toJson())) as Map<String, dynamic>;
    (data['uniqueCreatures'] as Map<String, dynamic>)['_president'] = null;
    gameState = GameState.fromJson(data);
    applyBugFixes('1.5.0');
    final recovered = pool.single;
    expect(recovered.properName, 'Cliff Schuster');
    expect(recovered.sleeperAgent, isFalse);
    expect(recovered.activity.type, ActivityType.none);
    expect(recovered.base?.controller, SiteController.lcs);
    expect(politics.execName[Exec.president]!.firstLast, 'Louis Sanders');
    applyBugFixes('1.5.0');
    expect(pool.single.sleeperAgent, isFalse);
    expect(politics.execName[Exec.president]!.firstLast, 'Louis Sanders');
  });

  test('loading preserves the sitting president sleeper', () {
    final data =
        jsonDecode(jsonEncode(gameState.toJson())) as Map<String, dynamic>;
    gameState = GameState.fromJson(data);
    applyBugFixes('1.5.0');
    expect(pool.single.sleeperAgent, isTrue);
    expect(uniqueCreatures.president.id, pool.single.id);
  });

  test('election also retires an uncached president sleeper', () async {
    final data =
        jsonDecode(jsonEncode(gameState.toJson())) as Map<String, dynamic>;
    (data['uniqueCreatures'] as Map<String, dynamic>)['_president'] = null;
    gameState = GameState.fromJson(data);
    politics.execTerm = 2;
    cantSeeReason = CantSeeReason.other;
    await presidentialElection();
    expect(pool.single.sleeperAgent, isFalse);
    expect(pool.single.base?.controller, SiteController.lcs);
    expect(
      uniqueCreatures.president.properName,
      politics.execName[Exec.president]!.firstLast,
    );
  });

  test('a former president in prison is not teleported on load', () {
    final prison = sites.firstWhere((s) => s.type == SiteType.prison);
    former.location = prison;
    politics.execName[Exec.president] = FullName(
      'Louis',
      'Ernst',
      'Sanders',
      Gender.male,
    );
    uniqueCreatures.reconcileFormerPresidentSleepers();
    expect(former.sleeperAgent, isFalse);
    expect(former.location, prison);
    expect(former.imprisoned, isTrue);
    expect(former.base, safehouse);
  });

  test('no available safehouse does not remove the former president', () {
    safehouse.controller = SiteController.unaligned;
    final city = former.location!.city;
    politics.execName[Exec.president] = FullName(
      'Louis',
      'Ernst',
      'Sanders',
      Gender.male,
    );
    uniqueCreatures.reconcileFormerPresidentSleepers();
    expect(pool.single, former);
    expect(former.sleeperAgent, isFalse);
    expect(former.base, isNull);
    expect(former.location, city);
  });

  test(
    'the sitting president joining the LCS promotes exactly the vice president',
    () {
      politics.execName[Exec.vicePresident] = FullName(
        'Vice',
        'X',
        'Person',
        Gender.male,
      );
      former.sleeperAgent = false;
      expect(politics.execName[Exec.president]!.firstLast, 'Vice Person');
      expect(uniqueCreatures.president.properName, 'Vice Person');
      expect(former.sleeperAgent, isFalse);
    },
  );
}
