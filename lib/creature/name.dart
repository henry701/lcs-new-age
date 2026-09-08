import 'package:json_annotation/json_annotation.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/name_lists.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

part 'name.g.dart';

@JsonSerializable()
class FullName {
  FullName(this.first, this.middle, this.last, this.gender);
  factory FullName.fromJson(Map<String, dynamic> json) =>
      _$FullNameFromJson(json);
  Map<String, dynamic> toJson() => _$FullNameToJson(this);
  String first;
  String middle;
  String last;
  @JsonKey(defaultValue: Gender.nonbinary)
  Gender gender;

  @override
  String toString() => LcsI18n.processString("{first} {middle} {last}", {
    "first": first,
    "middle": middle,
    "last": last,
  });

  String get firstLast =>
      LcsI18n.processString("{first} {last}", {"first": first, "last": last});
}

FullName generateFullName([Gender gender = Gender.nonbinary]) {
  gender = forceGenderBinary(gender);
  return FullName(
    firstName(gender),
    firstName(gender),
    lastName(gender),
    gender,
  );
}

String lastName([Gender gender = Gender.nonbinary]) {
  if (gender == Gender.whiteMalePatriarch) {
    return archconservativeLastNames.random;
  } else {
    return lastNames.random;
  }
}

String firstName([Gender gender = Gender.nonbinary, bool forceBinary = true]) {
  if (forceBinary) {
    gender = forceGenderBinary(gender);
  }
  switch (gender) {
    case Gender.whiteMalePatriarch:
      return whiteMalePatriarchFirstNames.random;
    case Gender.male:
      return maleFirstNames.followedBy(genderNeutralFirstNames).random;
    case Gender.female:
      return femaleFirstNames.followedBy(genderNeutralFirstNames).random;
    default:
      return genderNeutralFirstNames.random;
  }
}

class CountryName {
  CountryName(this.name, this.shortName, this.capital, this.leader);
  String name;
  String shortName;
  String capital;
  FullName leader;
}

CountryName generateCountryName() {
  String shortName = LcsI18n.processString("{prefix}{middle}{suffix}", {
    "prefix": countryPrefixes.random,
    "middle": countryMiddle.random,
    "suffix": countrySuffixes.random,
  });
  final title = LcsI18n.tr(countryTitles.random);
  String longName = oneIn(2)
      ? LcsI18n.processString("{title} of {country}", {
          "title": title,
          "country": shortName,
        })
      : LcsI18n.processString("{country} {title}", {
          "country": shortName,
          "title": title,
        });
  String capital = switch (lcsRandom(3)) {
    1 => LcsI18n.processString("St. {name}", {"name": lastName()}),
    2 => LcsI18n.processString("{prefix} {suffix}", {
      "prefix": LcsI18n.tr(["New", "Green", "Bright", "Fort", "High"].random),
      "suffix": LcsI18n.tr(["Haven", "Hill", "Bridge", "Bull", "Lake"].random),
    }),
    _ => LcsI18n.processString("{prefix}{suffix}", {
      "prefix": countryPrefixes.random,
      "suffix": countrySuffixes.random,
    }),
  };
  FullName leader = generateFullName(Gender.male);
  return CountryName(longName, shortName, capital, leader);
}

String generateCompanyName() {
  return LcsI18n.processString("{prefix}{stem} {type}", {
    "prefix": [
      "Anti", "Dis", "Fore", "Uni", "Sub", "Pre", "Under", "Inter", //
    ].random,
    "stem": [
      "bolt", "card", "fold", "run", "star", "flow", "wind", "fire", //
    ].random,
    "type": LcsI18n.tr(
      [
        "Industries", "Enterprises", "Holdings", "Group", "International", //
      ].random,
    ),
  });
}
