import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/daily/advance_day.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/game_options.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

Future<int> traumatize(Creature lead, String action, int y) async {
  if (lcsRandom(lead.attribute(Attribute.heart)) > lcsRandom(3)) {
    setColor(lightGreen);
    String reaction;
    if (gameOptions.lighterTone) {
      addparagraph(
        y++,
        0,
        LcsI18n.processString("{name} loses Heart.", {"name": lead.name}),
      );
    } else {
      reaction = [
        "{name} throws up in a trash can.",
        "{name} gets drunk, eventually falling asleep.",
        "{name} curls up in a ball, crying softly.",
        "{name} shoots up and collapses in a heap on the floor.",
        "{name} has a panic attack.",
        "{name} asks \"Are we the baddies?\"",
        "{name} doesn't want to talk to anyone.",
        "{name} can't sleep for days.",
        "{name} is haunted by the memory of the {action}.",
        "{name} has nightmares afterwards.",
      ].random;
      addparagraph(
        y++,
        0,
        LcsI18n.processString(reaction, {
          "name": lead.name,
          "action": LcsI18n.tr(action),
        }),
      );
    }
    lead.heartDamage += 1;
    move(y++, 0);
    lead.activity = Activity.none();
  } else if (oneIn(3) && lead.attribute(Attribute.wisdom) < 10) {
    if (gameOptions.lighterTone) {
      setColor(red);
      addparagraph(
        y++,
        0,
        LcsI18n.processString("{name} gains Wisdom.", {"name": lead.name}),
      );
    } else {
      setColor(lightBlue);
      addparagraph(
        y++,
        0,
        LcsI18n.processString("{name} gains Wisdom and grows colder.", {
          "name": lead.name,
        }),
      );
    }
    lead.adjustAttribute(Attribute.wisdom, 1);
  } else if (oneIn(3) &&
      lead.attribute(Attribute.wisdom) > lead.attribute(Attribute.heart)) {
    String name = lead.name;
    if (!gameOptions.lighterTone) {
      mvaddstrc(
        y++,
        0,
        lightGray,
        "{name} leaves the safehouse in a daze.",
        params: {"name": name},
      );
      await getKey();
      String wandering;
      wandering = [
        "{name} wanders the streets all night, lost in thought.",
        "{name} gets drunk while out and rethinks this life.",
        "{name} runs naked through the park at night.",
        "{name} wanders aimlessly through the city, unable to think.",
        "{name} finds a quiet diner and watches people exist.",
        "{name} lies on a park bench, wracked by regret.",
        "{name} walks until exhaustion forces {himHer} to collapse.",
        "{name} goes to a bar and meets some new people.",
        "{name} lies down in a dumpster, where {heShe} belongs.",
        "{name} knocks on people's doors, turned away every time.",
        "{name} sits in a bar, drinking and staring at the wall.",
        "{name} stares at a church for hours, before going in.",
        "{name} follows flickering streetlights into the darkness.",
        "{name} sits in a park, watching people with regular lives.",
        "{name} catches a bus, not knowing where it leads.",
        "{name} catches a bus and rides it to the end of the line.",
        "{name} catches a bus to the next city.",
        "\"I don't want to do this anymore...\"",
        "\"I need to get out of here!\"",
        "\"I can't do this anymore.\"",
        "\"I hate who I've become...\"",
        "\"I don't want to be a part of this...\"",
        "\"I hate this place!\"",
        "\"Fuck all of this!\"",
        "\"Fucking LCS bullshit...\"",
        "\"Who gives a shit about this anyway...\"",
        "\"What am I fucking doing?\"",
        "\"I hate this, I hate myself.\"",
        "\"I used to think I was a good person...\"",
      ].random;
      mvaddstrc(
        y++,
        2,
        midGray,
        wandering,
        params: {
          "name": name,
          "himHer": lead.gender.himHer,
          "heShe": lead.gender.heShe,
        },
      );
      await getKey();
    }
    if (oneIn(2)) {
      if (oneIn(2)) {
        if (gameOptions.lighterTone) {
          addparagraph(
            y++,
            0,
            LcsI18n.processString(
              "{name} decides to leave the Liberal Crime Squad.",
              {"name": lead.name},
            ),
          );
        } else {
          mvaddstrc(
            y++,
            4,
            darkGray,
            "{name} never comes back.",
            params: {"name": lead.name},
          );
        }
        lead.location = null;
        lead.die(); // they might be alive, but it doesn't matter to the LCS
        lead.boss?.juice -= 25;
        if (oneIn(2)) {
          lead.base?.siege.timeUntilCops = 2;
        }
      } else {
        lead.location = null;
        lead.hidingDaysLeft = lcsRandom(3) + 2;
        if (gameOptions.lighterTone) {
          addparagraph(
            y++,
            0,
            LcsI18n.processString(
              "{name} decides to take a few days off from LCS work.",
              {"name": lead.name},
            ),
          );
        } else {
          mvaddstrc(
            y++,
            4,
            darkGray,
            "{name} doesn't come back for several days...",
            params: {"name": lead.name},
          );
        }
      }
    } else {
      if (gameOptions.lighterTone) {
        addparagraph(
          y++,
          0,
          LcsI18n.processString("{name} thinks about leaving the LCS.", {
            "name": lead.name,
          }),
        );
      } else {
        mvaddstrc(
          y++,
          4,
          lightGray,
          "{name} returns to the safehouse after a few hours.",
          params: {"name": lead.name},
        );
      }
    }
  } else {
    if (gameOptions.lighterTone) {
      mvaddstrx(
        y++,
        0,
        "&w{name} doesn't seem happy about this.",
        params: {"name": lead.name},
      );
    } else {
      mvaddstrx(
        y++,
        0,
        "&w{name} &mdoesn't really &Kfeel anything...",
        params: {"name": lead.name},
      );
    }
  }
  await getKey();
  if (!lead.alive) {
    await dispersalCheck();
  }
  return y;
}
