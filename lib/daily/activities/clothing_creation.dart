import 'dart:math';

import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/ledger.dart';
import 'package:lcs_new_age/items/armor_upgrade.dart';
import 'package:lcs_new_age/items/clothing.dart';
import 'package:lcs_new_age/items/clothing_type.dart';
import 'package:lcs_new_age/items/item.dart';
import 'package:lcs_new_age/items/loot.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

Future<void> doActivityMakeClothing(Creature cr) async {
  ClothingType clothing =
      cr.activity.clothingType ?? clothingTypes.values.first;
  ArmorUpgrade armor = cr.activity.armorUpgrade ?? armorUpgrades.values.first;
  int cost = clothing.makePrice + armor.makePrice;
  int dif = clothing.makeDifficultyFor(cr, armor);
  Iterable<Item>? cloths = cr.site?.loot.where(
    (e) => e is Loot && e.type.cloth,
  );
  Item? foundCloth;
  if (cloths != null && cloths.isNotEmpty) {
    foundCloth = cloths.reduce(
      (previousValue, element) =>
          previousValue.type.fenceValue > element.type.fenceValue
          ? element
          : previousValue,
    );
  }
  if (foundCloth != null) {
    cost = cost ~/ 2;
    if (foundCloth.stackSize > 1) {
      foundCloth.stackSize--;
    } else {
      cr.site?.loot.remove(foundCloth);
    }
  }
  if (ledger.funds < cost) {
    mvaddstrc(
      8,
      1,
      lightGray,
      "{name} doesn't have enough money to make clothing.",
      params: {"name": cr.name},
    );
    await getKey();
    return;
  }
  ledger.subtractFunds(cost, Expense.sewingSupplies);
  cr.train(
    Skill.tailoring,
    (clothing.makeDifficulty + armor.makeDifficulty) * 2 + 1,
  );
  int quality = 1;
  while (min(lcsRandom(10), lcsRandom(10)) < dif - quality &&
      quality <= clothing.qualityLevels) {
    quality++;
    cr.train(Skill.tailoring, 5);
  }
  if (quality <= clothing.qualityLevels) {
    Item it = Clothing.fromType(clothing, armor, quality: quality);
    String rate;
    switch (quality) {
      case 1:
        rate = "first";
      case 2:
        rate = "second";
      case 3:
        rate = "third";
      case 4:
        rate = "fourth";
      default:
        rate = "${quality}th";
    }
    mvaddstrc(
      8,
      1,
      lightGray,
      "{name} created {rate}-rate {clothing}.",
      params: {"name": cr.name, "rate": rate, "clothing": clothing.name},
    );
    await getKey();
    cr.site?.loot.add(it);
  } else {
    switch (lcsRandom(7)) {
      case 0:
        mvaddstrc(
          8,
          1,
          lightGray,
          "{name} produced an unwearable cloth monster.",
          params: {"name": cr.name},
        );
        await getKey();
      case 1:
        mvaddstrc(
          8,
          1,
          lightGray,
          "{name} wasted the materials for a {clothing}.",
          params: {"name": cr.name, "clothing": clothing.name},
        );
        await getKey();
      case 2:
        mvaddstrc(
          8,
          1,
          lightGray,
          "{name} tried to make {clothing}, but failed.",
          params: {"name": cr.name, "clothing": clothing.name},
        );
        await getKey();
      case 3:
        mvaddstrc(
          8,
          1,
          lightGray,
          "{name} made a horrible nightmare of cloth and stitching.",
          params: {"name": cr.name},
        );
        await getKey();
      case 4:
        mvaddstrc(
          8,
          1,
          lightGray,
          "{name} stitched something bad.",
          params: {"name": cr.name},
        );
        await getKey();
      case 5:
        mvaddstrc(
          8,
          1,
          lightGray,
          "{name} got inches and feet mixed up and is now drowning in cloth.",
          params: {"name": cr.name},
        );
        await getKey();
      case 6:
        mvaddstrc(
          8,
          1,
          lightGray,
          "{name} got feet and inches mixed up and is now outfitting ants.",
          params: {"name": cr.name},
        );
        await getKey();
    }
    cr.site?.loot.add(Loot("LOOT_RECYCLEDCLOTH"));
  }
}
