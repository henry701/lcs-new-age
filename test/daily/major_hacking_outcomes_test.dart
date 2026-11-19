import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/daily/activities/hacking.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/loot_type.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

import '../test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    await LcsI18n.initialize('en_US');
    console.injectedKeys.clear();
    console.lastKey = null;
    erase();
  });

  tearDown(() {
    console.injectedKeys.clear();
    console.lastKey = null;
    LcsI18n.reset();
    erase();
  });

  test(
    'major hacks can recover judge files alongside other major outcomes',
    () async {
      final city = City('Seattle, WA', 'SEA', '');
      gameState.cities = [city];
      final district = city.addDistrict('District', 'District');
      final site = Site(SiteType.warehouse, city, district);
      district.sites.add(site);
      final hacker = Creature()
        ..name = 'Alex'
        ..location = site
        ..rawSkill[Skill.computers] = 100;
      final messages = <String>[];

      for (var seed = 0; seed < 128; seed++) {
        nextRngSeed = seed;
        console.injectKey(' ');
        await doActivityHacking([hacker]);
        messages.add(console.buffer[8].map((cell) => cell.glyph).join().trim());
      }

      final types = site.loot.map((item) => item.typeName).toSet();
      expect(
        types,
        containsAll([
          LootTypeIds.corpFiles,
          LootTypeIds.cableNewsFiles,
          LootTypeIds.amRadioFiles,
          LootTypeIds.researchFiles,
          LootTypeIds.judgeFiles,
        ]),
      );
      expect(messages.any((m) => m.contains('CIA network')), isTrue);
      expect(messages.any((m) => m.contains('genetics research')), isTrue);
      expect(messages.any((m) => m.contains('military networks')), isTrue);
    },
  );
}
