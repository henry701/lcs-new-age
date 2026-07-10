import 'package:lcs_new_age/basemode/base_mode.dart';
import 'package:lcs_new_age/creature/name.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/ledger.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/compound_upgrades.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/laws.dart';
import 'package:lcs_new_age/utils/interface_options.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

Future<void> investInLocation(Site loc) async {
  int solarCost = switch (laws[Law.pollution]!) {
    DeepAlignment.archConservative => 60000,
    DeepAlignment.conservative => 40000,
    DeepAlignment.moderate => 30000,
    DeepAlignment.liberal => 20000,
    DeepAlignment.eliteLiberal => 10000,
  };
  int dieselCost = switch (laws[Law.pollution]!) {
    DeepAlignment.archConservative => 300,
    DeepAlignment.conservative => 500,
    DeepAlignment.moderate => 750,
    DeepAlignment.liberal => 1000,
    DeepAlignment.eliteLiberal => 2000,
  };

  while (true) {
    erase();
    locHeader(loc);
    printLocation(loc);
    if (loc.upgradable) {
      if (!loc.compound.fortified) {
        String fortifyText = "Fortify the compound for a siege";
        if (loc.type == SiteType.bunker) {
          fortifyText = "Repair the bunker fortifications";
        } else if (loc.type == SiteType.bombShelter) {
          fortifyText = "Fortify the bomb shelter entrances";
        }
        addOptionText(
          8,
          1,
          "W",
          "W - {action} (\$2000)",
          params: {"action": fortifyText},
          enabledWhen: ledger.funds >= 2000,
        );
      }
      if (!loc.compound.cameras) {
        addOptionText(
          9,
          1,
          "C",
          "C - Place Security Cameras around the compound (\$2000)",
          enabledWhen: ledger.funds >= 2000,
        );
      }
      if (!loc.compound.boobyTraps) {
        addOptionText(
          10,
          1,
          "T",
          "T - Place Booby Traps throughout the compound (\$3000)",
          enabledWhen: ledger.funds >= 3000,
        );
      }
      if (!loc.compound.bollards) {
        addOptionText(
          11,
          1,
          "B",
          "B - Install heavy Bollards to keep vehicles away (\$3000)",
          enabledWhen: ledger.funds >= 3000,
        );
      }
      if (!loc.compound.generator) {
        addOptionText(
          12,
          1,
          "G",
          "G - Install a backup diesel generator for the compound (\$3000)",
          enabledWhen: ledger.funds >= 3000,
        );
      }
      if (!loc.compound.aaGun && !loc.compound.solarPanels) {
        addOptionText(
          13,
          1,
          "P",
          "P - Install a battery and Solar Panel array on the roof ({cost})",
          params: {"cost": "\$${solarCost ~/ 1000},000"},
          enabledWhen: ledger.funds >= solarCost,
        );
        if (laws[Law.gunControl] == DeepAlignment.archConservative) {
          addOptionText(
            14,
            1,
            "A",
            "A - Install a perfectly legal Anti-Aircraft gun on the roof (\$35,000)",
            enabledWhen: ledger.funds >= 35000,
          );
        } else {
          addOptionText(
            14,
            1,
            "A",
            "A - Install and conceal an illegal Anti-Aircraft gun on the roof (\$200,000)",
            enabledWhen: ledger.funds >= 200000,
          );
        }
      }
      if (!loc.compound.videoRoom) {
        addOptionText(
          15,
          1,
          "V",
          "V - Prepare a room as a Video Studio (\$2000)",
          enabledWhen: ledger.funds >= 2000,
        );
      }
      if (!loc.compound.hackerDen) {
        addOptionText(
          16,
          1,
          "H",
          "H - Prepare a room as a Hacker Den (\$4000)",
          enabledWhen: ledger.funds >= 4000,
        );
      }
      if (!loc.businessFront && !loc.discreet) {
        addOptionText(
          17,
          1,
          "F",
          "F - Set up a Business Front to ward off suspicion (\$3000)",
          enabledWhen: ledger.funds >= 3000,
        );
      }
    }
    if (loc.compound.generator) {
      addOptionText(
        18,
        1,
        "D",
        "D - Stockpile 5 days of diesel for the generator ({cost})",
        params: {"cost": "\$$dieselCost"},
        enabledWhen: ledger.funds >= dieselCost,
      );
    }
    addOptionText(
      19,
      1,
      "R",
      "R - Stockpile 20 daily rations of food (\$150)",
      enabledWhen: ledger.funds >= 150,
    );
    addOptionText(20, 1, "Enter", "Enter - Done");
    int c = await getKey();
    if (isBackKey(c)) break;
    if (loc.upgradable) {
      if (c == Key.w) {
        int price = CompoundUpgrade.fortify.price;
        if (!loc.compound.fortified && ledger.funds >= price) {
          ledger.subtractFunds(price, Expense.compoundUpgrades);
          loc.compound.fortified = true;
        }
      }
      if (c == Key.c) {
        int price = CompoundUpgrade.cameras.price;
        if (!loc.compound.cameras && ledger.funds >= price) {
          ledger.subtractFunds(price, Expense.compoundUpgrades);
          loc.compound.cameras = true;
        }
      }
      if (c == Key.t) {
        int price = CompoundUpgrade.boobyTraps.price;
        if (!loc.compound.boobyTraps && ledger.funds >= price) {
          ledger.subtractFunds(price, Expense.compoundUpgrades);
          loc.compound.boobyTraps = true;
        }
      }
      if (c == Key.b) {
        int price = CompoundUpgrade.bollards.price;
        if (!loc.compound.bollards && ledger.funds >= price) {
          ledger.subtractFunds(price, Expense.compoundUpgrades);
          loc.compound.bollards = true;
        }
      }
      if (c == Key.g) {
        int price = CompoundUpgrade.generator.price;
        if (!loc.compound.generator && ledger.funds >= price) {
          ledger.subtractFunds(price, Expense.compoundUpgrades);
          loc.compound.generator = true;
        }
      }
      if (c == Key.p) {
        int price = CompoundUpgrade.solarPanels.price;
        if (!loc.compound.solarPanels &&
            !loc.compound.aaGun &&
            ledger.funds >= price) {
          ledger.subtractFunds(price, Expense.compoundUpgrades);
          loc.compound.solarPanels = true;
        }
      }
      if (c == Key.a) {
        int price = CompoundUpgrade.aaGun.price;
        if (!loc.compound.aaGun &&
            !loc.compound.solarPanels &&
            ledger.funds >= price) {
          ledger.subtractFunds(price, Expense.compoundUpgrades);
          loc.compound.aaGun = true;
        }
      }
      if (c == Key.v) {
        int price = CompoundUpgrade.videoRoom.price;
        if (!loc.compound.videoRoom && ledger.funds >= price) {
          ledger.subtractFunds(price, Expense.compoundUpgrades);
          loc.compound.videoRoom = true;
        }
      }
      if (c == Key.h) {
        int price = CompoundUpgrade.hackerDen.price;
        if (!loc.compound.hackerDen && ledger.funds >= price) {
          ledger.subtractFunds(price, Expense.compoundUpgrades);
          loc.compound.hackerDen = true;
        }
      }
    }
    if (c == Key.d && ledger.funds >= dieselCost) {
      if (loc.compound.generator) {
        ledger.subtractFunds(dieselCost, Expense.compoundUpgrades);
        loc.compound.diesel += 5;
      }
    }
    if (c == Key.r) {
      if (ledger.funds >= 150) {
        ledger.subtractFunds(150, Expense.compoundUpgrades);
        loc.compound.rations += 20;
      }
    }
    if (c == Key.f) {
      int price = CompoundUpgrade.businessFront.price;
      if (!loc.businessFront && !loc.discreet && ledger.funds >= price) {
        ledger.subtractFunds(price, Expense.compoundUpgrades);
        loc.businessFront = true;
        do {
          String first = lastName(), second = lastName(), third = lastName();
          String short, longTemplate;
          (short, longTemplate) = [
            ("Life Ins.", "{first} Life Insurance"),
            ("Manpower", "{first} Manpower, LLC"),
            ("Holding", "{first} Holding Company"),
            ("Services", "{first} Elite Services"),
            ("Design", "{first} Design Agency"),
            ("Realty", "{first} Real Estate"),
            ("Disposal", "{first} Waste Disposal"),
            ("Accounts", "{first} & {second} Accounts"),
            ("Advisory", "{first} Advisory"),
            ("Finance", "{first} {second} Finance"),
            ("Legal", "{first} & {second} Legal"),
            ("Software", "{first} Software"),
            ("Technic", "{first} Technical"),
            ("Global", "{first} Global"),
            ("Partners", "{first} {second} {third} Partnership"),
            ("Acme", "Acme LLC Co. Inc."),
          ].random;
          loc.frontName = LcsI18n.processString(longTemplate, {
            "first": first,
            "second": second,
            "third": third,
          });
          loc.shortName = short;
        } while (sites.where((l) => l.shortName == loc.shortName).length > 1);
      }
    }
  }
}
