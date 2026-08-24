import 'package:json_annotation/json_annotation.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/common_display/print_creature_info.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/conversion.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/console.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/ledger.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/laws.dart';
import 'package:lcs_new_age/politics/politics.dart';
import 'package:lcs_new_age/politics/views.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

part 'recruitment.g.dart';

@JsonSerializable()
class RecruitmentSession {
  RecruitmentSession(this.recruit, [Creature? recruiter]) {
    if (recruiter != null) {
      this.recruiter = recruiter;
    }
    if (lcsRandom(100) < publicOpinion[View.lcsKnown]!) {
      double bonus = politics.publicMood();
      double rollSize = 100 - bonus;
      if (recruit.align != Alignment.liberal) {
        rollSize = bonus;
        bonus = 0;
      }
      if (100 - (lcsRandom(rollSize.round()) + bonus) <
          publicOpinion[View.lcsLiked]!) {
        rawEagerness = 3;
      } else {
        rawEagerness = 0;
      }
    } else {
      rawEagerness = 2;
    }
  }
  factory RecruitmentSession.fromJson(Map<String, dynamic> json) =>
      _$RecruitmentSessionFromJson(json);
  Map<String, dynamic> toJson() => _$RecruitmentSessionToJson(this);

  Creature recruit;
  int? _recruiterId;
  @JsonKey(name: "recruiter")
  int get recruiterId => _recruiterId ?? recruiter.id;
  set recruiterId(int id) => _recruiterId = id;
  @JsonKey(includeToJson: false, includeFromJson: false)
  late Creature recruiter;

  int rawEagerness = 0;
  @JsonKey(includeToJson: false, includeFromJson: false)
  int get eagerness {
    if (recruit.align == Alignment.liberal) return rawEagerness;
    if (recruit.align == Alignment.moderate) return rawEagerness - 2;
    if (recruit.align == Alignment.conservative) return rawEagerness - 4;
    return rawEagerness;
  }

  void addEagerness(int amount) => rawEagerness += amount;
}

List<String> _issueEventStrings = [
  "a documentary on the struggle for trans rights",
  "a research paper on abuses of the death penalty",
  "an economic paper on the flaws of trickle-down",
  "a video tour of the Chernobyl dead zone",
  "a documentary about factory farming",
  "a hand-recorded video of police brutality",
  "a government inquiry into military interrogations",
  "a documentary on privacy rights",
  "a collection of banned books",
  "a video about genetic engineering accidents",
  "a Liberal policy paper inquiring into judicial decisions",
  "a book profiling school shootings",
  "a hand-recorded video of unregulated sweatshops",
  "a Liberal think-tank survey of top CEO salaries",
  "a documentary about modern feminism",
  "a documentary on the civil rights struggle",
  "a collection of studies on the health effects of marijuana",
  "a reality TV episode on the lives of immigrants",
  "a book on the history of military atrocities",
  "a documentary on the prisoners' suffering",
  "a leaked government paper on environmental conditions",
  "a documentary on life under corporate culture",
];

Future<void> meetWithPotentialRecruits() async {
  for (int i = pool.length - 1; i >= 0; i--) {
    pool[i].meetings = 0;
  }
  if (!disbanding) {
    for (int r = recruitmentSessions.length - 1; r >= 0; r--) {
      RecruitmentSession session = recruitmentSessions[r];
      Creature p = session.recruiter;
      // Stand up recruits if 1) recruiter does not exist,
      // 2) recruiter was not able to return to a safehouse today,
      // or 3) recruiter is dead.
      if (p.site?.controller == SiteController.lcs && p.alive) {
        //MEET WITH RECRUIT
        //TERMINATE NULL RECRUIT MEETINGS
        if (p.site?.siege.underSiege == true) {
          recruitmentSessions.remove(session);
          continue;
        }
        //DO MEETING
        else {
          if (await completeRecruitMeeting(recruitmentSessions[r], p)) {
            recruitmentSessions.remove(session);
            continue;
          }
        }
      } else {
        recruitmentSessions.remove(session);
        continue;
      }
    }
  }
}

/* daily - recruit - recruit meeting */
Future<bool> completeRecruitMeeting(RecruitmentSession r, Creature p) async {
  final recruitName = localizedCreatureName(r.recruit);
  erase();
  setColor(white);
  move(0, 0);
  if (p.meetings++ > 5 && lcsRandom(p.meetings - 5) > 0) {
    mvaddstrc(
      0,
      0,
      lightGray,
      "{recruiter} accidentally missed the meeting with {recruit}",
      params: {"recruiter": p.name, "recruit": recruitName},
    );
    mvaddstrc(
      1,
      0,
      lightGray,
      "due to multiple booking of recruitment sessions.",
    );
    mvaddstrc(
      3,
      0,
      lightGray,
      "Get it together, {name}!",
      params: {"name": p.name},
    );

    await getKey();

    return true;
  }
  bool inPerson = false;
  if (p.location?.city == r.recruit.location?.city) {
    inPerson = true;
  } else {
    inPerson = false;
  }
  final locationInfo = inPerson
      ? LcsI18n.tr(r.recruit.location!.name)
      : LcsI18n.tr("via video chat.");
  mvaddstrcFitted(
    0,
    0,
    lightGray,
    "Meeting with {name}, {type}, {location}",
    60,
    params: {
      "name": recruitName,
      "type": LcsI18n.tr(r.recruit.type.name),
      "location": locationInfo,
    },
  );

  setColor(lightGray);
  printFunds();

  printCreatureInfo(r.recruit, showCarPrefs: ShowCarPrefs.onFoot);
  makeDelimiter();

  move(10, 0);
  final recruitResponse = switch (r.eagerness) {
    1 => "{name} will take a lot of persuading.",
    2 => "{name} is interested in learning more.",
    3 => "{name} feels something needs to be done.",
    _ when r.eagerness >= 4 =>
      "{name} is ready to fight for the Liberal Cause.",
    _ => "{name} kind of regrets agreeing to this.",
  };
  mvaddstrc(10, 0, lightGray, recruitResponse, params: {"name": recruitName});
  mvaddstr(
    11,
    0,
    "How should {name} approach the situation?",
    params: {"name": p.name},
  );

  final bookOption = inPerson
      ? "A - Spend \$50 on props and a book for them to keep."
      : "A - Spend \$50 on props and an e-book for them to keep.";
  addOptionTextFitted(
    13,
    0,
    "A",
    bookOption,
    CONSOLE_WIDTH,
    enabledWhen: ledger.funds >= 50,
  );
  addOptionTextFitted(
    14,
    0,
    "B",
    "B - Just casually chat with them and discuss politics.",
    CONSOLE_WIDTH,
  );

  final canRecruit = p.subordinatesLeft > 0 && r.eagerness >= 4;
  final recruitmentOption = canRecruit
      ? "C - {recruit} joins the LCS."
      : p.subordinatesLeft <= 0
      ? "C - {recruiter} needs more Juice to recruit."
      : "C - {recruit} isn't ready to join the LCS.";
  addOptionTextFitted(
    15,
    0,
    "C",
    recruitmentOption,
    CONSOLE_WIDTH,
    params: {"recruiter": p.name, "recruit": recruitName},
    enabledWhen: canRecruit,
  );

  addOptionTextFitted(16, 0, "D", "D - Break off the meetings.", CONSOLE_WIDTH);

  int y = 18;

  while (true) {
    int c = await getKey();

    if (c == Key.c && p.subordinatesLeft > 0 && r.eagerness >= 4) {
      mvaddstr(
        y,
        0,
        "{recruiter} offers to let {recruit} join the LCS.",
        params: {"recruiter": p.name, "recruit": recruitName},
      );
      await getKey();

      mvaddstrc(
        y += 2,
        0,
        lightGreen,
        "{recruit} accepts, and is eager to get started.",
        params: {"recruit": recruitName},
      );
      r.recruit.hireId = p.id;
      liberalize(r.recruit);
      await getKey();

      pool.add(r.recruit);
      erase();
      await sleeperizePrompt(r.recruit, p, 6);

      p.train(Skill.persuasion, 25);
      recruitmentSessions.remove(r);
      stats.recruits++;
      return true;
    }
    if (c == Key.b || (c == Key.a && ledger.funds >= 50)) {
      if (c == Key.a) ledger.subtractFunds(50, Expense.recruitment);

      p.train(Skill.persuasion, 25);
      if (r.recruit.skill(Skill.science) > p.skill(Skill.science)) {
        p.train(Skill.science, r.recruit.skill(Skill.science));
      }
      if (r.recruit.skill(Skill.religion) > p.skill(Skill.religion)) {
        p.train(Skill.religion, r.recruit.skill(Skill.religion));
      }
      if (r.recruit.skill(Skill.law) > p.skill(Skill.law)) {
        p.train(Skill.law, r.recruit.skill(Skill.law));
      }
      if (r.recruit.skill(Skill.business) > p.skill(Skill.business)) {
        p.train(Skill.business, r.recruit.skill(Skill.business));
      }

      int libPersuasiveness =
          p.skill(Skill.business) +
          p.skill(Skill.science) +
          p.skill(Skill.religion) +
          p.skill(Skill.law) +
          p.attribute(Attribute.intelligence);

      int recruitReluctance =
          5 +
          r.recruit.skill(Skill.business) +
          r.recruit.skill(Skill.science) +
          r.recruit.skill(Skill.religion) +
          r.recruit.skill(Skill.law) +
          r.recruit.attribute(Attribute.wisdom) +
          r.recruit.attribute(Attribute.intelligence);

      if (libPersuasiveness > recruitReluctance) {
        recruitReluctance = 0;
      } else {
        recruitReluctance -= libPersuasiveness;
      }

      int difficulty = recruitReluctance;

      if (c == Key.a) {
        difficulty -= 5;

        mvaddstr(
          y++,
          0,
          "{recruiter} shares {topic}.",
          params: {
            "recruiter": p.name,
            "topic": LcsI18n.tr(_issueEventStrings.random),
          },
        );

        await getKey();
      } else {
        mvaddstrc(
          y++,
          0,
          lightGray,
          "{recruiter} explains {gender} views on {law}.",
          params: {
            "recruiter": p.name,
            "gender": LcsI18n.currentLocale == "en_US"
                ? p.gender.hisHer
                : LcsI18n.tr("${p.gender.hisHer} (possessive)"),
            "law": LcsI18n.tr(Law.values.random.label),
          },
        );

        await getKey();
      }

      difficulty += r.recruit.level - 1;

      if (p.skillCheck(Skill.persuasion, difficulty)) {
        setColor(lightBlue);
        if (r.rawEagerness < 127) r.rawEagerness++;
        mvaddstrc(
          y++,
          0,
          lightBlue,
          "{recruit} found {recruiter}'s views to be insightful.",
          params: {"recruit": recruitName, "recruiter": p.name},
        );
        mvaddstrc(y++, 0, lightGray, "They'll definitely meet again tomorrow.");
      } else if (p.skillCheck(
        Skill.persuasion,
        difficulty,
      )) // Second chance to not fail horribly
      {
        if (r.rawEagerness > -128) r.rawEagerness--;
        mvaddstrc(
          y++,
          0,
          lightGray,
          "{recruit} is skeptical about some of {recruiter}'s arguments.",
          params: {"recruit": recruitName, "recruiter": p.name},
        );
        mvaddstrc(y++, 0, lightGray, "They'll meet again tomorrow.");
      } else {
        setColor(purple);
        if (r.recruit.type.talkReceptive &&
            r.recruit.align == Alignment.liberal) {
          mvaddstrc(
            y++,
            0,
            lightGray,
            "{recruit} isn't convinced {recruiter} really understands the problem.",
            params: {"recruit": recruitName, "recruiter": p.name},
          );
          mvaddstrc(
            y++,
            0,
            lightGray,
            "Maybe {recruiter} needs more experience.",
            params: {"recruiter": p.name},
          );
        } else {
          mvaddstr(
            y++,
            0,
            LcsI18n.processStringGendered(
              "{recruitName} thinks {pName} is dangerous extremist.",
              {"recruitName": recruitName, "pName": p.name},
              gender: p.gender,
            ),
            noTranslate: true,
          );

          mvaddstr(
            y++,
            0,
            "This whole thing was a mistake. There won't be another meeting.",
          );
        }

        await getKey();

        return true;
      }

      await getKey();

      return false;
    }
    if (c == Key.d) return true;
  }
}

// Prompt to turn new recruit into a sleeper
Future<void> sleeperizePrompt(
  Creature converted,
  Creature recruiter,
  int y,
) async {
  while (true) {
    move(y, 0);
    setColor(lightGray);
    addstr(
      "In what capacity will {name} best serve the Liberal cause?",
      params: {"name": converted.name},
    );
    addOptionText(
      y + 2,
      0,
      "A",
      "A - Come to {location} as a &Gregular member&x.",
      params: {
        "location": recruiter.location!.getName(
          short: false,
          includeCity: true,
        ),
      },
    );
    addOptionText(
      y + 3,
      0,
      "B",
      "B - Stay at {location} as a &Bsleeper agent&x.",
      params: {
        "location": converted.workLocation.getName(
          short: false,
          includeCity: true,
        ),
      },
    );

    int c = await getKey();
    if (c == Key.b) {
      converted.sleeperAgent = true;
      converted.location = converted.workLocation;
      converted.site?.mapped = true;
      converted.site?.hidden = false;
      converted.base = converted.site;
      liberalize(converted);
      if (converted == uniqueCreatures.president) {
        politics.exec[Exec.president] = DeepAlignment.eliteLiberal;
      }
      break;
    } else if (c == Key.a) {
      converted.location = recruiter.base;
      converted.base = recruiter.base;
      liberalize(converted);
      uniqueCreatures.replace(converted);
      break;
    }
  }
}
