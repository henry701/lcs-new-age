import 'dart:math';

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/name.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/ledger.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/flag_type.dart';
import 'package:lcs_new_age/items/item.dart';
import 'package:lcs_new_age/items/money.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/compound.dart';
import 'package:lcs_new_age/location/district.dart';
import 'package:lcs_new_age/location/location.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/siege.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/laws.dart';
import 'package:lcs_new_age/sitemode/sitemap.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

part 'site.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class Site extends Location {
  Site(this.type, [City? city, District? district])
    : name = type.name,
      shortName = type.shortName,
      cityId = city?.id ?? cities.firstOrNull?.id ?? -1,
      districtId = district?.id ?? districts.firstOrNull?.id ?? -1,
      id = gameState.nextSiteId++,
      mapseed = nextRngSeed {
    if (type == SiteType.homelessEncampment || type == SiteType.warehouse) {
      controller = SiteController.lcs;
    }
    if (discreet) hidden = true;
    initSiteName(this);
  }
  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
  Map<String, dynamic> toJson() => _$SiteToJson(this);
  @JsonKey()
  SiteType type;
  @JsonKey()
  Siege siege = Siege();
  @JsonKey()
  SiteController controller = SiteController.unaligned;
  @JsonKey()
  int rent = 0;
  @JsonKey()
  bool newRental = false;
  @JsonKey()
  int heat = 0;
  @JsonKey(defaultValue: 0)
  int extraHeatFromRuralMobs = 0;
  @JsonKey(defaultValue: 0)
  int extraHeatFromCorps = 0;
  @JsonKey(defaultValue: 0)
  int extraHeatFromCIA = 0;
  @JsonKey(defaultValue: 0)
  int extraHeatFromCCS = 0;
  int get extraHeatFromCCSTarget {
    if (!ccsActive || !lcsInPublicEye) return 0;
    int ccsReach = ccsState.index;
    if (!city.sites.any((s) => s.controller == SiteController.ccs)) {
      ccsReach -= 2;
    }
    if (ccsReach < 0) ccsReach = 0;
    int target =
        ccsReach *
        creaturesPresent.where((e) => e.isCriminal && e.isActiveLiberal).length;
    if ([
      SiteType.barAndGrill,
      SiteType.bombShelter,
      SiteType.bunker,
    ].contains(type)) {
      target *= 3;
    }
    return target;
  }

  @JsonKey()
  bool hasFlag = false;
  @JsonKey(defaultValue: 'FLAG_US')
  String flyingFlagId = 'FLAG_US';
  FlagType? get flyingFlag => hasFlag ? flagTypes[flyingFlagId] : null;
  @JsonKey(includeToJson: true, includeFromJson: true, defaultValue: false)
  bool _businessFront = false;
  bool get businessFront {
    if (type == SiteType.barAndGrill) {
      return true;
    }
    return _businessFront;
  }

  set businessFront(bool value) => _businessFront = value;
  @JsonKey()
  int closed = 0;
  bool get isClosed => closed > 0;
  @JsonKey()
  int highSecurity = 0;
  bool get hasHighSecurity => highSecurity > 0;
  @JsonKey()
  bool hidden = false;
  @JsonKey()
  bool mapped = false;
  @JsonKey()
  int id;
  @JsonKey()
  int cityId;
  @override
  City get city => cities.firstWhere((c) => c.id == cityId);
  @JsonKey()
  int districtId;
  District get district => districts.firstWhere((d) => d.id == districtId);
  @JsonKey()
  Compound compound = Compound();
  @JsonKey()
  List<Item> loot = [];
  @JsonKey()
  int mapseed;
  @JsonKey()
  List<SiteTileChange> changes = [];

  @JsonKey()
  @override
  String name;
  @JsonKey()
  String shortName;
  @JsonKey()
  String? frontName;
  @JsonKey()
  String? frontShortName;

  bool get upgradable {
    switch (type) {
      case SiteType.warehouse:
      case SiteType.barAndGrill:
      case SiteType.bombShelter:
      case SiteType.bunker:
      case SiteType.drugHouse:
        return true;
      default:
        return false;
    }
  }

  bool get discreet {
    if (type == SiteType.bombShelter || type == SiteType.bunker) {
      return true;
    }
    return false;
  }

  void rename(String name, String shortName) {
    this.name = name;
    this.shortName = shortName;
  }

  @override
  int get area => district.area;

  bool get isPartOfTheJusticeSystem =>
      type == SiteType.policeStation ||
      type == SiteType.courthouse ||
      type == SiteType.prison;
  bool get isSafehouse => controller == SiteController.lcs;

  bool get chargesRent =>
      type == SiteType.tenement ||
      type == SiteType.apartment ||
      type == SiteType.upscaleApartment;

  @override
  String getName({bool short = false, bool includeCity = false}) {
    final rawName = short ? (frontShortName ?? shortName) : (frontName ?? name);
    // Generated site names are already localized when the world is created.
    // Only pass stable catalog keys through the translator; otherwise a name
    // such as "Base do Exército Sullivan" is incorrectly reported as a
    // missing English key on every render.
    final fullName = LcsI18n.hasTranslation(rawName)
        ? LcsI18n.tr(rawName)
        : rawName;
    if (includeCity && multipleCityMode) {
      return LcsI18n.processString("{site}, {city}", {
        "site": fullName,
        "city": city.getName(short: true),
      });
    } else {
      return fullName;
    }
  }

  Iterable<Creature> get creaturesPresent =>
      pool.where((element) => element.locationId == idString);

  int get numberEating => creaturesPresent
      .where((e) => e.alive && e.align == Alignment.liberal)
      .length;

  int get foodDaysLeft => (compound.rations / max(numberEating, 1)).round();

  int get heatProtection {
    int protection = 15;
    if (type == SiteType.homelessEncampment) protection = 3;
    if (type == SiteType.tenement) protection = 30;
    if (type == SiteType.apartment) protection = 60;
    if (type == SiteType.upscaleApartment || discreet || businessFront) {
      protection = 80;
    }
    int flagSecrecy = flagSecrecyWhenFlying(flyingFlag);
    if (flagSecrecy > 0) protection += flagSecrecy;
    return protection.clamp(0, 95);
  }

  @override
  String get idString => "Site$id";

  @override
  void init() {
    mapseed = nextRngSeed;
    hasFlag = false;
    newRental = false;
    heat = 0;
    closed = 0;
    mapped = false;
    highSecurity = 0;
    changes.clear();
    compound = Compound();
    businessFront = false;

    initSiteName(this);
  }

  bool isDuplicateLocation() {
    return sites.any((e) => e != this && e.name == name);
  }

  /* add all items from a list to a location, and deal with money properly */
  void addLootAndProcessMoney(List<Item> loot) {
    List<Item> lootCopy = loot.toList();
    loot.clear();
    for (Item l in lootCopy) {
      if (l is Money) {
        ledger.addFunds(l.stackSize, Income.thievery);
      } else {
        // Empty squad inventory into base inventory
        this.loot.add(l);
      }
    }
  }
}

String localizedGeneratedSiteName(String adjective, String siteType) {
  final fullName = '$adjective $siteType';
  if (LcsI18n.hasTranslation(fullName)) return LcsI18n.tr(fullName);

  if (LcsI18n.currentLocale == 'pt_BR') {
    final translatedAdjective = _ptBrGeneratedAdjective(
      adjective,
      _ptBrFeminineGeneratedSiteTypes.contains(siteType),
    );
    if (translatedAdjective != null) {
      return [LcsI18n.tr(siteType), translatedAdjective].join(' ');
    }
  }

  return LcsI18n.processString('{adjective} {siteType}', {
    'adjective': LcsI18n.tr(adjective),
    'siteType': LcsI18n.tr(siteType),
  });
}

String localizedGeneratedNursingHomeName(String adjective, String noun) {
  final fullName = [adjective, noun, 'Nursing Home'].join(' ');
  if (LcsI18n.hasTranslation(fullName)) return LcsI18n.tr(fullName);

  final translatedAdjective = LcsI18n.currentLocale == 'pt_BR'
      ? _ptBrNursingHomeAdjective(adjective, noun)
      : LcsI18n.tr(adjective);
  return LcsI18n.processString('{adjective} {noun} Nursing Home', {
    'adjective': translatedAdjective,
    'noun': LcsI18n.tr(noun),
  });
}

String localizedGeneratedJuiceBarName(String adjective, String noun) {
  final fullName = [adjective, noun, 'Juice Bar'].join(' ');
  if (LcsI18n.hasTranslation(fullName)) return LcsI18n.tr(fullName);

  if (LcsI18n.currentLocale != 'pt_BR') {
    return LcsI18n.processString('{adjective} {noun} Juice Bar', {
      'adjective': LcsI18n.tr(adjective),
      'noun': LcsI18n.tr(noun),
    });
  }

  return LcsI18n.processString('{juiceBar} {noun} {adjective}', {
    'juiceBar': LcsI18n.tr('Juice Bar'),
    'noun': LcsI18n.tr(noun),
    'adjective': _ptBrJuiceBarAdjective(adjective, noun),
  }, noTranslate: true);
}

const _ptBrFeminineNursingHomeNouns = <String>{
  'Journey',
  'Compass',
  'Reflections',
};

const _ptBrPluralNursingHomeNouns = <String>{'Moments', 'Reflections'};

String _ptBrNursingHomeAdjective(String adjective, String noun) {
  final base = switch (adjective) {
    'Happy' => 'Feliz',
    'Gentle' => 'Gentil',
    'Quiet' => 'Silencioso',
    'Radiant' => 'Radiante',
    'Loving' => 'Amoroso',
    'Tender' => 'Carinhoso',
    'Joyful' => 'Alegre',
    _ => LcsI18n.tr(adjective),
  };
  final feminine = _ptBrFeminineNursingHomeNouns.contains(noun);
  final plural = _ptBrPluralNursingHomeNouns.contains(noun);

  return switch ((base, feminine, plural)) {
    ('Feliz', _, true) => 'Felizes',
    ('Feliz', _, false) => 'Feliz',
    ('Gentil', _, true) => 'Gentis',
    ('Gentil', _, false) => 'Gentil',
    ('Alegre', _, true) => 'Alegres',
    ('Alegre', _, false) => 'Alegre',
    ('Radiante', _, true) => 'Radiantes',
    ('Radiante', _, false) => 'Radiante',
    ('Silencioso', true, true) => 'Silenciosas',
    ('Silencioso', true, false) => 'Silenciosa',
    ('Silencioso', false, true) => 'Silenciosos',
    ('Silencioso', false, false) => 'Silencioso',
    ('Amoroso', true, true) => 'Amorosas',
    ('Amoroso', true, false) => 'Amorosa',
    ('Amoroso', false, true) => 'Amorosos',
    ('Amoroso', false, false) => 'Amoroso',
    ('Carinhoso', true, true) => 'Carinhosas',
    ('Carinhoso', true, false) => 'Carinhosa',
    ('Carinhoso', false, true) => 'Carinhosos',
    ('Carinhoso', false, false) => 'Carinhoso',
    _ => base,
  };
}

const _ptBrFeminineJuiceBarNouns = <String>{'Diet', 'Orange', 'Carrot'};

const _ptBrPluralJuiceBarNouns = <String>{'Methods'};

String _ptBrJuiceBarAdjective(String adjective, String noun) {
  final base = switch (adjective) {
    'Harmonious' => 'Harmonioso',
    _ => LcsI18n.tr(adjective),
  };
  final feminine = _ptBrFeminineJuiceBarNouns.contains(noun);
  final plural = _ptBrPluralJuiceBarNouns.contains(noun);

  return switch ((base, feminine, plural)) {
    ('Harmonioso', true, true) => 'Harmoniosas',
    ('Harmonioso', true, false) => 'Harmoniosa',
    ('Harmonioso', false, true) => 'Harmoniosos',
    ('Harmonioso', false, false) => 'Harmonioso',
    _ => base,
  };
}

const _ptBrFeminineGeneratedSiteTypes = <String>{
  'Paper Mill',
  'Schoolhouse',
  'Bus Garage',
  'Steel Plant',
  'Church',
  'Toy Factory',
  'Train Station',
  'Auto Plant',
  'Textile Mill',
  'Cannery',
  'Brewery',
  'Clinic',
  'Library',
};

String? _ptBrGeneratedAdjective(String adjective, bool feminine) =>
    switch (adjective) {
      'Abandoned' => feminine ? 'Abandonada' : 'Abandonado',
      'Forgotten' => feminine ? 'Esquecida' : 'Esquecido',
      'Old' => feminine ? 'Velha' : 'Velho',
      'Haunted' => feminine ? 'Assombrada' : 'Assombrado',
      _ => null,
    };

enum SiteController { lcs, ccs, unaligned }

Site? findSiteInSameCity(City? city, SiteType type) =>
    city?.sites.firstWhereOrNull((e) => e.type == type);

void initSiteName(Site loc) {
  // NOTE: make sure to keep code here matching code in updateworld_laws() in
  // monthly.cpp for when names are changed
  switch (loc.type) {
    case SiteType.policeStation:
      if (deathSquadsActive) {
        loc.rename("Death Squad HQ", "Death HQ");
      } else {
        loc.rename("Police Station", "Police");
      }
    case SiteType.courthouse:
      if (laws[Law.deathPenalty] == DeepAlignment.archConservative) {
        loc.rename("Halls of Ultimate Judgment", "Judge Hall");
      } else {
        loc.rename("Courthouse", "Courthouse");
      }
    case SiteType.fireStation:
      if (noProfanity) {
        loc.rename("Fireman HQ", "Fire HQ");
        loc.hidden = false;
      } else {
        loc.rename("Fire Station", "Fire Dept.");
        loc.hidden = true;
      }
    case SiteType.prison:
      if (laws[Law.prisons] == DeepAlignment.archConservative) {
        const adjective = ["Happy", "Cheery", "Quiet", "Green", "Nectar"];
        const noun = ["Valley", "Meadow", "Hills", "Glade", "Forest"];
        loc.name =
            LcsI18n.processString("{adjective} {noun} Forced Labor Camp", {
              "adjective": LcsI18n.tr(adjective.random),
              "noun": LcsI18n.tr(noun.random),
            });
        loc.shortName = "Joycamp";
      } else {
        final owner = lastName(Gender.whiteMalePatriarch);
        loc.name = LcsI18n.processString("{name} Prison", {"name": owner});
        loc.shortName = LcsI18n.tr("Prison");
      }
    case SiteType.universityHospital:
      switch (loc.cityId) {
        case 1: // Seattle
          loc.name = "UW Medical Center";
          loc.shortName = "UW Medical";
        case 2: // New York
          loc.name = "NewYork-Presbyterian Hospital";
          loc.shortName = "NYP Hospital";
        case 3: // Los Angeles
          loc.name = "LA General Medical Center";
          loc.shortName = "LA General";
        case 4: // Washington DC
          loc.name = "MedStar Washington";
          loc.shortName = "MedStar";
        default: // It is a mystery
          loc.name = "University Hospital";
          loc.shortName = "Hospital";
      }
    case SiteType.nursingHome:
      const adjective = [
        "Happy",
        "Gentle",
        "Quiet",
        "Radiant",
        "Loving",
        "Tender",
        "Joyful",
      ];
      const noun = [
        "Journey",
        "Moments",
        "Compass",
        "Touch",
        "Oasis",
        "Care",
        "Reflections",
      ];
      loc.name = localizedGeneratedNursingHomeName(
        adjective.random,
        noun.random,
      );
      loc.shortName = "NursingHome";
    case SiteType.insuranceOffice:
      const adjective = ["United", "Human", "Blue", "First", "Golden"];
      const noun = ["Cross", "Health", "Care", "Life", "Well"];
      loc.name = LcsI18n.processString("{adjective} {noun} Insurance", {
        "adjective": LcsI18n.tr(adjective.random),
        "noun": LcsI18n.tr(noun.random),
      });
      loc.shortName = "Insurance";
    case SiteType.nuclearPlant:
      if (laws[Law.nuclearPower] == DeepAlignment.eliteLiberal) {
        loc.rename("Nuclear Waste Center", "Nuclear");
      } else {
        loc.rename("Nuclear Power Plant", "Nuclear");
      }
    case SiteType.intelligenceHQ:
      if (nineteenEightyFour) {
        loc.rename("Ministry of Love", "Miniluv");
      } else {
        loc.rename("Intelligence HQ", "Int. HQ");
      }
    case SiteType.armyBase:
      if (nineteenEightyFour) {
        loc.rename("Ministry of Peace", "Minipax");
      } else {
        final owner = lastName(Gender.whiteMalePatriarch);
        loc.name = LcsI18n.processString("{name} Army Base", {"name": owner});
        loc.shortName = LcsI18n.tr("Army Base");
      }
    case SiteType.pawnShop:
      String name = lastName();
      if (laws[Law.gunControl] == DeepAlignment.eliteLiberal) {
        loc.name = LcsI18n.processString("{name}'s Pawnshop", {"name": name});
      } else {
        loc.name = LcsI18n.processString("{name} Pawn & Gun", {"name": name});
      }
      loc.shortName = "Pawnshop";
    case SiteType.ceoHouse:
      if (corporateFeudalism) {
        loc.rename("CEO Castle", "CEO Castle");
      } else {
        loc.rename("CEO Mansion", "CEO House");
      }
    case SiteType.warehouse:
      do {
        final adjective = ["Abandoned", "Forgotten", "Old", "Haunted"].random;
        late final String siteType;
        switch (lcsRandom(10)) {
          case 0:
            siteType = "Meat Plant";
            loc.shortName = "Meat Plant";
          case 1:
            siteType = "Warehouse";
            loc.shortName = "Warehouse";
          case 2:
            siteType = "Paper Mill";
            loc.shortName = "Paper Mill";
          case 3:
            siteType = "Schoolhouse";
            loc.shortName = "School";
          case 4:
            siteType = "Motel";
            loc.shortName = "Old Motel";
          case 5:
            siteType = "Bus Garage";
            loc.shortName = "Bus Garage";
          case 6:
            siteType = "Steel Plant";
            loc.shortName = "Steel Plant";
          case 7:
            siteType = "Church";
            loc.shortName = "Old Church";
          case 8:
            siteType = "Toy Factory";
            loc.shortName = "Toymakers";
          case 9:
            siteType = "Train Station";
            loc.shortName = "Station";
          case 10:
            siteType = "Auto Plant";
            loc.shortName = "Auto Plant";
          case 11:
            siteType = "Textile Mill";
            loc.shortName = "Textile Mill";
          case 12:
            siteType = "Cannery";
            loc.shortName = "Cannery";
          case 13:
            siteType = "Office Building";
            loc.shortName = "Offices";
          case 14:
            siteType = "Brewery";
            loc.shortName = "Brewery";
          case 15:
            siteType = "Clinic";
            loc.shortName = "Old Clinic";
          case 16:
            siteType = "Library";
            loc.shortName = "Library";
          case 17:
            siteType = "Museum";
            loc.shortName = "Museum";
          case 18:
            siteType = "Restaurant";
            loc.shortName = "Restaurant";
          default:
            siteType = "Warehouse";
            loc.shortName = "Warehouse";
        }
        loc.name = localizedGeneratedSiteName(adjective, siteType);
      } while (loc.isDuplicateLocation());
    case SiteType.dirtyIndustry:
      switch (lcsRandom(5)) {
        case 0:
          loc.rename("Aluminum Factory", "Alum Fact");
        case 1:
          loc.rename("Plastic Factory", "Plast Fact");
        case 2:
          loc.rename("Oil Refinery", "Refinery");
        case 3:
          loc.rename("Auto Plant", "Auto Plant");
        case 4:
          loc.rename("Chemical Factory", "Chem Fact");
      }
    case SiteType.upscaleApartment:
      do {
        String name = lastName();
        loc.shortName = "Condos";
        loc.name = LcsI18n.processString("{name} Condominiums", {"name": name});
      } while (loc.isDuplicateLocation());
    case SiteType.apartment:
      do {
        String name = lastName();
        loc.shortName = "Apartment";
        loc.name = LcsI18n.processString("{name} Apartments", {"name": name});
      } while (loc.isDuplicateLocation());
    case SiteType.tenement:
      do {
        String name;
        do {
          name = lastName();
        } while (name.length > 7);
        loc.name = LcsI18n.processString('{name} St. Housing Projects', {
          'name': name,
        });
        loc.shortName = "Projects";
      } while (loc.isDuplicateLocation());
    case SiteType.geneticsLab:
      loc.name = LcsI18n.processString("{name} Genetics", {"name": lastName()});
      loc.shortName = "Genetics";
    case SiteType.cosmeticsLab:
      loc.name = LcsI18n.processString("{name} Cosmetics", {
        "name": lastName(),
      });
      loc.shortName = "Cosmetics";
    case SiteType.carDealership:
      String name = firstName(Gender.whiteMalePatriarch);
      loc.name = LcsI18n.processString("{name}'s Used Cars", {"name": name});
      loc.shortName = "Car Dealer";
    case SiteType.departmentStore:
      loc.name = LcsI18n.processString("{name}'s Department Store", {
        "name": lastName(),
      });
      loc.shortName = "Dept. Store";
    case SiteType.sweatshop:
      loc.name = LcsI18n.processString("{name} Garment Makers", {
        "name": lastName(),
      });
      loc.shortName = "Sweatshop";
    case SiteType.drugHouse:
      if (loc.controller == SiteController.lcs) {
        String name = loc.name.split(" ").first;
        loc.name = LcsI18n.processString('{name} St. Safehouse', {
          'name': name,
        });
        loc.shortName = "Safehouse";
      } else {
        do {
          final name = lastName();
          final int choice = lcsRandom(4);
          if (laws[Law.drugs] == DeepAlignment.eliteLiberal) {
            switch (choice) {
              case 0:
                loc.name = LcsI18n.processString(
                  '{name} St. Recreational Drugs Center',
                  {'name': name},
                );
                loc.shortName = "Drug Shop";
              case 1:
                loc.name = LcsI18n.processString('{name} St. Cannabis Lounge', {
                  'name': name,
                });
                loc.shortName = "Pot Lounge";
              case 2:
                loc.name = LcsI18n.processString(
                  '{name} St. Marijuana Dispensary',
                  {'name': name},
                );
                loc.shortName = "Dispensary";
              default:
                loc.name = LcsI18n.processString('{name} St. Drug House', {
                  'name': name,
                });
                loc.shortName = "Drug House";
            }
          } else {
            loc.name = LcsI18n.processString('{name} St. Drug House', {
              'name': name,
            });
            loc.shortName = "Drug House";
          }
        } while (loc.isDuplicateLocation());
      }
    case SiteType.juiceBar:
      const adj = ["Natural", "Harmonious", "Restful", "Healthy", "New You"];
      const noun = ["Diet", "Methods", "Plan", "Orange", "Carrot"];
      loc.name = localizedGeneratedJuiceBarName(adj.random, noun.random);
      loc.shortName = "Juice Bar";
    case SiteType.veganCoOp:
      const veggie = ["Asparagus", "Tofu", "Broccoli", "Radish", "Eggplant"];
      const noun = ["Forest", "Rainbow", "Garden", "Farm", "Meadow"];
      loc.name = LcsI18n.processString("{vegetable} {noun} Vegan Co-op", {
        "vegetable": LcsI18n.tr(veggie.random),
        "noun": LcsI18n.tr(noun.random),
      });
      loc.shortName = "Vegan";
    case SiteType.internetCafe:
      const adj = ["Electric", "Wired", "Nano", "Micro", "Techno"];
      const noun = ["Panda", "Troll", "Latte", "Unicorn", "Pixie"];
      loc.name = LcsI18n.processString("{adjective} {noun} Internet Cafe", {
        "adjective": LcsI18n.tr(adj.random),
        "noun": LcsI18n.tr(noun.random),
      });
      loc.shortName = "Net Cafe";
    case SiteType.latteStand:
      const adj = ["Frothy", "Milky", "Caffeine", "Morning", "Evening"];
      const noun = ["Mug", "Cup", "Jolt", "Wonder", "Express"];
      loc.name = LcsI18n.processString("{adjective} {noun} Latte Stand", {
        "adjective": LcsI18n.tr(adj.random),
        "noun": LcsI18n.tr(noun.random),
      });
      loc.shortName = "Latte";
    case SiteType.publicPark:
      loc.name = LcsI18n.processString("{name} Park", {"name": lastName()});
      loc.shortName = "Park";
    case SiteType.barAndGrill:
      if (loc.controller == SiteController.lcs) {
        loc.name = "Vegan Bar & Grill";
        loc.shortName = "Vegan Bar";
      } else {
        loc.name = "Desert Eagle Bar & Grill";
        loc.shortName = "Deagle Bar";
      }
    case SiteType.bunker:
      if (loc.controller == SiteController.lcs) {
        loc.name = "Liberation Bunker";
        loc.shortName = "Bunker";
      } else {
        loc.name = "Robert E. Lee Bunker";
        loc.shortName = "Bunker";
      }
    default:
      break;
  }
}
