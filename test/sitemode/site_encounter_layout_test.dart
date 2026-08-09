import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/sitemode/site_display.dart';

import '../test_support.dart';

String _consoleCells(int y, int start, int end) => console.buffer[y]
    .sublist(start, end)
    .map((character) => character.glyph)
    .join();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    mode = GameMode.site;
    await LcsI18n.initialize('pt_BR');
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese encounter status stays out of the map preview', () {
    final observer = Creature()
      ..align = Alignment.liberal
      ..rawAttributes[Attribute.intelligence] = 10;
    pool.add(observer);

    encounter.add(
      Creature.fromId(CreatureTypeIds.swat, align: Alignment.conservative),
    );
    const mapSentinel = 'MAP PREVIEW';
    mvaddstr(12, 55, mapSentinel, noTranslate: true);

    printEncounter();

    expect(_consoleCells(12, 55, 55 + mapSentinel.length), mapSentinel);
    expect(_consoleCells(12, 49, 55).length, lessThanOrEqualTo(6));
    expect(console.buffer.every((row) => row.length == 80), isTrue);
  });
}
