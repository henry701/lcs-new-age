import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

/// Handles the firm interrogation of a hostage by a lead interrogator
Future<void> handleFirmInterrogation(
  Creature lead,
  Creature cr,
  Map<int, double> rapport,
  int y,
) async {
  // Base forceroll on lead interrogator's psychology skill and rapport
  int forceroll =
      lead.skillRoll(Skill.psychology) + ((rapport[lead.id] ?? 0) * 5).round();
  // Reduce rapport with lead
  rapport.update(lead.id, (v) => v - 1, ifAbsent: () => -1);

  String message = LcsI18n.processString(
    "{lead} interrogates {hostage}, {action} \"{question}\"",
    {
      "lead": lead.name,
      "hostage": cr.name,
      "action": LcsI18n.tr(
        [
          "asking",
          "demanding",
          "saying",
          "pressing {himHer} by saying",
          "probing {himHer} by saying",
        ].random,
      ),
      "possessive": cr.gender.hisHer,
      "himHer": cr.gender.himHer,
      "question": LcsI18n.tr(
        [
          "What do you know?",
          "Where do you work?",
          if (ccsActive) "What do you know about the CCS?",
          "Give up your secrets!",
          "Tell us what you know!",
          "We need information!",
          "What are you hiding?",
          "What's really going on?",
        ].random,
      ),
    },
  );
  addparagraph(y, 0, message);
  y = console.y + 1;

  await getKey();

  if (!cr.attributeCheck(Attribute.wisdom, forceroll)) {
    if (cr.skillCheck(Skill.religion, forceroll)) {
      mvaddstr(
        y++,
        0,
        LcsI18n.processString("{name} {action}", {
          "name": cr.name,
          "action": LcsI18n.tr(
            [
              "prays silently...",
              "seeks strength in faith.",
              "tries to find inner peace.",
              "looks to God for guidance.",
              "whispers a prayer.",
              "asks for divine help.",
            ].random,
          ),
        }),
      );
    } else {
      Site? workSite = cr.workLocation is Site ? cr.workLocation as Site : null;
      if (workSite?.mapped == false) {
        addparagraph(
          y,
          0,
          LcsI18n.processString(
            "{name} reveals everything {pronoun} knows about the {site}.",
            {
              "name": cr.name,
              "pronoun": cr.gender.heShe,
              "site": workSite!.name,
            },
          ),
        );
        y = console.y + 1;

        await getKey();

        workSite.mapped = true;
        workSite.hidden = false;
      } else {
        String the = cr.workLocation is Site ? "the " : "";
        addparagraph(
          y,
          0,
          LcsI18n.processString(
            "{name} talks about {article}{location}, though it doesn't seem like {pronoun} knows anything new.",
            {
              "name": cr.name,
              "article": the,
              "location": cr.workLocation.name,
              "pronoun": cr.gender.heShe,
            },
          ),
        );
        y = console.y + 1;

        await getKey();
      }
    }
  } else {
    mvaddstr(y++, 0, "{name} holds firm.", params: {"name": cr.name});
    await getKey();
  }
}
