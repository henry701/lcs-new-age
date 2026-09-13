import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/talk/talk_in_combat.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    await LcsI18n.initialize('pt_BR');
    console.injectedKeys.clear();
    console.lastKey = null;
    console.flush = () {};
    erase();
  });

  tearDown(() {
    console.injectedKeys.clear();
    console.lastKey = null;
    console.flush = () {};
    LcsI18n.reset();
    erase();
  });

  test('Portuguese bluff result clears the preceding talk header', () async {
    final liberal = Creature()
      ..name = 'Alex'
      ..align = Alignment.liberal;
    final target = Creature.fromId(CreatureTypeIds.policeChief)
      ..name = 'Delegada'
      ..isWillingToTalk = true;
    final testSquad = Squad.temporary()..members.add(liberal);

    gameState.lcs.squads.add(testSquad);
    activeSquad = testSquad;
    String? bluffLine;
    console.flush = () {
      final line = _consoleLine(9);
      if (line.contains('A situação')) bluffLine = line;
    };
    console
      ..injectKey('c')
      ..injectKey('Enter')
      ..injectKey('Enter');

    await talkInCombat(liberal, target);

    expect(bluffLine, equals(' "A situação está sob controle."'));
    expect(bluffLine, isNot(contains('Delegada')));
  });

  test(
    'Portuguese combat talk header localizes generated target names',
    () async {
      final liberal = Creature()
        ..name = 'Alex'
        ..align = Alignment.liberal;
      final target = Creature.fromId(CreatureTypeIds.swat)
        ..name = 'SWAT Officer'
        ..align = Alignment.conservative;
      final testSquad = Squad.temporary()..members.add(liberal);

      gameState.lcs.squads.add(testSquad);
      activeSquad = testSquad;
      String? headerLine;
      console.flush = () {
        final line = _consoleLine(9);
        if (line.contains('fala com')) headerLine = line;
      };
      console.injectKey('e');

      await talkInCombat(liberal, target);

      expect(headerLine, contains('fala com Policial da SWAT:'));
    },
  );
}
