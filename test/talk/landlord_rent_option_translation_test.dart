import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/clothing.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/talk/talk_outside_combat.dart';

import '../test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(ensureGameDataLoaded);

  setUp(() {
    gameState = GameState();
    console.injectedKeys.clear();
    console.lastKey = null;
    erase();
  });

  tearDown(() {
    activeSite = null;
    console.injectedKeys.clear();
    console.lastKey = null;
    LcsI18n.reset();
    erase();
  });

  Future<String> renderOption({
    required String locale,
    required SiteController controller,
    required bool naked,
  }) async {
    await LcsI18n.initialize(locale);
    activeSite = Site(SiteType.tenement)..controller = controller;
    final speaker = Creature()..name = 'Alex';
    if (!naked) speaker.equippedClothing = Clothing('CLOTHING_CLOTHES');
    final landlord = Creature.fromId(CreatureTypeIds.landlord);
    console.injectKey('c');
    await talkOutsideCombat(speaker, landlord);
    return console.buffer[14].map((character) => character.glyph).join().trim();
  }

  for (final locale in ['pt_BR', 'en_US']) {
    for (final naked in [false, true]) {
      for (final controller in [SiteController.unaligned, SiteController.lcs]) {
        test('$locale landlord option: $controller, naked=$naked', () async {
          final expected = switch ((locale, controller, naked)) {
            ('pt_BR', SiteController.unaligned, false) =>
              'D - Alugue um quarto.',
            ('pt_BR', SiteController.unaligned, true) =>
              'D - Alugue um quarto enquanto está nu.',
            ('pt_BR', SiteController.lcs, false) =>
              'D - Pare de alugar um quarto.',
            ('pt_BR', SiteController.lcs, true) =>
              'D - Pare de alugar um quarto enquanto está nu.',
            ('en_US', SiteController.unaligned, false) => 'D - Rent a room.',
            ('en_US', SiteController.unaligned, true) =>
              'D - Rent a room while naked.',
            ('en_US', SiteController.lcs, false) => 'D - Stop renting a room.',
            ('en_US', SiteController.lcs, true) =>
              'D - Stop renting a room while naked.',
            _ => throw StateError('Unexpected test case'),
          };
          expect(
            await renderOption(
              locale: locale,
              controller: controller,
              naked: naked,
            ),
            expected,
          );
        });
      }
    }
  }
}
