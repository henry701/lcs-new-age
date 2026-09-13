import 'package:lcs_new_age/creature/name_lists.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

/// Capitalizes the first letter of a string
String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

/// Generates a monster name by combining various elements
String generateMonsterName() {
  String first;
  final last = monsterLastNames.random;

  int form = lcsRandom(10);
  if (form < 3) {
    first = monsterFirstNames.random;
  } else if (form < 6) {
    first = colors.random;
  } else if (form < 9) {
    first = metals.random;
  } else {
    first = gemstones.random;
  }

  if (form < 3) {
    return LcsI18n.processString("{first} {last}", {
      "first": first,
      "last": capitalize(last),
    });
  } else if (form < 6) {
    return LcsI18n.processString("{first} {middle}{last}", {
      "first": first,
      "middle": colors.random,
      "last": last,
    });
  } else if (form < 9) {
    return LcsI18n.processString("{first} {middle}{last}", {
      "first": first,
      "middle": metals.random,
      "last": last,
    });
  } else {
    return LcsI18n.processString("{first} {middle}{last}", {
      "first": first,
      "middle": gemstones.random,
      "last": last,
    });
  }
}
