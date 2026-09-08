import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/clothing.dart';
import 'package:lcs_new_age/items/item.dart';
import 'package:lcs_new_age/items/loot.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/interface_options.dart';

Future<void> doActivityRepairClothing(Creature cr) async {
  Clothing? armor;
  bool pile = false;
  if (cr.clothing.bloody || cr.clothing.damaged) {
    armor = cr.clothing;
  } else {
    // Identify the best armor to repair
    int score(Clothing a) {
      int score = 0;
      if (a.bloody) score++;
      if (a.damaged) score++;
      return score;
    }

    Clothing? bestScore(Clothing? a, Clothing b) {
      if (a == null) {
        if (score(b) > 0) return b;
        return null;
      }
      return score(a) >= score(b) ? a : b;
    }

    armor = cr.base?.loot.whereType<Clothing>().fold(null, bestScore);
    pile = true;
  }

  if (armor == null) return;

  String armorName = LcsI18n.tr(armor.type.name);
  String aan = LcsI18n.currentLocale == 'pt_BR'
      ? "peça de roupa chamada"
      : pile
      ? aOrAn(armor.type.name)
      : cr.gender.hisHer;
  bool repairFailed = true;
  bool armorDestroyed = armor.quality > armor.type.qualityLevels;
  if (armor.damaged) {
    cr.train(Skill.tailoring, 5);
  }

  if (pile && armor.stackSize > 0) {
    Item newArmor = armor.split(1);
    cr.base!.loot.add(newArmor);
    armor = newArmor as Clothing;
  }

  if (armorDestroyed) {
    await showMessage(
      LcsI18n.processString(
        "{name} recycles the remains of {article} {armor} into cloth.",
        {"name": cr.name, "article": aan, "armor": armorName},
      ),
      color: red,
    );
  } else if (repairFailed && armor.bloody) {
    await showMessage(
      LcsI18n.processString("{name} washes {article} {armor}.", {
        "name": cr.name,
        "article": aan,
        "armor": armorName,
      }),
      color: lightBlue,
    );
  } else {
    await showMessage(
      LcsI18n.processString("{name} repairs {article} {armor}.", {
        "name": cr.name,
        "article": aan,
        "armor": armorName,
      }),
      color: lightGreen,
    );
  }

  armor.bloody = false;
  armor.damaged = false;
  if (armorDestroyed) {
    if (!pile) {
      cr.strip();
    } else {
      cr.base!.loot.remove(armor);
    }
    cr.base!.loot.add(Loot("LOOT_RECYCLEDCLOTH"));
  }
}
