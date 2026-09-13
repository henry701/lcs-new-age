import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/daily/activities/graffiti.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/weapon.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/title_screen/world.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    makeWorld();
    await LcsI18n.initialize('pt_BR');
    erase();
    move(0, 0);
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test(
    'Portuguese graffiti pickup localizes the safehouse and article',
    () async {
      final base = sites.firstWhere(
        (site) => site.type == SiteType.homelessEncampment,
      );
      final liberal = Creature()
        ..name = 'Wally Rexford'
        ..align = Alignment.liberal
        ..base = base
        ..location = base
        ..rawSkill[Skill.art] = 30
        ..rawSkill[Skill.streetSmarts] = 30;
      final sprayPaint = Weapon('WEAPON_SPRAYCAN');
      base.loot.add(sprayPaint);
      pool.add(liberal);
      console.injectKey('Enter');
      console.injectKey('Enter');
      reseedRNG(seed: 1);

      await doActivityGraffiti([liberal]);

      expect(
        _consoleLine(8).trim(),
        'Wally Rexford pegou uma Tinta spray no Acampamento sem-teto.',
      );
    },
  );
}
