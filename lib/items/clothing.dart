import 'dart:math';
import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/body.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/items/armor_upgrade.dart';
import 'package:lcs_new_age/items/clothing_type.dart';
import 'package:lcs_new_age/items/item.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/utils/colors.dart';

part 'clothing.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class Clothing extends Item {
  Clothing(super.typeName, {super.stackSize, this.armorId})
      : super.superConstructor() {
    armorId ??= type.allowedArmor.first.idName;
    damaged = false;
  }
  Clothing.fromType(ClothingType type, ArmorUpgrade armor, {int quality = 1})
      : _quality = quality,
        armorId = armor.idName,
        super.superConstructor(type.idName) {
    armorId ??= type.allowedArmor.first.idName;
    damaged = false; // Setting damaged to false will set up the armor values
  }
  factory Clothing.fromJson(Map<String, dynamic> json) =>
      _$ClothingFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ClothingToJson(this);

  @JsonKey()
  bool bloody = false;
  @JsonKey(
      includeToJson: true,
      includeFromJson: true,
      defaultValue: false,
      name: "damaged")
  bool _damaged = false;
  bool get damaged =>
      _damaged ||
      bodyArmor < maxBodyArmor ||
      headArmor < maxHeadArmor ||
      _limbArmor.values.any((a) => a < maxLimbArmor);
  set damaged(bool value) {
    if (!value) {
      bodyArmor = maxBodyArmor;
      headArmor = maxHeadArmor;
      _limbArmor = {};
    }
    _damaged = value;
  }

  bool get alarming =>
      (type.alarming) ||
      ((armor?.visible ?? false) &&
          !type.allowVisibleArmor &&
          type.intrinsicArmorId != armor?.idName);

  @JsonKey(includeToJson: true, includeFromJson: true, defaultValue: 1)
  int _quality = 1;

  @override
  ClothingType get type => super.type as ClothingType;
  @override
  bool get isClothing => true;
  @override
  bool get isForSale => !bloody && !damaged && fenceValue > 0;
  int get quality => _quality;
  set quality(int value) {
    _quality = value.clamp(1, type.qualityLevels);
  }

  @JsonKey()
  String? armorId;
  ArmorUpgrade? get armor => armorUpgrades[armorId];
  set armor(ArmorUpgrade? value) {
    armorId = value?.idName ?? "";
  }

  bool get fireResistant => armor?.fireResistant ?? false;

  double get armorQualityModifier {
    if (armor?.makeDifficulty == 0) return 1;
    return 1 - (quality - 1) * 0.2;
  }

  int get maxBodyArmor =>
      ((armor?.bodyArmor ?? 0) * armorQualityModifier).round();
  @JsonKey(defaultValue: 0)
  int bodyArmor = 0;
  int get maxHeadArmor {
    ArmorUpgrade? armor = this.armor;
    if (armor == null) return 0;
    if (armor.headArmor == 0 && type.concealsFace) {
      return (armor.limbArmor * armorQualityModifier).round();
    }
    return (armor.headArmor * armorQualityModifier).round();
  }

  @JsonKey(defaultValue: 0)
  int headArmor = 0;
  int get maxLimbArmor =>
      ((armor?.limbArmor ?? 0) * armorQualityModifier).round();
  @JsonKey(includeToJson: true, includeFromJson: true, defaultValue: {})
  Map<String, int> _limbArmor = {};

  int getLimbArmor(BodyPart part) => _limbArmor[part.name] ?? maxLimbArmor;
  void setLimbArmor(BodyPart part, int value) {
    _limbArmor[part.name] = value;
  }

  int getArmorForLocation(BodyPart part) {
    if (part.weakSpot) return headArmor;
    if (part.critical) return bodyArmor;
    return getLimbArmor(part);
  }

  void damageArmorInLocation(BodyPart part, int damage) {
    if (part.weakSpot) {
      headArmor = (headArmor - damage).clamp(0, headArmor);
    } else if (part.critical) {
      bodyArmor = (bodyArmor - damage).clamp(0, bodyArmor);
    } else {
      int currentArmor = getLimbArmor(part);
      setLimbArmor(part, (currentArmor - damage).clamp(0, currentArmor));
    }
    damaged = true;
  }

  @override
  double get fenceValue {
    int value = armor?.makePrice ?? 0;
    if (quality <= type.qualityLevels) {
      return (value + type.fenceValue) / quality;
    } else {
      return 0;
    }
  }

  @override
  Clothing clone() => Clothing(type.idName, armorId: armorId)
    ..bloody = bloody
    ..damaged = damaged
    ..quality = quality
    ..bodyArmor = bodyArmor
    ..headArmor = headArmor
    .._limbArmor = Map.from(_limbArmor);

  String get shortName => type.shortName;
  String get longName {
    if (quality > type.durability) {
      return "Tattered Rags";
    } else if (damaged) {
      return "${type.name} (d)";
    } else {
      return type.name;
    }
  }

  String shortArmorDetail() {
    String text = "";
    if (maxBodyArmor > 0 || maxHeadArmor > 0 || maxLimbArmor > 0) {
      int maxArmorIdentifySkill = _getMaxArmorIdentifySkill();
      String armorDisplay = _getArmorDisplay(maxArmorIdentifySkill);
      text += armorDisplay;
    }
    return text;
  }

  int _getMaxArmorIdentifySkill() {
    Iterable<Creature> filteredList = pool
          .where((c) => c.alive && c.align == Alignment.liberal);
    // Check context to determine which pool to use
    if (mode == GameMode.site && activeSite != null) {
      // On a site, check the entire LCS pool on that site
      filteredList = filteredList.where((c) => c.site == activeSite);
    }
    return filteredList
        .map((c) => c.attribute(Attribute.intelligence))
        .whereType<int>()
        .fold(0, (max, skill) => skill > max ? skill : max);
  }

  String _getArmorDisplay(int armorIdentifySkill) {
    // Calculate the actual armor value
    double limbArmorAvg = _limbArmor.values.fold(0, (a, b) => a + b);
    if (_limbArmor.length < 4) {
      limbArmorAvg += (4 - _limbArmor.length) * maxLimbArmor;
    }
    limbArmorAvg /= max(4, _limbArmor.length);
    double totalArmor = (bodyArmor + bodyArmor + limbArmorAvg + headArmor) /
        (maxBodyArmor + maxBodyArmor + maxLimbArmor + maxHeadArmor) *
        bodyArmor;
    if (totalArmor < 0) totalArmor = 0;
    int actualArmor = totalArmor.round();
    if (armorIdentifySkill <= 1) {
      // Vague descriptions only
      return _getVagueArmorDescription(actualArmor);
    } else if (armorIdentifySkill <= 4) {
      // Rounded values with increasing precision
      return _getRoundedArmorDisplay(actualArmor, armorIdentifySkill);
    } else {
      // Exact values
      return "+$actualArmor";
    }
  }

  String _getVagueArmorDescription(int armorValue) {
    if (armorValue <= 40) return "+Lgt";
    if (armorValue <= 80) return "+Med";
    if (armorValue <= 150) return "+Hvy";
    return "+Ext";
  }

  String _getRoundedArmorDisplay(int armorValue, int skillLevel) {
    // Formula for increasing precision: higher skill = more precise rounding
    // Skill 2: round to nearest 2
    // Skill 3: round to nearest 1
    // Skill 4: exact but still rounded for display
    int precision;
    switch (skillLevel) {
      case 2:
        precision = 2;
      case 3:
        precision = 1;
      // Still show exact for skill 4
      case 4:
        return "+$armorValue";
      default:
        precision = 1;
    }
    int roundedArmor = (armorValue / precision).round() * precision;
    roundedArmor = roundedArmor.clamp(0, armorValue);
    return "+$roundedArmor";
  }

  @override
  String equipTitle({bool full = false}) {
    String et = full ? type.name : type.shortName;
    if (quality > type.qualityLevels) {
      et = "Tattered Rags";
    }
    et += "&C${shortArmorDetail()}&x";
    if ((quality > 1 && quality <= type.qualityLevels) || bloody || damaged) {
      if (quality > 9) {
        et += "&KX&x";
      } else if (quality > 1) {
        et += "&Y$quality&x";
      }
      if (bloody) {
        et += "&RB&x";
      }
      if (damaged) {
        et += "&OD&x";
      }
    }
    return et;
  }

  @override
  void printEquipTitle(
      {bool full = false, Color baseColor = lightGray, bool armor = true}) {
    if (quality > type.qualityLevels) {
      addstrc(baseColor, "Tattered Rags");
    } else {
      addstrc(baseColor, full ? type.name : type.shortName);
    }
    if (armor) {
      addstrc(lightBlue, shortArmorDetail());
    }
    if (quality > 9) {
      addstrc(darkGray, "X");
    } else if (quality > 1) {
      addstrc(yellow, quality.toString());
    }
    if (bloody) {
      addstrc(red, "B");
    }
    if (damaged) {
      addstrc(orange, "D");
    }
  }

  @override
  int compareTo(Item other) {
    if (other is! Clothing) return super.compareTo(other);
    if (type.idName != other.type.idName) {
      return type.idName.compareTo(other.type.idName);
    }
    if (quality > other.quality) return -1;
    if (quality < other.quality) return 1;
    if (armorId == null && other.armorId != null) return -1;
    if (armorId != null && other.armorId == null) return 1;
    if (armorId != other.armorId) return armorId!.compareTo(other.armorId!);
    if (bodyArmor < other.bodyArmor) return -1;
    if (bodyArmor > other.bodyArmor) return 1;
    if (headArmor < other.headArmor) return -1;
    if (headArmor > other.headArmor) return 1;
    for (String key in _limbArmor.keys) {
      int comp = _limbArmor[key]!
          .compareTo(other._limbArmor[key] ?? other.maxLimbArmor);
      if (comp != 0) return comp;
    }
    for (String key in other._limbArmor.keys) {
      int comp =
          (_limbArmor[key] ?? maxLimbArmor).compareTo(other._limbArmor[key]!);
      if (comp != 0) return comp;
    }
    if (bloody && !other.bloody) return -1;
    if (!bloody && other.bloody) return 1;
    if (damaged && !other.damaged) return -1;
    if (!damaged && other.damaged) return 1;
    return 0;
  }

  bool covers(BodyPart part) {
    if (part.weakSpot) return type.coversHead || headArmor > 0;
    if (part.critical) return type.coversBody || bodyArmor > 0;
    // Technically, this doesn't account for the difference
    // between arms and legs, but that literally only comes
    // up for overalls, which don't cover arms.
    if (type.coversArms || type.coversLegs) return true;
    return getLimbArmor(part) > 0;
  }
}
