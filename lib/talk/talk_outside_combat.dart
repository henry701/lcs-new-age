import 'package:collection/collection.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/difficulty.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/daily/shopsnstuff.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/ledger.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/money.dart';
import 'package:lcs_new_age/justice/crimes.dart';
import 'package:lcs_new_age/location/compound.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/sitemode/site_display.dart';
import 'package:lcs_new_age/sitemode/sitemap.dart';
import 'package:lcs_new_age/talk/drop_a_pickup_line.dart';
import 'package:lcs_new_age/talk/talk_about_issues.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

String _translateCapitalizedPronoun(String pronoun) {
  final translated = LcsI18n.tr(pronoun.toLowerCase());
  if (translated.isEmpty) {
    return translated;
  }
  return translated[0].toUpperCase() + translated.substring(1);
}

String _localizedCountLabel(int count, String singular, String plural) {
  return count == 1 ? LcsI18n.tr(singular) : LcsI18n.tr(plural);
}

Future<bool> talkOutsideCombat(Creature a, Creature tk) async {
  bool nude = a.indecent;
  String whileNaked = nude ? " ${LcsI18n.tr("while naked")}" : "";
  clearSceneAreas();
  mvaddstrcx(
    9,
    1,
    white,
    "{name:white} talks to {target:color} {ageGender}:",
    params: {
      "name": a.name,
      "target": tk.name,
      "targetColor": tk.align.colorKey,
      "ageGender": creatureAgeAndGender(tk),
    },
  );

  addOptionText(
    console.y + 2,
    1,
    "A",
    "A - Strike up a conversation about politics{whileNaked}.",
    params: {"whileNaked": whileNaked},
  );
  addOptionText(
    console.y + 1,
    1,
    "B",
    "B - Drop a pickup line{whileNaked}.",
    enabledWhen: tk.canDate(a),
    params: {"whileNaked": whileNaked},
  );
  addOptionText(
    console.y + 1,
    1,
    "C",
    "C - On second thought, don't say anything{whileNaked}.",
    params: {"whileNaked": whileNaked},
  );

  if (tk.type.id == CreatureTypeIds.landlord) {
    if (activeSite?.controller == SiteController.unaligned) {
      addOptionText(
        14,
        1,
        "D",
        "D - Rent a room{whileNaked}.",
        params: {"whileNaked": whileNaked},
      );
    } else if (activeSite?.controller == SiteController.lcs) {
      addOptionText(
        14,
        1,
        "D",
        "D - Stop renting a room{whileNaked}.",
        params: {"whileNaked": whileNaked},
      );
    }
  } else if (tk.type.id == CreatureTypeIds.gangMember ||
      tk.type.id == CreatureTypeIds.merc) {
    addOptionText(
      14,
      1,
      "D",
      "D - Buy weapons{whileNaked}.",
      params: {"whileNaked": whileNaked},
    );
  } else if (tk.type.id == CreatureTypeIds.bankTeller) {
    addOptionText(
      14,
      1,
      "D",
      "D - Rob the bank{whileNaked}.",
      params: {"whileNaked": whileNaked},
    );
  }

  // relationship/recruits status
  final recruitOverview = StringBuffer();
  final pronounCap = _translateCapitalizedPronoun(a.gender.heSheCap);
  if (a.subordinatesLeft <= 0) {
    final subordinateTemplate = a.maxSubordinates > 0
        ? a.scheduledMeetings > 0
              ? "{name:midGray} cannot manage any more subordinates, but still has {meetingCount:white} {meetingLabel:midGray} scheduled."
              : "{name:midGray} cannot manage any more subordinates."
        : a.scheduledMeetings > 0
        ? "{name:midGray} cannot manage any subordinates, but still has {meetingCount:white} {meetingLabel:midGray} scheduled."
        : "{name:midGray} cannot manage any subordinates.";
    recruitOverview.write(
      LcsI18n.processString(subordinateTemplate, {
        "name": a.name,
        "meetingCount": a.scheduledMeetings,
        "meetingLabel": _localizedCountLabel(
          a.scheduledMeetings,
          "meeting",
          "meetings",
        ),
      }),
    );
  } else {
    final subordinateTemplate = a.scheduledMeetings > 0
        ? "{name:lightGray} can manage {subordinateCount:white} more {subordinateLabel:lightGray}, and has {meetingCount:white} {meetingLabel:lightGray} scheduled."
        : "{name:lightGray} can manage {subordinateCount:white} more {subordinateLabel:lightGray}.";
    recruitOverview.write(
      LcsI18n.processString(subordinateTemplate, {
        "name": a.name,
        "subordinateCount": a.subordinatesLeft,
        "subordinateLabel": _localizedCountLabel(
          a.subordinatesLeft,
          "subordinate",
          "subordinates",
        ),
        "meetingCount": a.scheduledMeetings,
        "meetingLabel": _localizedCountLabel(
          a.scheduledMeetings,
          "meeting",
          "meetings",
        ),
      }),
    );
  }
  recruitOverview.write(" ");

  if (a.relationshipsLeft <= 0) {
    final relationshipTemplate = a.maxRelationships > 0
        ? a.scheduldeDates > 0
              ? "{pronounCap:midGray} cannot maintain any more relationships, but still has {dateCount:white} {dateLabel:midGray} lined up."
              : "{pronounCap:midGray} cannot maintain any more relationships."
        : a.scheduldeDates > 0
        ? "{pronounCap:midGray} cannot maintain any relationships, but still has {dateCount:white} {dateLabel:midGray} lined up."
        : "{pronounCap:midGray} cannot maintain any relationships.";
    recruitOverview.write(
      LcsI18n.processString(relationshipTemplate, {
        "pronounCap": pronounCap,
        "dateCount": a.scheduldeDates,
        "dateLabel": _localizedCountLabel(
          a.scheduldeDates,
          "hot date",
          "hot dates",
        ),
      }),
    );
  } else {
    final relationshipTemplate = a.scheduldeDates > 0
        ? "{pronounCap:lightGray} can maintain {relationshipCount:white} more {relationshipLabel:lightGray}, and has {dateCount:white} {dateLabel:lightGray} lined up."
        : "{pronounCap:lightGray} can maintain {relationshipCount:white} more {relationshipLabel:lightGray}.";
    recruitOverview.write(
      LcsI18n.processString(relationshipTemplate, {
        "pronounCap": pronounCap,
        "relationshipCount": a.relationshipsLeft,
        "relationshipLabel": _localizedCountLabel(
          a.relationshipsLeft,
          "relationship",
          "relationships",
        ),
        "dateCount": a.scheduldeDates,
        "dateLabel": _localizedCountLabel(
          a.scheduldeDates,
          "hot date",
          "hot dates",
        ),
      }),
    );
  }

  addparagraph(console.y + 2, 1, recruitOverview.toString(), noTranslate: true);

  while (true) {
    int c = await getKey();

    switch (c) {
      case Key.a:
        return wannaHearSomethingDisturbing(a, tk);
      case Key.b:
        if (tk.canDate(a)) return await doYouComeHereOften(a, tk);
      case Key.c:
        return false;
      case Key.d:
        if (tk.type.id == CreatureTypeIds.landlord &&
            activeSite?.controller == SiteController.unaligned) {
          return heyIWantToRentARoom(a, tk);
        } else if (tk.type.id == CreatureTypeIds.landlord &&
            activeSite?.controller == SiteController.lcs) {
          return heyIWantToCancelMyRoom(a, tk);
        } else if (tk.type.id == CreatureTypeIds.gangMember ||
            tk.type.id == CreatureTypeIds.merc) {
          return heyINeedAGun(a, tk);
        } else if (tk.type.id == CreatureTypeIds.bankTeller) {
          return talkToBankTeller(a, tk);
        }
    }
  }
}

Future<bool> wannaHearSomethingDisturbing(Creature a, Creature tk) async {
  clearSceneAreas();
  mvaddstrc(9, 1, white, "{name} says, ", params: {"name": a.name});
  mvaddstrc(10, 1, lightGreen, "\"Do you want to hear something disturbing?\"");

  await getKey();

  bool interested =
      tk.type.talkReceptive ||
      a.skillCheck(Skill.persuasion, Difficulty.average);
  if (a.indecent) {
    interested = interested && lcsRandom(3) == 0;
  }

  if ((tk.type.animal &&
          !a.type.animal &&
          tk.align != Alignment.liberal &&
          !animalsArePeopleToo) ||
      tk.type.tank) {
    final reaction = tk.type.tank
        ? LcsI18n.tr("rumbles disinterestedly.")
        : tk.type.dog
        ? LcsI18n.tr("barks.")
        : LcsI18n.tr("doesn't understand.");
    mvaddstrc(
      12,
      1,
      white,
      "{name} {reaction}",
      params: {"name": tk.name, "reaction": reaction},
    );

    await getKey();
    return true;
  } else if (tk.name != "Prisoner" && interested) {
    mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
    mvaddstrc(13, 1, lightBlue, "\"What?\"");

    await getKey();

    return talkAboutIssues(a, tk);
  } else {
    mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
    setColor(lightBlue);
    move(13, 1);
    if (tk.name == "Prisoner") {
      if (tk.align == Alignment.liberal) {
        addstr("\"I'm stuck in here.\"");
      } else {
        addstr("\"Leave me alone.\"");
        tk.isWillingToTalk = false;
      }
    } else {
      addstr("\"No.\"");
      tk.isWillingToTalk = false;
    }
    addstrc(white, " <turns away>");
    await getKey();

    return true;
  }
}

Future<bool> heyIWantToRentARoom(Creature a, Creature tk) async {
  clearSceneAreas();
  mvaddstrc(9, 1, white, "{name} says, ", params: {"name": a.name});
  mvaddstrc(10, 1, lightGreen, "\"I'd like to rent a room.\"");

  await getKey();

  if (a.indecent) {
    mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
    mvaddstrc(
      13,
      1,
      lightBlue,
      "\"Put some clothes on before I call the cops.\"",
    );

    await getKey();

    return true;
  }

  int rent;
  switch (activeSite?.type) {
    case SiteType.apartment:
      rent = 650;
    case SiteType.upscaleApartment:
      rent = 1500;
    default:
      rent = 200;
  }

  mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
  mvaddstrc(
    13,
    1,
    lightBlue,
    "\"It'll be {rent} a month.",
    params: {"rent": "\$$rent"},
  );

  mvaddstr(
    14,
    1,
    "I'll need {rent} now as a security deposit.\"",
    params: {"rent": "\$$rent"},
  );

  await getKey();

  clearSceneAreas();

  while (true) {
    int c = Key.a;

    setColor(ledger.funds >= rent ? white : darkGray);
    addOptionText(11, 1, "A", "A - Accept.");
    addOptionText(12, 1, "B", "B - Decline.");
    addOptionText(13, 1, "C", "C - Threaten the landlord.");

    c = await getKey();

    switch (c) {
      case Key.a: // Accept rent deal
        if (ledger.funds < rent) break;

        clearSceneAreas();
        mvaddstrc(9, 1, white, "{name} says, ", params: {"name": a.name});
        mvaddstrc(10, 1, lightGreen, "\"I'll take it.\"");

        await getKey();

        mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
        mvaddstrc(
          13,
          1,
          lightBlue,
          "\"Rent is due by the third of every month.",
        );

        mvaddstr(
          14,
          1,
          "We'll start next month.\" {name} <turns away>",
          params: {"name": tk.name},
        );

        await getKey();

        ledger.subtractFunds(rent, Expense.rent);
        activeSite?.controller = SiteController.lcs;
        activeSite?.rent = rent;
        activeSite?.newRental = true;

        activeSquad?.members.forEach((c) => c.base = activeSite);
        return true;

      case Key.b: // Refuse rent deal
        clearSceneAreas();
        mvaddstrc(9, 1, white, "{name} says, ", params: {"name": a.name});
        mvaddstrc(
          10,
          1,
          lightGreen,
          "\"Whoa, I was looking for something cheaper.\"",
        );

        await getKey();

        mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
        mvaddstrc(
          13,
          1,
          lightBlue,
          "\"Not my problem...\" {name} <turns away>",
          params: {"name": tk.name},
        );

        await getKey();

        return true;

      case Key.c: // Threaten landlord
        clearSceneAreas();
        setColor(white);
        Creature? armedLiberal = activeSquad?.members.firstWhereOrNull(
          (c) => c.weapon.type.threatening,
        );
        if (armedLiberal != null) {
          mvaddstr(
            9,
            1,
            "{name} brandishes the {weapon}.",
            params: {
              "name": armedLiberal.name,
              "weapon": armedLiberal.weapon.getName(sidearm: true),
            },
          );

          await getKey();
          clearSceneAreas();
        }
        mvaddstr(9, 1, "{name} says, ", params: {"name": a.name});
        mvaddstrc(
          10,
          1,
          lightGreen,
          "\"What's the price for the Liberal Crime Squad?\"",
        );

        await getKey();

        int roll = a.skillRoll(Skill.persuasion);
        int difficulty = Difficulty.formidable;

        if (!lcsInPublicEye) {
          difficulty += DifficultyModifier.aLittleHarder;
        }
        if (armedLiberal == null) {
          difficulty += DifficultyModifier.aLittleHarder;
        }

        if (roll < difficulty - 4) {
          mvaddstrc(
            12,
            1,
            white,
            "{name} responds, ",
            params: {"name": tk.name},
          );
          mvaddstrc(
            13,
            1,
            lightBlue,
            "\"I think you'd better leave.\" {name} <crosses arms>",
            params: {"name": tk.name},
          );

          await getKey();

          tk.isWillingToTalk = false;
          return true;
        } else {
          mvaddstrc(
            12,
            1,
            white,
            "{name} responds, ",
            params: {"name": tk.name},
          );
          mvaddstrc(13, 1, lightBlue, "\"Jesus... it's yours...\"");

          await getKey();

          int rent;

          // Either he calls the cops or it's yours for free
          if (roll < difficulty) {
            addPotentialCrime(squad, Crime.extortion);
            activeSite!.siege.timeUntilCops = 2;
            rent = 100000000000000; // 100 trillion to guarantee eviction
          } else {
            rent = 0;
          }

          activeSite!.rent = rent;
          activeSite!.newRental = true;
          activeSite!.controller = SiteController.lcs;

          for (var c in squad) {
            c.base = activeSite;
          }
          return true;
        }
    }
  }
}

Future<bool> heyIWantToCancelMyRoom(Creature a, Creature tk) async {
  clearSceneAreas();
  mvaddstrc(9, 1, white, "{name} says, ", params: {"name": a.name});
  mvaddstrc(10, 1, lightGreen, "\"I'd like to cancel my room.\"");
  await getKey();

  if (a.indecent) {
    mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
    mvaddstrc(
      13,
      1,
      lightBlue,
      "\"Put some clothes on before I call the cops.\"",
    );
    await getKey();
    return true;
  }

  mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
  mvaddstrc(13, 1, lightBlue, "\"Fine.  Clear out your room.\"");

  await getKey();

  mvaddstrc(
    15,
    1,
    white,
    "<Your possessions at this location have been moved to the homeless camp.>",
  );

  await getKey();

  activeSite!.controller = SiteController.unaligned;

  //MOVE ALL ITEMS AND SQUAD MEMBERS
  Site hs = findSiteInSameCity(activeSite!.city, SiteType.homelessEncampment)!;
  for (Creature p in pool) {
    if (p.location == activeSite) p.location = hs;
    if (p.base == activeSite) p.base = hs;
  }
  hs.addLootAndProcessMoney(activeSite!.loot);

  activeSite!.compound = Compound();
  activeSite!.compound.rations = 0;
  activeSite!.businessFront = false;

  return true;
}

Future<bool> heyINeedAGun(Creature a, Creature tk) async {
  clearSceneAreas();
  mvaddstrc(9, 1, white, "{name} says, ", params: {"name": a.name});
  mvaddstrc(10, 1, lightGreen, "\"Hey, I need a gun.\"");
  await getKey();

  if (a.indecent) {
    mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
    mvaddstrc(13, 1, lightBlue, "\"Jesus...\"");
    await getKey();
    return true;
  }
  if (a.clothing.type.police) {
    mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
    mvaddstrc(13, 1, lightBlue, "\"I don't sell guns, officer.\"");
    await getKey();
    return true;
  }
  if (siteAlarm) {
    mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
    mvaddstrc(13, 1, lightBlue, "\"We can talk when things are calm.\"");
    await getKey();
    return true;
  }
  SiteType? siteType = activeSite?.type;
  if (mode != GameMode.site) siteType = null;
  switch (siteType) {
    case SiteType.bunker:
    case SiteType.drugHouse:
    case SiteType.barAndGrill:
    case SiteType.armsDealer:
    case SiteType.tenement:
    case SiteType.bombShelter:
    case SiteType.homelessEncampment:
    case SiteType.warehouse:
    case null:
      mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
      mvaddstrc(13, 1, lightBlue, "\"What exactly do you need?\"");
      await getKey();
      Squad? oldSquad;
      Squad? newSquad;
      if (activeSquad == null) {
        oldSquad = tk.squad;
        newSquad = Squad();
        squads.add(newSquad);
        tk.squad = newSquad;
        activeSquad = tk.squad;
      }
      await armsdealer(
        activeSite ??
              Site(SiteType.armsDealer, tk.base!.city, tk.base!.district)
          ..name = "Secluded Alley",
      );
      if (newSquad != null) {
        squads.remove(newSquad);
      }
      if (oldSquad != null) {
        tk.squad = oldSquad;
        activeSquad = null;
        newSquad = null;
      }
      return true;
    default:
      mvaddstrc(12, 1, white, "{name} responds, ", params: {"name": tk.name});
      mvaddstrc(13, 1, lightBlue, "\"Uhhh... not a good place for this.\"");
      await getKey();
      return true;
  }
}

Future<bool> talkToBankTeller(Creature a, Creature tk) async {
  clearSceneAreas();
  setColor(lightGray);
  String whileNaked = a.indecent ? " ${LcsI18n.tr("while naked")}" : "";
  addOptionText(
    11,
    1,
    "A",
    "A - Quietly pass the teller a robbery note{whileNaked}.",
    params: {"whileNaked": whileNaked},
  );
  addOptionText(
    12,
    1,
    "B",
    "B - Threaten bystanders and demand access to the vault{whileNaked}.",
    params: {"whileNaked": whileNaked},
  );
  addOptionText(
    13,
    1,
    "C",
    "C - On second thought, don't rob the bank{whileNaked}.",
    params: {"whileNaked": whileNaked},
  );

  int c;
  do {
    c = await getKey();
  } while (c < Key.a || c > Key.c);

  switch (c) {
    case Key.a:
      clearSceneAreas();
      final robberyNote = [
        "KINDLY PUT MONEY IN BAG. OR ELSE.",
        "I AM LIBERATING YOUR MONEY SUPPLY.",
        "THIS IS A ROBBERY. GIVE ME THE MONEY.",
        "I HAVE A GUN. CASH PLEASE.",
        "THE LIBERAL CRIME SQUAD REQUESTS CASH.",
        "I AM MAKING A WITHDRAWAL. ALL YOUR MONEY.",
        "YOU ARE BEING ROBBED. GIVE ME YOUR MONEY.",
        "PLEASE PLACE LOTS OF DOLLARS IN THIS BAG.",
        "SAY NOTHING. YOU ARE BEING ROBBED.",
        "ROBBERY. GIVE ME CASH. NO FUNNY MONEY.",
      ].random;
      mvaddstrcx(
        9,
        1,
        white,
        "{name} slips the teller a note: &G{note}",
        params: {"name": a.name, "note": LcsI18n.tr(robberyNote)},
      );

      await getKey();

      if (activeSite!.hasHighSecurity) {
        final reaction = [
          "gestures",
          "signals",
          "shouts",
          "screams",
          "gives a warning",
        ].random;
        mvaddstrc(
          11,
          1,
          white,
          "The bank teller reads the note, {reaction}, and dives for cover as the guards move in on the squad!",
          params: {"reaction": LcsI18n.tr(reaction)},
        );

        await getKey();

        siteAlarm = true;
        addPotentialCrime(squad, Crime.bankRobbery);
        addDramaToSiteStory(Drama.bankTellerRobbery);
        siteCrime += 30;
        encounter.add(Creature.fromId(CreatureTypeIds.merc));
        encounter.add(Creature.fromId(CreatureTypeIds.merc));
        encounter.add(Creature.fromId(CreatureTypeIds.merc));
        encounter.add(Creature.fromId(CreatureTypeIds.merc));
      } else {
        final reaction = [
          "nods calmly",
          "looks startled",
          "inhales sharply",
          "sets the paper aside",
          "looks up",
        ].random;
        mvaddstrc(
          11,
          1,
          white,
          "The bank teller reads the note, {reaction}, and slips several bricks of cash into the squad's bag.",
          params: {"reaction": LcsI18n.tr(reaction)},
        );

        await getKey();

        addPotentialCrime(squad, Crime.bankRobbery);
        addDramaToSiteStory(Drama.bankTellerRobbery);
        siteCrime += 30;
        siteAlarmTimer = 0;
        activeSquad!.loot.add(Money(5000));
      }
      tk.isWillingToTalk = false;
      return true;
    case Key.b:
      clearSceneAreas();
      setColor(white);
      Creature? armedLiberal = squad.firstWhereOrNull(
        (p) => p.weapon.type.threatening,
      );
      if (armedLiberal != null) {
        String weaponName = armedLiberal.weapon.getName(sidearm: true);
        mvaddstr(
          9,
          1,
          "{name} brandishes the {weapon}.",
          params: {"name": armedLiberal.name, "weapon": weaponName},
        );
        await getKey();
        clearMessageArea();
      }
      mvaddstr(10, 1, "{name} says, ", params: {"name": a.name});
      mvaddstrc(
        11,
        1,
        lightGreen,
        "\"{slogan}",
        params: {"slogan": slogan},
        noTranslate: true,
      );
      mvaddstr(12, 1, "OPEN THE VAULT, NOW!\"");

      await getKey();

      int roll = a.skillRoll(Skill.persuasion);
      int difficulty = Difficulty.veryEasy;

      if (armedLiberal == null) {
        difficulty += DifficultyModifier.aLotHarder;
      }
      if (activeSite!.hasHighSecurity) {
        difficulty += DifficultyModifier.aLotHarder;
      }

      clearSceneAreas();
      setColor(white);
      if (roll < difficulty) {
        mvaddstrc(9, 1, white, "The bank teller dives for cover as ");
        mvaddstr(10, 1, "guards move in on the squad!");

        await getKey();

        siteAlarm = true;
        addPotentialCrime(squad, Crime.bankRobbery);
        addDramaToSiteStory(Drama.bankStickup);
        siteCrime += 50;
        String guard = CreatureTypeIds.securityGuard;
        if (activeSite!.hasHighSecurity) guard = CreatureTypeIds.merc;
        for (int i = 0; i < 6; i++) {
          encounter.add(Creature.fromId(guard));
        }
      } else {
        mvaddstrc(9, 1, white, "The bank employees hesitantly cooperate!");
        await getKey();
        mvaddstr(10, 1, "The vault is open!");
        await getKey();

        addPotentialCrime(squad, Crime.bankRobbery);
        addDramaToSiteStory(Drama.bankStickup);
        siteCrime += 50;
        siteAlarm = true;

        for (SiteTile t in levelMap.all) {
          t.locked = false;
          if (t.special == TileSpecial.bankVault) {
            for (SiteTile n in t.neighbors()) {
              n.door = false;
            }
            t.special = TileSpecial.none;
          }
        }

        encounter.remove(tk);
      }
      return true;
    case Key.c:
    default:
      return false;
  }
}
