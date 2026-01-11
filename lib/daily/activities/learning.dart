import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/ledger.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

Future<void> doActivityTakeClasses(List<Creature> students) async {
  for (Creature student in students) {
    Skill skill = student.activity.skill ?? Skill.values.first;
    String hisHer = student.gender.hisHer;

    if (student.skill(skill) >= 10) {
      await showMessage(
        LcsI18n.processString(
          "{name} can't find any classes at {hisHer} level in {skill}.",
          {"name": student.name, "hisHer": hisHer, "skill": skill.displayName},
        ),
      );
      student.activity = Activity.none();
      continue;
    }

    if (!_maxed(student, skill)) {
      if (ledger.funds < 30) break;
      ledger.subtractFunds(30, Expense.training);
      student.train(skill, 50 - student.skill(skill) * 5);

      if (student.skillXP(skill) > skillXpNeeded(student.skill(skill) + 1)) {
        String level = switch (student.skill(skill)) {
          0 => "an introductory",
          < 5 => "a",
          < 8 => "an advanced",
          _ => "a high-level",
        };
        await showMessage(
          LcsI18n.processString("{name} has passed {level} class in {skill}.", {
            "name": student.name,
            "level": level,
            "skill": skill.displayName,
          }),
        );
        student.skillUp();
      }
    }

    if (_maxed(student, skill)) {
      student.activity = Activity.none();
      await showMessage(
        LcsI18n.processString(
          "{name} has reached {hisHer} potential in {skill}.",
          {"name": student.name, "hisHer": hisHer, "skill": skill.displayName},
        ),
      );
    }
  }
}

Future<void> doActivityStudy(List<Creature> students) async {
  for (Creature student in students) {
    Skill skill = student.activity.skill ?? Skill.values.first;
    String hisHer = student.gender.hisHer;
    if (!_maxed(student, skill)) {
      student.train(skill, 5);

      if (student.skillXP(skill) > skillXpNeeded(student.skill(skill))) {
        student.skillUp();
        if (student.skill(skill) < student.skillCap(skill)) {
          // Only if not maxed
          await showMessage(
            LcsI18n.processString(
              "{name} has reached level {level} in {skill}.",
              {
                "name": student.name,
                "level": student.skill(skill).toString(),
                "skill": skill.displayName,
              },
            ),
          );
        }
      }
    }

    if (_maxed(student, skill)) {
      student.activity = Activity.none();
      await showMessage(
        "${student.name} has reached $hisHer potential in ${skill.displayName}.",
      );
    }
  }
}

bool _maxed(Creature cr, Skill sk) => cr.skill(sk) >= cr.skillCap(sk);
