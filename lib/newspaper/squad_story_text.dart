import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/politics/alignment.dart';

String squadStoryTextLocation(
  NewsStory ns,
  bool ccs, {
  bool includeOpening = true,
}) {
  String placename = ns.loc!.getName();
  if (placename.substring(0, 4) == "The ") {
    placename = placename.substring(4);
  }
  int posand = placename.indexOf('&');
  if (posand != -1) {
    placename = LcsI18n.processString("{before} and {after}", {
      "before": placename.substring(0, posand).trim(),
      "after": placename.substring(posand + 1).trim(),
    });
  }
  final place = ccs ? mapCCSPlace(ns.loc!, placename) : placename;
  String locationPhrase = switch (ns.loc!.type) {
    SiteType.downtown ||
    SiteType.universityDistrict ||
    SiteType.outOfTown ||
    SiteType.industrialDistrict => switch (placename) {
      "Shopping" => LcsI18n.tr("at the Shopping Mall"),
      "Travel" => LcsI18n.tr("at the Travel Agency"),
      "Outskirts and Orange County" => LcsI18n.tr("in Orange County"),
      "Brooklyn and Queens" => LcsI18n.tr("on Long Island"),
      "Greater Hollywood" => LcsI18n.tr("in Hollywood"),
      "Manhattan Island" => LcsI18n.tr("in Manhattan"),
      "Arlington" => LcsI18n.tr("in Arlington"),
      "National Mall" => LcsI18n.tr("on the National Mall"),
      "Downtown" => LcsI18n.tr("in Downtown"),
      _ => LcsI18n.processString("in the {place}", {"place": place}),
    },
    SiteType.pawnShop =>
      placename.contains("'s")
          ? LcsI18n.processString("at {place}", {"place": place})
          : LcsI18n.processString("at the {place}", {"place": place}),
    SiteType.apartment ||
    SiteType.carDealership ||
    SiteType.departmentStore ||
    SiteType.publicPark => LcsI18n.processString("at {place}", {
      "place": place,
    }),
    _ => LcsI18n.processString("at the {place}", {"place": place}),
  };

  if (!includeOpening) {
    return locationPhrase;
  }

  if (ns.publicationAlignment == DeepAlignment.eliteLiberal && !ccs) {
    return switch (ns.loc!.type) {
      SiteType.upscaleApartment => LcsI18n.processString(
        "  The events took place {locationPhrase}, known for its rich and snooty residents.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.barAndGrill => LcsI18n.processString(
        "  The events took place {locationPhrase}, a spawning ground of Wrong Conservative Ideas.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.cosmeticsLab => LcsI18n.processString(
        "  The events took place {locationPhrase}, a Conservative animal rights abuser.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.geneticsLab => LcsI18n.processString(
        "  The events took place {locationPhrase}, a dangerous Conservative genetic research lab.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.policeStation => LcsI18n.processString(
        "  The events took place {locationPhrase}, headquarters of one of the most oppressive and Conservative police forces in the country.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.courthouse => LcsI18n.processString(
        "  The events took place {locationPhrase}, site of numerous Conservative Injustices.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.prison => LcsI18n.processString(
        "  The events took place {locationPhrase}, where innocent people are regularly beaten by Conservative guards.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.intelligenceHQ => LcsI18n.processString(
        "  The events took place {locationPhrase}, the Conservative headquarters of one of the biggest privacy violators in the world.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.armyBase => LcsI18n.processString(
        "  The events took place {locationPhrase}, pride of Conservative torturers and warmongers everywhere.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.sweatshop => LcsI18n.processString(
        "  The events took place {locationPhrase}, a Conservative sweatshop and human rights abuser.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.dirtyIndustry => LcsI18n.processString(
        "  The events took place {locationPhrase}, a factory whose Conservative smokestacks choke the city with deadly pollutants.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.nuclearPlant => LcsI18n.processString(
        "  The events took place {locationPhrase}, also known to be a Conservative storage facility for radioactive waste.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.corporateHQ => LcsI18n.processString(
        "  The events took place {locationPhrase}, where evil and Conservatism coagulate in the hallways.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.ceoHouse => LcsI18n.processString(
        "  The events took place {locationPhrase}, a building with enough square footage enough to house a hundred people if it weren't in Conservative Hands.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.amRadioStation ||
      SiteType.cableNewsStation => LcsI18n.processString(
        "  The events took place {locationPhrase}, known for its Extreme Conservative Bias.  ",
        {"locationPhrase": locationPhrase},
      ),
      SiteType.bank => LcsI18n.processString(
        "  The events took place {locationPhrase}, the very symbol of economic inequality.  ",
        {"locationPhrase": locationPhrase},
      ),
      _ => LcsI18n.processString(
        "  The events took place {locationPhrase}.  ",
        {"locationPhrase": locationPhrase},
      ),
    };
  }

  return LcsI18n.processString("  The events took place {locationPhrase}.  ", {
    "locationPhrase": locationPhrase,
  });
}

String squadStoryTextOpening(NewsStory ns, bool ccs) {
  String story = "";
  if (ns.type == NewsStories.squadSiteAction ||
      ns.type == NewsStories.squadKilledInSiteAction) {
    if (!lcsInPublicEye &&
        ns.publicationAlignment != DeepAlignment.eliteLiberal) {
      if (ns.liberalSpin) {
        if (ns.type == NewsStories.squadKilledInSiteAction) {
          story += LcsI18n.tr(
            "A group calling itself the Liberal Crime Squad burst briefly onto the scene of political activism yesterday, according to a spokesperson from the police department.&r",
          );
        } else {
          story += LcsI18n.tr(
            "A group calling itself the Liberal Crime Squad burst onto the scene of political activism yesterday, according to a spokesperson from the police department.&r",
          );
        }
      } else {
        story += LcsI18n.tr(
          "A group of terrorists calling themselves the Liberal Crime Squad went on a rampage yesterday, according to a spokesperson from the police department.",
        );
      }
    } else {
      if (ns.liberalSpin) {
        if (ns.type == NewsStories.squadKilledInSiteAction) {
          story += LcsI18n.tr(
            "The Liberal Crime Squad has struck again, albeit with a tragic end.&r",
          );
        } else {
          story += LcsI18n.tr("The Liberal Crime Squad has struck again.&r");
        }
      } else {
        if (ns.publicationAlignment == DeepAlignment.archConservative) {
          story += LcsI18n.tr(
            "The notorious Liberal Crime Squad went on another rampage, but they got what they deserved.&r",
          );
        } else {
          story += LcsI18n.tr(
            "The Liberal Crime Squad went on a violent rampage.&r",
          );
        }
      }
    }
  } else if (ns.type == NewsStories.ccsSiteAction ||
      ns.type == NewsStories.ccsKilledInSiteAction) {
    if (!ccsInPublicEye) {
      if (ns.liberalSpin) {
        if (ns.type == NewsStories.ccsKilledInSiteAction) {
          if (ns.publicationAlignment == DeepAlignment.archConservative) {
            story += LcsI18n.tr(
              "A group of would-be patriots calling themselves the Conservative Crime Squad burst briefly onto the scene of political activism yesterday, according to a spokesperson from the police department.&r",
            );
          } else {
            story += LcsI18n.tr(
              "A group of would-be heavily armed vigilantes calling themselves the Conservative Crime Squad burst briefly onto the scene of political activism yesterday, according to a spokesperson from the police department.&r",
            );
          }
        } else {
          if (ns.publicationAlignment == DeepAlignment.archConservative) {
            story += LcsI18n.tr(
              "A group of patriots calling themselves the Conservative Crime Squad burst onto the scene of political activism yesterday, according to a spokesperson from the police department.&r",
            );
          } else {
            story += LcsI18n.tr(
              "A group of heavily armed vigilantes calling themselves the Conservative Crime Squad burst onto the scene of political activism yesterday, according to a spokesperson from the police department.&r",
            );
          }
        }
      } else {
        if (ns.publicationAlignment == DeepAlignment.eliteLiberal) {
          story += LcsI18n.tr(
            "A gang of terrorists calling themselves the Conservative Crime Squad went on a violent rampage yesterday, according to a spokesperson from the police department.&r",
          );
        } else {
          story += LcsI18n.tr(
            "A gang of heavily armed vigilantes calling themselves the Conservative Crime Squad went on a suicidal rampage yesterday, according to a spokesperson from the police department.&r",
          );
        }
      }
    } else {
      if (!ns.liberalSpin &&
          ns.publicationAlignment != DeepAlignment.eliteLiberal) {
        if (ns.publicationAlignment == DeepAlignment.archConservative) {
          story += LcsI18n.tr(
            "The Conservative Crime Squad, patriots that they are, struck again.&r",
          );
        } else {
          story += LcsI18n.tr("The Conservative Crime Squad struck again.&r");
        }
      } else {
        if (ns.publicationAlignment == DeepAlignment.eliteLiberal) {
          story += LcsI18n.tr(
            "The Conservative Crime Squad, terrorists that they are, went on another rampage.&r",
          );
        } else {
          story += LcsI18n.tr(
            "The Conservative Crime Squad went on another rampage.&r",
          );
        }
      }
    }
  }

  story += squadStoryTextLocation(ns, ccs);

  if (ns.type == NewsStories.squadKilledInSiteAction) {
    if (ns.publicationAlignment == DeepAlignment.eliteLiberal) {
      story += LcsI18n.tr(
        "Unfortunately, the LCS group was defeated by the forces of evil.",
      );
    } else if (ns.liberalSpin) {
      story += LcsI18n.tr("Everyone in the LCS group was arrested or killed.");
    } else {
      story += LcsI18n.tr(
        "Fortunately, the LCS thugs were stopped by brave citizens.",
      );
    }
  }
  if (ns.type == NewsStories.ccsKilledInSiteAction) {
    if (ns.publicationAlignment == DeepAlignment.archConservative) {
      story += LcsI18n.tr(
        "Unfortunately, the CCS patriots were defeated by the forces of evil.",
      );
    } else if (!ns.liberalSpin) {
      story += LcsI18n.tr("Everyone in the CCS group was arrested or killed.");
    } else {
      story += LcsI18n.tr(
        "Fortunately, the CCS brutes were stopped by brave citizens.",
      );
    }
  }
  story += "&r";

  return story;
}

String mapCCSPlace(Site loc, String placename) {
  return {
        SiteType.upscaleApartment: "University Dormitory",
        SiteType.barAndGrill: "Gay Nightclub",
        SiteType.cosmeticsLab: "Animal Shelter",
        SiteType.geneticsLab: "Research Ethics Commission HQ",
        SiteType.policeStation: "Police Reform Office",
        SiteType.courthouse: "Abortion Clinic",
        SiteType.prison: "Rehabilitation Center",
        SiteType.intelligenceHQ: "Media Independence Office",
        SiteType.sweatshop: "Labor Union HQ",
        SiteType.dirtyIndustry: "Sustainable Energy Research Center",
        SiteType.nuclearPlant: "Whirled Peas Museum",
        SiteType.corporateHQ: "Welfare Assistance Agency",
        SiteType.ceoHouse: "Tax Collection Agency",
        SiteType.amRadioStation: "Public Radio Station",
        SiteType.cableNewsStation: "Network News Station",
        SiteType.armyBase: "Greenpeace Offices",
        SiteType.fireStation: "ACLU Branch Office",
        SiteType.bank: "Richard Dawkins Food Bank",
        SiteType.whiteHouse: "Progressive Lobbying Office",
      }[loc.type] ??
      placename;
}
