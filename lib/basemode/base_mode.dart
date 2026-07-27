import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:lcs_new_age/basemode/activate_regulars.dart';
import 'package:lcs_new_age/basemode/activate_sleepers.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/basemode/base_actions.dart';
import 'package:lcs_new_age/basemode/blind_time_log.dart';
import 'package:lcs_new_age/basemode/disbanding.dart';
import 'package:lcs_new_age/basemode/flag.dart';
import 'package:lcs_new_age/basemode/invest_in_location.dart';
import 'package:lcs_new_age/basemode/liberal_agenda.dart';
import 'package:lcs_new_age/basemode/media_overview.dart';
import 'package:lcs_new_age/basemode/plan_site_visit.dart';
import 'package:lcs_new_age/basemode/review_mode.dart';
import 'package:lcs_new_age/common_actions/equipment.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/common_display/print_party.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/daily/advance_day.dart';
import 'package:lcs_new_age/daily/siege.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/gamestate/time.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/flag.dart';
import 'package:lcs_new_age/items/flag_type.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/siege.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/monthly/advance_month.dart';
import 'package:lcs_new_age/saveload/save_load.dart';
import 'package:lcs_new_age/title_screen/game_over.dart';
import 'package:lcs_new_age/utils/colors.dart';

Future<bool> baseMode() async {
  int daysWithoutVision = 0;
  disbanding = false;

  while (true) {
    bool forceWait = false;
    cantSeeReason = CantSeeReason.other;
    forceWait = await checkForVision();

    if (!forceWait) {
      await howTimesHaveChanged(daysWithoutVision);
      daysWithoutVision = 0;
      // Vision restored; the time-passing log only covers blind stretches.
      clearBlindLog();
    }

    int partySize = activeSquad?.members.length ?? 0;
    if (activeSquad != null && partySize == 0) {
      squads.remove(activeSquad);
      activeSquad = null;
    }

    Site? loc = activeSquad?.site ?? activeSafehouse;
    Siege? siege = loc?.siege;
    if (!forceWait) {
      erase();
      baseModeSquadSafehouseDisplay(loc);
      baseModeOptionsDisplay(loc);
    }
    int c = forceWait ? Key.w : await getKey();
    switch (c) {
      case Key.v:
        // manage vehicles
        if (vehiclePool.isNotEmpty &&
            (activeSquad?.members.isNotEmpty ?? false)) {
          await setVehicles();
        }
      case Key.g:
        // give up
        if (siege?.underSiege ?? false) {
          await giveUp(loc);
          cleanGoneSquads();
        }
      case Key.f:
        // go forth / fight siege
        if (!(siege?.underSiege ?? false) && partySize > 0) {
          await planSiteVisit();
        } else if (siege?.underSiege == true &&
            siege?.activeSiegeType == SiegeType.police &&
            (activeSafehouse ?? activeSquad?.site)?.type ==
                SiteType.homelessEncampment) {
          await fightHomelessCampSiege();
          cleanGoneSquads();
        } else if (siege?.underAttack ?? false) {
          await escapeOrEngage();
          cleanGoneSquads();
        } else if (siege?.underSiege ?? false) {
          await sallyForth();
          cleanGoneSquads();
        }
      case Key.z:
        // select next safehouse
        List<Site> safehouses = sites.where((l) => l.isSafehouse).toList();
        if (safehouses.isNotEmpty) {
          int index = safehouses.indexOf(activeSafehouse ?? safehouses[0]);
          activeSquad = null;
          activeSafehouse = safehouses[(index + 1) % safehouses.length];
        }
      case Key.e:
        // equip loot
        if (partySize > 0 && activeSquad?.site != null) {
          Creature? oldASM = activeSquadMember;
          activeSquadMember = null;
          await equip(activeSquad?.site?.loot);
          activeSquadMember = oldASM;
        }
      case Key.o:
        // reorder squad
        if (partySize > 1) {
          await orderparty();
        }
      case Key.c:
        // cancel the squad's departure
        if (partySize > 0) {
          activeSquad?.activity = Activity.none();
        }
      case Key.p:
        if (loc != null) await prideOrProtest(loc);
      case Key.w:
        // wait
        if (forceWait || !pool.any((p) => p.site?.siege.underAttack ?? false)) {
          clearScreenOnNextMessage = forceWait;
          if (cantSeeReason != CantSeeReason.none) daysWithoutVision++;
          await advanceDay();
          if (day == 1) await advanceMonth();
          await advanceLocations();
          if (forceWait && day == 1) {
            erase();
            mvaddstrc(7, 5, lightGray, "Time passes...");
            mvaddstr(
              9,
              12,
              "{month} {day}, {year}",
              params: {"month": getMonth(month), "day": day, "year": year},
            );
            displayBlindLog();
            refresh();
            await Future.delayed(const Duration(milliseconds: 100));
          }
        } else if (loc?.siege.underAttack != true) {
          activeSafehouse = pool
              .firstWhere((p) => p.site?.siege.underAttack == true)
              .site;
          activeSquad = null;
        }
      case Key.i:
        Site? safehouse = activeSafehouse;
        if (safehouse != null &&
            safehouse.upgradable &&
            (siege?.underSiege == false)) {
          await investInLocation(safehouse);
        }
      case Key.l:
        disbanding = await liberalAgenda();
      case Key.a:
        await activateRegulars();
      case Key.b:
        await activateSleepers();
      case Key.n:
        if (squads.isNotEmpty) {
          int index = squads.indexOf(activeSquad ?? squads.last) + 1;
          if (index >= squads.length) index = 0;
          activeSquad = squads[index];
        }
      case Key.r:
        await reviewAssetsAndFormSquads();
      case Key.s:
        await updateTheSlogan();
      case Key.num0:
        activeSquadMember = null;
      case Key.m:
        await mediaOverview();
      case Key.x:
        await autoSaveGame();
        endGame();
      default:
        if (activeSquad != null) {
          int squadIndex = c - Key.num1;
          if (squadIndex >= 0 && squadIndex < squad.length) {
            Creature? squadMember = activeSquadMember;
            if (activeSquadMemberIndex == squadIndex && squadMember != null) {
              await fullCreatureInfoScreen(squadMember);
            } else {
              activeSquadMemberIndex = squadIndex;
            }
          }
        }
    }
  }
}

void baseModeSquadSafehouseDisplay(Site? loc) {
  if (activeSquad != null) activeSafehouse = null;
  locHeader();

  Site? aSafehouse = activeSafehouse;
  if (aSafehouse != null) {
    printLocation(aSafehouse);
  } else if (activeSquad != null) {
    printParty();
  } else {
    makeDelimiter();
  }

  if (loc == null) return;

  if (loc.hasFlag) {
    printFlag(loc.flyingFlag);
  }
}

void printLocation(Site loc) {
  if (loc.siege.underSiege) {
    if (!loc.siege.underAttack) {
      mvaddstrc(2, 1, yellow, "The police have surrounded this location.");
    } else {
      setColor(red);
      String attacker = switch (loc.siege.activeSiegeType) {
        SiegeType.police => "The police are raiding this location!",
        SiegeType.cia => "The CIA is raiding this location!",
        SiegeType.angryRuralMob => "An angry mob is storming this location!",
        SiegeType.corporateMercs =>
          "Corporate mercs are attacking this location!",
        SiegeType.medicalDebtCollectors =>
          "Debt collectors are raiding this location!",
        SiegeType.ccs => "The CCS is attacking this location!",
        _ => "Software bugs are attacking this location!",
      };
      mvaddstr(2, 1, attacker);
    }
  } else {
    mvaddstrc(2, 1, lightGray, "You are not under siege... yet.");
  }
  if (loc.upgradable) {
    if (numberEating(loc) > 0) {
      int daysLeft = foodDaysLeft(loc);
      if (daysLeft > 0) {
        if (daysLeft < 4) {
          setColor(loc.siege.underSiege ? yellow : lightGray);
          mvaddstr(3, 1, "This location has food for only a few days.");
        }
      } else {
        setColor(loc.siege.underSiege ? red : lightGray);
        mvaddstr(3, 1, "This location has insufficient food stores.");
      }
    }
    if (loc.compound.fortified) {
      mvaddstrc(4, 1, white, "FORTIFIED COMPOUND");
    }
    if (loc.compound.videoRoom) {
      mvaddstrc(4, 24, lightBlue, "VIDEO STUDIO");
    }
    if (loc.compound.hackerDen) {
      mvaddstrc(4, 41, blue, "HACKER DEN");
    }
    if (loc.businessFront) {
      mvaddstrc(4, 56, pink, "BUSINESS FRONT");
    } else if (loc.discreet) {
      mvaddstrc(4, 56, darkGray, "HIDDEN LOCATION");
    }
    if (loc.compound.cameras) {
      if (loc.siege.underSiege && loc.siege.camerasOff) {
        mvaddstrc(5, 1, red, "CAMERAS OFF");
      } else {
        mvaddstrc(5, 1, lightGreen, "CAMERAS ON");
      }
    }
    if (loc.compound.boobyTraps) {
      mvaddstrc(5, 17, red, "BOOBY TRAPS");
    }
    if (loc.compound.aaGun) {
      mvaddstrc(5, 33, orange, "AA GUN");
    }
    if (loc.compound.bollards) {
      mvaddstrc(5, 45, yellow, "BOLLARDS");
    }
    if (loc.siege.underSiege && loc.siege.lightsOff) {
      mvaddstrc(5, 58, lightGray, "LIGHTS OUT");
    } else if (loc.compound.solarPanels) {
      mvaddstrc(5, 58, lightGreen, "SOLAR POWER");
    } else if (loc.compound.generator) {
      mvaddstrc(5, 59, white, "GENERATOR");
    }
    int eaters = numberEating(loc), days = foodDaysLeft(loc);
    if (eaters > 0) {
      if (days >= 1) {
        final foodLeftText = days == 1
            ? "1 day of Food Left."
            : "{days} days of Food Left.";
        mvaddstrc(6, 50, lightGray, foodLeftText, params: {"days": days});
      } else if (days == 0) {
        mvaddstrc(6, 50, red, "Not Enough Food");
      }
    }
    final rationText = loc.compound.rations == 1
        ? "1 Daily Ration"
        : "{rations} Daily Rations";
    mvaddstrc(
      6,
      1,
      lightGray,
      rationText,
      params: {"rations": loc.compound.rations},
    );
    mvaddstr(6, 30, "{eaters} Eating", params: {"eaters": eaters});
  }
}

void locHeader([Site? loc]) {
  loc = loc ?? activeSquad?.site ?? activeSafehouse;
  move(0, 0);
  setColor(lightGray);
  if (loc != null) {
    if (loc.siege.underAttack) {
      setColor(red);
    } else if (loc.siege.underSiege) {
      setColor(yellow);
    }
    final locationPrefix = activeSquad == null
        ? LcsI18n.tr("No Squad Selected, ")
        : "";
    final locationText = StringBuffer()
      ..write(loc.getName(short: true, includeCity: true))
      ..write(', ');
    final dateText = LcsI18n.processString("{month} {day}, {year}", {
      "month": getMonthShort(month),
      "day": day,
      "year": year,
    });
    final header = StringBuffer()
      ..write(locationPrefix)
      ..write(locationText)
      ..write(dateText);
    mvaddstrFitted(0, 0, header.toString(), 40, noTranslate: true);
  } else {
    final dateText = LcsI18n.processString("{month} {day}, {year}", {
      "month": getMonthShort(month),
      "day": day,
      "year": year,
    });
    mvaddstrFitted(0, 0, dateText, 40, noTranslate: true);
  }
  if (loc == null) {
    mvaddstrc(3, 6, darkGray, "To form a new squad:");
    mvaddstr(4, 6, "1) R - Review Assets and Form Squads");
    mvaddstr(5, 6, "2) Press Z to Assemble a New Squad");
  }
  printFunds();
  if (activeSquad != null) {
    printSquadActivityDescription(0, 41, activeSquad!);
  }
}

void baseModeOptionsDisplay(Site? loc) {
  const leftColumnX = 1;
  const leftColumnWidth = 38;
  const rightColumnX = 40;
  const rightColumnWidth = ManagementTableLayout.consoleWidth - rightColumnX;
  const farRightColumnX = 64;

  // Base options reuse rows that may contain a longer daily-arrival message.
  // Clear them first so shorter Portuguese labels cannot inherit stale tails.
  eraseLine(8);
  eraseLine(9);

  int squadSize = activeSquad?.members.length ?? 0;
  Site? site = loc;
  bool sieged = site?.siege.underSiege ?? false;
  int safehouseCount = sites.where((l) => l.isSafehouse).length;
  bool cannotWait = pool.any((p) => p.site?.siege.underAttack ?? false);

  mvaddstrc(18, 10, lightGray, "=== ACTIVISM ===");
  mvaddstr(18, 51, "=== PLANNING ===");
  addOptionTextFitted(
    19,
    rightColumnX,
    "e",
    "E - Equip Squad",
    farRightColumnX - rightColumnX - 1,
    enabledWhen: squadSize > 0,
  );
  addOptionTextFitted(
    19,
    farRightColumnX,
    "v",
    "V - Vehicles",
    ManagementTableLayout.consoleWidth - farRightColumnX,
    enabledWhen: vehiclePool.isNotEmpty && squadSize > 0,
  );
  addOptionTextFitted(
    20,
    rightColumnX,
    "r",
    "R - Review Assets and Form Squads",
    rightColumnWidth,
    enabledWhen: pool.isNotEmpty,
  );
  Site? aSafehouse = activeSafehouse;
  if (sieged && site != null) {
    if (site.siege.underAttack) {
      mvaddstrc(8, 1, red, "Safehouse Under Attack");
    } else {
      mvaddstrc(
        8,
        1,
        yellow,
        site.compound.rations <= 0
            ? "Safehouse Under Siege (No Food)"
            : "Safehouse Under Siege",
      );
    }
  } else if (aSafehouse != null) {
    if ((aSafehouse.upgradable) && !aSafehouse.siege.underSiege) {
      addOptionTextFitted(
        8,
        leftColumnX,
        "i",
        "I - Invest in this location",
        29,
      );
    } else if (!aSafehouse.upgradable) {
      mvaddstrc(8, 1, midGray, "This location cannot be upgraded");
    }
  }
  if (squadSize > 1 && !sieged) {
    addOptionTextFitted(9, 31, "o", "O - Reorder", 25);
  }
  if (squadSize > 0 && !sieged) {
    // don't cover up info about siege with irrelevant squad name of a squad
    // that will be disbanded during the siege anyway
    mvaddstrcFitted(
      8,
      leftColumnX,
      lightGray,
      localizedSquadName(activeSquad?.name ?? ""),
      29,
      noTranslate: true,
    );
  }
  addOptionTextFitted(
    8,
    rightColumnX,
    "n",
    "N - Next Squad",
    rightColumnWidth,
    enabledWhen:
        squads.length > 1 || (activeSquad == null && squads.isNotEmpty),
  );
  addOptionTextFitted(
    9,
    57,
    "z",
    "Z - Next Location",
    ManagementTableLayout.consoleWidth - 57,
    enabledWhen: safehouseCount > 0,
  );
  addOptionTextFitted(
    21,
    rightColumnX,
    "l",
    "L - The Status of the Liberal Agenda",
    rightColumnWidth,
  );
  addOptionTextFitted(
    21,
    leftColumnX,
    "a",
    "A - Assign Tasks",
    leftColumnWidth,
    enabledWhen: pool.any(
      (p) =>
          p.isActiveLiberal &&
          (p.squad == null || p.squad?.activity.type == ActivityType.none),
    ),
  );
  addOptionTextFitted(
    24,
    leftColumnX,
    "b",
    "B - Sleeper Agents",
    leftColumnWidth,
    enabledWhen: pool.any((p) => p.sleeperAgent),
  );
  addOptionTextFitted(
    20,
    leftColumnX,
    "c",
    "C - Cancel Departure",
    leftColumnWidth,
    enabledWhen:
        squadSize > 0 && activeSquad?.activity.type != ActivityType.none,
  );

  if (sieged) {
    addOptionTextFitted(
      19,
      leftColumnX,
      "f",
      "F - Fight/Escape",
      leftColumnWidth,
      enabledWhen:
          squadSize > 0 || pool.any((p) => p.site?.siege.underAttack ?? false),
    );
    addOptionTextFitted(24, rightColumnX, "g", "G - Give Up", rightColumnWidth);
  } else {
    addOptionTextFitted(
      19,
      leftColumnX,
      "f",
      "F - Go Forth to Stop Evil",
      leftColumnWidth,
      enabledWhen: squadSize > 0,
    );
  }

  if (cannotWait) {
    if (sieged) {
      mvaddstrc(23, 1, red, "Cannot Wait until Siege Resolved");
    } else {
      addOptionTextFitted(
        23,
        leftColumnX,
        "w",
        "W - Select Siege Location",
        leftColumnWidth,
        baseColorKey: ColorKey.red,
      );
    }
  } else {
    if (sieged) {
      addOptionTextFitted(
        23,
        leftColumnX,
        "w",
        "W - Wait out the siege",
        leftColumnWidth,
      );
    } else if (squads.any((s) => s.activity.type == ActivityType.visit)) {
      addOptionTextFitted(
        23,
        leftColumnX,
        "w",
        "W - Carry out your plans",
        leftColumnWidth,
        baseColorKey: "G",
      );
    } else {
      addOptionTextFitted(
        23,
        leftColumnX,
        "w",
        "W - Wait a day",
        leftColumnWidth,
      );
    }
    if (date.add(const Duration(days: 1)).month != month) {
      addstrc(lightGray, " (next month)");
    }
  }
  int unreadNewsCount = gameState.newsArchive.where((ns) => ns.unread).length;
  if (unreadNewsCount > 0) {
    addOptionTextFitted(
      22,
      rightColumnX,
      "m",
      "M - Media Overview & Impact &C({unreadNewsCount})",
      rightColumnWidth,
      params: {"unreadNewsCount": unreadNewsCount},
    );
  } else {
    addOptionTextFitted(
      22,
      rightColumnX,
      "m",
      "M - Media Overview & Impact",
      rightColumnWidth,
    );
  }
  addOptionTextFitted(
    23,
    rightColumnX,
    "x",
    "X - Exit to the Title Screen",
    rightColumnWidth,
  );

  if (loc?.hasFlag ?? false) {
    addOptionTextFitted(
      22,
      leftColumnX,
      "p",
      "P - Protest: Burn the flag",
      leftColumnWidth,
      baseColorKey: sieged ? "G" : "w",
    );
  } else {
    addOptionTextFitted(
      22,
      leftColumnX,
      "p",
      "P - Pride: Fly a flag here (\$20)",
      leftColumnWidth,
      enabledWhen:
          (activeSafehouse != null || activeSquad != null) &&
          ledger.funds >= 20 &&
          !sieged,
    );
  }

  setColor(lightGray);
  int y = (loc?.hasFlag ?? false) ? 16 : 15;
  mvaddstrCenter(y++, gameState.lcs.displaySlogan, noTranslate: true);
  addCenteredOptionText(y++, "s", "(S - Change the Slogan)", baseColorKey: "m");
  if (loc != null) {
    printSafehouseSecurityBox(loc);
  }
}

void addFlagButton(int y, int x, Site loc) {
  String label;
  bool enabled;
  bool highlight;
  bool sieged = loc.siege.underSiege;
  bool policeSiege = sieged && loc.siege.activeSiegeType == SiegeType.police;
  bool ownsAnyFlag = loc.loot.any((i) => i is Flag);
  if (policeSiege && loc.hasFlag) {
    FlagType flag = loc.flyingFlag!;
    if (flag.burns) {
      if (!loc.siege.flagBurnUsed) {
        label = "P - Protest: Burn the flag";
        enabled = true;
        highlight = true;
      } else {
        label = "P - Pride: Switch flags";
        enabled = ownsAnyFlag;
        highlight = false;
      }
    } else {
      // Waving can be repeated, but only the first wave has any impact
      enabled = true;
      if (!loc.siege.flagWaveUsed) {
        label = "P - Protest: Wave the flag defiantly";
        highlight = true;
      } else {
        label = "P - Protest: Wave the flag again";
        highlight = false;
      }
    }
  } else if (sieged) {
    label = loc.hasFlag ? "P - Pride: Switch flags" : "P - Pride: Raise a flag";
    enabled = ownsAnyFlag;
    highlight = false;
  } else {
    bool canSwitch = ownsAnyFlag || ledger.funds >= 20;
    enabled = canSwitch;
    highlight = false;
    if (loc.hasFlag) {
      label = ownsAnyFlag
          ? "P - Pride: Switch flags"
          : "P - Pride: Switch flags (\$20)";
    } else {
      label = ownsAnyFlag
          ? "P - Pride: Fly a flag here"
          : "P - Pride: Fly a flag here (\$20)";
    }
  }

  addOptionText(
    y,
    x,
    "p",
    label,
    baseColorKey: highlight ? "G" : "w",
    enabledWhen: enabled,
  );
}

void printSafehouseSecurityBox(Site site) {
  int heat = site.heat;
  int heatProtection = site.heatProtection;

  setColor(lightGray);
  mvaddstr(9, 1, "┌────────────────┐");
  mvaddstr(10, 1, "│                │");
  mvaddstr(11, 1, "│                │");
  mvaddstr(12, 1, "└────────────────┘");

  mvaddstr(
    9,
    2,
    site.getName(short: true, includeCity: true),
    noTranslate: true,
  );
  if (site.siege.underAttack) {
    mvaddstrc(10, 3, red, "Under Attack");
  } else if (site.siege.underSiege) {
    mvaddstrc(10, 3, yellow, "Under Siege");
  } else {
    mvaddstrc(10, 2, lightGray, "Heat: ");
    addstrc(
      heat > heatProtection ? red : darkGray,
      "{heat}",
      params: {"heat": heat.toString()},
    );
    mvaddstrc(11, 2, lightGray, "Secrecy: ");
    addstrc(
      heat > heatProtection ? red : darkGray,
      "{protection}",
      params: {"protection": heatProtection.toString()},
    );
  }
  int extrajudicialHeat = [
    site.extraHeatFromCIA ~/ 2,
    site.extraHeatFromCCS,
    site.extraHeatFromCorps,
    site.extraHeatFromRuralMobs * 2,
  ].max;
  if (extrajudicialHeat > heatProtection * 0.3) {
    setColor(lightGray);
    mvaddstr(12, 1, "│                │");
    mvaddstr(13, 1, "│                │");
    mvaddstr(14, 1, "└────────────────┘");
    Color color = darkGray;
    String description = "Possible";
    if (extrajudicialHeat > heatProtection * 0.6) {
      color = midGray;
      description = "Likely";
    }
    if (extrajudicialHeat > heatProtection * 0.9) {
      color = red;
      description = "Overt";
    }
    mvaddstrc(12, 4, color, description);
    mvaddstrc(13, 4, color, "Surveillance");
  }
}

Future<bool> checkForVision() async {
  bool forceWait = true;
  cantSeeReason = CantSeeReason.other;
  if (disbanding) {
    cantSeeReason = CantSeeReason.disbanded;
    disbanding = await showDisbandingScreen();
  } else {
    for (Creature c in pool) {
      if (c.isActiveLiberal) {
        cantSeeReason = CantSeeReason.none;
        if (!c.hospitalized) {
          forceWait = false;
          break;
        }
      } else {
        if (c.hospitalized &&
            cantSeeReason.index > CantSeeReason.hospital.index) {
          cantSeeReason = CantSeeReason.hospital;
        } else if (c.vacationDaysLeft > 0 &&
            cantSeeReason.index > CantSeeReason.dating.index) {
          cantSeeReason = CantSeeReason.dating;
        } else if (c.hidingDaysLeft > 0 &&
            cantSeeReason.index > CantSeeReason.hiding.index) {
          cantSeeReason = CantSeeReason.hiding;
        }
      }
    }
  }
  return forceWait;
}

Future<void> howTimesHaveChanged(int daysWithoutVision) async {
  String? str;
  if (daysWithoutVision >= 365 * 16) {
    str = "How long since you've heard these sounds...  times have changed.";
  } else if (daysWithoutVision >= 365 * 8) {
    str = "It has been a long time.  A lot must have changed...";
  } else if (daysWithoutVision >= 365 * 4) {
    str = "It sure has been a while.  Things might have changed a bit.";
  }
  if (str != null) {
    erase();
    setColor(white);
    mvaddstrCenter(12, str);
    await pressAnyKey();
  }
}

enum CantSeeReason { hospital, dating, hiding, other, prison, disbanded, none }

Future<void> updateTheSlogan() async {
  eraseLine(16);
  mvaddstrc(16, 0, lightGray, "What is your new slogan?");
  eraseLine(17);
  slogan = await enterName(17, 0, slogan);
}
