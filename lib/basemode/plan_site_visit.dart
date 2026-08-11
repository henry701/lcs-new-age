import 'dart:math' as math;
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_party.dart';
import 'package:lcs_new_age/engine/console.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/district.dart';
import 'package:lcs_new_age/location/location.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/interface_options.dart';

const int intercityTicketPrice = 100;

Future<void> planSiteVisit() async {
  Squad? aSquad = activeSquad;
  if (aSquad == null || squad.isEmpty) return;
  bool haveCar = squad.any((s) => s.preferredCar != null);
  Site? squadLocation = aSquad.site;
  Location? area = squadLocation?.city;
  int ticketPrice = squad.length * intercityTicketPrice;
  int page = 0;

  while (true) {
    erase();
    mvaddstrc(0, 0, lightGray, "Where will the Squad go?");
    printParty(fullParty: true);
    if (area != null) {
      mvaddstrc(8, 0, lightGray, area.getName(), noTranslate: true);
    }
    List<Location> destinationList;
    if (area is City) {
      destinationList = [...area.districts];
    } else if (area is District) {
      destinationList = <Site>[...area.sites.whereNot((s) => s.hidden)]
        ..sort((a, b) => a.controller.index.compareTo(b.controller.index));
    } else {
      destinationList = [...cities];
    }

    int y = 10;
    for (
      int p = page * 11;
      p < destinationList.length && p < page * 11 + 11;
      p++
    ) {
      Location thisLocation = destinationList[p];
      Site? thisSite = (thisLocation is Site) ? thisLocation : null;
      District? thisDistrict = (thisLocation is District) ? thisLocation : null;
      City? thisCity = (thisLocation is City) ? thisLocation : null;
      String name = thisLocation.getName();
      String letter = letterAPlus(y - 10);
      final statusParts = <({String text, Color color})>[];
      void addStatus(String source, Color color) {
        statusParts.add((text: LcsI18n.tr(source), color: color));
      }

      if (thisLocation == squadLocation ||
          thisCity == squadLocation?.city ||
          thisDistrict == squadLocation?.district) {
        addStatus(" (Current Location)", white);
      } else if (thisSite?.controller == SiteController.lcs) {
        if (thisSite!.heatProtection <= 5) {
          addStatus(" (LCS Temp Shelter)", lightGreen);
        } else {
          if (thisSite.creaturesPresent.isEmpty &&
              !thisSite.compound.upgraded) {
            addStatus(" (Potential Safehouse)", lightGreen);
          } else {
            addStatus(" (LCS Safehouse)", lightGreen);
          }
        }
      } else if (thisSite?.controller == SiteController.ccs &&
          (ccsInPublicEye || thisSite?.mapped == true)) {
        addStatus(" (CCS Safehouse)", red);
      } else if (thisSite?.isClosed == true) {
        addStatus(" (Closed Down)", red);
      } else if (thisSite?.hasHighSecurity == true) {
        addStatus(" (High Security)", pink);
      }
      if (thisLocation.area != squadLocation?.area && !haveCar) {
        addStatus(" (Need Car)", yellow);
      }
      if (thisSite?.siege.underSiege == true) {
        addStatus(" (Under Siege)", red);
      }

      final metadataStart = thisSite?.controller == SiteController.lcs
          ? 54
          : thisCity != null
          ? 50
          : CONSOLE_WIDTH;
      final statusTextWidth = statusParts.fold<int>(
        0,
        (width, status) => width + strLenX(status.text),
      );
      final statusWidth = math.min(
        statusTextWidth,
        math.max(0, metadataStart - 1),
      );
      final optionWidth = math.max(1, metadataStart - statusWidth);
      addOptionTextFitted(
        y,
        0,
        letter,
        "{letter} - {name}",
        optionWidth,
        params: {"letter": letter, "name": name},
        enabledWhen:
            thisSite?.isClosed != true &&
            thisSite?.siege.underSiege != true &&
            (thisLocation.area == squadLocation?.area || haveCar),
      );
      var statusRemaining = statusWidth;
      for (final status in statusParts) {
        if (statusRemaining <= 0) break;
        final fittedStatus = fitConsoleText(
          status.text,
          math.min(strLenX(status.text), statusRemaining),
        );
        addstrc(status.color, fittedStatus, noTranslate: true);
        statusRemaining -= strLenX(fittedStatus);
      }
      if (thisSite != null && thisSite.controller == SiteController.lcs) {
        int heat = thisSite.heat;
        int heatProtection = thisSite.heatProtection;
        mvaddstrc(y, 54, lightGray, "Heat: ");
        addstrc(
          heat > heatProtection ? red : darkGray,
          "{value}",
          params: {"value": heat.toString()},
        );
        // Keep a separator after the heat value. At high pressure the fixed
        // x=66 position can be occupied by a fourth heat digit.
        final heatDigits = heat.toString().length;
        final secrecyX = 64 + (heatDigits < 3 ? 3 : heatDigits);
        mvaddstrc(y, secrecyX, lightGray, "Secrecy: ");
        addstrc(
          heat > heatProtection ? red : darkGray,
          "{value}",
          params: {"value": heatProtection.toString()},
        );
      }
      if (thisCity != null) {
        mvaddstrc(
          y,
          50,
          darkGray,
          LcsI18n.tr(thisCity.description),
          noTranslate: true,
        );
      }
      y++;
    }
    if (area == squadLocation?.city) {
      String letter = letterAPlus(y - 10);
      addOptionText(
        y,
        0,
        letter,
        "{letter} - Travel to a Different City",
        params: {"letter": letter},
        enabledWhen: haveCar && ledger.funds >= ticketPrice,
      );
      if (!haveCar) addstrc(yellow, " (Need Car)");
      addstrc(
        ledger.funds < ticketPrice ? red : green,
        " ({price})",
        params: {"price": "\$$ticketPrice"},
      );
    }
    setColor(lightGray);
    if (page > 0) {
      mvaddstr(10, 60, previousPageStr, noTranslate: true);
    }
    if (page + 1 < destinationList.length / 11) {
      mvaddstr(20, 60, nextPageStr, noTranslate: true);
    }
    if (area == squadLocation?.city) {
      addOptionText(
        24,
        1,
        "Enter",
        "Enter - The Squad is not yet Liberal enough",
      );
    } else {
      addOptionText(24, 1, "Enter", "Enter - Back one step");
    }
    int c = await getKey();
    if (isPageUp(c) && page > 0) page--;
    if (isPageDown(c) && page + 1 < destinationList.length / 11) page++;
    if (c >= Key.a && c <= Key.k) {
      int index = page * 11 + c - Key.a;
      if (index >= 0 && index < destinationList.length) {
        Location? oldArea = area;
        area = destinationList[index];
        if (area.area != squadLocation?.area && !haveCar) area = oldArea;
        if (area is Site && !area.isClosed) {
          aSquad.activity = Activity(
            ActivityType.visit,
            idString: area.idString,
          );
          break;
        }
      } else if (haveCar &&
          area == squadLocation?.city &&
          index == destinationList.length) {
        area = null;
      }
    }
    if (isBackKey(c)) {
      if (area == squadLocation?.city) {
        aSquad.activity = Activity.none();
        break;
      } else if (area is City) {
        area = null;
      } else if (area == null) {
        area = squadLocation?.city;
      } else {
        area = area.city;
      }
    }
  }
}
