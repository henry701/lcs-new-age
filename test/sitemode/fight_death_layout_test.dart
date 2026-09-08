import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/body.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
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

  test('Portuguese lighter-tone death fragments are localized', () {
    gameOptions.lighterTone = true;
    final target = Creature.fromId(CreatureTypeIds.swat)
      ..name = 'SWAT Officer'
      ..align = Alignment.conservative;

    int? diesSeed;
    for (var seed = 1; seed < 10000; seed++) {
      reseedRNG(seed: seed);
      if (lcsRandom(4) == 0) {
        diesSeed = seed;
        break;
      }
    }
    expect(diesSeed, isNotNull);

    reseedRNG(seed: diesSeed!);
    addDeathMessage(target);

    final rendered = _consoleLine(9);
    expect(rendered, contains('Policial da SWAT'));
    expect(rendered, isNot(contains('dies.')));
    expect(rendered.length, lessThanOrEqualTo(console.width));
  });

  test('Portuguese head-loss death templates are localized', () {
    final target = Creature.fromId(CreatureTypeIds.swat)
      ..name = 'SWAT Officer'
      ..align = Alignment.conservative;
    final body = target.body as HumanoidBody;
    body.head.cleanOff = true;

    int? headLossSeed;
    for (var seed = 1; seed < 10000; seed++) {
      reseedRNG(seed: seed);
      if (lcsRandom(4) == 0) {
        headLossSeed = seed;
        break;
      }
    }
    expect(headLossSeed, isNotNull);

    reseedRNG(seed: headLossSeed!);
    addDeathMessage(target);

    final rendered = '${_consoleLine(9)} ${_consoleLine(10)}'
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    expect(rendered, contains('Policial da SWAT'));
    expect(rendered, isNot(contains('reaches once where there is no head')));
    expect(rendered.length, lessThanOrEqualTo(console.width * 2));
  });

  test('Portuguese body-loss death templates remain localized', () {
    final target = Creature.fromId(CreatureTypeIds.swat)
      ..name = 'SWAT Officer'
      ..align = Alignment.conservative;
    final body = target.body as HumanoidBody;
    body.torso.cleanOff = true;

    int? bodyLossSeed;
    for (var seed = 1; seed < 10000; seed++) {
      reseedRNG(seed: seed);
      if (lcsRandom(2) == 0) {
        bodyLossSeed = seed;
        break;
      }
    }
    expect(bodyLossSeed, isNotNull);

    reseedRNG(seed: bodyLossSeed!);
    addDeathMessage(target);

    final rendered = '${_consoleLine(9)} ${_consoleLine(10)}'
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    expect(rendered, contains('Policial da SWAT'));
    expect(rendered, isNot(contains('breaks into pieces')));
    expect(rendered.length, lessThanOrEqualTo(console.width * 2));
  });

  test('Portuguese combat hit messages wrap across the message rows', () async {
    final attacker = Creature.fromId(CreatureTypeIds.agent)
      ..name = 'Sambor Smallwood'
      ..align = Alignment.liberal
      ..rawSkill[Skill.firearms] = 20
      ..rawSkill[Skill.dodge] = 20;
    attacker.giveWeaponAndAmmo('WEAPON_M7', 9);

    final target = Creature.fromId(CreatureTypeIds.swat)
      ..name = 'SWAT Officer'
      ..align = Alignment.conservative
      ..rawSkill[Skill.dodge] = 0
      ..rawAttributes[Attribute.agility] = 1
      ..rawAttributes[Attribute.strength] = 100
      ..rawAttributes[Attribute.wisdom] = 100;
    target.blood = target.maxBlood;
    mode = GameMode.site;

    final attackFuture = attack(attacker, target, false);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    expect(_consoleLine(9), contains('Sambor Smallwood'));

    console.injectKey('x');
    await Future<void>.delayed(const Duration(milliseconds: 50));
    final hitMessage = '${_consoleLine(9)} ${_consoleLine(10)}'
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    expect(hitMessage, contains('Sambor Smallwood'));
    expect(hitMessage, contains('Policial da SWAT'));
    expect(hitMessage, contains('3 vezes'));
    expect(_consoleLine(9), isNot(contains('…')));
    expect(console.buffer.every((row) => row.length == 80), isTrue);

    for (var i = 0; i < 10; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 50));
      console.injectKey('x');
    }
    await attackFuture;
  });
}
