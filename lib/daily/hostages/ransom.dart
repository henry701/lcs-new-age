import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/difficulty.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/daily/hostages/tend_hostage.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/ledger.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/justice/crimes.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

/// Handles drafting a ransom note for a hostage
Future<void> handleRansomNote(
  InterrogationSession intr,
  Creature lead,
  Creature cr,
  int y,
) async {
  intr.daysUntilRansomResponse = 2 + lcsRandom(4); // Response in 2-5 days

  // Calculate ransom amount based on hostage's importance and days in captivity
  switch (cr.type.id) {
    // Very rich or very famous people
    case CreatureTypeIds.corporateCEO:
    case CreatureTypeIds.president:
    case CreatureTypeIds.actor:
    case CreatureTypeIds.athlete:
    case CreatureTypeIds.socialite:
    case CreatureTypeIds.radioPersonality:
      intr.daysUntilRansomResponse += 5;
      intr.ransomAmount = 100000;
    // Pretty well off or pretty well known
    case CreatureTypeIds.policeChief:
    case CreatureTypeIds.eminentScientist:
    case CreatureTypeIds.landlord:
    case CreatureTypeIds.newsAnchor:
    case CreatureTypeIds.engineer:
    case CreatureTypeIds.mathematician:
    case CreatureTypeIds.liberalJudge:
    case CreatureTypeIds.conservativeJudge:
    case CreatureTypeIds.bankManager:
    case CreatureTypeIds.lawyer:
    case CreatureTypeIds.doctor:
    case CreatureTypeIds.corporateManager:
    case CreatureTypeIds.psychologist:
    case CreatureTypeIds.author:
    case CreatureTypeIds.fashionDesigner:
    case CreatureTypeIds.artCritic:
    case CreatureTypeIds.musicCritic:
    case CreatureTypeIds.programmer:
    case CreatureTypeIds.chef:
    case CreatureTypeIds.musician:
    case CreatureTypeIds.footballCoach:
    case CreatureTypeIds.carSalesman:
    case CreatureTypeIds.prisonGuard:
    case CreatureTypeIds.swat:
    case CreatureTypeIds.deathSquad:
    case CreatureTypeIds.gangUnit:
    case CreatureTypeIds.merc:
    case CreatureTypeIds.cop:
      intr.daysUntilRansomResponse += 3;
      intr.ransomAmount = 10000;
    // Everybody else
    default:
      intr.ransomAmount = 1000;
  }

  addparagraph(
    y,
    0,
    LcsI18n.processString(
      "{lead} prepares a ransom demand by {method}. The demand is set at {amount}. It may take some time for a response...",
      {
        "lead": lead.name,
        "method": LcsI18n.tr(
          [
            "attaching a photo of {hostage} to a note made from magazine clippings",
            "recording a video of {hostage} in captivity",
            "attaching a personal letter from {hostage} spelling out the LCS's demands",
            "recording audio of {hostage} reading a prepared statement",
          ].random,
        ),
        "hostage": cr.name,
        "amount": LcsI18n.currencyAmount(intr.ransomAmount),
      },
    ),
  );
  y = console.y + 1;

  await getKey();

  intr.ransomDemanded = true;
  if (!cr.kidnapped) {
    cr.kidnapped = true;
    NewsStory.prepare(NewsStories.kidnapReport).cr = cr;
  }
  cr.missing = true;
  cr.heat += 100;
}

Future<bool> handleRansomResponse(
  InterrogationSession intr,
  Creature cr,
) async {
  int y = 2;
  setColor(lightGray);
  addparagraph(
    y,
    0,
    LcsI18n.processString(
      "A response has been received from {name}'s relatives:",
      {"name": cr.name},
    ),
  );
  y = console.y + 1;
  await getKey();

  if (!oneIn(5)) {
    bool success = await handleRansomPayment(intr, cr, y);
    return success;
  } else {
    setColor(red);
    addparagraph(
      y,
      0,
      LcsI18n.processString(
        [
          "The friends and relatives of {name} will not negotiate with kidnappers and terrorists.",
          "Go to hell.",
          "The family of {name} will not, under any circumstances, finance a terrorist campaign.",
          "The family of {name} will not, under any circumstances, pay a ransom for that miserable piece of shit.",
        ].random,
        {"name": cr.name},
      ),
    );
    y = console.y + 1;
    setColor(lightGray);

    await getKey();
    intr.ransomPaid = true;
    return false;
  }
}

Future<bool> handleRansomPayment(
  InterrogationSession intr,
  Creature cr,
  int y,
) async {
  setColor(lightGreen);
  addparagraph(
    y,
    0,
    LcsI18n.processString(
      [
        "{amount} has been collected in cash according to the instructions provided. Please advise on the location you wish the money to be placed then return {name} to us unharmed.",
        "We have placed the money in the location you requested. It's yours. Just give our dear {name} back.",
        "We will do anything to get {name} back. The money is in the location you specified. We are trusting you. Please keep your word.",
      ].random,
      {
        "amount": LcsI18n.currencyAmount(intr.ransomAmount),
        "name": cr.properName,
      },
    ),
  );
  y = console.y + 1;

  // Select lead with highest street smarts for pickup
  List<Creature> tenders = pool
      .where(
        (e) =>
            e.alive &&
            e.activity.type == ActivityType.interrogation &&
            e.activity.idInt == cr.id,
      )
      .toList();
  Creature lead = tenders.first;

  int bestStreetSmarts = -1;
  for (Creature tender in tenders) {
    int streetSmarts = tender.skill(Skill.streetSmarts);
    if (streetSmarts > bestStreetSmarts) {
      bestStreetSmarts = streetSmarts;
      lead = tender;
    }
  }

  // Check for ambush based on street sense
  String location;
  bool pickedGoodLocation;
  (location, pickedGoodLocation) = await selectRansomLocation(lead);
  bool approachedCarefully = lead.skillCheck(
    Skill.streetSmarts,
    Difficulty.average,
  );

  setColor(lightGray);
  if (approachedCarefully) {
    addparagraph(
      y,
      0,
      LcsI18n.processString(
        "{lead} goes to pick up the money at {location}. {subject} {action}...",
        {
          "lead": lead.name,
          "location": location,
          "subject": lead.gender.heSheCap,
          "action": LcsI18n.tr(
            [
              "scouts the area carefully before approaching",
              "arrives early to check for any suspicious activity",
              "maps out an escape plan in case things go south",
              "keeps {possessive} eyes peeled for any signs of trouble",
              "makes sure to have multiple escape routes",
              "stays alert for any unusual patterns in the area",
            ].random,
          ),
          "possessive": lead.gender.hisHer,
        },
      ),
    );
  } else {
    addparagraph(
      y,
      0,
      LcsI18n.processString(
        "{lead} goes to pick up the money at {location}. {subject} {action}...",
        {
          "lead": lead.name,
          "location": location,
          "subject": lead.gender.heSheCap,
          "action": LcsI18n.tr(
            [
              "heads straight for the money",
              "moves quickly to the pickup spot",
              "makes a beeline for the drop location",
              "goes right to where the money should be",
              "takes a quick look around before proceeding",
              "glances around briefly before moving in",
              "makes sure there are no obvious cops in the area",
              "makes a cursory scan of the area",
              "makes sure to act casual and nonchalant",
            ].random,
          ),
        },
      ),
    );
  }
  y = console.y + 1;

  await getKey();

  bool success = await handleRansomAmbush(
    intr,
    lead,
    cr,
    y,
    pickedGoodLocation,
    approachedCarefully,
  );
  return success;
}

Future<(String, bool)> selectRansomLocation(Creature lead) async {
  bool pickedGoodLocation = lead.skillCheck(
    Skill.streetSmarts,
    Difficulty.average,
  );

  if (pickedGoodLocation) {
    // Public locations are actually safer for exchanges
    return (
      [
        "a busy coffee shop during rush hour",
        "a crowded shopping mall food court",
        "a packed transit station during commute",
        "a popular fast food restaurant at lunchtime",
        "a busy park on a weekend afternoon",
        "a crowded movie theater lobby",
        "a bustling train station",
        "a busy downtown intersection",
        "a popular tourist spot",
        "a crowded public square",
      ].random,
      true,
    );
  } else {
    // Less experienced leads pick secluded spots
    return (
      [
        "a quiet alleyway behind a 24-hour diner",
        "an abandoned parking garage",
        "a secluded park bench at night",
        "a run-down motel room",
        "a deserted transit station",
        "a back entrance to a shopping mall",
        "a storage unit facility",
        "a construction site after hours",
        "a loading dock behind a warehouse",
        "a public restroom in a train station",
      ].random,
      false,
    );
  }
}

Future<void> handleRansomArrest(Creature lead, int y) async {
  // Arrest consequences
  lead.squad = null;
  lead.carId = null;
  lead.location = findSiteInSameCity(lead.base!.city, SiteType.policeStation);
  lead.dropWeaponAndAmmo();
  lead.activity = Activity.none();
  criminalize(lead, Crime.extortion);
}

Future<bool> handleRansomAmbush(
  InterrogationSession intr,
  Creature lead,
  Creature cr,
  int y,
  bool pickedGoodLocation,
  bool approachedCarefully,
) async {
  // Street sense check to avoid ambush - difficulty scales with ransom amount
  int difficulty = Difficulty.average;
  if (intr.ransomAmount >= 100000) {
    difficulty = Difficulty.heroic; // Very high ransom = very high risk
  } else if (intr.ransomAmount >= 10000) {
    difficulty = Difficulty.challenging; // High ransom = high risk
  }

  if (!pickedGoodLocation) {
    difficulty += DifficultyModifier.aLittleHarder;
  }
  if (!approachedCarefully) {
    difficulty += DifficultyModifier.aLittleHarder;
  }

  bool gotMoney = false;
  if ((!pickedGoodLocation && !approachedCarefully) || oneIn(2)) {
    setColor(red);
    addparagraph(
      y,
      0,
      LcsI18n.processString("As {lead} approaches the money, {event}!", {
        "lead": lead.name,
        "event": LcsI18n.tr(
          [
            "police officers suddenly emerge from hiding",
            "a SWAT team descends on the location",
            "undercover agents reveal themselves",
            "a trap is sprung",
            "the area is suddenly flooded with law enforcement",
            "sirens blare as cop cars surround the area",
            "a police helicopter appears overhead",
            "snipers take up positions on nearby rooftops",
          ].random,
        ),
      }),
    );
    y = console.y + 1;

    int streetSmartsRoll = lead.skillRoll(Skill.streetSmarts);

    setColor(lightGray);
    if (streetSmartsRoll >= difficulty) {
      // Best chance of escape - good location and careful approach
      addparagraph(
        y,
        0,
        LcsI18n.processString("{lead} {action}.", {
          "lead": lead.name,
          "action": LcsI18n.tr(
            [
              "quickly spots the trap and slips away before the cops can close in",
              "uses {possessive} knowledge of the area to find an escape route",
              "recognizes the setup and evades the ambush with a combination of luck and street smarts",
              "moves quickly and manages to slip through their net",
              "identifies the weak point in their perimeter and exploits it",
              "uses {possessive} street smarts to outmaneuver the police",
              "finds a way to blend into the surroundings and disappear",
              "uses {possessive} experience to escape the trap",
            ].random,
          ),
          "possessive": lead.gender.hisHer,
        }),
      );
      y = console.y + 1;

      // Ambush consequences
      lead.heat += 50;
      addparagraph(
        y,
        0,
        LcsI18n.processString(
          "The ransom money is lost in the chaos, but {lead} manages to escape with {possessive} life.",
          {"lead": lead.name, "possessive": lead.gender.hisHer},
        ),
      );
      y = console.y + 1;
    } else if (pickedGoodLocation || approachedCarefully) {
      // Second chance to escape for those who did one thing right
      if (streetSmartsRoll < difficulty - 3) {
        addparagraph(
          y,
          0,
          LcsI18n.processString("{subject} {action}.", {
            "subject": lead.gender.heSheCap,
            "action": LcsI18n.tr(
              [
                "is quickly overwhelmed and arrested",
                "is tackled to the ground by officers",
                "is surrounded and has no choice but to surrender",
                "is caught in the act of trying to escape",
                "is apprehended after a brief struggle",
                "is taken into custody without incident",
                "is handcuffed and led away",
              ].random,
            ),
          }),
        );
        y = console.y + 1;

        await getKey();

        await handleRansomArrest(lead, y);
      } else {
        addparagraph(
          y,
          0,
          LcsI18n.processString("{subject} {action}...", {
            "subject": lead.gender.heSheCap,
            "action": LcsI18n.tr(
              [
                "somehow manages to slip away in the confusion",
                "gets lucky and finds an escape route",
                "manages to evade capture through sheer luck",
                "finds a way to escape despite {possessive} mistakes",
                "gets away by the skin of {possessive} teeth",
              ].random,
            ),
            "possessive": lead.gender.hisHer,
          }),
        );
        y = console.y + 1;

        await getKey();

        // Narrow escape consequences
        lead.heat += 75;
        addparagraph(
          y,
          0,
          LcsI18n.processString(
            "The ransom money is lost in the chaos, and {lead} barely escapes with {possessive} life.",
            {"lead": lead.name, "possessive": lead.gender.hisHer},
          ),
        );
        y = console.y + 1;
      }
    } else {
      // No precautions taken - automatic arrest
      addparagraph(
        y,
        0,
        LcsI18n.processString("{lead} {action}.", {
          "lead": lead.name,
          "action": LcsI18n.tr(
            [
              "is quickly overwhelmed and arrested",
              "accidentally runs right into the arms of several waiting officers",
              "is completely boxed in and has no choice but to surrender",
              "is caught in the act of trying to escape",
              "is apprehended after a brief struggle",
              "has no path to escape and is quickly handcuffed",
              "is handcuffed and led away",
            ].random,
          ),
        }),
      );
      y = console.y + 1;

      await getKey();

      await handleRansomArrest(lead, y);
    }
  } else {
    setColor(lightGreen);
    addparagraph(
      y,
      0,
      LcsI18n.processString("{lead} retrieves the ransom money and {action}.", {
        "lead": lead.name,
        "action": LcsI18n.tr(
          [
            "quickly walks away from the scene",
            "walks away without any further trouble",
            "leaves the area without being noticed",
            "returns with the money in hand",
            "gets away clean with the money",
            "manages to avoid any trouble",
            "makes it back to the safehouse without incident",
          ].random,
        ),
      }),
    );
    y = console.y + 1;

    ledger.addFunds(intr.ransomAmount, Income.ransom);

    for (var key in intr.techniques.keys) {
      intr.techniques[key] = false;
    }
    intr.techniques[Technique.free] = true;
    gotMoney = true;
  }

  intr.ransomPaid = true;

  await getKey();
  return gotMoney;
}
