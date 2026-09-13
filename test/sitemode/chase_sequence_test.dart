import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/sitemode/chase_sequence.dart';

import '../test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  test('police-siege pursuers enable the foot-chase surrender action', () {
    final swat = Creature.fromId(
      CreatureTypeIds.swat,
      align: Alignment.conservative,
    );

    expect(canSurrenderToEncounter([swat]), isTrue);
  });

  test('non-law-enforcement pursuers do not enable surrender', () {
    final mercenary = Creature.fromId(
      CreatureTypeIds.merc,
      align: Alignment.conservative,
    );

    expect(canSurrenderToEncounter([mercenary]), isFalse);
  });
}
