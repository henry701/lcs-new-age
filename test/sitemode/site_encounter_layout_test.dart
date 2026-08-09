import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/clothing.dart';
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

  test('Portuguese fleeing SWAT names preserve the acronym', () {
    final fleeing =
        Creature.fromId(CreatureTypeIds.swat, align: Alignment.conservative)
          ..blood = 0
          ..juice = 0
          ..nonCombatant = true;
    encounter.add(fleeing);

    printEncounter();

    expect(_consoleCells(12, 2, 19).trim(), equals('policial da SWAT'));
    expect(_consoleCells(12, 2, 19), isNot(contains('swat')));
  });

  test('Portuguese medical debt roles use localized encounter labels', () {
    final roleIds = [
      (CreatureTypeIds.actuary, 'Atuário'),
      (CreatureTypeIds.cpa, 'CPA'),
      (CreatureTypeIds.claimsAdjuster, 'Regulador de S'),
      (CreatureTypeIds.auditor, 'Auditor'),
      (CreatureTypeIds.officeWorker, 'Trabalhador de E'),
    ];
    for (final (id, _) in roleIds) {
      final role = Creature.fromId(id, align: Alignment.conservative)
        ..blood = 10000
        ..juice = 10000
        ..nonCombatant = false;
      encounter.add(role);
      expect(role.name, role.type.name);
    }

    printEncounter();

    for (var i = 0; i < roleIds.length; i++) {
      expect(
        _consoleCells(12 + i, 2, 19).trimRight(),
        startsWith(roleIds[i].$2),
      );
    }
  });

  test('Portuguese encounter health cells mark armor without clipping', () {
    final observer = Creature()
      ..align = Alignment.liberal
      ..rawAttributes[Attribute.intelligence] = 12;
    pool.add(observer);

    encounter.add(
      Creature.fromId(CreatureTypeIds.swat, align: Alignment.conservative)
        ..equippedClothing = Clothing('CLOTHING_SWATARMOR'),
    );

    printEncounter();

    final status = _consoleCells(12, 49, 55);
    expect(status, contains('+'));
    expect(status, isNot(contains('…')));
  });

  test('dead encounter rows do not expose negative health values', () {
    final dead = Creature.fromId(
      CreatureTypeIds.swat,
      align: Alignment.conservative,
    )
      ..alive = false
      ..blood = -400
      ..equippedClothing = Clothing('CLOTHING_SWATARMOR');
    encounter.add(dead);

    printEncounter();

    expect(_consoleCells(12, 2, 19).trim(), isEmpty);
    expect(_consoleCells(12, 49, 55).trim(), isEmpty);
    expect(
      console.buffer.map((row) => row.map((cell) => cell.glyph).join()).join(),
      isNot(contains('-400')),
    );
  });
}
