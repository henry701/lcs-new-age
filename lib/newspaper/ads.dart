import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/newspaper/display_news.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

void displaysinglead(
  bool liberalguardian,
  List<(int, int)> addplace,
  List<int> storyXStart,
  List<int> storyXEnd,
  NewsStory ns,
) {
  int x, y;
  (x, y) = addplace.random;
  addplace.remove((x, y));

  int sx = 0, ex = 0, sy = 0, ey = 0;
  if (x == 0) {
    sx = 0;
    ex = 23 + lcsRandom(4);
  }
  if (x == 1) {
    sx = 57 - lcsRandom(4);
    ex = 79;
  }
  if (y == 0) {
    sy = 2;
    ey = 9;
  }
  if (y == 1) {
    sy = 10;
    ey = 17;
  }
  if (y == 2) {
    sy = 18;
    ey = 24;
  }
  int choice = x + y * 2;

  String ch = '?';
  switch (lcsRandom(6)) {
    case 0:
      ch = "\u2591";
    case 1:
      ch = "\u2592"; //CH_MEDIUM_SHADE;
    case 2:
      ch = "\u2593"; //CH_DARK_SHADE;
    case 3:
      ch = "\u2588"; //CH_FULL_BLOCK;
    case 4:
      ch = "\u253C"; //CH_BOX_DRAWINGS_LIGHT_VERTICAL_AND_HORIZONTAL;
    case 5:
      ch = '*';
  }

  for (y = sy; y <= ey; y++) {
    if (storyXStart[y] < ex && ex < 43) storyXStart[y] = ex + 2;
    if (storyXEnd[y] > sx && sx > 43) storyXEnd[y] = sx - 2;

    if (ey == 9 && y == 9) continue;
    if (ey == 17 && y == 17) continue;
    for (x = sx; x <= ex; x++) {
      if (y == sy || y == 8 || y == 16 || y == 24 || x == sx || x == ex) {
        mvaddchar(y, x, ch);
      }
    }
  }

  //AD CONTENT
  {
    List<int> storyXStart = List.filled(25, 40);
    List<int> storyXEnd = List.filled(25, 40);
    for (int i = sy + 1; i <= ey - 1; i++) {
      storyXStart[i] = sx + 1;
      storyXEnd[i] = ex - 1;
    }

    String ad;
    if (!liberalguardian) {
      // Regular Newspaper Ads
      switch (choice) {
        case 0:
          ad = "&c";
          ad += LcsI18n.tr("No Fee");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("Consignment Program");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("Call for Details");
          ad += "&r";
        case 1:
          ad = "&c";
          ad += LcsI18n.tr("Fine Leather Chairs");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("Special Purchase");
          ad += "&r";
          ad += LcsI18n.processString("&cNow {amount}", {
            "amount": LcsI18n.currencyAmount((lcsRandom(8) + 8) * 100 + 49.99),
          });
          ad += "&r";
        case 2:
          ad = "&c";
          ad += LcsI18n.tr("Paris Flea Market");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("Sale");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("50% Off");
          ad += "&r";
        case 3:
          ad = "&c";
          ad += LcsI18n.tr("Quality Pre-Owned");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("Vehicles");
          ad += "&r";
          ad += LcsI18n.processString("&c{year} Lexus GS 300&r", {
            "year": (2020 - lcsRandom(15)).toString(),
          });
          ad += "&c";
          ad += LcsI18n.tr("Sedan 4D");
          ad += "&r";
          ad += LcsI18n.processString("&cOnly {amount}", {
            "amount": LcsI18n.currencyAmount((lcsRandom(19) + 3) * 1000 + 750),
          });
          ad += "&r";
        case 4:
          ad = "&c";
          ad += LcsI18n.tr("Spa");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("Health, Beauty");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("and Fitness");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("7 Days a Week");
          ad += "&r";
        case 5:
          ad = "&c";
          switch (lcsRandom(5)) {
            // less explicit personals in regular newspaper than Liberal Guardian
            case 0:
              ad += LcsI18n.tr("Searching For Love");
            case 1:
              ad += LcsI18n.tr("Seeking Love");
            case 2:
              ad += LcsI18n.tr("Are You Lonely?");
            case 3:
              ad += LcsI18n.tr("Looking For Love");
            case 4:
              ad += LcsI18n.tr("Soulmate Wanted");
          }
          ad += "&r&r";
          ad += LcsI18n.processString("&c{description} {who} {seeking}&r", {
            "description": sexdesc(),
            "who": sexwho(),
            "seeking": sexseek(),
          });
          ad += LcsI18n.processString("&c{type} w/ {who}&r", {
            "type": sextype(),
            "who": sexwho(),
          });
        default:
          ad = "&c";
          ad += LcsI18n.tr("Debuggers Needed");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("It Seems");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("You've Found");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("A Bug!");
          ad += "&r";
      }
    } else {
      // Liberal Guardian Ads
      switch (choice) // should be 6 choices from 1 to 6
      {
        case 0:
          ad = "&c";
          ad += LcsI18n.tr("Want Organic?");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("Visit The Vegan");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("Co-Op");
          ad += "&r";
        case 1:
          ad = "&c";
          ad += LcsI18n.tr("Liberal Defense Lawyer");
          ad += "&r";
          ad += "&c";
          ad += lcsRandom(11 + 20).toString();
          ad += " ";
          ad += LcsI18n.tr("Years Experience");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("Call Today");
          ad += "&r";
        case 2:
          ad = "&c";
          ad += LcsI18n.tr("Abortion Clinic");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("Walk-in, No");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("Questions Asked");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("Open 24/7");
          ad += "&r";
        case 3:
          ad = "&c";
          ad += LcsI18n.tr("Marijuana Dispensary");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("No ID Or Prescription Needed!");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("Please Pay In Cash.");
          ad += "&r";
        case 4:
          ad = "&c";
          ad += LcsI18n.tr("Got Slack?");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("Visit Your Local");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("SubGenius Clench");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("For More Info");
          ad += "&r";
        case 5:
          ad = "&c";
          switch (lcsRandom(5)) {
            // more explicit personals in Liberal Guardian than regular newspaper
            case 0:
              ad += LcsI18n.tr("Searching For Sex");
            case 1:
              ad += LcsI18n.tr("Seeking Sex");
            case 2:
              ad += LcsI18n.tr("Wanna Have Sex?");
            case 3:
              ad += LcsI18n.tr("Looking For Sex");
            case 4:
              ad += LcsI18n.tr("Sex Partner Wanted");
          }
          ad += "&r&r";
          ad += LcsI18n.processString("&c{description} {who} {seeking}&r", {
            "description": sexdesc(),
            "who": sexwho(),
            "seeking": sexseek(),
          });
          ad += LcsI18n.processString("&c{type} w/ {who}&r", {
            "type": sextype(),
            "who": sexwho(),
          });
        default:
          ad = "&c";
          ad += LcsI18n.tr("Debuggers Needed");
          ad += "&r&r";
          ad += "&c";
          ad += LcsI18n.tr("It Seems");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("You've Found");
          ad += "&r";
          ad += "&c";
          ad += LcsI18n.tr("A Bug!");
          ad += "&r";
      }
    }

    displayNewsStory(ad, storyXStart, storyXEnd, sy + 1, ns, true);
  }
}

void displayAds(
  NewsStory ns,
  bool liberalguardian,
  List<int> storyXStart,
  List<int> storyXEnd,
) {
  int adnumber = 0;
  if (!liberalguardian) {
    if (ns.page >= 10) adnumber++;
    if (ns.page >= 20) adnumber += lcsRandom(2) + 1;
    if (ns.page >= 30) adnumber += lcsRandom(2) + 1;
    if (ns.page >= 40) adnumber += lcsRandom(2) + 1;
    if (ns.page >= 50) adnumber += lcsRandom(2) + 1;
  } else {
    if (ns.guardianpage >= 2) adnumber++;
    if (ns.guardianpage >= 3) adnumber += lcsRandom(2) + 1;
    if (ns.guardianpage >= 4) adnumber += lcsRandom(2) + 1;
    if (ns.guardianpage >= 5) adnumber += lcsRandom(2) + 1;
    if (ns.guardianpage >= 6) adnumber += lcsRandom(2) + 1;
  }
  List<(int, int)> addplace = [(0, 0), (0, 1), (0, 2), (1, 0), (1, 1), (1, 2)];
  for (adnumber = (adnumber > 6 ? 6 : adnumber); adnumber > 0; adnumber--) {
    displaysinglead(liberalguardian, addplace, storyXStart, storyXEnd, ns);
  }
}

/* pick a descriptor acronym */
String sexdesc() => ["DTE", "ND", "NS", "VGL"].random;

/* what kind of person? */
String sexwho() => [
  "BB", "BBC", "BF", "BHM", "BiF", "BiM", //
  "BBW", "BMW", "CD", "DWF", "DWM", "FTM", "GAM", "GBM",
  "GF", "GG", "GHM", "GWC", "GWF", "GWM", "MBC", "MBiC",
  "MHC", "MTF", "MWC", "SBF", "SBM", "SBiF", "SBiM",
  "SSBBW", "SWF", "SWM", "TG", "TS", "TV",
].random;

/* seeking acronym */
String sexseek() => ["ISO", "LF"].random;

/* what type of sex? */
String sextype() => [
  "225", "ATM", "BDSM", "CBT", "BJ", "DP", "D/s", "GB", //
  "HJ", "OTK", "PNP", "TT", "SWS", "W/S",
].random;
