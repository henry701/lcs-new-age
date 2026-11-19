import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/review_mode.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';

import '../test_support.dart';

String line(int row) =>
    console.buffer[row].map((character) => character.glyph).join().trimRight();

Creature liberal(String name, {Creature? boss, int juice = 500}) {
  final person = Creature()
    ..name = name
    ..align = Alignment.liberal
    ..juice = juice
    ..hireId = boss?.id;
  pool.add(person);
  return person;
}

String letterFor(Creature person) {
  final sorted = pool.toList();
  sortbyhire(sorted, []);
  return String.fromCharCode('a'.codeUnitAt(0) + sorted.indexOf(person));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    await LcsI18n.initialize('pt_BR');
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
    'direct reports show that there is no higher contact and cannot be selected',
    () async {
      final leader = liberal('Leader');
      final direct = liberal('Direct', boss: leader);
      console
        ..injectKey('b')
        ..injectKey('x');

      await promoteliberals();

      expect(direct.hireId, leader.id);
      expect(line(3), contains('<Já no topo>'));
      expect(console.buffer[3][0].mouseClickKey, isNull);
    },
  );

  test(
    'valid promotion moves a recruit to the contact above their boss',
    () async {
      final leader = liberal('Leader');
      final boss = liberal('Boss', boss: leader);
      final recruit = liberal('Recruit', boss: boss);
      console
        ..injectKey('c')
        ..injectKey('x');

      await promoteliberals();

      expect(recruit.hireId, leader.id);
    },
  );

  test('a full contact blocks promotion without mutating the tree', () async {
    final leader = liberal('Leader', juice: 0);
    final boss = liberal('Boss', boss: leader);
    for (var i = 0; i < 5; i++) {
      liberal('Other $i', boss: leader);
    }
    final recruit = liberal('Recruit', boss: boss);
    final row = letterFor(recruit).codeUnitAt(0) - 'a'.codeUnitAt(0) + 2;
    expect(leader.subordinatesLeft, 0);
    console
      ..injectKey(letterFor(recruit))
      ..injectKey('x');

    await promoteliberals();

    expect(recruit.hireId, boss.id);
    expect(line(row), contains('<Não Pode Liderar Mais>'));
    expect(console.buffer[row][0].mouseClickKey, isNull);
  });

  test('an enlightened recruit can join a full contact', () async {
    final leader = liberal('Leader', juice: 0);
    final boss = liberal('Boss', boss: leader);
    for (var i = 0; i < 5; i++) {
      liberal('Other $i', boss: leader);
    }
    final recruit = liberal('Recruit', boss: boss)..brainwashed = true;
    expect(leader.subordinatesLeft, 0);
    console
      ..injectKey(letterFor(recruit))
      ..injectKey('x');

    await promoteliberals();

    expect(recruit.hireId, leader.id);
    expect(leader.subordinatesLeft, 0);
  });

  test('hidden and seduced recruits cannot be promoted', () async {
    final leader = liberal('Leader');
    final boss = liberal('Boss', boss: leader);
    final hidden = liberal('Hidden', boss: boss)..hidingDaysLeft = 1;
    final seduced = liberal('Seduced', boss: boss)..seduced = true;
    console
      ..injectKey(letterFor(hidden))
      ..injectKey(letterFor(seduced))
      ..injectKey('x');

    await promoteliberals();

    expect(hidden.hireId, boss.id);
    expect(seduced.hireId, boss.id);
  });

  test('unused letter on a partially populated page does not crash', () async {
    liberal('Leader');
    console
      ..injectKey('s')
      ..injectKey('x');

    await expectLater(promoteliberals(), completes);
  });
}
