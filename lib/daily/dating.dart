import 'dart:math';

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/dice.dart';
import 'package:lcs_new_age/creature/difficulty.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/daily/recruitment.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/ledger.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/ammo.dart';
import 'package:lcs_new_age/items/clothing.dart';
import 'package:lcs_new_age/items/item.dart';
import 'package:lcs_new_age/items/weapon.dart';
import 'package:lcs_new_age/justice/crimes.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/sitemode/haul_kidnap.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

part 'dating.g.dart';

String _translatePronoun(String pronoun) {
  return switch (pronoun) {
    "he" => LcsI18n.tr("he"),
    "she" => LcsI18n.tr("she"),
    "they" => LcsI18n.tr("they"),
    "his" => LcsI18n.tr("his"),
    "her" => LcsI18n.tr("her"),
    "him" => LcsI18n.tr("him"),
    "their" => LcsI18n.tr("their"),
    "them" => LcsI18n.tr("them"),
    _ => pronoun,
  };
}

String _translateCapitalizedPronoun(String pronoun) {
  final translated = _translatePronoun(pronoun.toLowerCase());
  if (translated.isEmpty) {
    return translated;
  }
  return translated[0].toUpperCase() + translated.substring(1);
}

String _formatDateNameList(List<Creature> dates) {
  final styledNames = dates.map((date) => "&W${date.name}&w").toList();
  if (styledNames.length <= 1) {
    return styledNames.firstOrNull ?? "";
  }
  if (styledNames.length == 2) {
    return "${styledNames[0]}${LcsI18n.tr(" and ")}${styledNames[1]}";
  }

  final leadingNames = styledNames
      .sublist(0, styledNames.length - 1)
      .join(", ");
  return "$leadingNames${LcsI18n.tr(", and ")}${styledNames.last}";
}

@JsonSerializable()
class DatingSession {
  DatingSession(this.lcsMemberId, this.city);
  factory DatingSession.fromJson(Map<String, dynamic> json) =>
      _$DatingSessionFromJson(json);
  Map<String, dynamic> toJson() => _$DatingSessionToJson(this);

  List<Creature> dates = [];
  @JsonKey(defaultValue: 0)
  int lcsMemberId;
  @JsonKey(includeToJson: false, disallowNullValue: false)
  Creature? get lcsMember => pool.firstWhereOrNull((e) => e.id == lcsMemberId);
  set lcsMember(Creature? c) => lcsMemberId = c?.id ?? lcsMemberId;
  City city;
  int timeLeft = 0;
}

Future<void> doDates() async {
  for (int d = datingSessions.length - 1; d >= 0; d--) {
    DatingSession date = datingSessions[d];
    Creature? p = date.lcsMember;
    if (p == null) {
      datingSessions.remove(date);
      continue;
    }
    // Stand up dates if 1) dater does not exist, or
    // 2) dater was not able to return to a safehouse today (and is not in the hospital)
    if (date.timeLeft > 0 ||
        (p.site?.controller == SiteController.lcs ||
            p.site?.type == SiteType.universityHospital ||
            p.site?.type == SiteType.clinic)) {
      //VACATION
      if (date.timeLeft > 0) {
        p.vacationDaysLeft = --date.timeLeft;
        if (date.timeLeft <= 0) {
          Site? hs = findSiteInSameCity(date.city, SiteType.homelessEncampment);
          if (p.base?.siege.underSiege == false) p.base = hs;
          p.location = p.base;
          if (await completeVacation(date, p)) {
            datingSessions.remove(date);
            continue;
          }
        }
      }
      //DO A DATE
      else {
        //TERMINATE NULL DATES
        if (p.site?.siege.underSiege == true) {
          datingSessions.remove(date);
          continue;
        }
        //DO DATE
        else {
          if (await completeDate(date, p)) {
            datingSessions.remove(date);
            continue;
          } else {
            p.vacationDaysLeft = date.timeLeft;
            if (p.vacationDaysLeft > 0) {
              //NOW KICK THE DATER OUT OF THE SQUAD AND LOCATION
              p.squad = null;
              p.location = null;
            }
          }
        }
      }
    } else {
      datingSessions.remove(date);
      continue;
    }
  }
}

const List<Skill> talkingSkills = [
  Skill.science,
  Skill.religion,
  Skill.business,
  Skill.law,
];

Future<bool> completeDate(DatingSession d, Creature p) async {
  City? city = p.location?.city;
  if (d.dates.any((d) => d.location?.city != city)) {
    city = null;
  }

  erase();
  setColor(white);
  move(0, 0);
  final dateIntroParams = <String, dynamic>{
    "pName": p.name,
    "dateList": _formatDateNameList(d.dates),
    "location": p.location?.name,
  };
  final dateIntro = switch ((
    d.dates.length,
    p.clinicMonthsLeft > 0,
    city == null,
  )) {
    (1, true, _) =>
      "{pName:white} has a \"hot\" date with {dateList} at {location:white}.",
    (1, false, true) =>
      "{pName:white} has a \"hot\" date with {dateList} over video chat.",
    (1, false, false) => "{pName:white} has a hot date with {dateList}.",
    (_, true, _) =>
      "{pName:white} has dates to manage with {dateList} at {location:white}.",
    (_, false, true) =>
      "{pName:white} has dates to manage with {dateList} over video chat.",
    _ => "{pName:white} has dates to manage with {dateList}.",
  };
  addparagraph(1, 1, dateIntro, params: dateIntroParams, x2: console.width - 2);

  await getKey();

  int dateCount = d.dates
      .where((c) => c.type.id != CreatureTypeIds.sexWorker)
      .length;

  if (dateCount > 1 && lcsRandom(dateCount > 2 ? 4 : 6) == 0) {
    switch (lcsRandom(3)) {
      case 0:
        move(console.y + 1, 0);
        if (dateCount > 2) {
          addstr(
            "Unfortunately, they all know each other and had been discussing {pName}. An ambush was set for the lying dog...",
            params: {"pName": p.name},
          );
        } else {
          addstr(
            "Unfortunately, they know each other and had been discussing {pName}. An ambush was set for the lying dog...",
            params: {"pName": p.name},
          );
        }

        await getKey();
      case 1:
        move(console.y + 1, 0);
        if (dateCount > 2) {
          addstr(
            "Unfortunately, they all turn up at the same time. Ruh roh...",
          );
        } else {
          addstr("Unfortunately, they turn up at the same time. Ruh roh...");
        }

        await getKey();
      default:
        move(console.y + 1, 0);
        final subjectPronoun = _translatePronoun(p.gender.heShe);
        if (d.dates.length > 2) {
          if (city != null) {
            addstr(
              "{pName} realizes {heshe} has committed to eating {count} meals at once. Things go downhill fast.",
              params: {
                "pName": p.name,
                "heshe": subjectPronoun,
                "count": d.dates.length,
              },
            );
          } else {
            addstr(
              "{pName} realizes {heshe} has committed to {count} calls at once. Things go downhill fast.",
              params: {
                "pName": p.name,
                "heshe": subjectPronoun,
                "count": d.dates.length,
              },
            );
          }
        } else {
          addstr(
            "{pName} mixes up the names of {name1} and {name2}. Things go downhill fast.",
            params: {
              "pName": p.name,
              "name1": d.dates[0].name,
              "name2": d.dates[1].name,
            },
          );
        }

        await getKey();
    }

    const List<String> dateFail = [
      "{name} is publicly humiliated.",
      "{name} runs away.",
      "{name} escapes through the bathroom window.",
      "{name} spends the night getting drunk alone.",
      "{name} gets chased out by an angry mob.",
      "{name} gets stuck washing dishes all night.",
      "{name} is rescued by a passing Elite Liberal.",
      "{name} makes like a tree and leaves.",
    ];
    const List<String> dateFailOnline = [
      "{name} feels completely humiliated.",
      "{name} is quickly blocked.",
      "{name} is promptly told off.",
      "{name} spends the night getting drunk alone.",
      "{name} unplugs the power in shame.",
      "{name} sits in the dark feeling dumb.",
      "{name} spends the evening watching online videos.",
      "{name} gets lit up on social media.",
    ];
    final template = (city == null ? dateFailOnline : dateFail).random;
    move(console.y + 1, 0);
    addstr(template, params: {"name": p.name});

    await getKey();

    return true;
  }

  for (int ei = d.dates.length - 1; ei >= 0; ei--) {
    Creature e = d.dates[ei];
    bool eIsSexworker = e.type.id == CreatureTypeIds.sexWorker;
    bool sameCity = e.location?.city == p.location?.city;
    int vacationPrice = eIsSexworker ? 2000 : 1000;
    erase();
    setColor(white);
    move(0, 0);
    mvaddstr(
      0,
      0,
      "Seeing {eName}, {typeName}, {location}",
      params: {
        "eName": e.name,
        "typeName": e.type.name,
        "location": e.workLocation.getName(short: false, includeCity: true),
      },
    );
    setColor(lightGray);
    printFunds();

    List<Item> temp = [];
    e.dropWeaponAndAmmo(lootPile: temp);
    e.giveArmor(Clothing("CLOTHING_CLOTHES"), temp);

    printCreatureInfo(e, showCarPrefs: ShowCarPrefs.onFoot);
    makeDelimiter();

    while (temp.isNotEmpty) {
      if (temp.last is Weapon) {
        e.giveWeapon(temp.last as Weapon, null);
      } //casts -XML
      else if (temp.last is Clothing) {
        e.giveArmor(temp.last as Clothing, null);
      } else if (e.weapon.acceptableAmmo.contains(temp.last.type)) {
        e.takeAmmo(temp.last as Ammo, null, temp.last.stackSize);
      }
      temp.removeAt(temp.length - 1);
    }

    mvaddstr(
      10,
      0,
      "How should {name} approach the situation?",
      params: {"name": p.name},
    );

    bool canPay100 =
        ledger.funds >= 100 &&
        p.clinicMonthsLeft == 0 &&
        (sameCity || eIsSexworker);
    String payText;
    if (sameCity) {
      if (eIsSexworker) {
        payText = "A - Pay \$100 for a night together.";
      } else {
        payText = LcsI18n.processString(
          "A - Spend a hundred bucks to take {firstName} out on the town.",
          {"firstName": e.name.split(' ').first},
        );
      }
    } else {
      if (eIsSexworker) {
        payText = "A - Pay \$100 for a one-on-one video call.";
      } else {
        payText = "A - There is no expectation to spend money on this date.";
      }
    }
    addOptionText(11, 0, "A", payText, enabledWhen: canPay100);

    bool canAvoidPaying = !eIsSexworker;
    String avoidPayingText;
    move(12, 0);
    if (eIsSexworker) {
      avoidPayingText = LcsI18n.processString(
        "B - {name} expects to be paid for {hisHer} time.",
        {"name": e.name, "hisHer": _translatePronoun(e.gender.hisHer)},
      );
    } else if (sameCity) {
      avoidPayingText =
          "B - Try to get through the evening without spending a penny.";
    } else {
      avoidPayingText = LcsI18n.processString(
        "B - Try to charm {himHer} with online dating.",
        {"himHer": _translatePronoun(e.gender.himHer)},
      );
    }
    addOptionText(12, 0, "B", avoidPayingText, enabledWhen: canAvoidPaying);

    bool canGoOnVacation =
        p.clinicMonthsLeft == 0 &&
        p.blood == p.maxBlood &&
        ledger.funds >= vacationPrice;
    String vacationText;
    if (p.blood == p.maxBlood) {
      if (sameCity) {
        vacationText = LcsI18n.processString(
          "C - Spend a week and {price} on a cheap vacation (stands up other dates).",
          {"price": vacationPrice.toString()},
        );
      } else {
        vacationText = LcsI18n.processString(
          "C - Spend {price} to visit {firstName} for a week (stands up other dates).",
          {
            "price": vacationPrice.toString(),
            "firstName": e.name.split(' ').first,
          },
        );
      }
    } else {
      vacationText = LcsI18n.processString(
        "C - Spend a week and {price} on a cheap vacation (must be uninjured).",
        {"price": vacationPrice.toString()},
      );
    }
    addOptionText(13, 0, "C", vacationText, enabledWhen: canGoOnVacation);

    addOptionText(14, 0, "D", "D - Break it off.");
    if (e.align == Alignment.conservative &&
        p.clinicMonthsLeft == 0 &&
        sameCity) {
      addOptionText(15, 0, "E", "E - Just kidnap the Conservative.");
    }

    int thingsincommon = countCommonInterests(p, e);
    while (true) {
      int c = await getKey();

      int aroll = p.skillRoll(Skill.seduction);
      int troll = e.attributeRoll(Attribute.wisdom, take10: true) + e.level;

      bool shouldDoDate = false;
      aroll += thingsincommon * 3;
      if (c == Key.a &&
          ledger.funds >= 100 &&
          p.clinicMonthsLeft == 0 &&
          (sameCity || eIsSexworker)) {
        ledger.subtractFunds(100, Expense.dating);
        aroll += lcsRandom(10);
        shouldDoDate = true;
      } else if (c == Key.b && !eIsSexworker) {
        shouldDoDate = true;
      }

      if (shouldDoDate) {
        int experience = lcsRandom(4) + 5;
        if (eIsSexworker) experience += 10;
        if (!sameCity) experience = max(1, experience ~/ 4);
        p.train(Skill.seduction, experience);
        for (Skill s in talkingSkills) {
          if (e.skill(s) >= 0) {
            if (e.skill(s) >= p.skill(s)) {
              p.train(s, e.skill(s));
            }
            troll += e.skill(s);
            aroll += p.skill(s);
          }
        }

        int y = 17;
        if (await dateResult(aroll, troll, d, e, p, y) == DateResult.arrested) {
          return true;
        }
        break;
      }

      if (c == Key.c &&
          ledger.funds >= vacationPrice &&
          p.clinicMonthsLeft == 0 &&
          p.blood == p.maxBlood) {
        ledger.subtractFunds(vacationPrice, Expense.dating);
        for (int e2 = d.dates.length - 1; e2 >= 0; e2--) {
          if (e2 == ei) continue;
          d.dates.removeAt(e2);
          ei = 0;
        }
        d.timeLeft = 7;

        for (Skill s in talkingSkills) {
          if (e.skill(s) >= 0) {
            if (e.skill(s) >= p.skill(s)) {
              p.train(s, e.skill(s) * 4);
            }
          }
        }
        return false;
      }
      if (c == Key.d) {
        d.dates.remove(e);
        break;
      }
      if (c == Key.e &&
          e.align == Alignment.conservative &&
          p.clinicMonthsLeft == 0 &&
          sameCity) {
        setColor(yellow);
        int bonus = 0;
        bool ranged = false;
        String weapon = "";
        bool unseriousWeapon = false;
        move(17, 0);
        String kidnapMessage;
        String warnMessage = "";

        if (p.weapon.type.rangedAttack != null) {
          weapon = p.weapon.getName(sidearm: true);
          kidnapMessage =
              "{pName} comes back from the bathroom toting the {weapon} and threatens to blow the Conservative's brains out!";
          bonus = 5;
          ranged = true;
        } else if (p.equippedWeapon != null) {
          weapon = p.weapon.getName(sidearm: true);
          if (p.weapon.type.canTakeHostages) {
            kidnapMessage =
                "{pName} grabs the Conservative from behind, holding the {weapon} to the corporate slave's throat!";
            bonus = 5;
          } else {
            kidnapMessage =
                "{pName} grabs the Conservative from behind, holding the {weapon} to the corporate slave's throat!";
            bonus = -1;
            unseriousWeapon = true;
          }
        } else {
          warnMessage = !noProfanity
              ? LcsI18n.tr("not to fuck around!")
              : LcsI18n.tr("not to [resist]!");
          kidnapMessage =
              "{pName} seizes {eName} from behind and warns {himHer} {warnMessage}";
          bonus += min(5, p.skill(Skill.martialArts) - 1);
        }
        mvaddstr(
          17,
          0,
          kidnapMessage,
          params: {
            "pName": p.name,
            "eName": e.name,
            "weapon": weapon,
            "himHer": _translatePronoun(e.gender.himHer),
            "warnMessage": warnMessage,
          },
        );

        await getKey();

        Future<void> successfulKidnap(int y) async {
          mvaddstr(
            y++,
            0,
            "{name} kidnaps the Conservative!",
            params: {"name": p.name},
          );

          await getKey();

          //Kidnapped wearing normal clothes and no weapon
          e.dropWeaponAndAmmo();
          Clothing clothes = Clothing("CLOTHING_CLOTHES");
          e.giveArmor(clothes, null);

          await kidnaptransfer(e, kidnapper: p);

          stats.kidnappings++;
          d.dates.remove(e);
        }

        // Kidnap probably succeeds if the conservative isn't very dangerous,
        // but fails 15 times as often if the conservative is tough stuff.
        if ((!e.type.kidnapResistant && lcsRandom(15) > 0) ||
            lcsRandom(2 + bonus) > 0) {
          int y = 19;
          setColor(lightGreen);
          move(y++, 0);
          if (bonus > 0) {
            addstr("{name} doesn't resist.", params: {"name": e.name});
          } else {
            addstr(
              "{name} struggles and yells for help, but nobody comes.",
              params: {"name": e.name},
            );
          }

          await getKey();

          await successfulKidnap(y);
          break;
        } else {
          int y = 19;
          setColor(red);
          move(y++, 0);
          if (ranged) {
            addstr(
              "{eName} brazenly tackles {pName}!",
              params: {"eName": e.name, "pName": p.name},
            );
          } else {
            addstr(
              "{eName} struggles and they both tumble to the ground!",
              params: {"eName": e.name},
            );
          }
          if (weapon != "") {
            await getKey();
            if (unseriousWeapon) {
              move(y++, 0);
              addstrc(
                yellow,
                "The {weapon} is knocked away uselessly.",
                params: {"weapon": weapon},
              );
            } else {
              move(y++, 0);
              addstrc(
                yellow,
                "The two struggle for control of the {weapon}!",
                params: {"weapon": weapon},
              );
            }
          }
          await getKey();

          int martialArtsDiff =
              p.skill(Skill.martialArts) - e.skill(Skill.martialArts);
          int strengthDiff =
              p.attribute(Attribute.strength) - e.attribute(Attribute.strength);
          int roll = Dice.r2d6.roll() + martialArtsDiff + strengthDiff;

          if (roll > Difficulty.easy) {
            // Success: Conservative kidnapped by winning the fight
            setColor(lightGreen);
            move(y++, 0);
            addstr(
              "{pName} overpowers {eName} after a struggle.",
              params: {"pName": p.name, "eName": e.name},
            );
            await getKey();
            await successfulKidnap(y);
            break;
          } else if (roll > Difficulty.automatic) {
            // Failure: Kidnap failed
            setColor(yellow);
            move(y++, 0);
            addstr(
              "{pName} breaks free after a wild struggle.",
              params: {"pName": p.name},
            );
            mvaddstr(y++, 0, "Unfortunately, the Conservative escapes...");

            // Charge with kidnapping
            p.wantedForCrimes[Crime.kidnapping] =
                p.wantedForCrimes[Crime.kidnapping]! + 1;

            await getKey();

            d.dates.remove(e);
            break;
          } else {
            // Critical failure: Kidnapper overpowered and arrested
            move(y++, 0);
            if (weapon != "" && !unseriousWeapon) {
              addstrc(
                red,
                "The Conservative manages to wrest the {weapon} away!",
                params: {"weapon": weapon},
              );
              move(y++, 0);
              await getKey();
              if (p.weapon.type.attacks.any((a) => a.bruises)) {
                addstr(
                  "{eName} swings the {weapon} and knocks {pName} out!",
                  params: {"eName": e.name, "weapon": weapon, "pName": p.name},
                );
              } else {
                addstr(
                  "{eName} switches grips and clubs {pName} in the head!",
                  params: {"eName": e.name, "pName": p.name},
                );
              }
            } else {
              addstrc(
                red,
                "{eName}'s fist is the last thing {pName} remembers seeing!",
                params: {"eName": e.name, "pName": p.name},
              );
              await getKey();
            }
            move(y++, 0);
            addstr("The Liberal wakes up in the police station...");

            // Find the police station
            Site? ps = findSiteInSameCity(
              p.location!.city,
              SiteType.policeStation,
            );

            // Arrest the Liberal
            p.squad = null;
            p.carId = null;
            p.location = ps;
            p.dropWeaponAndAmmo();
            p.activity = Activity.none();

            // Charge with kidnapping
            criminalize(p, Crime.kidnapping);

            await getKey();

            d.dates.remove(e);
            return true;
          }
        }
      }
    }
  }

  if (d.dates.isNotEmpty) {
    d.timeLeft = 0;
    return false;
  } else {
    return true;
  }
}

enum DateResult { meetTomorrow, breakup, joined, arrested }

// Handles the result of a date or vacation
Future<DateResult> dateResult(
  int aroll,
  int troll,
  DatingSession d,
  Creature e,
  Creature p,
  int y,
) async {
  bool eIsSexworker = e.type.id == CreatureTypeIds.sexWorker;
  if (eIsSexworker) {
    troll -= 10 + e.daysSinceJoined; // It's a commercial transaction
  } else if (e.location?.city != p.location?.city) {
    troll += 10; // It's a long-distance relationship
  }

  if (aroll > troll) {
    if (eIsSexworker) {
      troll += 30; // It's an *arm's length* commercial transaction
      // Slowly become more amenable to joining and less prone to getting bad vibes
      e.daysSinceJoined++;
    }
    setColor(lightBlue);
    move(y, 0);
    y++;
    if (eIsSexworker && !e.isWillingToTalk) {
      if (p.skill(Skill.seduction) >= p.skillCap(Skill.seduction)) {
        setColor(yellow);
        addstr(
          "{pName} has learned all {heshe} can from {eName}.",
          params: {
            "pName": p.name,
            "heshe": _translatePronoun(p.gender.heShe),
            "eName": e.name,
          },
        );
      } else {
        addstr(
          "{pName} still has more to learn from {eName}.",
          params: {"pName": p.name, "eName": e.name},
        );
      }
    } else {
      if (eIsSexworker) {
        addstr(
          "{eName} enjoys discussing {pName}'s unique life philosophy...",
          params: {"eName": e.name, "pName": p.name},
        );
      } else {
        addstr(
          "{eName} is quite taken with {pName}'s unique life philosophy...",
          params: {"eName": e.name, "pName": p.name},
        );
      }
    }

    await getKey();

    if (p.subordinatesLeft <= 0 && eIsSexworker && e.isWillingToTalk) {
      mvaddstrc(
        y++,
        0,
        yellow,
        "But {eName} doesn't like to get too emotionally attached.",
        params: {"eName": e.name},
      );

      mvaddstrc(
        y++,
        0,
        lightGray,
        "{pName} doesn't have the juice to recruit otherwise.",
        params: {"pName": p.name},
      );
      mvaddstr(
        y++,
        0,
        "This won't go anywhere, but it can continue for \"educational purposes\".",
        params: {},
      );
      e.isWillingToTalk = false;

      await getKey();

      return DateResult.meetTomorrow;
    } else if (p.relationshipsLeft <= 0 && !eIsSexworker) {
      setColor(yellow);

      move(y++, 0);
      int numRelationships = p.maxRelationships - p.relationshipsLeft;
      String relationshipAdjective = switch (numRelationships) {
        1 => "another",
        2 => "yet another",
        3 => "another",
        4 => "another",
        5 => "another",
        _ => "another",
      };
      relationshipAdjective = LcsI18n.tr(relationshipAdjective);
      addstr(
        "{pName} isn't seductive enough to maintain {adj} relationship.",
        params: {"pName": p.name, "adj": relationshipAdjective},
      );

      await getKey();
      setColor(lightGray);

      move(y++, 0);
      addstr("It was fun though. They agree to part ways amicably.");

      await getKey();

      d.dates.remove(e);

      return DateResult.breakup;
    }

    if (lcsRandom((aroll - troll) ~/ 2) > e.attribute(Attribute.wisdom) &&
        e.attribute(Attribute.wisdom) < 4 &&
        !(eIsSexworker && !e.isWillingToTalk)) {
      setColor(lightGreen);
      move(y, 0);
      y++;
      if (eIsSexworker) {
        addstr(
          "In fact, {eName} decides to put {hisHer} skills to work for the LCS!",
          params: {
            "eName": e.name,
            "hisHer": _translatePronoun(e.gender.hisHer),
          },
        );
        e.daysSinceJoined =
            0; // Reset to zero since we used this to track time dating
      } else if (e.align == Alignment.conservative) {
        addstr(
          "In fact, {eName} swears off Conservatism and begs to join the LCS!",
          params: {"eName": e.name},
        );
      } else if (e.align == Alignment.moderate) {
        addstr(
          "In fact, {eName} wants to join {pName} in the LCS!",
          params: {"eName": e.name, "pName": p.name},
        );
      } else {
        addstr(
          "In fact, {eName} is eager to fight alongside {pName}!",
          params: {"eName": e.name, "pName": p.name},
        );
      }

      //Get map of their workplace
      e.workSite?.mapped = true;
      e.workSite?.hidden = false;

      await getKey();

      if (!eIsSexworker) e.seduced = true;
      e.hireId = p.id;
      e.base = p.base;

      erase();

      setColor(white);
      move(0, 0);
      if (e.align != Alignment.liberal) {
        addstr("The Liberal Rebirth of ");
      } else {
        addstr("The Radicalization of ");
      }
      addstr(e.properName);

      move(2, 0);
      setColor(lightGray);
      addstr(
        "What name will you give to {name} in {possessive} new life?",
        params: {
          "name": e.properName,
          "possessive": _translatePronoun(e.gender.hisHer),
        },
      );
      move(3, 0);
      addstr(
        "If you do not enter anything, {subject} will keep {possessive} old name.",
        params: {
          "subject": _translatePronoun(e.gender.heShe),
          "possessive": _translatePronoun(e.gender.hisHer),
        },
      );

      e.name = await enterName(4, 0, e.properName, prefill: true);

      pool.add(e);

      await sleeperizePrompt(e, p, 8);

      stats.recruits++;
      d.dates.remove(e);

      //Check to determine if murderers are offended

      return DateResult.joined;
    } else {
      if (e.align == Alignment.conservative &&
          e.attribute(Attribute.wisdom) > e.attribute(Attribute.heart)) {
        setColor(lightGreen);
        y++;
        move(y++, 0);
        addstr(
          "{pName} is slowly warming {eName}'s frozen Conservative heart.",
          params: {"pName": p.name, "eName": e.name},
        );

        move(y++, 0);
        e.adjustAttribute(Attribute.wisdom, -1);
        e.adjustAttribute(Attribute.heart, 1);
      } else if (e.attribute(Attribute.wisdom) > 3) {
        e.adjustAttribute(Attribute.wisdom, -1);
      }
      //Possibly date reveals map of location
      else if (e.workSite?.mapped == false &&
          lcsRandom(e.attribute(Attribute.wisdom)) == 0) {
        y++;
        mvaddstr(
          y++,
          0,
          "{eName} turns the topic of discussion to the {siteName}.",
          params: {"eName": e.name, "siteName": e.workSite!.name},
        );
        mvaddstr(
          y++,
          0,
          "{pName} is able to create a map of the site from this information.",
          params: {"pName": p.name},
        );
        y++;
        e.workSite!.mapped = true;
        e.workSite!.hidden = false;
      }

      setColor(lightGray);
      move(y++, 0);
      if (eIsSexworker && !e.isWillingToTalk) {
        addstr("Lessons continue tomorrow.");
      } else {
        addstr("They'll meet again tomorrow.");
      }

      await getKey();

      return DateResult.meetTomorrow;
    }
  } else if (aroll == troll) {
    setColor(lightGray);
    move(y++, 0);
    String excuse = switch (lcsRandom(7)) {
      0 => "to wash {hisHer} hair.",
      1 => "due to an allergy attack.",
      2 => "due to an early meeting tomorrow.",
      3 => "to catch {hisHer} favourite TV show.",
      4 => "to take care of {hisHer} pet {pet}",
      5 => "to go to a birthday party.",
      6 => "to recharge {hisHer} cell phone.",
      _ => "to wash {hisHer} hair.",
    };
    excuse = LcsI18n.processString(excuse, {
      "hisHer": _translatePronoun(e.gender.hisHer),
      "pet": LcsI18n.tr(
        ["cat.", "dog.", "fish.", "six-legged pig."][lcsRandom(4)],
      ),
    });
    addstr(
      "{eName} had to leave early {excuse}",
      params: {"eName": e.name, "excuse": excuse},
    );
    move(y++, 0);
    addstr(
      "{heSheCap} did still promise to meet up again tomorrow.",
      params: {"heSheCap": _translateCapitalizedPronoun(e.gender.heSheCap)},
    );

    await getKey();

    return DateResult.meetTomorrow;
  } else {
    //WISDOM POSSIBLE INCREASE
    if (e.align == Alignment.conservative && aroll < troll / 2) {
      setColor(red);
      move(y++, 0);

      addstr(
        "Talking with {eName} actually curses {pName}'s mind with wisdom!!!",
        params: {"eName": e.name, "pName": p.name},
      );

      p.adjustAttribute(Attribute.wisdom, 1);

      for (Skill s in talkingSkills) {
        if (e.skill(s) > p.skill(s)) {
          p.train(s, 20 * e.skill(s));
        }
      }

      await getKey();
    }

    //BREAK UP
    bool reportingToPolice = e.type.reportsToPolice && lcsRandom(2) == 0;
    reportingToPolice = reportingToPolice || lcsRandom(50) == 0;
    if (p.isCriminal && reportingToPolice) {
      mvaddstrc(
        y++,
        0,
        red,
        "{eName} was leaking information to the police the whole time!",
        params: {"eName": e.name},
      );

      await getKey();

      move(y++, 0);
      Site? ps = findSiteInSameCity(p.location!.city, SiteType.policeStation);
      if (ps == null) {
        addstrc(
          lightGreen,
          "But there isn't a police station in {city}!",
          params: {"city": p.location!.city.name},
        );
        mvaddstr(
          y++,
          0,
          "Nobody comes to arrest {name}.",
          params: {"name": p.name},
        );
      } else if (!p.skillCheck(Skill.streetSmarts, Difficulty.hard)) {
        addstrc(purple, "{name} has been arrested.", params: {"name": p.name});

        p.squad = null;
        p.carId = -1;
        p.location = ps;
        p.dropWeaponAndAmmo();
        p.activity = Activity.none();

        await getKey();

        d.dates.remove(e);

        return DateResult.arrested;
      } else {
        setColor(lightGreen);
        addstr(
          "But {pName} cleverly escapes the police ambush!",
          params: {"pName": p.name},
        );
      }
    } else {
      int existingRelationships = p.relationships.length;
      if (eIsSexworker) {
        mvaddstrc(
          y++,
          0,
          purple,
          "{eName} picks up some weird vibes and decides to bail.",
          params: {"eName": e.name},
        );
        mvaddstr(y++, 0, "This will be the last visit.");
        move(y++, 0);
      } else if (existingRelationships > 0 && lcsRandom(2) > 0) {
        setColor(purple);
        move(y++, 0);
        addstr(
          "The date starts well, but {eName} has no patience for ",
          params: {"eName": e.name},
        );
        move(y++, 0);
        addstr("{pName}'s ", params: {"pName": p.name});
        switch (existingRelationships) {
          case 5:
            addstr("awe-inspiring ");
          case 4:
            addstr("mind-bending ");
          case 3:
            addstr("intricate ");
          case 2:
            addstr("complicated ");
          case 1:
            addstr("busy ");
          default:
            addstr("unbelievably complicated ");
        }
        addstr("schedule and prior relationships.");

        move(y++, 0);
        addstr("This relationship is over.");
      } else {
        setColor(purple);
        move(y++, 0);
        addstr(
          "{eName} can sense that things just aren't working out.",
          params: {"eName": e.name},
        );

        move(y++, 0);
        addstr("This relationship is over.");
      }
    }

    await getKey();

    d.dates.remove(e);

    return DateResult.breakup;
  }
}

Future<bool> completeVacation(DatingSession d, Creature p) async {
  Creature e = d.dates.first;
  bool eIsSexworker = e.type.id == CreatureTypeIds.sexWorker;

  erase();
  setColor(white);
  move(0, 0);
  mvaddstr(0, 0, "{name} is back from vacation.", params: {"name": p.name});

  int aroll = p.skillRoll(Skill.seduction, advantage: true);
  int troll = e.attributeRoll(Attribute.wisdom, take10: true) + e.level;

  p.train(Skill.seduction, lcsRandom(28) + 35);
  if (eIsSexworker) p.train(Skill.seduction, 100);

  int thingsincommon = countCommonInterests(p, e);
  aroll += thingsincommon * 3;

  for (Skill s in talkingSkills) {
    if (e.skill(s) >= 0) {
      if (e.skill(s) >= p.skill(s)) {
        p.train(s, e.skill(s));
      }
      troll += e.skill(s);
      aroll += p.skill(s);
    }
  }

  switch (await dateResult(aroll, troll, d, e, p, 2)) {
    case DateResult.breakup:
    case DateResult.joined:
    case DateResult.arrested:
      return true;
    case DateResult.meetTomorrow:
      return false;
  }
}

int countCommonInterests(Creature p, Creature e) {
  int commonInterests = 0;
  for (Skill s in Skill.values) {
    if (e.skill(s) >= 1 && p.skill(s) >= 1) {
      commonInterests++;
    }
  }
  return commonInterests;
}
