import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/daily/shopsnstuff.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/title_screen/world.dart';

import '../test_support.dart';

String _consoleCells(int y, int start, int end) => console.buffer[y]
    .sublist(start, end)
    .map((character) => character.glyph)
    .join();

KeyDownEvent get _enterKey => const KeyDownEvent(
  physicalKey: PhysicalKeyboardKey.enter,
  logicalKey: LogicalKeyboardKey.enter,
  timeStamp: Duration.zero,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    await LcsI18n.initialize('pt_BR');
    makeWorld();
    erase();
    move(0, 0);
  });

  tearDown(() {
    console.flush = () {};
    LcsI18n.reset();
    erase();
  });

  test('Portuguese car-dealer status actions stay in separate cells', () async {
    final liberal = Creature()..name = 'Joana';
    pool.add(liberal);
    final customers = Squad()..members.add(liberal);
    squads.add(customers);
    activeSquad = customers;
    activeSquadMemberIndex = -1;
    final dealershipSite = sites.firstWhere(
      (site) => site.type == SiteType.carDealership,
    );

    console.keyEvent(_enterKey);
    await dealership(dealershipSite);

    final left = _consoleCells(15, 1, 40);
    final right = _consoleCells(15, 40, 80);
    expect(left, contains('Mostrar o status Liberal'));
    expect(left, isNot(contains('#')));
    expect(right.trimLeft(), startsWith('# -'));
    expect(right, isNot(contains('esquadrão#')));
  });

  test(
    'Portuguese car-dealer choice prompts use contextual articles',
    () async {
      final liberal = Creature()..name = 'Joana';
      pool.add(liberal);
      final customers = Squad()..members.add(liberal);
      squads.add(customers);
      activeSquad = customers;
      ledger.forceSetFunds(100000);
      activeSquadMemberIndex = -1;
      final dealershipSite = sites.firstWhere(
        (site) => site.type == SiteType.carDealership,
      );
      final prompts = <String>[];
      console.flush = () {
        final prompt = console.buffer[22]
            .map((character) => character.glyph)
            .join()
            .trimRight();
        if (prompt.isNotEmpty) prompts.add(prompt);
      };

      console
        ..injectKey('g')
        ..injectKey('a')
        ..injectKey('a')
        ..injectKey('Enter');
      await dealership(dealershipSite);

      expect(
        prompts,
        contains('Pressione uma letra para selecionar um veículo'),
      );
      expect(prompts, contains('Pressione uma letra para selecionar uma cor'));
    },
  );
}
