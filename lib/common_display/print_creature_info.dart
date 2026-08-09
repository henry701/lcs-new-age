import 'package:format/format.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/body.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/time.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/justice/crimes.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/laws.dart';
import 'package:lcs_new_age/sitemode/stealth.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/vehicles/vehicle.dart';

void printCreatureInfo(
  Creature cr, {
  ShowCarPrefs? showCarPrefs,
  int knowledge = 255,
}) {
  showCarPrefs ??= mode == GameMode.base
      ? ShowCarPrefs.showPreferences
      : ShowCarPrefs.showActualCar;
  makeDelimiter(y: 1);
  mvaddstrc(
    1,
    2,
    lightGray,
    "{name}, {title}",
    params: {"name": localizedCreatureName(cr), "title": cr.title},
  );
  if (cr.isHoldingBody) {
    addstr(
      ", {holding} {hostage}",
      params: {
        "holding": "holding",
        "hostage": cr.prisoner?.type.hostageName ?? cr.prisoner?.name,
      },
    );
  }
  printAttributesAsKnowledgePermits(cr, knowledge);

  mvaddstr(5, 0, "Transp: ");
  printTransportation(cr, showCarPrefs);

  setWeaponColor(cr);
  mvaddstr(6, 0, "Weapon: ");
  printWeapon(cr);

  setColorForArmor(cr);
  mvaddstr(7, 0, "Clothes: ");
  addstr(cr.clothing.shortName);

  printTopSkills(2, 31, cr, 5, knowledge: knowledge, maxWidth: 17);

  printHealthStat(1, 49, cr);
  if (cr.body.parts.any((p) => p.wounded)) {
    printWounds(cr);
    setColor(lightGray);
  }
}

void printAttributesAsKnowledgePermits(Creature creature, int knowledge) {
  const attributeCellWidth = 11;
  const secondAttributeColumn = 12;

  mvaddstrFitted(
    2,
    0,
    "Str: {str}",
    attributeCellWidth,
    params: {"str": creature.attribute(Attribute.strength).toString()},
  );
  mvaddstrFitted(
    3,
    0,
    "Agi: {agi}",
    attributeCellWidth,
    params: {"agi": creature.attribute(Attribute.agility).toString()},
  );
  mvaddstrFitted(
    4,
    0,
    "Hrt: {hrt}",
    attributeCellWidth,
    params: {"hrt": creature.attribute(Attribute.heart).toString()},
  );
  mvaddstrFitted(
    2,
    secondAttributeColumn,
    "Int: {int}",
    attributeCellWidth,
    params: {"int": creature.attribute(Attribute.intelligence).toString()},
  );
  mvaddstrFitted(
    3,
    secondAttributeColumn,
    "Cha: {cha}",
    attributeCellWidth,
    params: {"cha": creature.attribute(Attribute.charisma).toString()},
  );
  mvaddstrFitted(
    4,
    secondAttributeColumn,
    "Wis: {wis}",
    attributeCellWidth,
    params: {"wis": creature.attribute(Attribute.wisdom).toString()},
  );
}

enum ShowCarPrefs {
  onFoot, // "-1" in the old code
  showActualCar, // "0"
  showPreferences, // "1"
}

void printTransportation(Creature cr, ShowCarPrefs showCarPrefs) {
  Vehicle? v;
  if (showCarPrefs == ShowCarPrefs.showActualCar) v = cr.car;
  if (showCarPrefs == ShowCarPrefs.showPreferences) v = cr.preferredCar;
  if (v != null) {
    addstr(LcsI18n.tr(v.shortName), noTranslate: true);
    if (showCarPrefs == ShowCarPrefs.showPreferences
        ? cr.preferredDriver
        : cr.isDriver) {
      addstr("-D");
    }
  } else {
    int legok = cr.body.legs.where((l) => !l.missing).length;
    if (cr.hasWheelchair) {
      addstr("Wheelchair");
    } else {
      addstr(legok >= 1 ? "On Foot" : "On \"Foot\"");
    }
  }
}

void setWeaponColor(Creature cr) {
  if (mode != GameMode.site) {
    setColor(lightGray);
  } else {
    switch (weaponCheck(cr)) {
      case WeaponCheckResult.ok:
        setColor(lightGreen);
      case WeaponCheckResult.inCharacter:
        setColor(yellow);
      case WeaponCheckResult.suspicious:
        setColor(red);
    }
  }
}

void printWeapon(Creature cr, {int? maxWidth}) {
  if (maxWidth != null) {
    addstr(fitConsoleText(_weaponDisplayText(cr), maxWidth), noTranslate: true);
    return;
  }

  if (cr.equippedWeapon == null && cr.type.socialAttacks.isNotEmpty) {
    addstr("Voice");
    return;
  }
  addstr(cr.weapon.type.shortName);
  setColor(lightGray);
  if (cr.weapon.type.usesAmmo) {
    if (cr.weapon.ammo > 0) {
      addstr(
        " {ammo}/{spare}",
        params: {
          "ammo": cr.weapon.ammo.toString(),
          "spare": (cr.spareAmmo?.stackSize ?? 0).toString(),
        },
        noTranslate: true,
      );
    } else {
      setColor(darkGray);
      if ((cr.spareAmmo?.stackSize ?? 0) > 0) {
        addstr(
          " {spare}",
          params: {"spare": cr.spareAmmo!.stackSize.toString()},
          noTranslate: true,
        );
      } else {
        addstr(" 0");
      }
    }
  } else if (cr.weapon.type.thrown) {
    addstr(
      " {count}",
      params: {"count": cr.weapon.stackSize.toString()},
      noTranslate: true,
    );
  }
}

String _weaponDisplayText(Creature cr) {
  if (cr.equippedWeapon == null && cr.type.socialAttacks.isNotEmpty) {
    return LcsI18n.tr("Voice");
  }

  final weaponName = LcsI18n.tr(cr.weapon.type.shortName);
  if (cr.weapon.type.usesAmmo) {
    if (cr.weapon.ammo > 0) {
      return (StringBuffer(weaponName)
            ..write(' ')
            ..write(cr.weapon.ammo)
            ..write('/')
            ..write(cr.spareAmmo?.stackSize ?? 0))
          .toString();
    }
    final spare = cr.spareAmmo?.stackSize ?? 0;
    if (spare > 0) {
      return (StringBuffer(weaponName)
            ..write(' ')
            ..write(spare))
          .toString();
    }
    return (StringBuffer(weaponName)..write(' 0')).toString();
  }
  if (cr.weapon.type.thrown) {
    return (StringBuffer(weaponName)
          ..write(' ')
          ..write(cr.weapon.stackSize))
        .toString();
  }
  return weaponName;
}

void printTopSkills(
  int y,
  int x,
  Creature cr,
  int numberToPrint, {
  int knowledge = 255,
  int? maxWidth,
}) {
  // Get skills sorted by level and experience
  List<MapEntry<Skill, int>> skills = List.generate(
    Skill.values.length,
    (i) => MapEntry<Skill, int>(
      Skill.values[i],
      (cr.rawSkill[Skill.values[i]] ?? 0) * 10000 +
          (cr.rawSkillXP[Skill.values[i]] ?? 0),
    ),
  );
  skills.sort((a, b) => b.value.compareTo(a.value));
  skills = skills.where((s) => s.value > 0).take(numberToPrint).toList();
  if (skills.isNotEmpty) {
    // Keep the translated heading inside the compact profile's skill column;
    // the wound table begins at column 49.
    mvaddstrcFitted(y, x, lightGray, "Top Skills:", maxWidth ?? 49 - x - 1);
  }
  for (int i = 0; i < skills.length; i++) {
    Skill s = skills[i].key;
    int level = cr.skill(s);
    int levelXP = (cr.skillXP(s) / skillXpNeeded(level) * 100).floor();
    if (cr.skillCap(s) > 0 && cr.rawSkill[s]! >= cr.skillCap(s)) {
      setColor(lightBlue);
    } else if (levelXP >= 100 && cr.rawSkill[s]! < cr.skillCap(s)) {
      setColor(white);
    } else if (cr.rawSkill[s]! < 1) {
      if (cr.rawSkillXP[s]! > 0) {
        setColor(darkGray);
      }
      setColor(darkGray);
    } else {
      setColor(lightGray);
    }
    final skillName = knowledge > i ? s.localizedName : "???????";
    String value;
    if (knowledge > i + 2) {
      if (levelXP < 100) {
        final paddedLevel = levelXP < 10 ? '0' : '';
        value =
            (StringBuffer(levelXP)
                  ..write('.')
                  ..write(paddedLevel)
                  ..write(levelXP))
                .toString();
      } else {
        value = (StringBuffer(levelXP)..write('.99+')).toString();
      }
    } else {
      value = "?";
    }

    move(y + i + 1, x);
    if (maxWidth == null) {
      addstr(skillName, noTranslate: true);
      addstr(": ", noTranslate: true);
      addstr(value, noTranslate: true);
      continue;
    }

    final labelWidth = (maxWidth - strLenX(value) - 1).clamp(1, maxWidth);
    final skillLabel = StringBuffer(skillName)..write(':');
    addstr(
      fitConsoleText(skillLabel.toString(), labelWidth),
      noTranslate: true,
    );
    addstr(" ", noTranslate: true);
    addstr(fitConsoleText(value, maxWidth - labelWidth - 1), noTranslate: true);
  }
}

void printWounds(Creature cr, {int y = 2, int x = 49, int? maxWidth}) {
  final nameWidth = maxWidth == null ? 11 : (maxWidth - 10).clamp(1, 12);
  final statusX = x + nameWidth + (maxWidth == null ? 1 : 0);
  final statusWidth = maxWidth == null ? null : maxWidth - nameWidth;
  for (int i = 0; i < cr.body.parts.length; i++) {
    BodyPart p = cr.body.parts[i];
    setColor(p.bleeding > 0 ? red : lightGray);
    if (maxWidth == null) {
      mvaddstrFitted(
        y + i,
        x,
        "{name}:",
        nameWidth,
        params: {"name": LcsI18n.tr(p.name)},
        noTranslate: true,
      );
    } else {
      mvaddstrFitted(
        y + i,
        x,
        "{name}:",
        nameWidth - 1,
        params: {"name": LcsI18n.tr(p.name)},
      );
    }
    move(y + i, statusX);
    if (p.nastyOff) {
      _addWoundStatus("Ripped off", statusWidth);
    } else if (p.cleanOff) {
      _addWoundStatus("Clean sever", statusWidth);
    } else if (!p.wounded) {
      setColor(lightGreen);
      if (cr.type.animal) {
        _addWoundStatus("Animal", statusWidth);
      } else {
        _addWoundStatus(
          cr.align == Alignment.liberal ? "Liberal (body status)" : "Healthy",
          statusWidth,
        );
      }
    } else {
      List<String> injuries = [];
      if (p.shot) injuries.add("Sht");
      if (p.bruised) injuries.add("Brs");
      if (p.cut) injuries.add("Cut");
      if (p.torn) injuries.add("Trn");
      if (p.burned) injuries.add("Brn");
      _addWoundStatus(injuries.join(","), statusWidth);
    }
    if (!p.cleanOff && !p.nastyOff) {
      int armor = cr.clothing.getArmorForLocation(p);
      if (armor > 0) {
        final armorText = LcsI18n.processString("+{armor}", {
          "armor": armor.toString(),
        });
        final remainingWidth = statusWidth == null
            ? null
            : statusWidth - (console.x - statusX);
        if (remainingWidth == null) {
          addstrc(lightBlue, armorText, noTranslate: true);
        } else if (remainingWidth > 0) {
          addstrc(
            lightBlue,
            fitConsoleText(armorText, remainingWidth),
            noTranslate: true,
          );
        }
      }
    }
  }
}

void _addWoundStatus(String status, int? maxWidth) {
  // Injury codes are composed at runtime (for example, "Sht,Brs,Cut"), so
  // translate each component instead of looking up an unavailable compound
  // key in the catalog.
  final rendered = status.split(",").map(LcsI18n.tr).join(",");
  if (maxWidth == null) {
    addstr(rendered, noTranslate: true);
    return;
  }
  addstr(fitConsoleText(rendered, maxWidth), noTranslate: true);
}

String creatureAgeAndGender(Creature person) {
  final age = person.age;
  late final String ageDescription;
  if (person.body is! HumanoidBody) {
    // Animals and machines; +-2
    ageDescription = LcsI18n.processString("{age}?", {
      "age": age + person.birthDate.day % 5 - 2,
    });
  } else if (person.age < 20) {
    // Children and teens; +-1
    ageDescription = LcsI18n.processString("{age}?", {
      "age": age + person.birthDate.day % 3 - 1,
    });
  } else {
    // Adults; just assess a decade
    ageDescription = LcsI18n.processString("{age}s", {"age": age - (age % 10)});
  }

  final gender = switch (person.gender.simplified) {
    Gender.nonbinary => LcsI18n.tr("Nonbinary"),
    Gender.male => LcsI18n.tr("Male"),
    Gender.female => LcsI18n.tr("Female"),
    _ => throw StateError('Unexpected simplified gender'),
  };
  return LcsI18n.processString(
    person.gender == person.genderAssignedAtBirth
        ? "({age}, {gender})"
        : "({age}, {gender}, Trans)",
    {"age": ageDescription, "gender": gender},
  );
}

void addProfileNavigationOptions(
  int y,
  int x,
  String firstKey,
  String firstText,
  String secondKey,
  String secondText,
) {
  const separator = " / ";
  final firstWidth = strLenX(LcsI18n.processString(firstText, null));
  final separatorWidth = strLenX(separator);
  final availableWidth = console.width - x;
  final fittedFirstWidth = firstWidth.clamp(
    1,
    availableWidth - separatorWidth - 1,
  );
  final secondX = x + fittedFirstWidth + separatorWidth;
  final secondWidth = console.width - secondX;

  addOptionTextFitted(y, x, firstKey, firstText, fittedFirstWidth);
  mvaddstr(y, x + fittedFirstWidth, separator, noTranslate: true);
  addOptionTextFitted(y, secondX, secondKey, secondText, secondWidth);
}

/* full character sheet with surrounding interface */
Future<void> fullCreatureInfoScreen(Creature cr) async {
  if (activeSquad == null) return;

  const int pagenum = 3;
  int page = 0;

  while (true) {
    erase();

    setColor(lightGreen);
    move(0, 0);
    addstr("Profile of a Liberal");

    if (page == 0) printFullCreatureStats(cr);
    if (page == 1) printFullCreatureSkills(cr);
    if (page == 2) printFullCreatureCrimes(cr);

    addOptionText(23, 0, "N", "N - Change Name");
    addOptionText(23, 26, "G", "G - Change Gender");
    if ((activeSquad?.members.length ?? 0) > 1) {
      addProfileNavigationOptions(
        23,
        50,
        "LEFT",
        "LEFT",
        "RIGHT",
        "RIGHT - Other Liberals",
      );
    }
    addOptionText(
      24,
      0,
      "Any Other Key",
      "Any Other Key - Continue the Struggle",
    );
    addProfileNavigationOptions(24, 52, "UP", "UP", "DOWN", "DOWN - More Info");

    int c = await getKey();

    if ((activeSquad?.members.length ?? 0) > 1 &&
        ((c == Key.leftArrow || c == Key.a) ||
            (c == Key.rightArrow || c == Key.d))) {
      int sx = (c == Key.leftArrow || c == Key.a) ? -1 : 1;
      int index = squad.indexOf(cr) + sx;
      cr = squad[index % squad.length];
    } else if (c == Key.downArrow || c == Key.x) {
      page++;
      page %= pagenum;
    } else if (c == Key.upArrow || c == Key.w) {
      page--;
      if (page < 0) page = pagenum - 1;
      page %= pagenum;
    } else if (c == Key.n) {
      setColor(lightGray);
      mvaddstr(
        23,
        0,
        "What is the new code name?                                                      ",
      ); // 80 characters
      mvaddstr(
        24,
        0,
        "                                                                                ",
      ); // 80 spaces

      cr.name = await enterName(24, 0, cr.name);
    } else if (c == Key.g) {
      List<Gender> genders = [Gender.male, Gender.female, Gender.nonbinary];
      if (cr.cannotDetransition) {
        genders.remove(cr.genderAssignedAtBirth);
      }
      int index;
      if (genders.contains(cr.gender)) {
        index = genders.indexOf(cr.gender);
      } else {
        index = 0;
      }
      cr.gender = genders[(index + 1) % genders.length];
    } else {
      break;
    }
  }
}

/* Full screen character sheet, skills only edition */
void printFullCreatureSkills(Creature cr) {
  // Add name
  printFullCreatureNameBlock(cr);

  // Add all skills
  for (int s = 0; s < Skill.values.length; s++) {
    Skill skill = Skill.values[s];
    if (s % 3 == 0 && s < 9) {
      setColor(lightGray);
      move(4, 27 * (s ~/ 3));
      addstr("SKILL");
      move(4, 15 + 27 * (s ~/ 3));
      addstr("NOW");
      addstr("  ", noTranslate: true);
      addstr("MAX");
    }

    highlightColorForSkill(cr, skill);

    mvaddstrFitted(
      5 + s ~/ 3,
      27 * (s % 3),
      "{skill}:",
      13,
      params: {"skill": skill.localizedName},
      noTranslate: true,
    );
    printSkillValue(cr, skill, 5 + s ~/ 3, 14 + 27 * (s % 3));
  }
  setColor(lightGray);
}

void printSkillValue(
  Creature cr,
  Skill skill,
  int y,
  int x, {
  bool emphasizePotential = false,
  bool showCap = true,
}) {
  move(y, x);
  addstr("{:2d}.".format(cr.skill(skill)));
  int xpPercent = ((cr.skillXP(skill) / skillXpNeeded(cr.skill(skill))) * 100)
      .round();
  if (xpPercent < 100) {
    addstr("{xpPercent}", params: {"xpPercent": xpPercent.toString()});
  } else {
    addstr("99+");
  }

  if (showCap) {
    if (emphasizePotential) {
      if (cr.skillCap(skill) > cr.skill(skill)) {
        setColor(white);
      }
    } else {
      if (cr.skillCap(skill) == 0 || cr.skill(skill) < cr.skillCap(skill)) {
        setColor(darkGray);
      }
    }
    move(y, x + 6);
    addstr("{:2d}.00".format(cr.skillCap(skill)));
  }
}

/* full screen character sheet */
void printFullCreatureStats(
  Creature cr, {
  ShowCarPrefs showCarPrefs = ShowCarPrefs.showPreferences,
}) {
  const attributeWidth = 15;
  const vitalityX = 16;
  const vitalityWidth = 13;
  const skillX = 30;
  const skillWidth = 15;
  const currentSkillX = 46;
  const maxSkillX = 53;
  const woundsX = 59;

  setColor(lightGray);

  // Add name
  printFullCreatureNameBlock(cr);
  // Add birthdate
  mvaddstr(
    3,
    0,
    "Born {month} {day}, ",
    params: {
      "month": getMonthInSentence(cr.birthDate.month),
      "day": cr.birthDate.day,
    },
  );
  addstr(
    "{year} (Age {age}, ",
    params: {"year": cr.birthDate.year.toString(), "age": cr.age.toString()},
  );
  if (cr.gender == Gender.male) {
    addstr("Male");
  } else if (cr.gender == Gender.female) {
    addstr("Female");
  } else {
    addstr("Nonbinary");
  }
  addstr(", ");
  if (cr.gender != cr.genderAssignedAtBirth) {
    addstr("Transgender");
  } else {
    addstr("Cisgender");
  }
  addstr(") ");
  printWantedFor(cr);
  setColor(lightGray);

  // Add juice
  mvaddstrFitted(
    9,
    vitalityX,
    "Juice: {juice}",
    vitalityWidth,
    params: {"juice": cr.juice},
  );
  if (cr.juice < 1000) {
    final next = switch (cr.juice) {
      < 0 => "0",
      < 10 => "10",
      < 50 => "50",
      < 100 => "100",
      < 200 => "200",
      < 500 => "500",
      _ => "1000",
    };
    mvaddstrFitted(
      10,
      vitalityX,
      "${LcsI18n.tr("Next:  ")}$next",
      vitalityWidth,
      noTranslate: true,
    );
  }
  // Add attributes
  mvaddstrFitted(
    5,
    0,
    "Heart: {heart}",
    attributeWidth,
    params: {"heart": cr.attribute(Attribute.heart).toString()},
  );
  mvaddstrFitted(
    6,
    0,
    "Intelligence: {int}",
    attributeWidth,
    params: {"int": cr.attribute(Attribute.intelligence).toString()},
  );
  mvaddstrFitted(
    7,
    0,
    "Wisdom: {wis}",
    attributeWidth,
    params: {"wis": cr.attribute(Attribute.wisdom).toString()},
  );
  mvaddstrFitted(
    8,
    0,
    "Agility: {agi}",
    attributeWidth,
    params: {"agi": cr.attribute(Attribute.agility).toString()},
  );
  mvaddstrFitted(
    9,
    0,
    "Strength: {str}",
    attributeWidth,
    params: {"str": cr.attribute(Attribute.strength).toString()},
  );
  mvaddstrFitted(
    10,
    0,
    "Charisma: {cha}",
    attributeWidth,
    params: {"cha": cr.attribute(Attribute.charisma).toString()},
  );

  // Add highest skills
  Map<Skill, bool> used = {for (Skill s in Skill.values) s: false};

  int skillsMax = 16;
  bool printed = true;

  mvaddstrFitted(5, skillX, "SKILL", skillWidth);
  mvaddstrFitted(5, currentSkillX, "NOW", maxSkillX - currentSkillX - 1);
  mvaddstrFitted(5, maxSkillX, "MAX", woundsX - maxSkillX - 1);
  for (int skillsShown = 0; skillsShown < skillsMax && printed; skillsShown++) {
    printed = false;

    int max = 0;
    int maxs = -1;
    for (int s = 0; s < Skill.values.length; s++) {
      Skill skill = Skill.values[s];
      if ((cr.skill(skill) * 10000 + cr.skillXP(skill)) > max &&
          !used[skill]!) {
        max = cr.skill(skill) * 10000 + cr.skill(skill);
        maxs = s;
      }
    }

    if (maxs != -1) {
      Skill skill = Skill.values[maxs];
      used[skill] = true;
      printed = true;

      highlightColorForSkill(cr, skill);

      mvaddstrFitted(
        6 + skillsShown,
        skillX,
        "{skill}:",
        skillWidth,
        params: {"skill": skill.localizedName},
      );
      move(6 + skillsShown, currentSkillX);
      addstr("{:2d}.".format(cr.skill(skill)));
      if (cr.skillXP(skill) < 100 + (10 * cr.skill(skill))) {
        addstr(
          "{:02d}".format(
            (cr.skillXP(skill) * 100) ~/ (100 + (10 * cr.skill(skill))),
          ),
        );
      } else {
        addstr("99+");
      }

      if (cr.skillCap(skill) == 0 || cr.skill(skill) < cr.skillCap(skill)) {
        setColor(darkGray);
      }
      move(6 + skillsShown, maxSkillX);
      addstr("{:2d}.00".format(cr.skillCap(skill)));
    }
  }

  // Add task
  mvaddstrc(12, 0, lightGray, "Task: ");
  setColor(cr.activity.color);
  addparagraph(
    12,
    8,
    cr.activity.description,
    y2: 14,
    x2: skillX - 1,
    noTranslate: true,
  );
  setColor(lightGray);
  // addstrc(cr.activity.color, cr.activity.description);

  // Add weapon
  mvaddstrc(console.y, 0, lightGray, "Weapon: ");
  printWeapon(cr);

  // Add clothing
  mvaddstrc(console.y + 1, 0, lightGray, "Clothes: ");
  cr.clothing.printEquipTitle(full: true, armor: false);

  // Add vehicle, keeping the description inside the left profile column.
  Vehicle? v;
  if (showCarPrefs == ShowCarPrefs.showPreferences) {
    v = cr.preferredCar;
  } else {
    v = cr.car;
  }
  String carName;
  if (v != null && showCarPrefs != ShowCarPrefs.onFoot) {
    carName = v.fullName();
    bool d;
    if (showCarPrefs == ShowCarPrefs.showPreferences) {
      d = cr.preferredDriver;
    } else {
      d = cr.isDriver;
    }
    if (d) carName += "-D";
  } else {
    int legok = cr.body.legok;
    if (cr.hasWheelchair) {
      carName = LcsI18n.tr("Wheelchair");
    } else if (legok >= 1) {
      carName = LcsI18n.tr("On Foot");
    } else {
      carName = LcsI18n.tr("On \"Foot\"");
    }
  }
  mvaddstrFitted(
    console.y + 1,
    0,
    LcsI18n.tr("Car: ") + carName,
    skillX - 1,
    noTranslate: true,
  );

  // Add recruit stats
  if (!cr.brainwashed) {
    move(19, 0);
    addstr(
      "{recruits} Recruits / {max} Max",
      params: {
        "recruits": cr.maxSubordinates - cr.subordinatesLeft,
        "max": cr.maxSubordinates,
      },
    );
  } else {
    move(19, 0);
    addstr("Enlightened Can't Recruit");
  }
  // Any meetings with potential recruits scheduled?
  if (cr.scheduledMeetings > 0) {
    move(19, 55);
    addstr("Scheduled Meetings: ");
    addstr(cr.scheduledMeetings.toString());
  }
  // Add seduction stats
  move(20, 0);
  int lovers = cr.relationships.length;
  int maxLovers = cr.maxRelationships;
  addstr(
    lovers == 1 ? "{lovers} Lover / {max} Max" : "{lovers} Lovers / {max} Max",
    params: {"lovers": lovers, "max": maxLovers},
  );
  // Any dates with potential love interests scheduled?
  if (cr.scheduldeDates > 0) {
    move(20, 55);
    addstr("Scheduled Dates:    ");
    addstr(cr.scheduldeDates.toString());
  }

  // Add wound status
  printWounds(
    cr,
    y: 5,
    x: woundsX,
    maxWidth: ManagementTableLayout.consoleWidth - woundsX,
  );
  setColor(lightGray);

  //SPECIAL WOUNDS
  setColor(red);

  int y = 12;
  int x = woundsX;
  List<String> injuries = cr.body.allSpecialInjuries();
  for (String injury in injuries) {
    mvaddstrFitted(y++, x, injury, ManagementTableLayout.consoleWidth - x);
  }

  setColor(lightGray);
}

/* Full screen character sheet, crime sheet */
void printFullCreatureCrimes(Creature cr) {
  printFullCreatureNameBlock(cr);
  // Show outstanding convictions in addition to untried crimes
  if (cr.deathPenalty) {
    setColor(red);
    if (cr.site?.type == SiteType.prison) {
      mvaddstr(3, 0, "On DEATH ROW");
    } else {
      mvaddstr(3, 0, "Escaped prisoner sentenced to DEATH");
    }
  } else if (cr.sentence < 0) {
    setColor(red);
    if (cr.site?.type == SiteType.prison) {
      mvaddstr(3, 0, "Serving life in prison");
    } else {
      mvaddstr(3, 0, "Escaped prisoner sentenced to life in prison");
    }
  } else if (cr.sentence > 0) {
    setColor(yellow);
    if (cr.site?.type == SiteType.prison) {
      mvaddstr(3, 0, "Serving ");
    } else {
      mvaddstr(3, 0, "Escaped prisoner sentenced to ");
    }
    addstr(
      "{sentence} months in prison.",
      params: {"sentence": cr.sentence.toString()},
    );
  }

  // Add all crimes
  for (int i = 0; i < Crime.values.length; i++) {
    Crime crime = Crime.values[i];
    if (i % 2 == 0 && i < 4) {
      setColor(lightGray);
      mvaddstr(4, 40 * (i ~/ 2), "CRIME");
      mvaddstr(4, 30 + 40 * (i ~/ 2), "NUM");
    }

    // Commited crimes are yellow
    if (cr.wantedForCrimes[crime]! > 0) {
      setColor(yellow);
    } else {
      setColor(darkGray);
    }

    mvaddstrFitted(
      5 + i ~/ 2,
      40 * (i % 2),
      "{crime}: ",
      29,
      params: {"crime": LcsI18n.tr(crime.chargedWith)},
      noTranslate: true,
    );
    mvaddstrFitted(
      5 + i ~/ 2,
      30 + 40 * (i % 2),
      "{:02d}".format(cr.wantedForCrimes[crime]!),
      10,
      noTranslate: true,
    );
  }

  setColor(lightGray);
}

void printFullCreatureNameBlock(Creature cr) {
  mvaddstrcx(
    2,
    0,
    lightGray,
    "Name: {name:white}, {title} ({type})",
    params: {
      "name": cr.name,
      "title": cr.title,
      "type": LcsI18n.tr(cr.type.name),
    },
  );
}

void highlightColorForSkill(Creature cr, Skill skill) {
  if (cr.skillCap(skill) != 0 && cr.skill(skill) >= cr.skillCap(skill)) {
    // Maxed skills are cyan
    setColor(lightBlue);
  } else if (cr.skillXP(skill) >= 100 + (10 * cr.skill(skill)) &&
      cr.skill(skill) < cr.skillCap(skill)) {
    // Leveling skills are white
    setColor(white);
  } else if (cr.skill(skill) < 1) {
    // <1 skills are dark gray
    setColor(darkGray);
  } else {
    // >=1 skills are light gray
    setColor(lightGray);
  }
}

void printWantedFor(Creature cr) {
  bool kidnapped = cr.kidnapped;
  bool criminal = false;
  Map<Crime, bool> wanted = {};

  for (Crime crime in Crime.values) {
    if ((cr.wantedForCrimes[crime] ?? 0) > 0) {
      wanted[crime] = true;
      criminal = true;
    } else {
      wanted[crime] = false;
    }
  }

  if (!criminal && !kidnapped) return;

  setColor(yellow);
  addstr("WANTED FOR ");

  if (kidnapped) {
    addstr("REHABILITATION");
  } else if (wanted[Crime.treason] == true) {
    addstr("TREASON");
  } else if (wanted[Crime.terrorism] == true) {
    addstr("TERRORISM");
  } else if (wanted[Crime.murder] == true) {
    addstr("MURDER");
  } else if (wanted[Crime.kidnapping] == true) {
    addstr("KIDNAPPING");
  } else if (wanted[Crime.bankRobbery] == true) {
    addstr("BANK ROBBERY");
  } else if (wanted[Crime.arson] == true) {
    addstr("ARSON");
  } else if (wanted[Crime.escapingPrison] == true) {
    addstr("ESCAPING PRISON");
  } else if (wanted[Crime.flagBurning] == true) {
    addstr(
      laws[Law.freeSpeech] == DeepAlignment.archConservative
          ? "FLAG MURDER"
          : "FLAG BURNING",
    );
  } else if (wanted[Crime.unlawfulSpeech] == true) {
    addstr("HARMFUL SPEECH");
  } else if (wanted[Crime.drugDistribution] == true) {
    addstr("DRUG DEALING");
  } else if (wanted[Crime.aidingEscape] == true) {
    addstr("RELEASING PRISONERS");
  } else if (wanted[Crime.juryTampering] == true) {
    addstr("JURY TAMPERING");
  } else if (wanted[Crime.racketeering] == true) {
    addstr("RACKETEERING");
  } else if (wanted[Crime.extortion] == true) {
    addstr("EXTORTION");
  } else if (wanted[Crime.assault] == true) {
    addstr("ASSAULT");
  } else if (wanted[Crime.grandTheftAuto] == true) {
    addstr("GRAND THEFT AUTO");
  } else if (wanted[Crime.creditCardFraud] == true) {
    addstr("CREDIT CARD FRAUD");
  } else if (wanted[Crime.theft] == true) {
    addstr("LARCENY");
  } else if (wanted[Crime.prostitution] == true) {
    addstr("PROSTITUTION");
  } else if (wanted[Crime.harboring] == true) {
    addstr(
      laws[Law.immigration]! < DeepAlignment.liberal
          ? "HIRING ILLEGAL ALIENS"
          : "HIRING UNDOCUMENTED",
    );
  } else if (wanted[Crime.cyberTerrorism] == true) {
    addstr("CYBER TERRORISM");
  } else if (wanted[Crime.dataTheft] == true) {
    addstr("DATA THEFT");
  } else if (wanted[Crime.unlawfulBurial] == true) {
    addstr("UNLAWFUL BURIAL");
  } else if (wanted[Crime.breakingAndEntering] == true) {
    addstr("BREAKING AND ENTERING");
  } else if (wanted[Crime.cyberVandalism] == true) {
    addstr("CYBER VANDALISM");
  } else if (wanted[Crime.vandalism] == true) {
    addstr("VANDALISM");
  } else if (wanted[Crime.resistingArrest] == true) {
    addstr("RESISTING ARREST");
  } else if (wanted[Crime.disturbingThePeace] == true) {
    addstr("DISTURBING THE PEACE");
  } else if (wanted[Crime.publicNudity] == true) {
    addstr("PUBLIC NUDITY");
  } else if (wanted[Crime.loitering] == true) {
    addstr("LOITERING");
  } else if (wanted[Crime.illegalEntry] == true) {
    addstr("DEPORTATION");
  }
}
