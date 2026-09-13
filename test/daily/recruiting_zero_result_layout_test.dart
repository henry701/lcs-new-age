import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/daily/activities/recruiting.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/title_screen/world.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

Creature _recruiter(String name) {
  final recruiter =
      Creature.fromId(CreatureTypeIds.collegeStudent, align: Alignment.liberal)
        ..name = name
        ..rawSkill[Skill.streetSmarts] = -100
        ..activity = Activity(ActivityType.recruiting)
        ..activity.idString = CreatureTypeIds.collegeStudent;
  pool.add(recruiter);
  return recruiter;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
    gameState = GameState();
    makeWorld();
    gameState.activeSite = sites.first;
    erase();
    move(0, 0);
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test(
    'Portuguese zero-result recruiting waits while showing feedback',
    () async {
      final recruiter = _recruiter('Kim Aguilera');
      var returned = false;
      final activity = doActivityRecruit(recruiter).whenComplete(() {
        returned = true;
      });

      console.injectKey('Enter');
      await Future<void>.delayed(Duration.zero);

      final line = _consoleLine(11);
      expect(
        returned,
        isFalse,
        reason: 'zero-result feedback must require a key',
      );
      expect(
        line,
        contains('não conseguiu encontrar um Estudante Universitário.'),
      );
      expect(line.endsWith('.'), isTrue);
      expect(line, isNot(contains('was unable to track down')));
      expect(console.buffer, hasLength(25));
      expect(console.buffer.every((row) => row.length <= 80), isTrue);

      console.injectKey('Enter');
      await activity;
      expect(returned, isTrue);
    },
  );

  test(
    'Portuguese zero-result recruiting fits an over-long recruiter name',
    () async {
      final recruiter = _recruiter('K' * 100);
      var returned = false;
      final activity = doActivityRecruit(recruiter).whenComplete(() {
        returned = true;
      });

      console.injectKey('Enter');
      await pumpEventQueue();
      expect(returned, isFalse);
      final line = _consoleLine(11);
      expect(
        line,
        contains('não conseguiu encontrar um Estudante Universitário.'),
      );
      expect(line.endsWith('.'), isTrue);
      expect(line, contains('…'));

      console.injectKey('Enter');
      await activity;

      expect(
        LcsI18n.hasTranslation('{name} was unable to track down a {type}.'),
        isTrue,
      );
      expect(returned, isTrue);
      expect(line, contains('não conseguiu encontrar'));
      expect(line.endsWith('.'), isTrue);
      expect(line.length, lessThanOrEqualTo(console.width));
      expect(console.buffer, hasLength(25));
      expect(console.buffer.every((row) => row.length <= 80), isTrue);
    },
  );
}
