import 'package:collection/collection.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/basemode/flag.dart';
import 'package:lcs_new_age/basemode/help_system.dart';
import 'package:lcs_new_age/common_actions/equipment.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/creature/sort_creatures.dart';
import 'package:lcs_new_age/daily/activities/fundraising.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/armor_upgrade.dart';
import 'package:lcs_new_age/items/clothing_type.dart';
import 'package:lcs_new_age/items/flag_type.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/interface_options.dart';

Future<void> activateRegulars() async {
  List<Creature> tempPool = pool
      .where(
        (p) =>
            p.isActiveLiberal &&
            (p.squad == null || p.squad?.activity.type == ActivityType.none),
      )
      .toList();
  if (tempPool.isEmpty) return;

  sortLiberals(tempPool, SortingScreens.activateRegulars);

  int page = 0;
  while (true) {
    erase();
    printFunds();
    mvaddstr(0, 0, "Assign Tasks to Liberals");
    printManagementTableHeader("ACTIVITY");
    int y = 2;
    for (int p = page * 19; p < tempPool.length && p < (page + 1) * 19; p++) {
      Creature c = tempPool[p];
      String key = letterAPlus(y - 2);
      printManagementTableRow(
        y: y,
        key: key,
        creature: c,
        location:
            c.location?.getName(short: true, includeCity: true) ??
            LcsI18n.tr("In Hiding"),
        locationColor: c.site?.isPartOfTheJusticeSystem == true
            ? yellow
            : lightGray,
        trailing: c.activity.description,
        trailingColor: c.activity.color,
      );
      y++;
    }
    mvaddstrc(22, 0, lightGray, "Press a Letter to Assign an Activity.");
    addPageButtons(y: 23, x: 0);
    addOptionTextFitted(24, 0, "T", "T - Sorting options", 39);
    addOptionTextFitted(24, 40, "Z", "Z - Assign simple tasks in bulk", 40);
    int c = await getKey();
    if (isPageUp(c) && page > 0) page--;
    if (isPageDown(c) && (page + 1) * 19 < tempPool.length) page++;
    if (c >= Key.a && c <= Key.s) {
      int p = page * 19 + (c - Key.a);
      if (p < tempPool.length) await assignTask(tempPool[p]);
    }
    if (c == Key.t) {
      await sortingPrompt(SortingScreens.activateRegulars);
      sortLiberals(tempPool, SortingScreens.activateRegulars);
    }
    if (c == Key.z) {
      await _activateBulk();
    }
    if (isBackKey(c)) break;
  }
}

List<ActivityType> _activism = [
  ActivityType.communityService,
  ActivityType.trouble,
  ActivityType.graffiti,
  ActivityType.hacking,
  ActivityType.writeGuardian,
];

List<ActivityType> _legal = [
  ActivityType.donations,
  ActivityType.sellTshirts,
  ActivityType.sellArt,
  ActivityType.sellMusic,
];

List<ActivityType> _illegal = [
  ActivityType.sellDrugs,
  ActivityType.prostitution,
  ActivityType.ccfraud,
];

List<ActivityType> _acquisition = [
  ActivityType.recruiting,
  ActivityType.stealCars,
  ActivityType.makeClothing,
  ActivityType.makeFlag,
  ActivityType.wheelchair,
];

List<ActivityType> _study = [ActivityType.study, ActivityType.takeClass];

List<ActivityType> _medical = [ActivityType.clinic, ActivityType.augment];

List<ActivityType> _teaching = [
  ActivityType.teachLiberalArts,
  ActivityType.teachCovert,
  ActivityType.teachFighting,
];

Future<void> assignTask(Creature c) async {
  int state = 0;
  bool canDisposeCorpses =
      c.site?.creaturesPresent.any((p) => !p.alive) == true;
  bool canInterrogateHostages =
      c.site?.creaturesPresent.any(
        (c) => c.alive && c.align == Alignment.conservative,
      ) ==
      true;
  while (true) {
    erase();
    final fundsText = fundsDisplayText();
    printFunds();
    if (c.income > 0) {
      mvaddstrFitted(
        0,
        0,
        "{name} made {income} yesterday. What now?",
        console.width - fundsText.length - 2,
        params: {"name": c.name, "income": "\$${c.income}"},
      );
    } else {
      mvaddstrFitted(
        0,
        0,
        "Taking Action: What will {name} do today?",
        console.width - fundsText.length - 2,
        params: {"name": c.name},
      );
    }
    printCreatureInfo(c, showCarPrefs: ShowCarPrefs.showPreferences);
    makeDelimiter();
    _y = 10;
    _highlightedActivity = c.activity.type;
    _category(_activism, "A - Liberal Activism", state == Key.a, state != 0);
    _category(_legal, "B - Legal Fundraising", state == Key.b, state != 0);
    _category(_illegal, "C - Illegal Fundraising", state == Key.c, state != 0);
    _category(
      _acquisition,
      "D - Recruitment and Acquisition",
      state == Key.d,
      state != 0,
    );
    _category(_study, "E - Education and Learning", state == Key.e, state != 0);
    _category(_teaching, "T - Teaching Classes", state == Key.t, state != 0);
    _category(_medical, "M - Medical and Support", state == Key.m, state != 0);
    _activity(
      ActivityType.interrogation,
      "I - Interact with a Prisoner",
      state != 0,
      grayOut: !canInterrogateHostages,
    );
    _activity(
      ActivityType.bury,
      "Z - Corpse Disposal",
      state != 0,
      grayOut: !canDisposeCorpses,
    );
    setColor(activeSafehouse?.siege.underSiege ?? false ? darkGray : lightGray);
    addOptionText(_y++, 1, "g", "G - Equip This Liberal");
    _activity(ActivityType.none, "X - Lay Low for Now", state != 0);
    addOptionText(19, 40, "?", "? - About the Selected Activity");
    addOptionText(20, 40, "Enter", "Enter - Confirm Selection");
    if (state == Key.a) {
      _activismSubmenu(c);
    } else if (state == Key.b) {
      _legalSubmenu();
    } else if (state == Key.c) {
      _illegalSubmenu(c);
    } else if (state == Key.d) {
      _acquisitionSubmenu(c);
    } else if (state == Key.e) {
      _educationSubmenu(c);
    } else if (state == Key.t) {
      _teachingSubmenu();
    } else if (state == Key.m) {
      _medicalSubmenu(c);
    }
    final categoryActivities = _activitiesForState(state);
    _activityFooter(
      c,
      visible:
          categoryActivities == null ||
          categoryActivities.contains(c.activity.type),
    );
    int key = await getKey();
    switch (key) {
      case Key.a:
        state = key;
        _activismDefault(c);
      case Key.b:
        state = key;
        _legalDefault(c);
      case Key.c:
        state = key;
        _illegalDefault(c);
      case Key.d:
        state = key;
        _acquisitionDefault(c);
      case Key.e:
        state = key;
      case Key.t:
        state = key;
      case Key.m:
        state = key;
        _medicalDefault(c);
      case Key.x:
        state = 0;
        c.activity = Activity.none();
      case Key.z:
        if (canDisposeCorpses) {
          state = 0;
          c.activity = Activity(ActivityType.bury);
        }
      case Key.i:
        if (canInterrogateHostages) {
          state = 0;
          await _selectTendHostage(c);
        }
      case Key.g:
        await equipLiberal(c);
    }
    if (key >= Key.num0 && key <= Key.num9) {
      if (state == Key.a) {
        _activismChoice(c, key - Key.num0);
      } else if (state == Key.b) {
        _legalChoice(c, key - Key.num0);
      } else if (state == Key.c) {
        _illegalChoice(c, key - Key.num0);
      } else if (state == Key.d) {
        await _acquisitionChoice(c, key - Key.num0);
      } else if (state == Key.e) {
        await _educationChoice(c, key - Key.num0);
      } else if (state == Key.t) {
        _teachingChoice(c, key - Key.num0);
      } else if (state == Key.m) {
        _medicalChoice(c, key - Key.num0);
      }
    }
    if (isBackKey(key) && key != Key.x) {
      break;
    }
    if (key == "?".codePoint) {
      await helpOnActivity(c.activity.type);
    }
  }
}

int _y = 10;
ActivityType _highlightedActivity = ActivityType.none;
const int _subActivityX = 40;
const int _subActivityWidth = 40;
void _category(
  List<ActivityType> category,
  String desc,
  bool highlight,
  bool ignore,
) {
  String colorKey = "w";
  if (highlight || (!ignore && category.contains(_highlightedActivity))) {
    colorKey = "C";
  }
  addOptionText(_y++, 1, desc[0], desc, baseColorKey: colorKey);
}

void _activity(
  ActivityType activity,
  String desc,
  bool ignore, {
  int x = 1,
  bool grayOut = false,
  int? maxWidth,
}) {
  String colorKey = "w";
  if (!ignore && activity == _highlightedActivity) {
    colorKey = "C";
  }
  final y = _y++;
  if (maxWidth == null) {
    addOptionText(
      y,
      x,
      desc[0],
      desc,
      baseColorKey: colorKey,
      enabledWhen: !grayOut,
    );
  } else {
    addOptionTextFitted(
      y,
      x,
      desc[0],
      desc,
      maxWidth,
      baseColorKey: colorKey,
      enabledWhen: !grayOut,
    );
  }
}

void _subActivity(ActivityType activity, String desc, {bool greyOut = false}) {
  _activity(
    activity,
    desc,
    false,
    x: _subActivityX,
    grayOut: greyOut,
    maxWidth: _subActivityWidth,
  );
}

List<ActivityType>? _activitiesForState(int state) => switch (state) {
  Key.a => _activism,
  Key.b => _legal,
  Key.c => _illegal,
  Key.d => _acquisition,
  Key.e => _study,
  Key.t => _teaching,
  Key.m => _medical,
  _ => null,
};

void _activismSubmenu(Creature c) {
  _y = 10;
  _subActivity(ActivityType.communityService, "1 - Community Service");
  _subActivity(ActivityType.trouble, "2 - Liberal Disobedience");
  _subActivity(ActivityType.graffiti, "3 - Graffiti");
  _subActivity(
    ActivityType.hacking,
    c.site?.compound.hackerDen != true
        ? "4 - Hacking (Need Den)"
        : "4 - Hacking",
    greyOut:
        c.rawSkill[Skill.computers]! == 0 || c.site?.compound.hackerDen != true,
  );
  _subActivity(
    ActivityType.writeGuardian,
    "5 - Write Liberal Guardian Articles",
  );
  _subActivity(
    ActivityType.streamGuardian,
    c.site?.compound.videoRoom != true
        ? "6 - Stream Guardian TV (Need Studio)"
        : "6 - Stream Guardian TV",
    greyOut: c.site?.compound.videoRoom != true,
  );
}

void _activismChoice(Creature c, int choice) {
  if (choice == 1) c.activity = Activity(ActivityType.communityService);
  if (choice == 2) c.activity = Activity(ActivityType.trouble);
  if (choice == 3) c.activity = Activity(ActivityType.graffiti);
  if (choice == 4 &&
      c.rawSkill[Skill.computers]! > 0 &&
      c.site?.compound.hackerDen == true) {
    c.activity = Activity(ActivityType.hacking);
  }
  if (choice == 5) c.activity = Activity(ActivityType.writeGuardian);
  if (choice == 6 && c.site?.compound.videoRoom == true) {
    c.activity = Activity(ActivityType.streamGuardian);
  }
}

void _activismDefault(Creature c, {bool noCommunityService = false}) {
  if (!noCommunityService && c.juice < 0) {
    c.activity = Activity(ActivityType.communityService);
  } else if (c.rawSkill[Skill.computers]! > 2 &&
      c.site?.compound.hackerDen == true) {
    c.activity = Activity(ActivityType.hacking);
  } else if (c.rawSkill[Skill.art]! > 1) {
    c.activity = Activity(ActivityType.graffiti);
  } else {
    c.activity = Activity(ActivityType.trouble);
  }
}

void _legalSubmenu() {
  _y = 10;
  _subActivity(ActivityType.donations, "1 - Solicit Donations");
  _subActivity(ActivityType.sellTshirts, "2 - Make and Sell Clothing");
  _subActivity(ActivityType.sellArt, "3 - Make and Sell Art");
  _subActivity(ActivityType.sellMusic, "4 - Perform Live Music");
}

void _legalChoice(Creature c, int choice) {
  if (choice == 1) c.activity = Activity(ActivityType.donations);
  if (choice == 2) c.activity = Activity(ActivityType.sellTshirts);
  if (choice == 3) c.activity = Activity(ActivityType.sellArt);
  if (choice == 4) c.activity = Activity(ActivityType.sellMusic);
}

void _legalDefault(Creature c) {
  // Calculate estimated income for each legal fundraising method
  int donationsIncome = estimateDonationsIncome(c, estimate: true);
  int tshirtIncome = estimateTshirtIncome(c, estimate: true);
  int artIncome = estimateArtIncome(c, estimate: true);
  int musicIncome = estimateMusicIncome(c, estimate: true);

  // Choose the method with highest estimated income
  if (musicIncome >= donationsIncome &&
      musicIncome >= tshirtIncome &&
      musicIncome >= artIncome) {
    c.activity = Activity(ActivityType.sellMusic);
  } else if (artIncome >= donationsIncome && artIncome >= tshirtIncome) {
    c.activity = Activity(ActivityType.sellArt);
  } else if (tshirtIncome >= donationsIncome) {
    c.activity = Activity(ActivityType.sellTshirts);
  } else {
    c.activity = Activity(ActivityType.donations);
  }
}

void _illegalSubmenu(Creature c) {
  _y = 10;
  _subActivity(ActivityType.sellDrugs, "1 - Sell Weed Brownies");
  _subActivity(
    ActivityType.prostitution,
    "2 - Prostitution",
    greyOut: c.age < 18,
  );
  _subActivity(
    ActivityType.ccfraud,
    c.site?.compound.hackerDen != true
        ? "3 - Credit Card Fraud (Need Den)"
        : "3 - Credit Card Fraud",
    greyOut:
        c.rawSkill[Skill.computers] == 0 || c.site?.compound.hackerDen != true,
  );
}

void _illegalChoice(Creature c, int choice) {
  if (choice == 1) c.activity = Activity(ActivityType.sellDrugs);
  if (choice == 2 && c.age >= 18) {
    c.activity = Activity(ActivityType.prostitution);
  }
  if (choice == 3 &&
      c.rawSkill[Skill.computers] != 0 &&
      c.site?.compound.hackerDen == true) {
    c.activity = Activity(ActivityType.ccfraud);
  }
}

void _illegalDefault(Creature c) {
  if (c.rawSkill[Skill.computers]! > 1 && c.site?.compound.hackerDen == true) {
    c.activity = Activity(ActivityType.ccfraud);
  } else if (c.rawSkill[Skill.seduction]! > 1 && c.age >= 18) {
    c.activity = Activity(ActivityType.prostitution);
  } else {
    c.activity = Activity(ActivityType.sellDrugs);
  }
}

void _acquisitionSubmenu(Creature c) {
  _y = 10;
  _subActivity(ActivityType.recruiting, "1 - Recruiting");
  _subActivity(ActivityType.stealCars, "2 - Steal a Car");
  _subActivity(ActivityType.makeClothing, "3 - Make Clothing");
  _subActivity(ActivityType.makeFlag, "4 - Make a Flag");
  _subActivity(
    ActivityType.wheelchair,
    "5 - Procure a Wheelchair",
    greyOut: c.canWalk || c.hasWheelchair,
  );

  _y++;
  mvaddstrcFitted(
    _y++,
    _subActivityX,
    midGray,
    "Laundry and mending clothing are",
    _subActivityWidth,
  );
  mvaddstrcFitted(
    _y++,
    _subActivityX,
    midGray,
    "handled by Liberals set to Lay Low.",
    _subActivityWidth,
  );
}

Future<void> _acquisitionChoice(Creature c, int choice) async {
  if (choice == 1) c.activity = Activity(ActivityType.recruiting);
  if (choice == 2) c.activity = Activity(ActivityType.stealCars);
  if (choice == 3) await _selectClothingToMake(c);
  if (choice == 4) await _selectFlagToMake(c);
  if (choice == 5 && !c.canWalk && !c.hasWheelchair) {
    c.activity = Activity(ActivityType.wheelchair);
  }
}

void _acquisitionDefault(Creature c) {
  if (!c.canWalk && !c.hasWheelchair) {
    c.activity = Activity(ActivityType.wheelchair);
  }
}

void _educationSubmenu(Creature c) {
  _y = 10;
  _subActivity(ActivityType.study, "1 - Practice a Skill (Free)");
  _subActivity(ActivityType.takeClass, "2 - Take Paid Classes (\$30/day)");
}

Future<void> _educationChoice(Creature c, int choice) async {
  if (choice == 1) {
    await _selectSkillForEducation(c, ActivityType.study);
  }
  if (choice == 2) {
    await _selectSkillForEducation(c, ActivityType.takeClass);
  }
}

void _teachingSubmenu() {
  _y = 10;
  _subActivity(ActivityType.teachLiberalArts, "1 - Teach Liberal Arts");
  _subActivity(ActivityType.teachCovert, "2 - Teach Covert Ops");
  _subActivity(ActivityType.teachFighting, "3 - Teach Fighting");
}

void _teachingChoice(Creature c, int choice) {
  if (choice == 1) c.activity = Activity(ActivityType.teachLiberalArts);
  if (choice == 2) c.activity = Activity(ActivityType.teachCovert);
  if (choice == 3) c.activity = Activity(ActivityType.teachFighting);
}

void _medicalSubmenu(Creature c) {
  _y = 10;
  _subActivity(
    ActivityType.clinic,
    "1 - Go to the Hospital",
    greyOut: c.blood >= c.maxBlood,
  );
  //_subActivity(ActivityType.augment, "2 - Augment a Liberal");
  _y++;
  mvaddstrc(_y++, 40, midGray, "Capable medics will always provide");
  mvaddstrc(_y++, 40, midGray, "medical care to themselves or others");
  mvaddstrc(_y++, 40, midGray, "in the same location.  This does not");
  mvaddstrc(_y++, 40, midGray, "interfere with other tasks.");
}

void _medicalChoice(Creature c, int choice) {
  if (choice == 1 && c.blood < c.maxBlood) {
    c.activity = Activity(ActivityType.clinic);
  } else if (choice == 2) {
    //c.activity = Activity(ActivityType.augment);
  }
}

void _medicalDefault(Creature c) {
  if (c.blood < c.maxBlood) {
    c.activity = Activity(ActivityType.clinic);
  }
}

Future<void> _selectClothingToMake(Creature cr) async {
  int minDifficulty(ClothingType c) =>
      c.makeDifficulty +
      c.allowedArmor.first.makeDifficulty -
      cr.skill(Skill.tailoring);
  List<ClothingType> craftable = clothingTypes.values
      .where(
        (c) =>
            c.makeDifficulty >= 0 &&
            (!c.deathsquadLegality || deathSquadsActive),
      )
      .sorted((a, b) => a.name.compareTo(b.name))
      .sorted((a, b) => minDifficulty(a).compareTo(minDifficulty(b)));

  int selectedClothingIndex = -1;
  int selectedArmorIndex = 0;
  ClothingType? getSelectedClothing() {
    if (selectedClothingIndex == -1) return null;
    return craftable.elementAtOrNull(selectedClothingIndex);
  }

  ArmorUpgrade getSelectedArmor() =>
      getSelectedClothing()?.allowedArmor.elementAtOrNull(selectedArmorIndex) ??
      armorUpgrades.values.first;

  void renderFooter() {
    _clothingDetailFooter(
      getSelectedClothing()!,
      getSelectedArmor(),
      cr.skill(Skill.tailoring),
    );
  }

  erase();
  await pagedInterface(
    headerPrompt:
        "Which will {name} try to make?  (Note: Half Cost if you have cloth)",
    headerPromptParams: {"name": cr.name},
    headerKey: {4: "NAME", 37: "DIFFICULTY", 60: "COST"},
    footerPrompt: "Press a Letter to select a Type of Clothing",
    pageSize: 12,
    count: craftable.length,
    showBackButton: selectedClothingIndex != -1,
    lineBuilder: (y, key, index) {
      int difficulty = minDifficulty(craftable[index]);
      bool selected = selectedClothingIndex == index;
      String color = ColorKey.lightGray;
      if (selected) color = ColorKey.white;
      addOptionTextFitted(
        y,
        0,
        key,
        "{key} - {name}",
        36,
        params: {"key": key, "name": LcsI18n.tr(craftable[index].name)},
        baseColorKey: color,
      );
      addDifficultyText(y, 37, difficulty + 4);
      String price =
          "\$${craftable[index].makePrice + craftable[index].allowedArmor.first.makePrice}";
      mvaddstrc(y, 64 - price.length, lightGreen, price, noTranslate: true);
    },
    onChoice: (index) async {
      selectedClothingIndex = index;
      selectedArmorIndex = 0;
      renderFooter();
      return false;
    },
    onOtherKey: (key) {
      ClothingType? clothing = getSelectedClothing();
      if (key == Key.enter) {
        return true;
      }
      if ((key == Key.rightArrow || key == Key.rightAngleBracket) &&
          clothing != null) {
        if (selectedArmorIndex < clothing.allowedArmor.length - 1) {
          selectedArmorIndex++;
          renderFooter();
        }
      } else if ((key == Key.leftArrow || key == Key.leftAngleBracket) &&
          clothing != null) {
        if (selectedArmorIndex > 0) {
          selectedArmorIndex--;
          renderFooter();
        }
      } else if (key == Key.upArrow && clothing != null) {
        selectedClothingIndex = (selectedClothingIndex - 1) % craftable.length;
        selectedArmorIndex = 0;
        renderFooter();
      } else if (key == Key.downArrow && clothing != null) {
        selectedClothingIndex = (selectedClothingIndex + 1) % craftable.length;
        selectedArmorIndex = 0;
        renderFooter();
      }
      return false;
    },
  );
  if (selectedClothingIndex != -1) {
    cr.activity = Activity(
      ActivityType.makeClothing,
      idString:
          "${craftable[selectedClothingIndex].idName}:ARMOR$selectedArmorIndex",
    );
  }
}

Future<void> _selectFlagToMake(Creature cr) async {
  List<FlagType> craftable =
      flagTypes.values.where((f) => f.makeDifficulty >= 0).toList()
        ..sort((a, b) {
          int byDifficulty = a.makeDifficulty.compareTo(b.makeDifficulty);
          if (byDifficulty != 0) return byDifficulty;
          int byCategory = a.category.index.compareTo(b.category.index);
          if (byCategory != 0) return byCategory;
          return 0;
        });
  if (craftable.isEmpty) return;

  int selected = 0;
  bool confirmed = false;
  void renderPreview() {
    renderFlagPreview(
      craftable[selected],
      difficulty: craftable[selected].makeDifficultyFor(cr),
      costLine: "\$${craftable[selected].makePrice}",
      costColor: lightGreen,
      cancelText: "Escape - Cancel Making Flag",
    );
  }

  renderPreview();

  await pagedInterface(
    headerPrompt:
        "Which will {name} try to make?  (Half cost if you have cloth)",
    headerPromptParams: {"name": cr.name},
    headerKey: const {
      0: "FLAG",
      40: "ISSUE",
      56: "HEAT",
      62: "DIFFICULTY",
      75: "COST",
    },
    footerPrompt: "Crafted flags are stored in your safehouse inventory.",
    pageSize: 12,
    count: craftable.length,
    showBackButton: false,
    lineBuilder: (y, key, index) {
      FlagType flag = craftable[index];
      addOptionTextFitted(
        y,
        0,
        key,
        "{key} - {name}",
        39,
        params: {"key": key, "name": LcsI18n.tr(flag.name)},
        baseColorKey: index == selected ? ColorKey.white : ColorKey.lightGray,
      );
      mvaddstrcFitted(y, 40, lightGray, flag.view.label, 15);
      var (secrecyText, secrecyColor) = flagSecrecyText(flag);
      mvaddstrc(y, 56, secrecyColor, secrecyText);
      addDifficultyText(y, 62, flag.makeDifficultyFor(cr), maxWidth: 13);
      mvaddstrc(y, 75, lightGreen, "\$${flag.makePrice}");
      // pagedInterface clears graphics on every redraw, so re-draw the preview
      // once per frame, on the first row.
    },
    onChoice: (index) async {
      selected = index;
      renderPreview();
      flush();
      return false;
    },
    onOtherKey: (key) {
      if (key == Key.enter) {
        confirmed = true;
        return true;
      }
      return false;
    },
  );
  if (confirmed) {
    cr.activity = Activity(
      ActivityType.makeFlag,
      idString: craftable[selected].idName,
    );
  }
}

void _clothingDetailFooter(
  ClothingType clothing,
  ArmorUpgrade armor,
  int skill,
) {
  int armorIndex = clothing.allowedArmor.toList().indexOf(armor);
  eraseArea(startY: 16);
  makeDelimiter(y: 16);
  move(17, 0);
  bool alarming =
      clothing.alarming ||
      (armor.visible &&
          !clothing.allowVisibleArmor &&
          clothing.intrinsicArmorId != armor.idName);
  for (int i = 0; i < 2; i++) {
    eraseLine(17);
    addInlineOptionText(
      "<",
      " < ",
      enabledWhen: armorIndex > 0,
      highlightColorKey: "W",
    );
    addstrc(
      lightGray,
      "{name}, ",
      params: {"name": fitConsoleText(LcsI18n.tr(clothing.name), 24)},
      noTranslate: true,
    );
    addstrc(
      lightBlue,
      fitConsoleText(LcsI18n.tr(armor.name), 24),
      noTranslate: true,
    );
    addstrc(
      lightGreen,
      " {price}",
      params: {"price": "\$${clothing.makePrice + armor.makePrice}"},
      noTranslate: true,
    );

    if (clothing.allowedArmor.length > 1) {
      addstrc(
        lightGray,
        " ({current}/{total})",
        params: {
          "current": armorIndex + 1,
          "total": clothing.allowedArmor.length,
        },
        noTranslate: true,
      );
    }
    addInlineOptionText(
      ">",
      " > ",
      enabledWhen: armorIndex < clothing.allowedArmor.length - 1,
      highlightColorKey: "W",
    );
    move(console.y, (console.width - console.x) ~/ 2);
  }

  if (alarming) {
    setColor(red);
  } else {
    setColor(lightBlue);
  }
  mvaddstrCenter(
    18,
    fitConsoleText(LcsI18n.tr(armor.description), console.width),
    noTranslate: true,
  );

  mvaddstrc(19, 20, lightGray, "Special Traits: ");
  List<String> traits = clothing.traitsList(
    false,
    specifiedArmorUpgrade: armor,
  );
  if (traits.isEmpty) {
    if (alarming) {
      addstrc(red, "Alarming");
    } else {
      addstrc(darkGray, "None");
    }
  } else {
    addstrc(
      lightBlue,
      fitConsoleText(traits.map(LcsI18n.tr).join(", "), 44),
      noTranslate: true,
    );
    if (alarming) {
      addstr(", ");
      addstrc(red, "Alarming");
    }
  }

  const rightStatsX = 42;

  void addArmorStat(int y, String label, int value) {
    mvaddstrc(y, 20, lightGray, label);
    final rendered = LcsI18n.processString("{armor} Armor", {
      "armor": value.toString(),
    });
    addstrc(
      lightBlue,
      fitConsoleText(rendered, rightStatsX - console.x - 1),
      noTranslate: true,
    );
  }

  int headArmor = armor.headArmor;
  if (headArmor == 0 && clothing.concealsFace) {
    headArmor = armor.limbArmor;
  }
  addArmorStat(20, "Head: ", headArmor);
  addArmorStat(21, "Torso: ", armor.bodyArmor);
  addArmorStat(22, "Limbs: ", armor.limbArmor);
  mvaddstrc(20, rightStatsX, lightGray, "Dodge: ");
  if (armor.dodgePenalty > 0) {
    addstrc(
      red,
      "-{penalty}",
      params: {"penalty": armor.dodgePenalty.toString()},
      noTranslate: true,
    );
  } else {
    addstrc(lightGreen, "No Penalty");
  }
  mvaddstrc(21, rightStatsX, lightGray, "Accuracy: ");
  if (armor.accuracyPenalty > 0) {
    addstrc(
      red,
      "-{penalty}",
      params: {"penalty": armor.accuracyPenalty.toString()},
      noTranslate: true,
    );
  } else {
    addstrc(lightGreen, "No Penalty");
  }
  mvaddstrc(22, rightStatsX, lightGray, "Complexity: ");
  int difficulty = clothing.makeDifficulty + armor.makeDifficulty + 4 - skill;
  addDifficultyText(console.y, console.x, difficulty);

  setColor(white);
  String enterText = "Enter - Confirm Selection";
  String escapeText = "Escape - Cancel Making Clothing";
  int footerWidth =
      LcsI18n.tr(enterText).length + 3 + LcsI18n.tr(escapeText).length;
  int startX = (console.width - footerWidth) ~/ 2;
  move(23, startX);
  addInlineOptionText("Enter", enterText);
  addstr("  ");
  addInlineOptionText("Escape", escapeText);
}

Future<void> _selectSkillForEducation(
  Creature cr,
  ActivityType activityType,
) async {
  const descriptionX = 35;
  List<Skill> skills = Skill.values;
  if (activityType == ActivityType.takeClass) {
    skills = skills.where((s) => s.canTakeClasses).toList();
  }
  erase();
  final headerPrompt = activityType == ActivityType.takeClass
      ? "What skill will {name} take classes in?"
      : "What skill will {name} practice?";
  await pagedInterface(
    headerPrompt: headerPrompt,
    headerPromptParams: {"name": cr.name},
    headerKey: {4: "SKILL", 23: "NOW", 29: "MAX", descriptionX: "DESCRIPTION"},
    footerPrompt: "Press a Letter to select a Skill",
    count: skills.length,
    lineBuilder: (y, key, index) {
      Skill skill = skills[index];
      addOptionTextFitted(
        y,
        0,
        key,
        "{key} - {skill}",
        22,
        params: {"key": key, "skill": LcsI18n.tr(skill.displayName)},
      );
      highlightColorForSkill(cr, skill);
      printSkillValue(cr, skill, y, 23, emphasizePotential: true);
      mvaddstrcFitted(
        y,
        descriptionX,
        lightGray,
        activityType == ActivityType.takeClass
            ? skill.classText
            : skill.description,
        console.width - descriptionX,
      );
    },
    onChoice: (index) async {
      cr.activity = Activity(activityType, skill: skills[index]);
      return true;
    },
  );
}

void _activityFooter(Creature cr, {bool visible = true}) {
  // The teaching view owns all three detail rows. Clear the previous
  // activity first so a shorter translated line cannot leave stale text.
  eraseLine(22);
  eraseLine(23);
  eraseLine(24);
  if (!visible) return;

  final activityMessageTemplate = switch (cr.activity.type) {
    ActivityType.none =>
      "{name} will lay low and tend to any laundry and mending.",
    ActivityType.visit => "{name} will act with their squad.",
    ActivityType.augment => "{name} will undergo surgery.",
    ActivityType.bury => "{name} will bury the dead.",
    ActivityType.ccfraud => "{name} will commit credit card fraud.",
    ActivityType.clinic => "{name} will go to the hospital.",
    ActivityType.communityService =>
      "{name} will volunteer for a local nonprofit.",
    ActivityType.donations => "{name} will solicit donations.",
    ActivityType.graffiti => "{name} will spray graffiti.",
    ActivityType.hacking => "{name} will hack into private networks.",
    ActivityType.interrogation => "{name} will tend to hostages.",
    ActivityType.makeClothing => "{name} will make clothing.",
    ActivityType.prostitution => "{name} will have sex for money.",
    ActivityType.recruiting => "{name} will recruit new members.",
    ActivityType.sellArt => "{name} will make and sell art.",
    ActivityType.sellDrugs => "{name} will bake and sell weed brownies.",
    ActivityType.sellMusic => "{name} will perform live music for money.",
    ActivityType.sellTshirts => "{name} will make and sell clothing.",
    ActivityType.stealCars => "{name} will steal a car.",
    ActivityType.streamGuardian =>
      "{name} will stream for the Liberal Guardian.",
    ActivityType.study => "{name} will independently study {skill}.",
    ActivityType.takeClass => "{name} will take classes in {skill}.",
    ActivityType.trouble => "{name} will hit the streets and cause trouble.",
    ActivityType.wheelchair => "{name} will procure a wheelchair.",
    ActivityType.writeGuardian =>
      "{name} will write articles for the Liberal Guardian.",
    _ => "{name} will report a bug to the developers: {activity}.",
  };
  final activityMessage = LcsI18n.processString(activityMessageTemplate, {
    "name": cr.name,
    "skill": LcsI18n.tr(cr.activity.skill?.displayName ?? "unknown skill"),
    "activity": LcsI18n.tr(cr.activity.type.label),
  });

  // Determine if this activity needs additional info on line 23
  bool needsLine23 = switch (cr.activity.type) {
    ActivityType.visit ||
    ActivityType.bury ||
    ActivityType.ccfraud ||
    ActivityType.communityService ||
    ActivityType.donations ||
    ActivityType.graffiti ||
    ActivityType.hacking ||
    ActivityType.interrogation ||
    ActivityType.makeClothing ||
    ActivityType.prostitution ||
    ActivityType.recruiting ||
    ActivityType.sellArt ||
    ActivityType.sellDrugs ||
    ActivityType.sellMusic ||
    ActivityType.sellTshirts ||
    ActivityType.stealCars ||
    ActivityType.streamGuardian ||
    ActivityType.study ||
    ActivityType.takeClass ||
    ActivityType.trouble ||
    ActivityType.writeGuardian => true,
    _ => false,
  };

  bool needsLine24 = switch (cr.activity.type) {
    ActivityType.recruiting ||
    ActivityType.study ||
    ActivityType.takeClass ||
    ActivityType.teachCovert ||
    ActivityType.teachFighting ||
    ActivityType.teachLiberalArts ||
    ActivityType.trouble => true,
    _ => false,
  };

  bool isTeaching = switch (cr.activity.type) {
    ActivityType.teachCovert ||
    ActivityType.teachFighting ||
    ActivityType.teachLiberalArts => true,
    _ => false,
  };

  if (!isTeaching) {
    mvaddstrc(22, 3, lightGray, activityMessage, noTranslate: true);
  }

  if (needsLine23) {
    switch (cr.activity.type) {
      case ActivityType.visit:
        mvaddstrc(
          23,
          3,
          midGray,
          "Squad activities always take precedence even if you",
        );
        mvaddstr(24, 3, "assign a different individual activity.");
      case ActivityType.bury:
        mvaddstrc(23, 3, midGray, "Uses Street Smarts to avoid the police.");
      case ActivityType.ccfraud:
        mvaddstrc(23, 3, midGray, "Uses Computers.  Requires a Hacker Den.");
      case ActivityType.communityService:
        mvaddstrc(
          23,
          3,
          midGray,
          "A tiny bit of juice.  It's not *real* though, you know?",
        );
      case ActivityType.donations:
        mvaddstrc(23, 3, midGray, "Uses Persuasion and Street Smarts.");
      case ActivityType.graffiti:
        mvaddstrc(23, 3, midGray, "Uses Art.");
      case ActivityType.hacking:
        mvaddstrc(23, 3, midGray, "Uses Computers.  Requires a Hacker Den.");
      case ActivityType.interrogation:
        mvaddstrc(23, 3, midGray, "Uses Psychology and other social skills.");
      case ActivityType.makeClothing:
        mvaddstrc(23, 3, midGray, "Uses Tailoring.");
      case ActivityType.prostitution:
        mvaddstrc(23, 3, midGray, "Uses Seduction.");
      case ActivityType.recruiting:
        mvaddstrc(
          23,
          3,
          midGray,
          "Uses Street Smarts to find likely recruits.",
        );
      case ActivityType.sellArt:
        mvaddstrc(23, 3, midGray, "Uses Art and Business.");
      case ActivityType.sellDrugs:
        mvaddstrc(23, 3, midGray, "Uses Street Smarts and Business.");
      case ActivityType.sellMusic:
        mvaddstrc(23, 3, midGray, "Uses Music and Business.");
      case ActivityType.sellTshirts:
        mvaddstrc(23, 3, midGray, "Uses Tailoring and Business.");
      case ActivityType.stealCars:
        mvaddstrc(23, 3, midGray, "Uses Security and Street Smarts.");
      case ActivityType.streamGuardian:
        mvaddstrc(
          23,
          3,
          midGray,
          "Uses Persuasion and various knowledge skills.",
        );
      case ActivityType.study:
        mvaddstrc(
          23,
          3,
          midGray,
          "Slowly and safely gains experience for free.",
        );
      case ActivityType.takeClass:
        mvaddstrc(
          23,
          3,
          midGray,
          "Quickly and safely gains experience for \$30/day.",
        );
      case ActivityType.writeGuardian:
        mvaddstrc(23, 3, midGray, "Uses Writing and various knowledge skills.");
      case ActivityType.trouble:
        mvaddstrc(
          23,
          3,
          midGray,
          "Uses Street Smarts to avoid trouble of your own.",
        );
      default:
        break;
    }
  } else if (isTeaching) {
    switch (cr.activity.type) {
      case ActivityType.teachCovert:
        mvaddstrc(
          22,
          3,
          midGray,
          "Trains: Computers, Security, Stealth, Disguise, Tailoring, Seduction,",
        );
        mvaddstr(23, 3, "        Driving, and Street Smarts");
        mvaddstr(
          24,
          3,
          "Classes cost up to \$60/day to conduct. All Liberals able will attend.",
        );
      case ActivityType.teachFighting:
        mvaddstrc(
          22,
          3,
          midGray,
          "Trains: Martial Arts, Firearms, Throwing, Heavy Weapons, Dodge,",
        );
        mvaddstrc(23, 3, midGray, "        and First Aid");
        mvaddstr(
          24,
          3,
          "Classes cost up to \$100/day to conduct. All Liberals able will attend.",
        );
      case ActivityType.teachLiberalArts:
        mvaddstrc(
          22,
          3,
          midGray,
          "Trains: Writing, Persuasion, Law, Religion, Science,",
        );
        mvaddstr(23, 3, "        Business, Psychology, Music, and Art");
        mvaddstr(
          24,
          3,
          "Classes cost up to \$20/day to conduct. All Liberals able will attend.",
        );
      default:
        break;
    }
  }

  if (needsLine24 && !isTeaching) {
    switch (cr.activity.type) {
      case ActivityType.recruiting:
        mvaddstr(
          24,
          3,
          "Persuasion or Seduction is used to convince them to join.",
        );
      case ActivityType.study:
        mvaddstr(24, 3, "The only limit is your own potential.");
      case ActivityType.takeClass:
        mvaddstr(
          24,
          3,
          "Classes have a maximum level and not all skills are taught.",
        );
      case ActivityType.trouble:
        break;
      default:
        break;
    }
  }

  addOptionText(20, 40, "Enter", "Enter - Confirm Selection");
}

enum BulkActivity {
  communityService(
    name: "Community Service",
    activityType: ActivityType.communityService,
  ),
  liberalActivism(name: "Liberal Activism", activityType: ActivityType.trouble),
  liberalGuardian(
    name: "Liberal Guardian",
    activityType: ActivityType.writeGuardian,
  ),
  legalFundraising(
    name: "Legal Fundraising",
    activityType: ActivityType.donations,
  ),
  sellBrownies(name: "Sell Brownies", activityType: ActivityType.sellDrugs),
  prostitution(
    name: "Prostitution",
    activityType: ActivityType.prostitution,
    minAge: 18,
  ),
  ccfraud(
    name: "Credit Card Fraud",
    activityType: ActivityType.ccfraud,
    requiresHackerDen: true,
  ),
  stealCars(name: "Stealing Cars", activityType: ActivityType.stealCars),
  recruiting(name: "Recruiting", activityType: ActivityType.recruiting);

  const BulkActivity({
    required this.name,
    required this.activityType,
    this.requiresHackerDen = false,
    this.minAge,
  });

  final String name;
  final ActivityType activityType;
  final bool requiresHackerDen;
  final int? minAge;

  bool isEnabledFor(Creature creature) {
    if (requiresHackerDen && creature.site?.compound.hackerDen != true) {
      return false;
    }
    if (minAge != null && creature.age < minAge!) {
      return false;
    }
    return true;
  }
}

Future<void> _activateBulk() async {
  List<Creature> temppool = pool
      .where(
        (p) =>
            p.isActiveLiberal &&
            (p.squad == null || p.squad?.activity.type == ActivityType.none),
      )
      .toList();

  if (temppool.isEmpty) return;

  int page = 0;
  BulkActivity selectedActivity = BulkActivity.communityService;

  while (true) {
    erase();

    setColor(lightGray);
    printFunds();

    mvaddstr(0, 0, "Assign Tasks in Bulk");
    addHeader({4: "CODE NAME", 25: "CURRENT ACTIVITY", 51: "BULK ACTIVITY"});

    void addOption(int i, BulkActivity activity) {
      addOptionTextFitted(
        i + 1,
        51,
        i.toString(),
        "{index} - {name}",
        console.width - 51,
        params: {"index": i.toString(), "name": LcsI18n.tr(activity.name)},
        baseColorKey: selectedActivity == activity ? "W" : "w",
      );
    }

    addOption(1, BulkActivity.communityService);
    addOption(2, BulkActivity.liberalActivism);
    addOption(3, BulkActivity.liberalGuardian);
    addOption(4, BulkActivity.legalFundraising);
    addOption(5, BulkActivity.sellBrownies);
    addOption(6, BulkActivity.prostitution);
    addOption(7, BulkActivity.ccfraud);
    addOption(8, BulkActivity.stealCars);
    addOption(9, BulkActivity.recruiting);

    int y = 2;
    for (
      int p = page * 19;
      p < temppool.length && p < page * 19 + 19;
      p++, y++
    ) {
      Creature tempp = temppool[p];
      String letter = letterAPlus(p - page * 19);
      bool isEnabled = selectedActivity.isEnabledFor(tempp);

      addOptionText(
        y,
        0,
        letter,
        "{letter} - {name}",
        params: {"letter": letter, "name": tempp.name},
        enabledWhen: isEnabled,
      );

      move(y, 25);
      setColor(tempp.activity.type.color);
      addstr(tempp.activity.type.label);
    }

    mvaddstrc(
      22,
      0,
      lightGray,
      "Press a Letter to Assign an Activity.  Press a Number to select an Activity.",
    );
    addPageButtons(y: 23, x: 0);

    int c = await getKey();

    //PAGE UP
    if ((isPageUp(c) || c == Key.upArrow || c == Key.leftArrow) && page > 0) {
      page--;
    }
    //PAGE DOWN
    if ((isPageDown(c) || c == Key.downArrow || c == Key.rightArrow) &&
        (page + 1) * 19 < temppool.length) {
      page++;
    }

    if (c >= Key.a && c <= Key.s) {
      int p = page * 19 + c - Key.a;
      if (p < temppool.length) {
        Creature tempp = temppool[p];

        if (selectedActivity.isEnabledFor(tempp)) {
          // Handle special cases for activity selection
          switch (selectedActivity) {
            case BulkActivity.liberalActivism:
              _activismDefault(tempp, noCommunityService: true);
            case BulkActivity.liberalGuardian:
              if (tempp.site?.compound.videoRoom == true &&
                  tempp.skill(Skill.persuasion) >= tempp.skill(Skill.writing)) {
                tempp.activity.type = ActivityType.streamGuardian;
              } else {
                tempp.activity.type = ActivityType.writeGuardian;
              }
            case BulkActivity.legalFundraising:
              _legalDefault(tempp);
            default:
              tempp.activity = Activity(selectedActivity.activityType);
          }
        }
      }
    }
    if (c >= Key.num1 && c <= Key.num9) {
      selectedActivity = BulkActivity.values[c - Key.num1];
    }

    if (isBackKey(c)) break;
  }
}

Future<void> _selectTendHostage(Creature cr) async {
  List<Creature> hostages =
      cr.site?.creaturesPresent
          .where(
            (c) =>
                c.alive &&
                c.align == Alignment.conservative &&
                c.location == cr.location,
          )
          .toList() ??
      [];
  if (hostages.isEmpty) return;
  if (hostages.length == 1) {
    cr.activity = Activity(ActivityType.interrogation, idInt: hostages[0].id);
    return;
  }
  erase();
  await pagedInterface(
    headerPrompt: "Which hostage will {name} be watching over?",
    headerPromptParams: {"name": cr.name},
    headerKey: {
      4: "HOSTAGE NAME",
      25: "SKILL",
      33: "HEALTH",
      45: "LOCATION",
      60: "DAYS IN CAPTIVITY",
    },
    footerPrompt: "Press a Letter to select a Hostage",
    count: hostages.length,
    lineBuilder: (y, key, index) {
      Creature h = hostages[index];
      mvaddstrc(
        y,
        0,
        lightGray,
        "{key} - {name}",
        params: {"key": key, "name": h.name},
      );
      mvaddstr(
        y,
        25,
        "{skillTotal}",
        params: {
          "skillTotal": h.rawSkill.values.reduce((a, b) => a + b).toString(),
        },
      );
      printHealthStat(y, 33, h, small: true);
      mvaddstrc(
        y,
        45,
        lightGray,
        h.location?.getName(short: true, includeCity: true) ??
            LcsI18n.tr("Missing"),
        noTranslate: true,
      );
      mvaddstr(
        y,
        60,
        "{days} Day{s}",
        params: {
          "days": h.daysSinceJoined.toString(),
          "s": h.daysSinceJoined == 1 ? "" : "s",
        },
      );
    },
    onChoice: (index) async {
      cr.activity = Activity(
        ActivityType.interrogation,
        idInt: hostages[index].id,
      );
      return true;
    },
  );
}

Future<void> equipLiberal(Creature c) async {
  //create a temp squad containing just this liberal
  Squad? oldActiveSquad = activeSquad;
  Squad newSquad = Squad();
  newSquad.members.add(c);
  squads.add(newSquad);
  activeSquad = newSquad;
  await equip(c.site?.loot);
  activeSquad = oldActiveSquad;
  squads.remove(newSquad);
}
