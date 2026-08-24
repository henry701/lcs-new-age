/* news - make some filler junk */
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

String generateFiller(int amount) {
  final rawCityName = randomCityName();
  // The generated city pool contains proper names that are intentionally not
  // catalogued. Keep those fallbacks verbatim instead of recording a missing
  // translation for every filler story.
  final cityName = localizedCityDisplayName(rawCityName);
  String fillerStory = LcsI18n.processString(
    "{city:red} - ",
    {"city": cityName},
    noTranslate: true,
    baseColorKey: 'r',
  );
  for (int par = 0; amount > 0; amount--) {
    par++;
    for (int i = 0; i < lcsRandom(10) + 3; i++) {
      fillerStory += "~";
    }
    if (amount > 1) fillerStory += " ";
    if (par >= 50 && oneIn(5) && amount > 20) {
      par = 0;
      fillerStory += "&r  ";
    }
  }
  fillerStory += "&r";
  return fillerStory;
}
