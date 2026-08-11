import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/daily/activities/clothing_repair.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/clothing.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test(
    'Portuguese clothing repair localizes the name and avoids English pronouns',
    () async {
      final liberal = Creature()
        ..name = 'Kate Yankovic'
        ..gender = Gender.female;
      liberal.equippedClothing = Clothing('CLOTHING_BLACKSUIT')..damaged = true;
      console.injectKey('Enter');

      await doActivityRepairClothing(liberal);

      expect(
        _consoleLine(8).trim(),
        'Kate Yankovic conserta a peça de roupa chamada Terno preto.',
      );
      expect(_consoleLine(8), isNot(contains('Black Suit')));
      expect(_consoleLine(8), isNot(contains('ela')));
    },
  );
}
