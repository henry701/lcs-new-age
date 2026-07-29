import 'dart:ui';

import 'package:lcs_new_age/basemode/disbanding.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/laws.dart';
import 'package:lcs_new_age/politics/politics.dart';
import 'package:lcs_new_age/politics/views.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/interface_options.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

enum AgendaVibe { ongoing, liberalVictory, conservativeVictory }

enum AgendaPage { main, pollsA, pollsB, lawsA, lawsB }

Future<bool> liberalAgenda([AgendaVibe vibe = AgendaVibe.ongoing]) async {
  AgendaPage page = AgendaPage.main;
  while (true) {
    erase();
    if (vibe == AgendaVibe.liberalVictory) {
      mvaddstrc(0, 0, lightGreen, "The Triumph of the Liberal Agenda");
      mvaddstr(23, 0, "The country has achieved Elite Liberal status!");
      addPageButtons(y: 24, x: 0);
      addOptionText(24, console.x + 4, "L", "L - View the high score list");
    } else if (vibe == AgendaVibe.conservativeVictory) {
      mvaddstrc(0, 0, red, "The Abject Failure of the Liberal Agenda");
      mvaddstr(23, 0, "The country has been Reaganified.");
      addPageButtons(y: 24, x: 0);
      addOptionText(24, console.x + 4, "L", "L - View the high score list");
    } else {
      mvaddstrc(0, 0, white, "The Status of the Liberal Agenda");
      addOptionText(24, 0, "D", "D - Disband and Wait");
      addPageButtons(y: 24, x: console.x + 4, short: true);
      addOptionText(24, console.x + 4, "Any other key", "Any Other Key - Exit");
    }
    _agendaPage(page, vibe);
    if (vibe == AgendaVibe.ongoing) {
      _alignmentKey(23);
    }
    int c = await getKey();
    if (isPageUp(c) || c == Key.leftArrow) {
      page = AgendaPage.values[(page.index - 1) % (AgendaPage.values.length)];
    } else if (isPageDown(c) || c == Key.rightArrow) {
      page = AgendaPage.values[(page.index + 1) % (AgendaPage.values.length)];
    } else if (c == Key.l && vibe != AgendaVibe.ongoing) {
      break;
    } else if (c == Key.d && vibe == AgendaVibe.ongoing) {
      return _confirmDisband();
    } else if (vibe == AgendaVibe.ongoing) {
      break;
    }
  }
  return false;
}

Future<bool> _confirmDisband() async {
  String word = [
    "Racial Justice",
    "Free Speech",
    "Gay Marriage",
    "Abortion Rights",
    "Separation Clause",
    "Racial Equality",
    "Gun Control",
    "Campaign Finance Reform",
    "Animal Rights",
    "Union Organizing",
    "Black Lives Matter",
    "Climate Change",
    "Immigration Reform",
    "Human Rights",
    "Liberal Feminism",
    "Trans Rights",
    "Right To Privacy",
    "Legalized Marijuana",
    "Flag Burning",
    "Criminal Justice Reform",
    "Conflict Resolution",
    "Progressive Taxation",
  ].random;

  erase();
  mvaddstrc(0, 0, white, "Are you sure you want to disband?");

  setColor(lightGray);
  mvaddstr(
    2,
    0,
    "Disbanding scatters the Liberal Crime Squad, sending all of its members",
  );
  mvaddstr(
    3,
    0,
    "into hiding, free to pursue their own lives.  You will be able to observe",
  );
  mvaddstr(
    4,
    0,
    "the political situation in brief, and wait until a resolution is reached.",
  );

  mvaddstr(
    6,
    0,
    "If at any time you determine that the Liberal Crime Squad will be needed",
  );
  mvaddstr(
    7,
    0,
    "again, you may return to the homeless camp to restart the campaign.",
  );

  mvaddstr(
    9,
    0,
    "Do not make this decision lightly.  If you do need to return to action,",
  );
  mvaddstr(10, 0, "only the most devoted of your former members will return.");

  mvaddstrc(
    13,
    0,
    white,
    "Type this Liberal phrase to confirm (press a wrong letter to rethink it):",
  );

  for (int pos = 0; pos < word.length;) {
    for (int x = 0; x < word.length; x++) {
      if (x == pos) {
        setColor(green);
      } else if (x < pos) {
        setColor(lightGreen);
      } else {
        setColor(lightGray);
      }
      mvaddchar(15, x, word[x]);
    }
    int key = await getKey();
    if (key == word[pos].toLowerCase().codePoint) {
      pos++;
      if (pos < word.length &&
          (word[pos] == ' ' || word[pos] == '\'' || word[pos] == '-')) {
        pos++;
      }
    } else if (key != Key.space) {
      return false;
    }
  }
  for (int i = pool.length - 1; i >= 0; i--) {
    Creature p = pool[i];
    if (!p.alive || p.align != Alignment.liberal) {
      pool.removeAt(i);
    } else {
      p.squad = null;
      p.hidingDaysLeft = -1;
    }
  }
  cleanGoneSquads();
  gameState.disbandTime = year;
  return true;
}

void _agendaPage(AgendaPage page, AgendaVibe vibe) {
  switch (page) {
    case AgendaPage.main:
      mvaddstr(2, 0, "Page 1 of 5 - General Summary");
      _mainPage(vibe);
    case AgendaPage.pollsA:
      mvaddstr(2, 0, "Page 2 of 5 - Opinion Polling (Part 1)");
      _pollsPage(0);
    case AgendaPage.pollsB:
      mvaddstr(2, 0, "Page 3 of 5 - Opinion Polling (Part 2)");
      _pollsPage(13);
    case AgendaPage.lawsA:
      mvaddstr(2, 0, "Page 4 of 5 - Active Laws (Part 1)");
      _lawsPage(0, vibe);
    case AgendaPage.lawsB:
      mvaddstr(2, 0, "Page 5 of 5 - Active Laws (Part 2)");
      _lawsPage(18, vibe);
  }
}

void _mainPage(AgendaVibe vibe) {
  _executives(vibe);
  if (vibe == AgendaVibe.conservativeVictory) {
    mvaddstrc(10, 0, red, "Congress consists of CEOs and Televangelists");
    mvaddstr(5, 63, "Replaced");
    mvaddstr(6, 61, "By Corporate");
    mvaddstr(7, 60, "Ethics Officers");
  } else {
    // Court names begin at column 56. Bound summaries to the left panel so
    // the full court roster remains visible even when it has ten members.
    printHouse(10, maxWidth: 55);
    printSenate(11, maxWidth: 55);
    for (int c = 0; c < politics.court.length; c++) {
      mvaddstrc(
        3 + c,
        56,
        politics.court[c].color,
        politics.courtName[c].firstLast,
      );
    }
    setColor(lightGray);
  }
  setPoliticalBodyColor(summarizePoliticalBody(politics.court));
  if (vibe == AgendaVibe.conservativeVictory) setColor(red);
  String supreme = "SUPREME", court = "COURT";
  for (int i = 0; i < supreme.length; i++) {
    mvaddchar(3 + i, 52, supreme[i]);
  }
  for (int i = 0; i < court.length; i++) {
    mvaddchar(3 + i, 54, court[i]);
  }
  for (int i = 0; i < Law.values.length; i++) {
    _printSingleLaw(vibe, i);
  }
}

void _executives(AgendaVibe vibe) {
  String president;
  if (vibe == AgendaVibe.conservativeVictory) {
    president = "King:";
  } else if (politics.execTerm == 1) {
    president = "President (1st Term):";
  } else if (politics.execTerm == 2) {
    president = "President (2nd Term):";
  } else {
    president = "President:";
  }
  mvaddstrc(5, 0, exec[Exec.president]!.color, president);
  mvaddstr(5, 25, execName[Exec.president]!.firstLast);
  setColor(exec[Exec.vicePresident]!.color);

  String vicePresident;
  if (vibe == AgendaVibe.conservativeVictory) {
    vicePresident = "Minister of Love:";
  } else {
    vicePresident = "Vice President:";
  }
  mvaddstrc(6, 0, exec[Exec.vicePresident]!.color, vicePresident);
  mvaddstr(6, 25, execName[Exec.vicePresident]!.firstLast);

  String secretaryOfState;
  if (vibe == AgendaVibe.conservativeVictory) {
    secretaryOfState = "Minister of Peace:";
  } else {
    secretaryOfState = "Secretary of State:";
  }
  mvaddstrc(7, 0, exec[Exec.secretaryOfState]!.color, secretaryOfState);
  mvaddstr(7, 25, execName[Exec.secretaryOfState]!.firstLast);

  String attorneyGeneral;
  if (vibe == AgendaVibe.conservativeVictory) {
    attorneyGeneral = "Minister of Truth:";
  } else {
    attorneyGeneral = "Attorney General:";
  }
  mvaddstrc(8, 0, exec[Exec.attorneyGeneral]!.color, attorneyGeneral);
  mvaddstr(8, 25, execName[Exec.attorneyGeneral]!.firstLast);
}

void _printSingleLaw(AgendaVibe vibe, int i) {
  Law law = Law.values[i];
  if (vibe == AgendaVibe.conservativeVictory) {
    setColor(red);
  } else if (vibe == AgendaVibe.liberalVictory) {
    setColor(lightGreen);
  } else {
    setColor(darkGray);
  }
  int y = 14 + i ~/ 3, x = i % 3 * 26;
  mvaddstr(y, x, "<—————>");
  mvaddstrcFitted(y, x + 8, laws[law]!.color, law.label, 18);
  mvaddstr(y, x + 5 - laws[law]!.index, "O");
}

void _alignmentKey(int y) {
  mvaddstrc(y, 0, DeepAlignment.eliteLiberal.color, "Elite Liberal");
  addstrc(lightGray, " - ");
  addstrc(DeepAlignment.liberal.color, "Liberal");
  addstrc(lightGray, " - ");
  addstrc(DeepAlignment.moderate.color, "moderate");
  addstrc(lightGray, " - ");
  addstrc(DeepAlignment.conservative.color, "Conservative");
  addstrc(lightGray, " - ");
  addstrc(DeepAlignment.archConservative.color, "Arch Conservative");
}

void _lawsPage(int start, AgendaVibe vibe) {
  for (int l = start; l <= start + 17 && l < Law.values.length; l++) {
    int y = 4 + l - start;
    Law law = Law.values[l];
    if (vibe == AgendaVibe.conservativeVictory) {
      setColor(DeepAlignment.archConservative.color);
    } else if (vibe == AgendaVibe.liberalVictory) {
      setColor(DeepAlignment.eliteLiberal.color);
    } else {
      setColor(laws[law]!.color);
    }
    mvaddstrFitted(y, 0, _lawDescription(law, laws[law]!, vibe), console.width);
  }
}

String _lawDescription(Law law, DeepAlignment alignment, AgendaVibe vibe) {
  int index;
  if (vibe == AgendaVibe.conservativeVictory) {
    index = 0;
  } else if (vibe == AgendaVibe.liberalVictory) {
    index = 6;
  } else {
    index = alignment.index + 1;
  }
  return law.description[index];
}

void _pollsPage(int start) {
  int y = 5;
  String header =
      "XX% Issue —————————————————————————————————————————————————— Public Interest";
  if (start == 0) {
    View maxView = politics.publicInterest.entries
        .reduce((a, b) => a.value >= b.value ? a : b)
        .key;
    int approval = politics.presidentialApproval();
    final president = politics.constitutionalAmendments == 0
        ? "King {name}"
        : "President {name}";
    mvaddstrc(
      4,
      0,
      lightGray,
      "{approval}% have a favorable opinion of ",
      params: {"approval": approval.toString()},
    );
    addstrc(
      exec[Exec.president]!.color,
      president,
      params: {"name": execName[Exec.president]!.firstLast},
    );
    addstrc(lightGray, ".");
    String concern = "";
    if (politics.publicInterest[maxView]! < 5) {
      concern = "a recent sports scandal";
    } else {
      concern = _concernString(maxView);
    }
    mvaddstr(
      5,
      0,
      "The people are most concerned about {concern}.",
      params: {"concern": LcsI18n.tr(concern)},
    );
    mvaddstr(7, 0, header);
    y = 8;
  } else {
    mvaddstrc(4, 0, lightGray, header);
  }
  for (int i = start; y < 22 && i < View.values.length; i++, y++) {
    View v = View.values[i];
    if (v == View.ccsHated &&
        (ccsState == CCSStrength.inHiding ||
            ccsState == CCSStrength.defeated)) {
      continue;
    }
    int interest = politics.publicInterest[v]!;
    String interestLabel;
    Color interestColor;
    if (interest > 16) {
      interestLabel = LcsI18n.tr("Huge");
      interestColor = red;
    } else if (interest > 8) {
      interestLabel = LcsI18n.tr("High");
      interestColor = orange;
    } else if (interest > 4) {
      interestLabel = LcsI18n.tr("Moderate");
      interestColor = yellow;
    } else if (interest > 2) {
      interestLabel = LcsI18n.tr("Low");
      interestColor = lightGray;
    } else if (interest > 0) {
      interestLabel = LcsI18n.tr("Minimal");
      interestColor = midGray;
    } else {
      interestLabel = LcsI18n.tr("None");
      interestColor = darkGray;
    }

    double survey = politics.publicOpinion[v]!;
    if (v == View.lcsLiked) survey = politics.lcsApproval();
    if (v == View.ccsHated) survey = politics.ccsApproval();
    final Color surveyColor;
    if (survey < 20) {
      surveyColor = DeepAlignment.archConservative.color;
    } else if (survey < 40) {
      surveyColor = DeepAlignment.conservative.color;
    } else if (survey < 60) {
      surveyColor = DeepAlignment.moderate.color;
    } else if (survey < 80) {
      surveyColor = DeepAlignment.liberal.color;
    } else {
      surveyColor = DeepAlignment.eliteLiberal.color;
    }
    final String issue = _pollingIssue(v);
    final String renderedIssue =
        "${survey.floor()}.${(survey * 10 - survey.floor() * 10).floor()}% ${LcsI18n.tr(issue)}";
    setColor(surveyColor);
    mvaddstr(y, 0, fitConsoleText(renderedIssue, 61), noTranslate: true);
    if (console.x < 61) {
      mvaddstr(
        y,
        console.x,
        "".padRight(61 - console.x, "."),
        noTranslate: true,
      );
    }
    mvaddstrc(y, 61, interestColor, interestLabel, noTranslate: true);
  }
}

String _pollingIssue(View view) {
  switch (view) {
    case View.lgbtRights:
      return "support LGBTQ+ rights";
    case View.deathPenalty:
      return "oppose the death penalty";
    case View.taxes:
      return "are in favor of higher taxes";
    case View.nuclearPower:
      return "are terrified of nuclear power";
    case View.animalResearch:
      return "deplore animal research";
    case View.policeBehavior:
      return "are critical of the police";
    case View.torture:
      return "want stronger measures to prevent torture";
    case View.intelligence:
      return "want to stop government mass surveillance";
    case View.freeSpeech:
      return "want more freedom to criticize the government";
    case View.genetics:
      return "support regulation of genetic research";
    case View.justices:
      return "are for the appointment of Liberal Justices";
    case View.gunControl:
      return "are concerned about gun violence";
    case View.sweatshops:
      return "avoid companies that use sweatshops";
    case View.pollution:
      return "call for stricter environmental regulations";
    case View.corporateCulture:
      return "are disgusted by corporate malfeasance";
    case View.ceoSalary:
      return "believe that CEO salaries are too high";
    case View.womensRights:
      return "favor doing more for gender equality";
    case View.civilRights:
      return "agree that more work is needed for racial equality";
    case View.drugs:
      return laws[Law.drugs]! >= DeepAlignment.liberal
          ? "support keeping marijuana legal"
          : "want to legalize marijuana";
    case View.immigration:
      return "support Liberal immigration policy";
    case View.military:
      return "believe that military spending is too high";
    case View.prisons:
      return "want prisons to focus on rehabilitation";
    case View.amRadio:
      return "find Conservative AM Radio distasteful";
    case View.cableNews:
      return "do not trust Conservative Cable News";
    case View.lcsKnown:
      return "have heard of the Liberal Crime Squad";
    case View.lcsLiked:
      return "consider the Liberal Crime Squad a force for good";
    case View.ccsHated:
      return "want the Conservative Crime Squad brought to justice";
    case View.housing:
      return "want the government to provide affordable housing";
    case View.healthcare:
      return "support universal healthcare";
    case View.retirement:
      return "want a government-run retirement system";
  }
}

String _concernString(View view) {
  switch (view) {
    case View.lcsKnown:
    case View.lcsLiked:
      if (publicOpinion[View.lcsKnown]! < 50) {
        return "obscure radical groups";
      } else if (publicOpinion[View.lcsLiked]! > 50) {
        return "the Liberal Crime Squad";
      } else {
        return "the LCS terrorists";
      }
    case View.amRadio:
    case View.cableNews:
      if (publicOpinion[View.amRadio]! + publicOpinion[View.cableNews]! > 100) {
        return "Conservative media bias";
      } else {
        return "Liberal media bias";
      }
    case View.lgbtRights:
      if (publicOpinion[view]! > 50) {
        return "protecting LGBTQ+ rights";
      } else {
        return "stopping the LGBTQ+ agenda";
      }
    case View.deathPenalty:
      if (publicOpinion[view]! > 50) {
        return "opposing the death penalty";
      } else {
        return "executing serious criminals";
      }
    case View.taxes:
      if (publicOpinion[view]! > 50) {
        return "increasing taxes";
      } else {
        return "reducing taxes";
      }
    case View.nuclearPower:
      if (publicOpinion[view]! > 50) {
        return "the dangers of nuclear power";
      } else {
        return "the importance of nuclear power";
      }
    case View.animalResearch:
      if (publicOpinion[view]! > 50) {
        return "inhumane animal research practices";
      } else {
        return "excessive animal research regulation";
      }
    case View.policeBehavior:
      if (publicOpinion[view]! > 50) {
        return "police brutality";
      } else {
        return "crime";
      }
    case View.torture:
      if (publicOpinion[view]! > 50) {
        return "ending the use of torture";
      } else {
        return "stopping terrorists";
      }
    case View.intelligence:
      if (publicOpinion[view]! > 50) {
        return "ending mass surveillance";
      } else {
        return "government mass surveillance";
      }
    case View.freeSpeech:
      if (publicOpinion[view]! > 50) {
        return "protecting free speech";
      } else {
        return "the media's vulgarity";
      }
    case View.genetics:
      if (publicOpinion[view]! > 50) {
        return "regulating genetic research";
      } else {
        return "excessive regulation of genetic research";
      }
    case View.justices:
      if (publicOpinion[view]! > 50) {
        return "appointing more Liberal justices";
      } else {
        return "appointing more Conservative justices";
      }
    case View.gunControl:
      if (publicOpinion[view]! > 50) {
        return "stopping gun violence";
      } else {
        return "protecting gun rights";
      }
    case View.sweatshops:
      if (publicOpinion[view]! > 50) {
        return "threats to labor rights";
      } else {
        return "stopping union thugs";
      }
    case View.pollution:
      if (publicOpinion[view]! > 50) {
        return "climate change";
      } else {
        return "more environmental regulations";
      }
    case View.corporateCulture:
      if (publicOpinion[view]! > 50) {
        return "corporate malfeasance";
      } else {
        return "over-regulation of businesses";
      }
    case View.ceoSalary:
      if (publicOpinion[view]! > 50) {
        return "high income inequality";
      } else {
        return "leftist class warfare";
      }
    case View.womensRights:
      if (publicOpinion[view]! > 50) {
        return "gender equality";
      } else {
        return "feminists";
      }
    case View.civilRights:
      if (publicOpinion[view]! > 50) {
        return "racism";
      } else {
        return "\"White genocide\"";
      }
    case View.drugs:
      if (laws[Law.drugs]! >= DeepAlignment.liberal) {
        if (publicOpinion[view]! > 50) {
          return "keeping marijuana legal";
        } else {
          return "legalizing marijuana";
        }
      } else {
        if (publicOpinion[view]! > 50) {
          return "legalizing marijuana";
        } else {
          return "keeping marijuana legal";
        }
      }
    case View.immigration:
      if (publicOpinion[view]! > 50) {
        return "the need for immigration reform";
      } else {
        return "illegal immigration";
      }
    case View.military:
      if (publicOpinion[view]! > 50) {
        return "excessive military spending";
      } else {
        return "insufficient military spending";
      }
    case View.prisons:
      if (publicOpinion[view]! > 50) {
        return "inhumane prison conditions";
      } else {
        return "soft luxury prisons";
      }
    case View.ccsHated:
      if (publicOpinion[view]! > 50) {
        return "the CCS terrorists";
      } else {
        return "the CCS patriots";
      }
    case View.housing:
      if (publicOpinion[view]! > 50) {
        return "the cost of housing";
      } else {
        return "socialists trying to control housing";
      }
    case View.healthcare:
      if (publicOpinion[view]! > 50) {
        return "the cost of healthcare";
      } else {
        return "socialists trying to control healthcare";
      }
    case View.retirement:
      if (publicOpinion[view]! > 50) {
        return "the cost of retirement";
      } else {
        return "socialists trying to control retirement";
      }
  }
}
