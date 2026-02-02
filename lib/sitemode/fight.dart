import 'dart:math';

import 'package:collection/collection.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/common_actions/common_actions.dart';
import 'package:lcs_new_age/common_display/print_party.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/body.dart';
import 'package:lcs_new_age/creature/conversion.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/dice.dart';
import 'package:lcs_new_age/creature/difficulty.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/attack.dart';
import 'package:lcs_new_age/items/clothing.dart';
import 'package:lcs_new_age/items/item.dart';
import 'package:lcs_new_age/items/money.dart';
import 'package:lcs_new_age/justice/crimes.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/sitemode/haul_kidnap.dart';
import 'package:lcs_new_age/sitemode/map_specials.dart';
import 'package:lcs_new_age/sitemode/site_display.dart';
import 'package:lcs_new_age/sitemode/sitemap.dart';
import 'package:lcs_new_age/talk/talk_in_combat.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

/* attack handling for each side as a whole */
Future<void> youattack(List<Creature> validTargets) async {
  bool wasAlarm = siteAlarm;

  for (Creature p in activeSquad!.livingMembers) {
    await squadMemberAttacks(p, wasAlarm, validTargets);
  }

  // Alarm enemies
  for (Creature e in validTargets) {
    if (e.alive && e.isEnemy) {
      siteAlarm = true;
      break;
    }
  }

  // Cover fire from allies when defending/escaping from a crowded safehouse
  if (activeSiteUnderSiege) {
    for (Creature p in pool) {
      if (!p.alive) continue;
      if (p.align != Alignment.liberal) continue;
      if (p.squad == activeSquad) continue;
      if (p.location != activeSite) continue;

      Attack? chosenAttack = p.getAttack(true, false, false);
      if (chosenAttack != null) {
        await squadMemberAttacks(p, wasAlarm, validTargets);
      }
    }
  }
}

Future<void> squadMemberAttacks(
  Creature p,
  bool wasAlarm,
  List<Creature> validTargets,
) async {
  // Categorize npcs into danger levels
  List<Creature> superEnemies = [];
  List<Creature> dangerousEnemies = [];
  List<Creature> enemies = [];
  List<Creature> nonEnemies = [];
  for (Creature e in validTargets) {
    if (e.alive) {
      if (e.isEnemy &&
          ((!e.nonCombatant && !e.calculateWillRunAway()) ||
              e.type.majorEnemy)) {
        if (e.type.tank && e.stunned == 0) {
          superEnemies.add(e);
        } else if ((e.attack.socialDamage || e.attack.damage > 20) &&
            e.blood >= e.maxBlood * 0.4 &&
            e.stunned == 0) {
          dangerousEnemies.add(e);
        } else {
          enemies.add(e);
        }
      } else {
        nonEnemies.add(e);
      }
    }
  }

  // Intimidate if no enemies present who aren't fleeing
  if (superEnemies.isEmpty &&
      dangerousEnemies.isEmpty &&
      enemies.isEmpty &&
      mode != GameMode.carChase) {
    if (validTargets.any((e) => e.isEnemy && e.alive)) {
      await intimidate(p);
    }
    return;
  }

  // Select one of the most dangerous enemies to attack
  Creature target;
  if (superEnemies.isNotEmpty && !p.attack.socialDamage) {
    target = superEnemies.random;
  } else if (dangerousEnemies.isNotEmpty) {
    target = dangerousEnemies.random;
  } else if (enemies.isNotEmpty) {
    target = enemies.random;
  } else if (superEnemies.isNotEmpty) {
    target = superEnemies.random;
  } else if (validTargets.isNotEmpty) {
    target = validTargets.random;
  } else {
    return; // No valid targets to attack
  }

  // <1% chance for the LCS to accidentally hit bystanders
  bool mistake = false;
  if (nonEnemies.isNotEmpty && oneIn(100 + p.skill(p.attack.skill) * 10)) {
    target = nonEnemies.random;
    mistake = true;
  }

  // Resolve attack on target
  bool attacked = await attack(p, target, mistake);

  if (attacked) {
    // Add juice, drama, size crime
    if (mistake) {
      siteCrime += 10;
    } else {
      siteCrime += 3;
      addjuice(p, 1, 200);
    }
    if (!p.weapon.type.musicalAttack) {
      addDramaToSiteStory(Drama.attacked);
      if (p.weapon.isCurrentlyLegal && p.weapon.isAGun) {
        addDramaToSiteStory(Drama.legalGunUsed);
      } else if (p.weapon.isAGun) {
        addDramaToSiteStory(Drama.illegalGunUsed);
      }
      // Charge with assault if first strike
      addPotentialCrime([p], Crime.assault, reasonKey: target.id.toString());
    } else {
      addPotentialCrime(
        [p],
        Crime.disturbingThePeace,
        reasonKey: target.id.toString(),
      );
    }
  }

  // Dead foes drop loot, removed from encounter, grant bonus juice
  if (!target.alive && target.align == Alignment.conservative) {
    if (mode == GameMode.site) makeLoot(target, groundLoot);
    encounter.remove(target);
    validTargets.remove(target);
    if (!mistake) {
      for (Creature p in squad) {
        addjuice(p, 5, 500);
      }
    }
  }
}

const List<String> escapeCrawling = [
  " crawls off moaning...",
  " crawls off whimpering...",
  " crawls off trailing blood...",
  " crawls off screaming...",
  " crawls off crying...",
  " crawls off sobbing...",
  " crawls off whispering...",
  " crawls off praying...",
  " crawls off cursing...",
];
const List<String> escapeRunning = [
  " makes a break for it!",
  " escapes crying!",
  " runs away!",
  " gets out of there!",
  " runs hollering!",
  " bolts out of there!",
  " runs away screaming!",
];
const List<String> cowerInCombat = [
  " cowers in fear.",
  " cowers in the corner.",
  " stays in cover.",
  " looks around in panic.",
  " stays low to the ground.",
];

Future<void> enemyattack(List<Creature> possibleEnemies) async {
  for (int i = possibleEnemies.length - 1; i >= 0; i--) {
    Creature e = possibleEnemies[i];
    e.justAttacked = false;
    if (!e.alive) continue;

    // Moderate bouncers are converted to conservatives
    if (siteAlarm &&
        e.type.id == CreatureTypeIds.bouncer &&
        e.align != Alignment.liberal) {
      conservatize(e);
    }
    // Enemies notice you and become unwilling to talk
    if (e.isEnemy) {
      e.noticedParty = true;
      e.isWillingToTalk = false;
    }

    // Fleeing npcs escape
    if (mode != GameMode.carChase) {
      bool runsAway = e.calculateWillRunAway() || e.nonCombatant;
      if (mode == GameMode.carChase) runsAway = false;
      if (e.cantRunAway) runsAway = false;

      if (runsAway && e.body is HumanoidBody) {
        clearMessageArea();

        final escapeMessage = (e.body.legok < 2 || e.blood < e.maxBlood * 0.45)
            ? escapeCrawling.random
            : escapeRunning.random;
        mvaddstrc(
          9,
          1,
          white,
          "{name} $escapeMessage",
          params: {"name": e.name},
        );

        encounter.remove(e);
        possibleEnemies.remove(e);
        if (activeSiteUnderSiege) activeSite!.siege.kills++;

        printParty();
        printEncounter();

        await getKey();

        continue;
      } else if (e.nonCombatant && e.cantRunAway) {
        if (await incapacitated(e, false)) {
          e.incapacitatedThisRound = true;
        } else if (e.equippedWeapon != null) {
          clearMessageArea();
          mvaddstrc(
            9,
            1,
            white,
            "{name} ${cowerInCombat.random}",
            params: {"name": e.name},
          );
          await getKey();
        }
        continue;
      }
    }

    // Categorize targets into good and bad buckets
    List<Creature> goodtarg = [];
    List<Creature> badtarg = [];
    if (e.isEnemy) {
      for (Creature p in squad) {
        if (p.alive) goodtarg.add(p);
      }
      for (Creature e2 in encounter) {
        if (e2.alive && e2 != e) {
          if (!activeSiteUnderSiege) {
            badtarg.add(e2);
          } else {
            if (e2.isEnemy) {
              badtarg.add(e2);
            } else {
              goodtarg.add(e2);
            }
          }
        }
      }
    } else {
      for (Creature e2 in possibleEnemies) {
        if (e2.alive && e2.isEnemy && !e2.nonCombatant && e2.stunned <= 0) {
          goodtarg.add(e2);
        } else if (e2.alive && e2 != e) {
          badtarg.add(e2);
        }
      }
    }

    // Take no action if nobody they want to attack is present
    if (goodtarg.isEmpty) return;

    Creature target = goodtarg.random;

    // If the attack will be a social attack, it can't have friendly fire
    bool canmistake = true;
    if (e.attack.socialDamage) canmistake = false;
    if (!e.attack.ranged) canmistake = false;
    if (mode == GameMode.carChase) canmistake = false;

    if (canmistake) {
      // Resolve hits on hostages and hauled liberals
      if (e.isEnemy && target.prisoner != null && oneIn(2)) {
        await attack(e, target.prisoner!, true);
        if (!target.prisoner!.alive) {
          if (target.prisoner!.align != Alignment.liberal ||
              target.prisoner!.body.fellApart) {
            CreatureType prisonerType = target.prisoner!.type;

            if (prisonerType.majorEnemy) {
              siteCrime += 30;
            }

            makeLoot(target.prisoner!, groundLoot);

            String bodyDesc = target.prisoner!.body.fellApart
                ? "the bloody mess"
                : "{name}'s body";

            await encounterMessage(
              "{attacker} drops {body}",
              params: {"attacker": target.name, "body": bodyDesc},
            );
            target.prisoner = null;
          }
        }
        continue;
      }

      // Resolve friendly fire and neutrals caught in the crossfire
      if (oneIn(10 * e.weaponSkill + 10) && badtarg.isNotEmpty) {
        target = badtarg.random;
        if (target.justConverted) {
          await attack(e, target, false);
        } else {
          await attack(e, target, true);
        }
        if (!target.alive) {
          if (mode == GameMode.site) makeLoot(target, groundLoot);
          encounter.remove(target);
          possibleEnemies.remove(target);
        }
        continue;
      }
    }

    // Resolve attack on the intended target
    await attack(e, target, false);
    if (!target.alive && encounter.contains(target)) {
      if (mode == GameMode.site) makeLoot(target, groundLoot);
      encounter.remove(target);
      possibleEnemies.remove(target);
    }
  }
}

/* attack handling for an individual creature and its target */
Future<bool> attack(
  Creature a,
  Creature t,
  bool mistake, {
  bool forceMelee = false,
}) async {
  bool targetInSquad = t.squad == activeSquad && t.align == Alignment.liberal;
  bool targetIsLeader = targetInSquad && t.boss == null;

  clearMessageArea();
  setColor(a.align.color);

  //INCAPACITATED
  a.incapacitatedThisRound = false;
  if (await incapacitated(a, false)) {
    a.incapacitatedThisRound = true;
    a.justAttacked = false;
    return false;
  } else {
    a.justAttacked = true;
    a.cantRunAway = true;
  }

  //RELOAD
  if ((a.willReload(mode == GameMode.carChase, forceMelee) ||
          a.hasThrownWeapon) &&
      !forceMelee) {
    move(9, 1);
    if (a.hasThrownWeapon) {
      a.readyAnotherThrowingWeapon();
      addstr(
        "{name} readies another {weapon}.",
        params: {"name": a.name, "weapon": a.weapon.getName()},
      );
    } else {
      a.reload(true);
      addstr("{name} reloads.", params: {"name": a.name});
    }

    printParty();
    printEncounter();

    await getKey();

    return false;
  }
  bool forceRanged = mode == GameMode.carChase;
  bool canSocialAttack =
      (a.align == Alignment.liberal || encounter.length < ENCMAX) &&
      !forceRanged;
  bool forceNoReload = forceMelee || !a.canReload();
  Attack? attackUsed = a.getAttack(
    forceRanged,
    forceMelee,
    forceNoReload,
    allowSocial: canSocialAttack,
  );

  if (attackUsed == null) return false; // No viable attack to use, so don't

  if (attackUsed.socialDamage) {
    if (a.align == Alignment.liberal || encounter.length < ENCMAX) {
      return socialAttack(a, t, attackUsed);
    }
  }

  bool melee = !attackUsed.ranged && !attackUsed.socialDamage;
  bool sneakAttack = false;
  bool addNastyOff = false;
  bool addStun = false;
  bool addAutoConvert = false;
  bool torsoOnly = false;
  int maxNumberOfAttacks = attackUsed.numberOfAttacks;
  double damageMultiplier = 1;

  mvaddstr(9, 1, "{name} ", params: {"name": a.name});
  if (mistake) addstr("MISTAKENLY ");
  if (a.weapon.type.idName == "WEAPON_NONE") {
    int result = a.skillRoll(Skill.martialArts);
    if (a.body is HumanoidBody) {
      if (result < Difficulty.easy) {
        addstr("flails at");
        maxNumberOfAttacks = 1;
        damageMultiplier = 0.5;
      } else if (result < Difficulty.average) {
        addstr("punches");
        maxNumberOfAttacks = 1;
        damageMultiplier = 1;
      } else if (result < Difficulty.hard) {
        addstr("kicks");
        maxNumberOfAttacks = 1;
        damageMultiplier = 1;
      } else if (result < Difficulty.mythic) {
        switch (lcsRandom(3)) {
          case 0:
            addstr("pummels");
            maxNumberOfAttacks = 6;
            damageMultiplier = 1;
          case 1:
            addstr("combos");
            maxNumberOfAttacks = 4;
            damageMultiplier = 2;
          case 2:
            addstr("jump kicks");
            maxNumberOfAttacks = 1;
            damageMultiplier = 5;
        }
      } else {
        switch (lcsRandom(9)) {
          case 0:
            addstr(
              "unleashes {gender_his_her} Stand on",
              params: {"gender_his_her": a.gender.hisHer},
            );
            maxNumberOfAttacks = 12;
            damageMultiplier = 1.5;
          case 1:
            addstr("launches a flurry of kicks at");
            maxNumberOfAttacks = 8;
            damageMultiplier = 2;
          case 2:
            addstr("slows time and touches");
            addNastyOff = true;
            maxNumberOfAttacks = 1;
            damageMultiplier = 12;
          case 3:
            addstr("leaps into the air and descends upon");
            maxNumberOfAttacks = 3;
            damageMultiplier = 5;
          case 4:
            addstr("suddenly appears behind");
            maxNumberOfAttacks = 4;
            damageMultiplier = 4;
          case 5:
            addstr("hurls a ball of energy at");
            addNastyOff = true;
            maxNumberOfAttacks = 1;
            damageMultiplier = 12;
          case 6:
            addstr("throws a stunning palm strike at");
            addStun = true;
            maxNumberOfAttacks = 1;
            damageMultiplier = 0.5;
          case 7:
            addstr("leaps into a spinning kick against");
            maxNumberOfAttacks = 2;
            damageMultiplier = 6;
          case 8:
            addstr("delivers the Bleeding Heart punch to");
            addAutoConvert = true;
            torsoOnly = true;
            maxNumberOfAttacks = 1;
            damageMultiplier = 0;
        }
      }
    } else if (a.weapon.typeName == "WEAPON_BITE") {
      addstr("lunges with fangs out at");
      maxNumberOfAttacks = 1;
      damageMultiplier = 1;
    } else {
      addstr("attacks");
      maxNumberOfAttacks = 1;
      damageMultiplier = 1;
    }
  } else {
    if (attackUsed.canBackstab && a.align == Alignment.liberal && !mistake) {
      if (!t.noticedParty && !siteAlarm) {
        sneakAttack = true;
        addstr("sneaks up on");
        if (siteAlarmTimer > 10 || siteAlarmTimer < 0) siteAlarmTimer = 10;
        t.noticedParty = true;
        t.isWillingToTalk = false;
      }
    }

    if (!sneakAttack) {
      addstr(attackUsed.attackDescription.random);
      siteAlarm = true;
    }
  }

  addstr(" {name}", params: {"name": t.name});

  if (a.equippedWeapon != null && !attackUsed.thrown) {
    addstr(
      " with a {weapon}",
      params: {"weapon": a.weapon.getName(primary: true)},
    );
  }
  addstr("!");

  await getKey();

  int bonus =
      0; // Accuracy bonus or penalty that does NOT affect damage or counterattack chance

  //SKILL EFFECTS
  Skill wsk = attackUsed.skill;

  // Basic roll
  int aroll = a.skillRoll(wsk, dice: Dice.d20);
  int droll = t.skill(Skill.dodge);
  if (attackUsed.ranged) {
    droll += 10;
  } else {
    droll += t.attribute(Attribute.agility);
  }
  if (mode == GameMode.carChase) {
    droll = 0;
    if (t.car != null && a.car != null) {
      int tDistance = chaseSequence?.enemyCarDistance[t.car!] ?? 0;
      int aDistance = chaseSequence?.enemyCarDistance[a.car!] ?? 0;
      int difference = (tDistance - aDistance).abs();
      droll = difference + lcsRandom(difference) + 5;
    }
    a.train(wsk, droll + 5);
  } else {
    if (sneakAttack) {
      droll = t.attribute(Attribute.wisdom);
      if (siteAlarmTimer == 0) {
        droll += DifficultyModifier.aLotHarder;
      }
      // Current tile bloody? People are more on guard
      if (mode == GameMode.site) {
        if (levelMap[locx][locy][locz].megaBloody) {
          droll += DifficultyModifier.aLotHarder;
        } else if (levelMap[locx][locy][locz].bloody) {
          droll += DifficultyModifier.moderatelyHarder;
        }
      }
      aroll += a.skill(Skill.stealth);
      a.train(Skill.stealth, 10);
      a.train(wsk, 10);
    } else {
      t.train(Skill.dodge, aroll * 2);
      a.train(wsk, droll * 2 + 5);
    }
  }

  // Hostages interfere with attack
  if (t.prisoner != null) bonus -= lcsRandom(10);
  if (a.prisoner != null) aroll -= lcsRandom(10);

  //Injured people suck at attacking, are like fish in a barrel to attackers
  aroll = healthmodroll(aroll, a);
  if (mode != GameMode.carChase) {
    droll = healthmodroll(droll, t);
  }

  // If in a foot chance, double the debilitating effect of injuries
  if (mode == GameMode.footChase) {
    aroll = healthmodroll(aroll, a);
    droll = healthmodroll(droll, t);
  }

  // Prevent negative rolls
  if (aroll < 0) aroll = 0;
  if (droll < 0) droll = 0;

  // Weapon accuracy bonuses and penalties
  bonus += attackUsed.accuracyBonus;

  //USE BULLETS
  int bursthits = 0; // Tracks number of hits.

  int thrownweapons =
      0; // Used by thrown weapons to remove the weapons at the end of the turn if needed

  if (a.weapon.typeName == "WEAPON_NONE") //Move into WEAPON_NONE -XML
  {
    // Martial arts multi-strikes
    if (maxNumberOfAttacks == 1) {
      bursthits = 1;
    } else {
      bursthits =
          maxNumberOfAttacks ~/ 2 +
          lcsRandom((a.skill(Skill.martialArts) - maxNumberOfAttacks) ~/ 3 + 1);
    }
    if (bursthits > maxNumberOfAttacks) bursthits = maxNumberOfAttacks;
    if (!a.human) {
      bursthits = 1; // Whoops, must be human to use martial arts fanciness
    }
  } else {
    if (mode == GameMode.site &&
        lcsRandom(100) < (attackUsed.fire?.chanceCausesDebris ?? 0)) {
      activeSite!.changes.add(
        SiteTileChange(locx, locy, locz, SITEBLOCK_DEBRIS),
      );
    }
    if (mode == GameMode.site &&
        lcsRandom(100) < (attackUsed.fire?.chance ?? 0)) {
      // Fire!
      if (!levelMap[locx][locy][locz].burning ||
          !levelMap[locx][locy][locz].debris) {
        levelMap[locx][locy][locz].setFlag(SITEBLOCK_FIRE_START, true);
        siteCrime += 3;
        addjuice(a, 5, 500);
        if (!activeSiteUnderSiege && squad.contains(a)) {
          addPotentialCrime(squad, Crime.arson, reasonKey: "fire");
          addDramaToSiteStory(Drama.arson);
        }
      }
    }

    for (int i = 0; i < maxNumberOfAttacks; i++) {
      if (attackUsed.usesAmmo) {
        if (a.weapon.ammo > 0) {
          a.weapon.ammo -= 1;
        } else {
          break;
        }
      } else if (attackUsed.thrown) {
        if (((a.spareAmmo?.stackSize ?? 0) + 1) - thrownweapons > 0) {
          thrownweapons++;
        } else {
          break;
        }
      }

      if (sneakAttack) {
        bursthits = 1; // Backstab only hits once
        break;
      }
      // Each shot in a burst is increasingly less likely to hit
      int recoil = attackUsed.successiveAttacksDifficulty * i;
      if (attackUsed.usesAmmo) {
        recoil += (a.weapon.loadedAmmoType?.recoil ?? 0) * i;
      }
      if (aroll + bonus - recoil > droll &&
          a.skill(wsk) >= attackUsed.successiveAttacksDifficulty * i) {
        bursthits++;
      }
    }
  }

  if (aroll + bonus > droll &&
      attackUsed.damage > t.blood &&
      targetIsLeader &&
      mode != GameMode.carChase) {
    // If the attack has a high chance of killing the target, and the target
    // is the leader, find a liberal to jump in front of the bullet
    for (Creature alternate in squad) {
      if (alternate == t) continue;
      if (alternate.attribute(Attribute.heart) > 8 &&
          alternate.attribute(Attribute.agility) > 4) {
        clearMessageArea();
        String adverb = !t.alive ? " misguidedly" : " heroically";
        mvaddstrc(
          9,
          1,
          lightGreen,
          "{name1}{adverb} shields {name2}{corpse}",
          params: {
            "name1": alternate.name,
            "adverb": adverb,
            "name2": t.name,
            "corpse": !t.alive ? "'s corpse!" : "!",
          },
        );

        //Instant juice!! Way to take the bullet!!
        addjuice(alternate, 10, 1000);
        await getKey();

        t = alternate;
        break;
      }
    }
  }

  move(10, 1);
  debugPrint("${a.name} rolls $aroll + $bonus, ${t.name} rolls $droll");
  BodyPart? hitPart;
  BodyPart? rollHitLocation() {
    Map<BodyPart, int> weights = {};
    for (BodyPart p in t.body.parts) {
      if (p.missing) continue;
      if (p.immuneInCar && mode == GameMode.carChase) {
        continue;
      }
      int size = p.size;
      if (sneakAttack) {
        if (p.weakSpot) size *= 4;
        if (!p.critical) continue;
      }
      if (aroll + bonus > droll + 20) {
        if (!p.weakSpot) continue;
      }
      if (aroll + bonus > droll + 15) {
        if (!p.critical) continue;
      }
      if (aroll + bonus > droll + 10) {
        if (p.weakSpot) size *= 2;
        if (p.critical) size *= 2;
      } else if (aroll + bonus > droll + 5) {
        if (p.critical && !p.weakSpot) size *= 2;
      } else {
        if (p.weakSpot) continue;
      }
      weights[p] = size;
    }
    if (weights.isNotEmpty) {
      return lcsRandomWeighted(weights);
    } else if (t.body.parts.isNotEmpty) {
      return t.body.parts.random;
    }
    return null;
  }

  hitPart = rollHitLocation();
  if (torsoOnly) {
    hitPart = t.body.parts.firstWhere((p) => p.critical && !p.weakSpot);
  }

  if (hitPart != null && aroll + bonus > droll) {
    //HIT!
    // Build the target description based on conditions
    String targetDescTemplate;
    Map<String, dynamic> targetDescParams = {};
    if (addAutoConvert) {
      targetDescTemplate = "";
    } else if (t.clothing.covers(hitPart)) {
      if (hitPart.weakSpot && t.human) {
        if (t.clothing.headArmor > 4) {
          targetDescTemplate = "{name}'s helmet";
          targetDescParams = {"name": t.name};
        } else {
          targetDescTemplate = "{name}'s {part}";
          targetDescParams = {
            "name": t.name,
            "part": hitPart.name.toLowerCase(),
          };
        }
      } else if (hitPart.critical && t.clothing.bodyArmor > 4 && t.human) {
        targetDescTemplate = "{name}'s {armor}";
        targetDescParams = {
          "name": t.name,
          "armor":
              t.clothing.armor?.name.split(",").first.toLowerCase() ?? "armor",
        };
      } else if (t.clothing.getLimbArmor(hitPart) > 4) {
        targetDescTemplate = "{name}'s {part} armor";
        targetDescParams = {"name": t.name, "part": hitPart.name.toLowerCase()};
      } else {
        targetDescTemplate = "{name}'s {part}";
        targetDescParams = {"name": t.name, "part": hitPart.name.toLowerCase()};
      }
    } else {
      targetDescTemplate = "{part}";
      targetDescParams = {"part": hitPart.name.toLowerCase()};
    }
    String targetDesc = LcsI18n.format(targetDescTemplate, targetDescParams);

    // Build the action and multiple hits description
    String actionTemplate;
    String actionParams = "";
    String multiHitDesc = "";
    if (addAutoConvert) {
      actionTemplate = " punches the {ism} out of {name}";
      actionParams = LcsI18n.format("", {"ism": t.align.ism, "name": t.name});
    } else if (sneakAttack) {
      actionTemplate = " stabs {target}";
      actionParams = targetDesc;
    } else if (bursthits == 1 || attackUsed.ranged) {
      actionTemplate = " hits {target}";
      actionParams = targetDesc;
    } else {
      actionTemplate = " hits {target}";
      actionParams = targetDesc;
    }

    // show multiple hits
    if (attackUsed.alwaysDescribeHit || bursthits > 1) {
      String multiHit = switch (bursthits) {
        1 => "",
        2 => " twice",
        3 => " three times",
        4 => " four times",
        5 => " five times",
        _ => " {times} times",
      };
      if (bursthits > 1 && !attackUsed.ranged && !addAutoConvert) {
        actionTemplate = "{attacker} strikes true on {target}";
        actionParams = LcsI18n.format("", {
          "attacker": a.name,
          "target": targetDesc,
        });
      }
      multiHitDesc = LcsI18n.processString(", {description}{hit}", {
        "description": attackUsed.hitDescription,
        "hit": multiHit,
      });
    }

    String fullMessage = LcsI18n.processString(
      "{attacker}{action}{multiHitDesc}",
      {
        "attacker": a.name,
        "action": LcsI18n.format(actionTemplate, {"target": actionParams}),
        "multiHitDesc": multiHitDesc,
      },
    );
    if (addAutoConvert) {
      addstr("{message}!", params: {"message": fullMessage});
    } else {
      addstr("{message}.", params: {"message": fullMessage});
    }
    await getKey();

    bool aliveBefore = t.alive;
    for (int i = 0; i < bursthits; i++) {
      await hit(
        a,
        t,
        attackUsed,
        hitPart!,
        sneakAttack,
        addNastyOff,
        damageMultiplier,
      );
      if (hitPart.critical && addStun) {
        t.stunned = 10;
      } else if (addStun) {
        t.stunned = 1;
      }
      if (addAutoConvert && !t.type.tank) {
        void swapAttributes(Attribute a, Attribute b) {
          int aValue = t.rawAttributes[a]!;
          int bValue = t.rawAttributes[b]!;
          t.rawAttributes[a] = bValue;
          t.rawAttributes[b] = aValue;
        }

        if (a.align == Alignment.conservative) {
          if (t.rawAttributes[Attribute.heart]! >
              t.rawAttributes[Attribute.wisdom]!) {
            swapAttributes(Attribute.heart, Attribute.wisdom);
          }
          if (!encounter.contains(t)) encounter.add(t);
          pool.remove(t);
          conservatize(t);
          t.noticedParty = true;
          t.isWillingToTalk = true;
        } else if (a.align == Alignment.liberal) {
          if (t.rawAttributes[Attribute.wisdom]! >
              t.rawAttributes[Attribute.heart]!) {
            swapAttributes(Attribute.heart, Attribute.wisdom);
          }
          liberalize(t);
          t.isWillingToTalk = true;
        }
        t.justConverted = true;
        printEncounter();
      }
      if (!attackUsed.ranged) hitPart = rollHitLocation();
      if (torsoOnly) {
        hitPart = t.body.parts.firstWhere((p) => p.critical && !p.weakSpot);
      }
      if (hitPart == null) break;
    }

    if (aliveBefore && !t.alive && t.squad == null) {
      printParty();
      printEncounter();
      addDeathMessage(t);
      await getKey();
    }
  } else {
    setColor(white);

    if (melee &&
        aroll < droll - 10 &&
        t.blood > 70 &&
        t.human &&
        t.getAttack(false, true, true) != null) {
      mvaddstr(
        10,
        1,
        "{name} knocks the blow aside and counters!",
        params: {"name": t.name},
      );
      await getKey();
      await attack(t, a, false, forceMelee: true);
    } else {
      move(10, 1);
      if (sneakAttack) {
        addstr(
          [
            "{name} notices at the last moment!",
            "{name} notices before the attack connects!",
            "{name} spins and blocks the attack!",
            "{name} jumps back and cries out in alarm!",
          ].random,
          params: {"name": t.name},
        );
        siteAlarm = true;
      } else if (mode == GameMode.carChase) {
        final carChaseResult = [
          "misses!",
          "goes wide!",
          "hits the car!",
          "hits the road!",
          "hits the sidewalk!",
          "hits a building!",
          "hits a tree!",
          "hits a parked car!",
          "ricochets off the car!",
          "ricochets off the road!",
          "is too high!",
        ].random;
        addstr(
          "{name}'s shot {result}",
          params: {"name": a.name, "result": carChaseResult},
        );
      } else if (t.skillCheck(
        Skill.dodge,
        Difficulty.average,
      )) //Awesome dodge or regular one?
      {
        final dodgeMessage = [
          "dodges the attack!",
          "leaps out of the way!",
          "does the Matrix dodge!",
          "sidesteps the attack!",
          "dodges into cover!",
        ].random;
        addstr(
          "{name} {action}",
          params: {"name": t.name, "action": dodgeMessage},
        );
      } else {
        addstr("{name} misses.", params: {"name": a.name});
      }

      printParty();
      printEncounter();

      await getKey();
    }
  }

  for (; thrownweapons > 0; thrownweapons--) {
    if (a.hasThrownWeapon) a.readyAnotherThrowingWeapon();
    a.dropWeapon();
  }

  return true;
}

/* modifies a combat roll based on the creature's critical injuries */
int healthmodroll(int aroll, Creature a) {
  return aroll - lcsRandom(a.body.combatRollModifier * 2);
}

/* adjusts attack damage based on armor, other factors */
int damagemod(
  Creature t,
  Attack attackUsed,
  int damamount,
  BodyPart hitlocation,
  double mod,
) {
  debugPrint("Damage mod: $mod, damage before application: $damamount");

  if (mod < 0) {
    damamount = (damamount / (1.0 - 1.0 * mod)).round();
    debugPrint("Damage reduced to $damamount");
  } else if (mod >= 0) {
    damamount = (damamount * (1.0 + 0.2 * mod)).round();
    debugPrint("Damage increased to $damamount");
  }

  if (damamount < 0) damamount = 0;

  return damamount;
}

Future<void> hit(
  Creature a,
  Creature t,
  Attack attackUsed,
  BodyPart hitPart,
  bool sneakAttack,
  bool addNastyOff,
  double damageMultiplier,
) async {
  if (hitPart.missing) return;
  String str = "";
  int damamount = 0;
  SeverType severtype = attackUsed.severType;

  severtype = attackUsed.severType;
  if (addNastyOff) severtype = SeverType.nasty;
  int random = (attackUsed.damage * 0.8).round();
  int fixed = (attackUsed.damage * 0.2).round();
  if (sneakAttack) fixed += 100;
  //debugPrint("Random: $random, fixed: $fixed, hits: $bursthits");
  //debugPrint("Initial damage roll: $damamount");

  // Damage bonus from high skill, strength
  double mod = 0;
  if (!attackUsed.ranged) {
    double strength = a.attribute(Attribute.strength).toDouble();
    mod += strength;
  }

  int bursthits = a.weapon.loadedAmmoType?.multihit ?? 1;
  if (attackUsed.cartridge != a.weapon.loadedAmmoType?.cartridge) bursthits = 1;
  bool bruiseOnly = true;
  for (int i = 0; i < bursthits; i++) {
    int hitDamage = lcsRandom(random) + fixed;
    hitDamage = (hitDamage * damageMultiplier).round();
    hitDamage = damagemod(t, attackUsed, hitDamage, hitPart, mod);

    // Armor
    int externalArmor = t.clothing.getArmorForLocation(hitPart);
    int internalArmor = hitPart.naturalArmor;
    int totalArmor = internalArmor + externalArmor;
    if (totalArmor > 0) {
      int armorDamage = max((hitDamage * 0.3).round(), 1);
      int blocked = min(totalArmor, hitDamage);
      if (totalArmor < hitDamage) {
        bruiseOnly = false;
      }
      if (attackUsed.bruises && !attackUsed.bleeds) {
        hitDamage -= (blocked * 0.5).floor();
      } else {
        hitDamage -= (blocked * 0.8).floor();
      }
      if (armorDamage > 0) {
        int externalDamage = min(armorDamage, externalArmor);
        int internalDamage = min(armorDamage - externalDamage, internalArmor);
        t.clothing.damageArmorInLocation(hitPart, externalDamage);
        hitPart.naturalArmor -= internalDamage;
      }
    } else {
      bruiseOnly = false;
    }
    damamount += hitDamage;
  }

  if (damamount > 0) {
    Creature target = t;

    if (bruiseOnly) {
      hitPart.bruised = true;
    } else {
      if (attackUsed.bleeds) {
        hitPart.bleeding += 1;
      }
      hitPart.cut = attackUsed.cuts;
      hitPart.torn = attackUsed.tears;
      hitPart.shot = attackUsed.shoots;
      hitPart.burned = attackUsed.burns;
      hitPart.bruised = attackUsed.bruises;
    }

    int severamount = (hitPart.relativeHealth * t.maxBlood + t.maxBlood)
        .round();
    if (hitPart.critical) {
      severamount += t.maxBlood * 2;
    }

    if (severtype != SeverType.none &&
        damamount >= severamount &&
        !bruiseOnly) {
      String NAME = // ignore: non_constant_identifier_names
      t.name
          .toUpperCase();
      String PART = // ignore: non_constant_identifier_names
      hitPart.name
          .toUpperCase();
      if (severtype == SeverType.clean) {
        hitPart.cleanOff = true;
        if (hitPart.critical && !hitPart.weakSpot) {
          str += "{NAME}'S {PART} IS SLICED IN HALF!";
        } else {
          str += "{NAME}'S {PART} IS SLICED OFF!";
        }

        str = str.replaceAll("{NAME}", NAME);
        str = str.replaceAll("{PART}", PART);
      } else if (severtype == SeverType.nasty) {
        hitPart.nastyOff = true;
        str += "{NAME}'S {PART} IS BLOWN APART!";
        str = str.replaceAll("{NAME}", NAME);
        str = str.replaceAll("{PART}", PART);
      }
    }

    hitPart.relativeHealth -= damamount / target.maxBlood;

    if (hitPart.weakSpot) damamount = damamount * 2;
    if (!hitPart.critical) damamount = (damamount / 2).round();
    debugPrint("Final damage after hit location effects: $damamount");

    if (!hitPart.critical && target.alive) {
      if (lcsRandom(100) >= attackUsed.noDamageReductionForLimbsChance) {
        damamount = min(damamount, (target.blood / 2).round());
      }
    }

    //debugPrint("Target blood before hit: ${target.blood}/${target.maxBlood}");
    target.blood -= damamount;
    //debugPrint("Target blood after hit: ${target.blood}/${target.maxBlood}");

    levelMap[locx][locy][locz].bloody = true;

    if (severtype == SeverType.nasty) bloodblast(t.clothing);

    if (str != "") {
      clearMessageArea();
      mvaddstrc(9, 1, a.align.color, str);
      printParty();
      printEncounter();
      await getKey();
    }

    if ((hitPart.critical && hitPart.missing) || target.blood <= 0) {
      bool alreadydead = !target.alive;

      if (!alreadydead) {
        target.die();

        int killjuice = 5 + (t.juice / 20).round();
        if ((t.align.index - a.align.index).abs() == 2) {
          if (t.type.majorEnemy || t.type.tank) {
            killjuice += 50;
          }
          addjuice(a, killjuice, 1000); // Instant juice
        } else {
          addjuice(a, -25, -50);
        }

        if (target.isEnemy && (!t.type.animal || animalsArePeopleToo)) {
          if (activeSiteUnderSiege) activeSite!.siege.kills++;
          if (activeSiteUnderSiege && t.type.tank) {
            activeSite!.siege.tanks--;
          }
          if (activeSite?.controller == SiteController.ccs) {
            if (target.type.id == CreatureTypeIds.ccsArchConservative) {
              ccsBossKills++;
            }
            ccsSiegeKills++;
          }
        }
        if (target.squadId == null &&
            (!target.type.animal || animalsArePeopleToo)) {
          siteCrime += 10;
          if (t.type.majorEnemy) {
            siteCrime += 90;
          }
          if (a.squad == activeSquad) {
            addDramaToSiteStory(Drama.killedSomebody);
            addPotentialCrime(squad, Crime.murder);
          }
        }
      }

      if (!alreadydead) {
        await severloot(t, groundLoot);
        printParty();
        printEncounter();
        clearMessageArea();

        if (target.prisoner != null) {
          await freehostage(t, FreeHostageMessage.newLine);
        }
      }
    }

    printParty();
    printEncounter();

    //SPECIAL WOUNDS
    if (!hitPart.missing && target.body is HumanoidBody) {
      bool heavydam = false;
      bool breakdam = false;
      bool pokedam = false;
      HumanoidBody body = target.body as HumanoidBody;
      if (damamount >= 12) {
        if ((attackUsed.shoots ||
                attackUsed.burns ||
                attackUsed.tears ||
                attackUsed.cuts) &&
            !bruiseOnly) {
          heavydam = true;
        }
      }

      if (damamount >= 10) {
        if ((attackUsed.cuts || attackUsed.tears || attackUsed.shoots) &&
            !bruiseOnly) {
          pokedam = true;
        }
      }

      if (damamount >= 40 || (damamount >= 20 && attackUsed.bruises)) {
        if (attackUsed.cuts ||
            attackUsed.shoots ||
            attackUsed.tears ||
            attackUsed.bruises) {
          breakdam = true;
        }
      }

      void maxBlood(double proportion) {
        if (target.blood > target.maxBlood * proportion) {
          target.blood = (target.maxBlood * proportion).round();
        }
      }

      if (hitPart == body.head) {
        clearMessageArea();
        setColor(a.align.color);

        int roll = lcsRandom(7);

        switch (roll) {
          case 0:
            if ((!body.missingLeftEye ||
                    !body.missingRightEye ||
                    !body.missingNose) &&
                heavydam) {
              String faceMessage;
              if (attackUsed.shoots) {
                faceMessage = "{name}'s face is blasted off!";
              } else if (attackUsed.burns) {
                faceMessage = "{name}'s face is burned away!";
              } else if (attackUsed.tears) {
                faceMessage = "{name}'s face is torn off!";
              } else if (attackUsed.cuts) {
                faceMessage = "{name}'s face is cut away!";
              } else {
                faceMessage = "{name}'s face is removed!";
              }
              mvaddstr(9, 1, faceMessage, params: {"name": target.name});

              await getKey();

              body.missingLeftEye = true;
              body.missingRightEye = true;
              body.missingNose = true;
              maxBlood(0.2);
            }
          case 1:
            if (body.teeth > 0) {
              int teethminus = lcsRandom(body.teeth) + 1;

              move(9, 1);
              if (teethminus > 1) {
                addstr(
                  teethminus == body.teeth
                      ? "All {teethminus} of {name}'s teeth are "
                      : "{teethminus} of {name}'s teeth are ",
                  params: {"teethminus": teethminus, "name": target.name},
                );
              } else if (body.teeth > 1) {
                addstr(
                  "One of {name}'s teeth is ",
                  params: {"name": target.name},
                );
              } else {
                addstr(
                  "{name}'s last tooth is ",
                  params: {"name": target.name},
                );
              }

              if (attackUsed.shoots) {
                addstr("shot out!");
              } else if (attackUsed.burns) {
                addstr("burned away!");
              } else if (attackUsed.tears) {
                addstr("gouged out!");
              } else if (attackUsed.cuts) {
                addstr("cut out!");
              } else {
                addstr("knocked out!");
              }

              await getKey();

              body.teeth -= teethminus;
            }
          case 2:
            if (!body.missingRightEye && heavydam) {
              String eyeMessage;
              if (attackUsed.shoots) {
                eyeMessage = "{name}'s right eye is shot out!";
              } else if (attackUsed.burns) {
                eyeMessage = "{name}'s right eye is burned away!";
              } else if (attackUsed.tears) {
                eyeMessage = "{name}'s right eye is torn out!";
              } else if (attackUsed.cuts) {
                eyeMessage = "{name}'s right eye is cut open!";
              } else {
                eyeMessage = "{name}'s right eye is removed!";
              }
              mvaddstr(9, 1, eyeMessage, params: {"name": target.name});

              await getKey();

              body.missingRightEye = true;
              maxBlood(0.5);
            }
          case 3:
            if (!body.missingLeftEye && heavydam) {
              String eyeMessage;
              if (attackUsed.shoots) {
                eyeMessage = "{name}'s left eye is shot out!";
              } else if (attackUsed.burns) {
                eyeMessage = "{name}'s left eye is burned away!";
              } else if (attackUsed.tears) {
                eyeMessage = "{name}'s left eye is torn out!";
              } else if (attackUsed.cuts) {
                eyeMessage = "{name}'s left eye is cut open!";
              } else {
                eyeMessage = "{name}'s left eye is removed!";
              }
              mvaddstr(9, 1, eyeMessage, params: {"name": target.name});

              await getKey();

              body.missingLeftEye = true;
              maxBlood(0.5);
            }
          case 4:
            if (!body.missingTongue && heavydam) {
              String tongueMessage;
              if (attackUsed.shoots) {
                tongueMessage = "{name}'s tongue is blown off!";
              } else if (attackUsed.burns) {
                tongueMessage = "{name}'s tongue is burned away!";
              } else if (attackUsed.tears) {
                tongueMessage = "{name}'s tongue is torn out!";
              } else if (attackUsed.cuts) {
                tongueMessage = "{name}'s tongue is cut off!";
              } else {
                tongueMessage = "{name}'s tongue is removed!";
              }
              mvaddstr(9, 1, tongueMessage, params: {"name": target.name});

              await getKey();

              body.missingTongue = true;
              maxBlood(0.5);
            }
          case 5:
            if (!body.missingNose && heavydam) {
              String noseMessage;
              if (attackUsed.shoots) {
                noseMessage = "{name}'s nose is blown off!";
              } else if (attackUsed.burns) {
                noseMessage = "{name}'s nose is burned away!";
              } else if (attackUsed.tears) {
                noseMessage = "{name}'s nose is torn off!";
              } else if (attackUsed.cuts) {
                noseMessage = "{name}'s nose is cut off!";
              } else {
                noseMessage = "{name}'s nose is removed!";
              }
              mvaddstr(9, 1, noseMessage, params: {"name": target.name});

              await getKey();

              body.missingNose = true;
              maxBlood(0.5);
            }
          case 6:
            if (!body.brokenNeck && breakdam) {
              String neckMessage;
              if (attackUsed.shoots) {
                neckMessage = "{name}'s neck bones are shattered!";
              } else {
                neckMessage = "{name}'s neck is broken!";
              }
              mvaddstr(9, 1, neckMessage, params: {"name": target.name});

              await getKey();

              body.neck = InjuryState.untreated;
              maxBlood(0.2);
            }
        }
      }
      if (hitPart == body.torso) {
        clearMessageArea();
        setColor(a.align.color);

        int roll = lcsRandom(10 + body.ribs > 0 ? 4 : 0);
        if (bruiseOnly) roll = 11;

        switch (roll) {
          case 0:
            if (!body.brokenUpperSpine && breakdam) {
              String spineMessage;
              if (attackUsed.shoots) {
                spineMessage = "{name}'s upper spine is shattered!";
              } else {
                spineMessage = "{name}'s upper spine is broken!";
              }
              mvaddstr(9, 1, spineMessage, params: {"name": target.name});

              await getKey();

              body.upperSpine = InjuryState.untreated;
              maxBlood(0.2);
            }
          case 1:
            if (!body.brokenLowerSpine && breakdam) {
              String spineMessage;
              if (attackUsed.shoots) {
                spineMessage = "{name}'s lower spine is shattered!";
              } else {
                spineMessage = "{name}'s lower spine is broken!";
              }
              mvaddstr(9, 1, spineMessage, params: {"name": target.name});

              await getKey();

              body.lowerSpine = InjuryState.untreated;
              maxBlood(0.2);
            }
          case 2:
            if (!body.puncturedRightLung && pokedam) {
              String lungMessage;
              if (attackUsed.shoots) {
                lungMessage = "{name}'s right lung is blasted!";
              } else if (attackUsed.tears) {
                lungMessage = "{name}'s right lung is torn!";
              } else {
                lungMessage = "{name}'s right lung is punctured!";
              }
              mvaddstr(9, 1, lungMessage, params: {"name": target.name});

              await getKey();

              body.puncturedRightLung = true;
              maxBlood(0.2);
            }
          case 3:
            if (!body.puncturedLeftLung && pokedam) {
              String lungMessage;
              if (attackUsed.shoots) {
                lungMessage = "{name}'s left lung is blasted!";
              } else if (attackUsed.tears) {
                lungMessage = "{name}'s left lung is torn!";
              } else {
                lungMessage = "{name}'s left lung is punctured!";
              }
              mvaddstr(9, 1, lungMessage, params: {"name": target.name});

              await getKey();

              body.puncturedLeftLung = true;
              maxBlood(0.2);
            }
          case 4:
            if (!body.puncturedHeart && pokedam) {
              String heartMessage;
              if (attackUsed.shoots) {
                heartMessage = "{name}'s heart is blasted!";
              } else if (attackUsed.tears) {
                heartMessage = "{name}'s heart is torn!";
              } else {
                heartMessage = "{name}'s heart is punctured!";
              }
              mvaddstr(9, 1, heartMessage, params: {"name": target.name});

              await getKey();

              body.puncturedHeart = true;
              if (target.blood > 3) {
                target.blood = 3;
              }
            }
          case 5:
            if (!body.puncturedLiver && pokedam) {
              String liverMessage;
              if (attackUsed.shoots) {
                liverMessage = "{name}'s liver is blasted!";
              } else if (attackUsed.tears) {
                liverMessage = "{name}'s liver is torn!";
              } else {
                liverMessage = "{name}'s liver is punctured!";
              }
              mvaddstr(9, 1, liverMessage, params: {"name": target.name});

              await getKey();

              body.puncturedLiver = true;
              maxBlood(0.5);
            }
          case 6:
            if (!body.puncturedStomach && pokedam) {
              String stomachMessage;
              if (attackUsed.shoots) {
                stomachMessage = "{name}'s stomach is blasted!";
              } else if (attackUsed.tears) {
                stomachMessage = "{name}'s stomach is torn!";
              } else {
                stomachMessage = "{name}'s stomach is punctured!";
              }
              mvaddstr(9, 1, stomachMessage, params: {"name": target.name});

              await getKey();

              body.puncturedStomach = true;
              maxBlood(0.5);
            }
          case 7:
            if (!body.puncturedRightKidney && pokedam) {
              String kidneyMessage;
              if (attackUsed.shoots) {
                kidneyMessage = "{name}'s right kidney is blasted!";
              } else if (attackUsed.tears) {
                kidneyMessage = "{name}'s right kidney is torn!";
              } else {
                kidneyMessage = "{name}'s right kidney is punctured!";
              }
              mvaddstr(9, 1, kidneyMessage, params: {"name": target.name});

              await getKey();

              body.puncturedLeftKidney = true;
              maxBlood(0.5);
            }
          case 9:
            if (!body.puncturedSpleen && pokedam) {
              String spleenMessage;
              if (attackUsed.shoots) {
                spleenMessage = "{name}'s spleen is blasted!";
              } else if (attackUsed.tears) {
                spleenMessage = "{name}'s spleen is torn!";
              } else {
                spleenMessage = "{name}'s spleen is punctured!";
              }
              mvaddstr(9, 1, spleenMessage, params: {"name": target.name});

              await getKey();

              body.puncturedSpleen = true;
              maxBlood(0.5);
            }
          case 10:
          case 11:
          case 12:
          case 13:
            if (body.ribs > 0 && breakdam) {
              int ribminus = lcsRandom(min(body.ribs, damamount ~/ 20)) + 1;

              move(9, 1);
              if (ribminus > 1) {
                addstr(
                  ribminus == body.ribs
                      ? "All {ribminus} of {name}'s ribs are "
                      : "{ribminus} of {name}'s ribs are ",
                  params: {"ribminus": ribminus, "name": target.name},
                );
              } else if (body.ribs > 1) {
                addstr(
                  "One of {name}'s ribs is ",
                  params: {"name": target.name},
                );
              } else {
                addstr(
                  "{name}'s last unbroken rib is ",
                  params: {"name": target.name},
                );
              }

              if (attackUsed.shoots) {
                addstr("shattered!");
              } else {
                addstr("broken!");
              }

              await getKey();

              body.ribs -= ribminus;
            }
        }
      }

      await severloot(target, groundLoot);
    }

    //setColor(white);
  }
}

Future<bool> socialAttack(Creature a, Creature t, Attack attackUsed) async {
  int resist = 0;

  clearMessageArea();
  mvaddstrc(
    9,
    1,
    white,
    "{attacker} {attack} {target}!",
    params: {
      "attacker": a.name,
      "attack": attackUsed.attackDescription.random,
      "target": t.name,
    },
  );

  int attack = a.skillRoll(attackUsed.skill);
  if (t.align == Alignment.liberal) {
    resist = t.attributeRoll(Attribute.heart, take10: true);
  } else {
    resist = t.attributeRoll(Attribute.wisdom, take10: true);
  }
  resist += t.skill(Skill.psychology);
  a.train(attackUsed.skill, max(1, resist));

  if (t.type.animal && !animalsArePeopleToo) {
    resist += 10;
  }

  if (t.type.tank || (a.isEnemy && t.brainwashed)) {
    mvaddstr(
      10,
      1,
      "{name} is immune to the attack!",
      params: {"name": t.name},
    );
  } else if (a.align == t.align) {
    mvaddstr(
      10,
      1,
      "{name1} already agrees with {name2}.",
      params: {"name1": t.name, "name2": a.name},
    );
  } else if (attack > resist) {
    if (attackUsed.stuns) {
      t.stunned += (attack - resist) ~/ 4;
    }
    if (a.isEnemy) {
      if (t.juice > 100) {
        mvaddstr(10, 1, "{name} loses juice!", params: {"name": t.name});
        addjuice(t, -50, 100);
      } else if (lcsRandom(15) > t.attribute(Attribute.wisdom) ||
          t.attribute(Attribute.wisdom) < t.attribute(Attribute.heart)) {
        mvaddstr(
          10,
          1,
          "{name} is tainted with Wisdom!",
          params: {"name": t.name},
        );
        t.adjustAttribute(Attribute.wisdom, 1);
      } else if (t.align == Alignment.liberal && t.seduced) {
        mvaddstr(
          10,
          1,
          "{name} can't bear to leave!",
          params: {"name": t.name},
        );
      } else {
        if (a.align == Alignment.conservative) {
          mvaddstr(
            10,
            1,
            "{name} is turned Conservative",
            params: {"name": t.name},
          );
          if (t.prisoner != null) {
            await freehostage(t, FreeHostageMessage.continueLine);
          }
          addstr("!");
        } else {
          mvaddstr(
            10,
            1,
            "{name} doesn't want to fight anymore",
            params: {"name": t.name},
          );
          if (t.prisoner != null) {
            await freehostage(t, FreeHostageMessage.continueLine);
          }
          addstr("!");
        }

        if (!encounter.contains(t)) encounter.add(t);
        pool.remove(t);
        if (a.align == Alignment.conservative) {
          conservatize(t);
          t.isWillingToTalk = false;
        } else if (a.align == Alignment.liberal) {
          if (t.align == Alignment.conservative) {
            if (activeSite?.controller == SiteController.ccs) {
              if (t.type.id == CreatureTypeIds.ccsArchConservative) {
                ccsBossConverts++;
              }
              ccsSiegeConverts++;
            }
          }
          liberalize(t);
          if (activeSiteUnderSiege) activeSite!.siege.kills++;
          t.isWillingToTalk = true;
        } else {
          t.isWillingToTalk = true;
        }
        t.noticedParty = true;
        t.squad = null;
      }
    } else {
      if (t.juice >= 1) {
        mvaddstr(10, 1, "{name} seems less badass!", params: {"name": t.name});
        addjuice(t, -100, 0);
        t.stunned += lcsRandom(2);
      } else if (!t.attributeCheck(Attribute.heart, Difficulty.average) ||
          t.attribute(Attribute.heart) < t.attribute(Attribute.wisdom)) {
        mvaddstr(10, 1, "{name}'s Heart swells!", params: {"name": t.name});
        t.adjustAttribute(Attribute.heart, 1);
        t.stunned += lcsRandom(2);
      } else {
        if (t.align == Alignment.conservative) {
          if (activeSite?.controller == SiteController.ccs) {
            if (t.type.id == CreatureTypeIds.ccsArchConservative) {
              ccsBossConverts++;
            }
            ccsSiegeConverts++;
          }
        }

        mvaddstr(10, 1, "{name} has turned Liberal!", params: {"name": t.name});
        t.stunned = 0;

        liberalize(t);
        if (activeSiteUnderSiege) activeSite!.siege.kills++;
        sitestory?.drama.add(Drama.musicalRampage);
        t.justConverted = true;
        t.isWillingToTalk = true;
      }
    }
  } else {
    addstr("{name} misses.", params: {"name": a.name});
  }

  printParty();
  printEncounter();

  await getKey();

  siteCrime += 3;
  addjuice(a, 1, 200);

  return false;
}

/* destroys armor, masks, drops weapons based on severe damage */
Future<void> severloot(Creature cr, List<Item> loot) async {
  int armok = cr.body.armok;

  if (cr.equippedWeapon != null && armok == 0) {
    clearMessageArea();
    mvaddstrc(
      9,
      1,
      yellow,
      "The {weapon} slips from {name}'s grasp.",
      params: {"weapon": cr.weapon.getName(), "name": cr.name},
    );

    await getKey();

    if (mode == GameMode.site) {
      cr.dropWeaponAndAmmo(lootPile: loot);
    } else {
      cr.dropWeaponAndAmmo();
    }
  }

  HumanoidBody? body;
  if (cr.body is HumanoidBody) {
    body = cr.body as HumanoidBody;
  }

  if (body?.torso.missing == true &&
          cr.equippedClothing?.covers(body!.torso) == true ||
      (body?.head.missing == true && cr.equippedClothing?.type.mask == true)) {
    clearMessageArea();
    mvaddstrc(
      9,
      1,
      yellow,
      "{name}'s {clothing} has been destroyed.",
      params: {"name": cr.name, "clothing": cr.clothing.shortName},
    );

    await getKey();

    cr.strip();
  }
}

/* blood explosions */
void bloodblast(Clothing armor) {
  //GENERAL
  if (armor.type.canGetBloody) armor.bloody = true;

  if (mode != GameMode.site) return;

  levelMap[locx][locy][locz].megaBloody = true;

  //HIT EVERYTHING
  for (Creature p in squad) {
    if (oneIn(2)) {
      p.equippedClothing?.bloody = true;
    }
  }

  for (Creature e in encounter) {
    if (oneIn(2)) {
      e.equippedClothing?.bloody = true;
    }
  }

  //REFRESH THE SCREEN
  printSiteMapSmall(locx, locy, locz);
  refresh();
}

void makeLoot(Creature cr, List<Item> lootPile) {
  debugPrint("Making loot for ${cr.name} into $lootPile");
  cr.dropWeaponAndAmmo(lootPile: lootPile);
  cr.strip(lootPile: lootPile);
  if (cr.money > 0 && mode == GameMode.site) {
    lootPile.add(Money(cr.money));
  }
}

/* checks if the creature can fight and prints flavor text if they can't */
Future<bool> incapacitated(Creature a, bool noncombat) async {
  bool incapacitated = false;
  bool printed = false;

  if (a.blood <= a.maxBlood * 0.2 ||
      (a.blood <= a.maxBlood * 0.5 && (oneIn(2) || a.incapacitatedThisRound))) {
    incapacitated = true;
    if (a.type.tank) {
      a.incapacitatedThisRound = false;
      if (noncombat) {
        clearMessageArea();

        mvaddstrc(
          9,
          1,
          white,
          "The {name} {reaction}",
          params: {
            "name": a.name,
            "reaction": ["smokes...", "smolders.", "burns..."].random,
          },
        );

        printed = true;
      }
    } else if (a.type.animal) {
      a.incapacitatedThisRound = false;
      if (noncombat) {
        clearMessageArea();
        final reaction = switch (lcsRandom(3)) {
          0 => "yelps in pain...",
          1 => noProfanity ? "[makes a stinky]." : "soils the floor.",
          _ => "yowls pitifully...",
        };
        mvaddstrc(
          9,
          1,
          white,
          "The {name} {reaction}",
          params: {"name": a.name, "reaction": reaction},
        );

        printed = true;
      }
    } else {
      a.incapacitatedThisRound = false;
      if (noncombat) {
        clearMessageArea();
        if (a.squad == null && !a.type.majorEnemy) a.nonCombatant = true;
        final reaction = switch (lcsRandom(54)) {
          0 => "desperately cries out to Jesus.",
          1 => noProfanity ? "[makes a stinky]." : "soils the floor.",
          2 => "whimpers in a corner.",
          3 => "begins to weep.",
          4 => "vomits.",
          5 => "chortles...",
          6 => "screams in pain.",
          7 => "asks for mother.",
          8 => "prays softly...",
          9 => "clutches at the wounds.",
          10 => "reaches out and moans.",
          11 => "hollers in pain.",
          12 => "groans in agony.",
          13 => "begins hyperventilating.",
          14 => "shouts a prayer.",
          15 => "coughs up blood.",
          16 =>
            mode != GameMode.carChase
                ? "stumbles against a wall."
                : "leans against the door.",
          17 => "begs for forgiveness.",
          18 => "shouts \"Why have you forsaken me?\"",
          19 => "murmurs \"Why Lord?   Why?\"",
          20 => "whispers \"Am I dead?\"",
          21 =>
            noProfanity
                ? "[makes a mess], moaning."
                : "pisses on the floor, moaning.",
          22 => "whispers incoherently.",
          23 =>
            a.body.eyeok > 1
                ? "stares off into space."
                : a.body.eyeok == 1
                ? "stares into space with one empty eye."
                : "stares out with hollow sockets.",
          24 => "cries softly.",
          25 => "yells until the scream cracks dry.",
          26 =>
            a.body.teeth > 1
                ? "teeth start chattering."
                : a.body.teeth == 1
                ? "tooth starts chattering."
                : "gums start chattering.",
          27 => "starts shaking uncontrollably.",
          28 => "looks strangely calm.",
          29 => "nods off for a moment.",
          30 => "starts drooling.",
          31 => "seems lost in memories.",
          32 => "shakes with fear.",
          33 => "murmurs \"I'm so afraid...\"",
          34 => "cries \"It can't be like this...\"",
          35 =>
            a.age < 20 && !a.type.animal
                ? "cries \"Mommy!\""
                : a.type.dog
                ? "murmurs \"What about my puppies?\""
                : "murmurs \"What about my offspring?\"",
          36 => "shudders quietly.",
          37 => "yowls pitifully.",
          38 => "begins losing faith in God.",
          39 => "muses quietly about death.",
          40 => "asks for a blanket.",
          41 => "shivers softly.",
          42 => noProfanity ? "[makes a mess]." : "vomits up a clot of blood.",
          43 =>
            noProfanity
                ? "[makes a mess]."
                : "spits up a cluster of bloody bubbles.",
          44 => "pleads for mercy.",
          45 => "quietly asks for coffee.",
          46 => "looks resigned.",
          47 => "scratches at the air.",
          48 => "starts to giggle uncontrollably.",
          49 => "wears a look of pain.",
          50 => "questions God.",
          51 => "whispers \"Mama baby.  Baby loves mama.\"",
          52 => "asks for childhood toys frantically.",
          _ => "murmurs \"But I go to church...\"",
        };
        mvaddstrc(
          9,
          1,
          white,
          "The {name} {reaction}",
          params: {"name": a.name, "reaction": reaction},
        );

        printed = true;
      }
    }
  } else if (a.stunned > 0) {
    if (noncombat) {
      a.stunned--;
      clearMessageArea();
      final reaction = switch (lcsRandom(11)) {
        0 => "seems hesitant.",
        1 => "is caught in self-doubt.",
        2 => "looks around uneasily.",
        3 => "begins to weep.",
        4 => "asks \"Is this right?\"",
        5 => "asks for guidance.",
        6 => "is caught in indecision.",
        7 => "feels numb.",
        8 => "prays quietly.",
        9 => "searches for the truth.",
        _ => "tears up.",
      };
      mvaddstrc(
        9,
        1,
        white,
        "{name} {reaction}",
        params: {"name": a.name, "reaction": reaction},
      );

      printed = true;
    }
    incapacitated = true;
  } else if (!incapacitated && a.body.fullParalysis) {
    if (!noncombat) {
      clearMessageArea();
      final reaction = switch (lcsRandom(5)) {
        0 => "looks on with authority.",
        1 => "waits patiently.",
        2 => "sits in thought.",
        3 => "breathes slowly.",
        _ => "considers the situation.",
      };
      mvaddstrc(
        9,
        1,
        white,
        "{name} {reaction}",
        params: {"name": a.name, "reaction": reaction},
      );

      printed = true;
    }

    incapacitated = true;
  }

  if (printed) {
    printParty();
    printEncounter();

    await getKey();
  }

  return incapacitated;
}

Future<void> captureCreature(Creature t) async {
  t.activity = Activity.none();
  t.dropWeaponAndAmmo();
  Clothing clothes = Clothing("CLOTHING_CLOTHES");
  t.equippedClothing = clothes;
  t.sleeperAgent = false;

  await freehostage(t, FreeHostageMessage.none);
  if (t.justEscaped) {
    t.location = activeSite;
    if (activeSite!.isPartOfTheJusticeSystem) {
      Clothing prisoner = Clothing("CLOTHING_PRISONER");
      t.equippedClothing = prisoner;
    }
    if (activeSite!.type == SiteType.prison) {
      t.heat = 0;
      t.wantedForCrimes.updateAll((key, value) => 0);
    }
  } else {
    t.location = findSiteInSameCity(
      activeSite?.city ?? t.location?.city,
      SiteType.policeStation,
    );
  }

  t.squad = null;
}

/* describes a character's death */
void addDeathMessage(Creature cr) {
  clearMessageArea();
  setColor(yellow);

  move(9, 1);

  BodyPart? head = cr.body.parts.firstWhereOrNull((bp) => bp.name == "Head");
  BodyPart? body = cr.body.parts.firstWhereOrNull((bp) => bp.name == "Torso");

  if (head?.missing == true) {
    final message = switch (lcsRandom(4)) {
      0 =>
        mode != GameMode.carChase
            ? "{name} reaches once where there is no head, and falls."
            : "{name} reaches once where there is no head, and slumps over.",
      1 =>
        mode != GameMode.carChase
            ? "{name} stands headless for a moment then crumples over."
            : "{name} sits headless for a moment then crumples over.",
      2 =>
        mode != GameMode.carChase
            ? noProfanity
                  ? "{name} squirts [red water] out of the neck and runs down the hall."
                  : "{name} squirts blood out of the neck and runs down the hall."
            : noProfanity
            ? "{name} squirts [red water] out of the neck and falls to the side."
            : "{name} squirts blood out of the neck and falls to the side.",
      _ => "{name} sucks a last breath through the neck hole, then is quiet.",
    };
    addstr(message, params: {"name": cr.name});
  } else if (body?.missing == true) {
    final message = switch (lcsRandom(2)) {
      0 => "{name} breaks into pieces.",
      _ => "{name} falls apart and is dead.",
    };
    addstr(message, params: {"name": cr.name});
  } else if (cr.blood < cr.maxBlood * -2) {
    final message = switch (lcsRandom(8)) {
      0 => "{name} is dead before {hisHer} body hits the ground.",
      1 => "{name} collapses lifelessly.",
      2 => "{name} doesn't even make sound.",
      3 => "{name} is very much dead.",
      4 => "{name} didn't even know what hit {himHer}.",
      5 => "{name} dies instantly.",
      6 => "{name}'s body slumps to the floor.",
      _ => "{name}'s body hits the ground with a dull thump.",
    };
    addstr(
      message,
      params: {
        "name": cr.name,
        "hisHer": cr.gender.hisHer,
        "himHer": cr.gender.himHer,
      },
    );
  } else {
    final line1 = switch (lcsRandom(11)) {
      0 => "{name} cries out one last time then is quiet.",
      1 =>
        noProfanity
            ? "{name} gasps a last breath and [makes a mess]."
            : "{name} gasps a last breath and soils the floor.",
      2 => "{name} murmurs quietly, breathing softly. Then all is silent.",
      3 =>
        "{name} shouts \"FATHER!  Why have you forsaken me?\" and dies in a heap.",
      4 =>
        "{name} cries silently for mother, breathing slowly, then not at all.",
      5 => "{name} breathes heavily, coughing up blood...  then is quiet.",
      6 => "{name} silently drifts away, and is gone.",
      7 =>
        noProfanity
            ? "{name} sweats profusely, murmurs something [good] about Jesus, and dies."
            : "{name} sweats profusely, murmurs something about Jesus, and dies.",
      8 =>
        "{name} whines loudly, voice crackling, then curls into a ball, unmoving.",
      9 => "{name} shivers silently, whispering a prayer, then all is still.",
      10 =>
        cr.align == Alignment.liberal
            ? "{name} speaks these final words: {slogan}"
            : cr.align == Alignment.moderate
            ? "{name} speaks these final words: \"A plague on both your houses...\""
            : "{name} speaks these final words: \"Better dead than liberal...\"",
      _ => "{name} is gone.", // Fallback (lcsRandom(11) returns 0-10)
    };
    addstr(line1, params: {"name": cr.name, "slogan": slogan});
  }
}

/* pushes people into the current squad (used in a siege) */
void autopromote(Site loc) {
  if (activeSquad == null) return;

  int partysize = squad.length;
  int partyalive = activeSquad!.livingMembers.length;
  int libnum = 0;

  if (partyalive == 6) return;

  for (int pl = 0; pl < pool.length; pl++) {
    if (pool[pl].location != loc) continue;
    if (pool[pl].alive && pool[pl].align == Alignment.liberal) libnum++;
  }

  if (partysize == libnum) return;

  squad.removeWhere((e) => !e.alive);

  for (int i = 0; i < 6 - partyalive; i++) {
    for (int pl = 0; pl < pool.length; pl++) {
      if (pool[pl].location != loc) continue;
      if (pool[pl].alive &&
          pool[pl].squadId == null &&
          pool[pl].align == Alignment.liberal) {
        pool[pl].squad = activeSquad;
        break;
      }
    }
  }
}
