import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/sitemode/fight.dart';
import 'package:lcs_new_age/utils/game_options.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    gameOptions.lighterTone = false;
    await LcsI18n.initialize('pt_BR');
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese combat death messages wrap instead of clipping', () {
    final target = Creature.fromId(CreatureTypeIds.swat)
      ..name = 'SWAT Officer'
      ..align = Alignment.conservative;
    target.blood = target.maxBlood;

    int? finalWordsSeed;
    for (var seed = 1; seed < 10000; seed++) {
      reseedRNG(seed: seed);
      if (lcsRandom(11) == 10) {
        finalWordsSeed = seed;
        break;
      }
    }
    expect(finalWordsSeed, isNotNull);

    reseedRNG(seed: finalWordsSeed!);
    addDeathMessage(target);

    final wrapped = '${_consoleLine(9)} ${_consoleLine(10)}'
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    expect(
      wrapped,
      contains(
        'Policial da SWAT profere suas últimas palavras: '
        '"Melhor morrer do que ser liberal..."',
      ),
    );
    expect(console.buffer.every((row) => row.length == 80), isTrue);
  });

  test('Portuguese combat death messages use a possessive pronoun', () {
    final target = Creature.fromId(CreatureTypeIds.swat)
      ..name = 'SWAT Officer'
      ..gender = Gender.female
      ..align = Alignment.conservative;
    target.blood = -target.maxBlood * 3;

    int? deadBeforeGroundSeed;
    for (var seed = 1; seed < 10000; seed++) {
      reseedRNG(seed: seed);
      if (lcsRandom(8) == 0) {
        deadBeforeGroundSeed = seed;
        break;
      }
    }
    expect(deadBeforeGroundSeed, isNotNull);

    reseedRNG(seed: deadBeforeGroundSeed!);
    addDeathMessage(target);

    final rendered = '${_consoleLine(9)} ${_consoleLine(10)}'
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    expect(
      rendered,
      contains('Policial da SWAT morre antes que o corpo dela atinja o chão.'),
    );
    expect(rendered, isNot(contains('corpo ela')));
  });
}
