import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/plan_site_visit.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/title_screen/world.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    LcsI18n.reset();
    gameState = GameState();
    await LcsI18n.initialize('pt_BR');
    makeWorld();
    erase();
    move(0, 0);
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test(
    'Portuguese destination rows keep safehouse status away from pressure stats',
    () async {
      final home = sites.firstWhere(
        (site) => site.type == SiteType.homelessEncampment,
      );
      final founder = Creature()
        ..align = Alignment.liberal
        ..name = 'Justin Arafata'
        ..type = creatureTypes[CreatureTypeIds.thief]!
        ..location = home;
      pool.add(founder);

      final founderSquad = Squad()..name = 'The Liberal Crime Squad';
      squads.add(founderSquad);
      founder.squad = founderSquad;
      activeSquad = founderSquad;
      activeSafehouse = home;

      final target =
          sites.firstWhere(
              (site) =>
                  site.type == SiteType.warehouse &&
                  site.district == home.district,
            )
            ..name = 'Fábrica de Brinquedos Assombrada'
            ..controller = SiteController.lcs
            ..heat = 0
            ..hidden = false;

      final district = target.district;
      final districtKey = String.fromCharCode(
        'a'.codeUnitAt(0) + district.city.districts.indexOf(district),
      );
      console.injectKey(districtKey);
      final route = planSiteVisit();

      for (
        var attempt = 0;
        attempt < 100 && !_consoleLine(10).contains('Fábrica');
        attempt++
      ) {
        await Future<void>.delayed(const Duration(milliseconds: 1));
      }

      final row =
          10 +
          (district.sites.where((site) => !site.hidden).toList()..sort(
                (a, b) => a.controller.index.compareTo(b.controller.index),
              ))
              .indexOf(target);
      final line = _consoleLine(row);
      final stats = line.substring(54);
      expect(stats, contains('Pressão:'));
      expect(stats, contains('Sigilo:'));
      expect(line, isNot(contains('EscondePressão')));
      expect(line.length, lessThanOrEqualTo(80));

      console.injectKey('Enter');
      await Future<void>.delayed(const Duration(milliseconds: 1));
      console.injectKey('Enter');
      await route;
    },
  );
}
