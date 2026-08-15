/* politics - causes the supreme court to hand down decisions */

import 'package:collection/collection.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/name.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/laws.dart';
import 'package:lcs_new_age/politics/politics.dart';
import 'package:lcs_new_age/talk/drop_a_pickup_line.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

const supremeCourtVoteColumn = 63;

String localizedSupremeCourtAlignment(DeepAlignment alignment) =>
    LcsI18n.tr(alignment.label);

/// Fits a localized precedent into the left column of the surveillance vote.
///
/// Vote totals start at [supremeCourtVoteColumn], so the description must
/// leave room for the translated prefix, its trailing period, and a separator
/// before the right-hand vote totals.
String fitSupremeCourtPrecedent(String precedent) {
  final prefix = LcsI18n.processString("A new precedent would ", null);
  final availableWidth = supremeCourtVoteColumn - strLenX(prefix) - 2;
  return fitConsoleText(LcsI18n.processString(precedent, null), availableWidth);
}

Future<void> supremeCourt() async {
  int c;
  if (canSeeThings) {
    await showMessage("The Supreme court is handing down decisions!");

    erase();
    mvaddstrc(
      0,
      0,
      white,
      "Supreme Court Watch {year}",
      params: {"year": year.toString()},
    );
    setColor(lightGray);
  }

  int cnum = lcsRandom(5) + 2, bias = 0;
  List<Law> scase = List.filled(cnum, Law.elections);
  List<int> scasedir = List.filled(cnum, -1);
  List<Law> availableLaws = [...Law.values];
  String name1, name2;

  for (c = 0; c < cnum; c++) {
    scase[c] = availableLaws.removeAt(lcsRandom(availableLaws.length));

    if (laws[scase[c]] == DeepAlignment.eliteLiberal) {
      scasedir[c] = -1;
    } else if (laws[scase[c]] == DeepAlignment.archConservative) {
      scasedir[c] = 1;
    } else {
      if (bias != 0) {
        scasedir[c] = bias;
      } else if (oneIn(2)) {
        scasedir[c] = 1;
      } else {
        scasedir[c] = -1;
      }
    }

    if (canSeeThings) {
      move(c * 3 + 2, 0);
      if (oneIn(4) || scase[c] == Law.military || scase[c] == Law.torture) {
        name1 = "United States";
      } else if (oneIn(5) ||
          scase[c] == Law.deathPenalty ||
          scase[c] == Law.policeReform ||
          scase[c] == Law.prisons ||
          scase[c] == Law.gunControl ||
          scase[c] == Law.abortion) {
        name1 = randomStateName();
      } else {
        name1 = lastName();
      }
      if (oneIn(5)) {
        name2 = randomStateName();
      } else if (oneIn(5)) {
        name2 = randomCityName();
      } else if (oneIn(7)) {
        name2 = randomChurchName();
      } else {
        name2 = lastName();
      }
      if (scase[c] == Law.labor ||
          scase[c] == Law.corporate ||
          scase[c] == Law.animalRights ||
          scase[c] == Law.pollution) {
        name2 = LcsI18n.processString("{last}, {suffix}", {
          "last": lastName(Gender.whiteMalePatriarch),
          "suffix": ["Inc.", "L.L.C.", "Corp.", "Co.", "Ltd."].random,
        });
      }
      if (oneIn(2)) {
        String swap = name1;
        name1 = name2;
        name2 = swap;
      }

      addstr(
        "{name1} {versus} {name2}",
        params: {"name1": name1, "versus": "v.", "name2": name2},
      );

      final precedentPrefix = LcsI18n.processString(
        "A new precedent would ",
        null,
      );
      mvaddstr(c * 3 + 3, 0, precedentPrefix, noTranslate: true);
      setColor(scasedir[c] == 1 ? lightGreen : red);
      String precedent = "";
      switch (scase[c]) {
        case Law.animalRights:
          if (scasedir[c] == 1) {
            precedent = "guarantee rights for animals";
          } else {
            precedent = "strike down animal welfare laws";
          }
        case Law.policeReform:
          if (scasedir[c] == 1) {
            precedent = "curtail abusive police behavior";
          } else {
            precedent = "allow abusive police behavior";
          }
        case Law.privacy:
          if (scasedir[c] == 1) {
            precedent = "guarantee more privacy rights";
          } else {
            precedent = "strike down privacy laws";
          }
        case Law.deathPenalty:
          if (scasedir[c] == 1) {
            precedent = "restrict use of the death penalty";
          } else {
            precedent = "permit more executions";
          }
        case Law.nuclearPower:
          if (scasedir[c] == 1) {
            precedent = "restrict use of nuclear power";
          } else {
            precedent = "allow broad use of nuclear power";
          }
        case Law.pollution:
          if (scasedir[c] == 1) {
            precedent = "restrict industrial pollution";
          } else {
            precedent = "strike down environmental regulations";
          }
        case Law.labor:
          if (scasedir[c] == 1) {
            precedent = "guarantee new labor protections";
          } else {
            precedent = "restrict the rights of unions";
          }
        case Law.lgbtRights:
          if (scasedir[c] == 1) {
            precedent = "strike down anti-LGBT laws";
          } else {
            precedent = "support anti-LGBT discrimination";
          }
        case Law.corporate:
          if (scasedir[c] == 1) {
            precedent = "create limits on corporate power";
          } else {
            precedent = "strike down corporate regulations";
          }
        case Law.freeSpeech:
          if (scasedir[c] == 1) {
            precedent = "strike down free speech limits";
          } else {
            precedent = "allow limits on free speech";
          }
        case Law.taxes:
          if (scasedir[c] == 1) {
            precedent = "allow broader wealth redistribution";
          } else {
            precedent = "strike down redistributive taxes";
          }
        case Law.flagBurning:
          if (scasedir[c] == 1) {
            precedent = "strike down flag burning laws";
          } else {
            precedent = "place limits on flag burning";
          }
        case Law.gunControl:
          if (scasedir[c] == 1) {
            precedent = "allow more restrictions on guns";
          } else {
            precedent = "strike down gun control laws";
          }
        case Law.genderEquality:
          if (scasedir[c] == 1) {
            precedent = "guarantee rights for women";
          } else {
            precedent = "allow gender-based discrimination";
          }
        case Law.abortion:
          if (scasedir[c] == 1) {
            precedent = "strike down anti-abortion laws";
          } else {
            precedent = "encourage anti-abortion laws";
          }
        case Law.civilRights:
          if (scasedir[c] == 1) {
            precedent = "guarantee rights for racial minorities";
          } else {
            precedent = "permit racial discrimination";
          }
        case Law.drugs:
          if (scasedir[c] == 1) {
            precedent = "strike down anti-drug laws";
          } else {
            precedent = "expand the war on drugs";
          }
        case Law.immigration:
          if (scasedir[c] == 1) {
            precedent = "guarantee rights to noncitizens";
          } else {
            precedent = "limit protections for noncitizens";
          }
        case Law.elections:
          if (scasedir[c] == 1) {
            precedent = "increase fairness in elections";
          } else {
            precedent = "bias elections toward incumbents";
          }
        case Law.military:
          if (scasedir[c] == 1) {
            precedent = "weaken the military-industrial complex";
          } else {
            precedent = "strengthen the defense industry";
          }
        case Law.torture:
          if (scasedir[c] == 1) {
            precedent = "ban torture in interrogations";
          } else {
            precedent = "allow torture in interrogations";
          }
        case Law.prisons:
          if (scasedir[c] == 1) {
            if (laws[Law.prisons] == DeepAlignment.liberal) {
              precedent = "require prisons to focus on rehabilitation";
            } else {
              precedent = "guarantee rights to prisoners";
            }
          } else {
            precedent = "permit harsh treatment of prisoners";
          }
        case Law.housing:
          if (scasedir[c] == 1) {
            precedent = "expand tenant rights";
          } else {
            precedent = "expand landlord rights";
          }
        case Law.healthcare:
          if (scasedir[c] == 1) {
            precedent = "extend healthcare rights";
          } else {
            precedent = "reduce healthcare access";
          }
        case Law.retirement:
          if (scasedir[c] == 1) {
            precedent = "guarantee retirement benefits";
          } else {
            precedent = "limit retirement benefits";
          }
      }
      addstr(fitSupremeCourtPrecedent(precedent), noTranslate: true);
      addstrc(lightGray, ". ");

      refresh();
    }
  }

  if (canSeeThings) {
    mvaddstrc(23, 0, lightGray, "Press any key to watch the decisions unfold.");
    checkKey();
    await getKey();
  }

  for (c = 0; c < cnum; c++) {
    bool yeswin = false;
    int yesvotes = 0, vote;
    //Constitutional bias -- free speech, flag burning, religious freedom issues, supreme court
    //is extra liberal, gun control, supreme court is extra conservative
    //"All court justices will vote according to alignment and bias and do not consult
    //popular opinion...---Servant Corps"
    if (scase[c] == Law.freeSpeech || scase[c] == Law.flagBurning) {
      bias = 1;
    } else if (scase[c] == Law.gunControl) {
      bias = -1;
    } else {
      bias = 0;
    }

    for (int l = 0; l < politics.court.length; l++) {
      vote = court[l].index;
      if (vote >= 1 && vote <= 3) vote += bias + lcsRandom(3) - 1;

      if (laws[scase[c]]!.index > vote && scasedir[c] == -1) yesvotes++;
      if (laws[scase[c]]!.index < vote && scasedir[c] == 1) yesvotes++;

      if (l == politics.court.length - 1 &&
          yesvotes >= politics.court.length / 2) {
        yeswin = true;
      }
    }

    if (canSeeThings) {
      if (yeswin) {
        setColor(scasedir[c] == 1 ? lightGreen : red);
      } else {
        setColor(darkGray);
      }
      mvaddstr(
        c * 3 + 2,
        63,
        "{votes} for Change",
        params: {"votes": yesvotes.toString()},
      );

      if (!yeswin) {
        setColor(white);
      } else {
        setColor(darkGray);
      }
      mvaddstr(
        c * 3 + 3,
        63,
        "{votes} for Status Quo",
        params: {"votes": (politics.court.length - yesvotes).toString()},
      );

      await pause(400);
    }
    if (yeswin) {
      laws[scase[c]] =
          DeepAlignment.values[laws[scase[c]]!.index + scasedir[c]];
    }
  }

  if (canSeeThings) {
    mvaddstrc(
      23,
      0,
      lightGray,
      "Press any key to reflect on what has happened.",
    );
    checkKey();
    await getKey();
  }

  //CHANGE A JUSTICE 50% OF THE TIME
  if (oneIn(2)) {
    if (canSeeThings) {
      erase();

      mvaddstrc(0, 0, white, "Changing the Guard!");
    }

    int j = lcsRandom(politics.court.length);

    if (canSeeThings) {
      mvaddstrc(
        2,
        0,
        white,
        "{label} Justice ",
        params: {"label": localizedSupremeCourtAlignment(politics.court[j])},
      );
      addstrc(
        politics.court[j].color,
        politics.courtName[j].firstLast,
        noTranslate: true,
      );
      addstrc(white, " is stepping down.");

      mvaddstrc(7, 0, lightGray, "Press any key to see what happens.");
      checkKey();
      await getKey();
    }

    double president = exec[Exec.president]!.index.toDouble();
    if (politics.presidentParty == PoliticalParty.republican) {
      president -= 0.5;
    } else {
      president += 0.5;
    }
    List<DeepAlignment> senateSorted = [...senate]..sort();
    int sen = senateSorted.elementAt(senateSorted.length ~/ 2).index;

    double consensus = (president + sen) / 2;

    court[j] = switch (consensus) {
      < 0.5 => DeepAlignment.archConservative,
      < 1.5 => DeepAlignment.conservative,
      <= 2.5 => DeepAlignment.moderate,
      <= 3.5 => DeepAlignment.liberal,
      _ => DeepAlignment.eliteLiberal,
    };

    Gender gender = switch (court[j]) {
      DeepAlignment.archConservative => Gender.whiteMalePatriarch,
      DeepAlignment.liberal || DeepAlignment.eliteLiberal => Gender.femaleBias,
      _ => Gender.maleBias,
    };
    do {
      politics.courtName[j] = generateFullName(gender);
    } while (politics.courtName[j].firstLast.length > 20);

    if (canSeeThings) {
      mvaddstr(
        4,
        0,
        "After much debate and televised testimony, a new justice,",
      );
      move(5, 0);
      addstr("the Honorable ");
      addstrc(
        politics.court[j].color,
        politics.courtName[j].firstLast,
        noTranslate: true,
      );
      addstrc(
        lightGray,
        ", {alignment}, is appointed to the bench.",
        params: {
          "alignment": localizedSupremeCourtAlignment(politics.court[j]),
        },
      );

      mvaddstrc(
        7,
        0,
        lightGray,
        "Press any key to reflect on what has happened.",
      );
      checkKey();
      await getKey();
    }
    // Sort justices by alignment
    Map<FullName, DeepAlignment> justices = {
      for (int i = 0; i < court.length; i++) politics.courtName[i]: court[i],
    };
    List<MapEntry> sorted = justices.entries.sortedByCompare(
      (element) => element.value.index,
      (a, b) => a.compareTo(b),
    );
    for (int i = 0; i < sorted.length; i++) {
      politics.courtName[i] = sorted[i].key;
      court[i] = sorted[i].value;
    }
  }
}
