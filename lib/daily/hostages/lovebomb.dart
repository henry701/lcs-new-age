import 'package:lcs_new_age/creature/attributes.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/creature/dice.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/skills.dart';
import 'package:lcs_new_age/daily/hostages/tend_hostage.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

Future<void> handleLoveBombing(
  InterrogationSession intr,
  Creature lead,
  Creature cr,
  int y,
) async {
  double rapportTemp = intr.rapport[lead.id] ?? 0;
  int attack = lead.skill(Skill.psychology) * 2;
  attack += Dice.r2d6.roll();
  attack += cr.daysSinceJoined;

  if (intr.techniques[Technique.props] == true) attack += 10;
  attack += (rapportTemp * 2).round();

  String message;
  if (intr.techniques[Technique.props] == true) {
    List<String> miniOptions = [
      "protest sign workshop",
      "drag show",
      "puppet show",
      "movie showing",
      "yoga session",
      "speech",
      "poetry slam",
      "chill session",
      "fashion show",
      "big hug",
      "miniature concert",
      "book reading",
      "feast",
      "mock protest",
      "board game",
      "live chicken",
    ];
    message = LcsI18n.processString("{lead} {activity}", {
      "lead": lead.name,
      "activity": LcsI18n.processComposedString(
        [
          "serves {hostage} an incredible vegan feast, complete with quinoa "
              "casserole and an oat milk latte, insisting that {pronoun} "
              "try it all while {lead} explains the comparative carbon "
              "footprint of the ingredients and contrasts this against the "
              "carbon footprint of a traditional meat-based meal.",
          "holds an in-depth microaggression workshop with {hostage}, engaging "
              "{obj} in a series of elaborate role-playing scenarios "
              "where they dissect even the most innocuous phrases for hidden biases "
              "and discuss how this impacts {hostage} and others around them.",
          "puts together a poetry slam for {hostage}, where at first {lead} "
              "reads some of {leadPossessive} own poetry before {hostage} "
              "is given the stage to join in with several verses of {hostagePossessive} own, "
              "to be followed by a long discussion about the poetic form and the "
              "lived experiences that feed into their respective verses.",
          "holds a mock protest to bring {hostage} into the movement in spirit, "
              "starting with an extended planning session where they pick out "
              "phrases and put together protest signs about issues that really "
              "matter to {hostagePronoun}.",
          "holds a movie night with {hostage}, with a marathon of documentaries "
              "on topics like renewable energy and intersectionality, pausing "
              "frequently for collaborative discussions on \"what it all means\".",
          "has {hostage} brainstorm protest sign ideas on issues that matter to "
              "{hostagePronoun}, then helps {obj} to "
              "put together a sign {hostagePronoun} can take out into the street "
              "once {hostage} is released.",
          "puts on a drag brunch for {hostage}, encouraging {obj} to "
              "embrace self-expression and self-love through glitter, pancakes, "
              "and RuPaul quotes.",
          "sets up a supervised drug experimentation day for {hostage}, with a "
              "variety of substances to try, including Cannabis, LSD, MDMA, "
              "and psilocybin, making sure that {hostagePronoun} is "
              "comfortable with the process and has a safe space to explore "
              "altered states of consciousness while minimizing risk to "
              "{hostagePossessive} health.",
          "assigns {hostage} a stack of progressive literature, focused on readings "
              "from bell hooks, Audre Lorde, and other feminist icons, so {hostagePronoun} "
              "can break through the barriers of {hostagePossessive} old mindset "
              "and start to understand the importance of intersectional feminism.",
          "assigns {hostage} a stack of progressive literature, focused on readings "
              "from Ngũgĩ wa Thiong'o, Edward Said, and other postcolonial theorists, "
              "so {hostagePronoun} can start to understand the importance of "
              "decolonizing {hostagePossessive} mind.",
          "assigns {hostage} a stack of progressive literature, focused on readings "
              "from Angela Davis, Frantz Fanon, and other revolutionary thinkers, "
              "so {hostagePronoun} can start to understand some of the ideas "
              "that underpin revolutionary left-wing politics.",
          "assigns {hostage} a stack of progressive literature, focused on readings "
              "from Peter Kropotkin, Emma Goldman, and other anarchist thinkers, "
              "so {hostagePronoun} can start to question the absolute authority "
              "of the state and the need for a more just and equitable society.",
          "assigns {hostage} a stack of progressive literature, focused on readings "
              "from Judith Butler, Michel Foucault, and other queer theorists, "
              "so {hostagePronoun} can start to understand the politics of "
              "queer liberation and the fight against gender-based oppression.",
          "holds a mandatory self-care bootcamp for {hostage}, complete with yoga "
              "sessions, aromatherapy, and journaling prompts like \"What does "
              "your political inner child look like?\"",
          "hosts a \"paint your feelings\" session for {hostage}, where {hostagePronoun} "
              "is encouraged to express the flaws in {hostagePossessive} ideology "
              "through abstract art, with no judgment or critique, but a deep "
              "compassion.",
          "organizes a personalized concert of protest-inspired music, inviting "
              "{hostage} to join in on the harmonies, with a focus on uplifting "
              "songs about love and unity early in the session, and then moving "
              "into more complex and forceful pieces as the session progresses.",
          "holds an inclusive fashion show for {hostage}, where {hostagePronoun} "
              "can try on a variety of outfits that challenge traditional gender "
              "norms and incorporate elements of niche subcultures, each item "
              "linked to a discussion about the history and significance of the "
              "style and the subculture it comes from.",
          "brings in gardening supplies and teaches {hostage} how to grow {hostagePossessive} own "
              "food, narrating how sowing literal seeds of change mirrors the "
              "LCS's mission to uproot harmful ideologies.",
          "builds an intricate escape room for {hostage}, full of puzzles about "
              "systemic inequality, where {hostagePronoun} can only solve each "
              "puzzle by first escaping {hostagePossessive} old mindset.",
          "stages a puppet show for {hostage}, featuring characters like "
              "Karl Marx and Rosa Luxemburg in a series of skits about the "
              "history of the LCS and the importance of revolutionary "
              "politics.",
          "throws a holiday party for {hostage} celebrating {holiday}, complete with a {item1}, a {item2}, and a {item3}.",
          "gives {hostage} a live chicken to hold while {lead} plays "
              "a series of undercover videos of factory farms and slaughterhouses "
              "for {hostagePronoun}, then encourages {obj} to "
              "get in touch with {hostagePossessive} true feelings.",
        ].random,
        {
          "lead": lead.name,
          "hostage": cr.name,
          "pronoun": cr.gender.heShe,
          "obj": cr.gender.himHer,
          "leadPossessive": lead.gender.hisHer,
          "hostagePossessive": cr.gender.hisHer,
          "hostagePronoun": cr.gender.heShe,
          "holiday": LcsI18n.tr(
            [
              "Intersectional Justice Jubilee",
              "Hug-Your-Haters Day",
              "Intersectionality Awareness Day",
              "Queer Liberation Day",
              "Decolonization Day",
              "Anarchist Abolitionist Day",
              "Feminist Resistance Day",
              "Trans Unity Day",
              "Rainbow Butterfly Day",
              "Incredible Inclusivity Day",
              "Black Power Day",
              "African Roots Day",
              "Black And Proud Day",
              "Black Lives Do In Fact Matter Day",
              "Love Wins Day",
              "Liberalism Day",
              "Leftist Pride Day",
              "Social Justice Day",
              "Adopt-A-Conservative Day",
              "Fuck The Police Day",
              "Radical Self-Care Day",
              "Resistance Day",
              "Even Prouder Pride Day",
              "I'm A Liberal Day",
              "Damn It's Good To Be A Liberal Day",
              "Liberalism Is The New Black Day",
              "Join The LCS Day",
              "Stop Being A Conservative Day",
            ].random,
          ),
          "item1": LcsI18n.tr(miniOptions.randomPop()),
          "item2": LcsI18n.tr(miniOptions.randomPop()),
          "item3": LcsI18n.tr(miniOptions.randomPop()),
        },
      ),
    });
  } else {
    message = LcsI18n.processString("{lead} {activity}", {
      "lead": lead.name,
      "activity": LcsI18n.processComposedString(
        [
          "raves about how good vegan food is to {hostage}.",
          "explains microaggressions to {hostage}.",
          "recites some spoken word poetry for {hostage}.",
          "quizzes {hostage} about correct recycling habits.",
          "enthuses about the benefits of regular meditation to {hostage} "
              "and offers to teach {obj} how to do it.",
          "shows {hostage} pictures of people having fun at a protest and "
              "suggests {pronoun} would get a lot out of it.",
          "describes a progressive film to {hostage} and tells {obj} "
              "about what it means.",
          "tells {hostage} about some clever protest signs people have come up "
              "with in the past.",
          "tells {hostage} how much fun drag shows are and offers to answer "
              "any questions {obj} has about them.",
          "recommends {hostage} read some theory when {pronoun} gets "
              "a chance, and tries to explain some of the complex ideas "
              "from memory.",
          "asks {hostage} \"What does your political inner child look like?\"",
          "tries to do a guided meditation with {hostage}, and asks "
              "{obj} to visualize {possessive} feelings "
              "like a painting.",
          "plays a selection of protest songs on {leadPossessive} cell "
              "phone and asks {obj} what {pronoun} thinks "
              "they mean.",
          "challenges {hostage} to imagine a world without posessions, and "
              "wonders if {pronoun} can.",
          "suggests {hostage} would look good in a hemp tunic.",
          "says {hostage} would could be a totally epic left-wing punk rebel "
              "if {pronoun} is interested in that sort of thing.",
          "tells {hostage} about the importance of intersectionality.",
          "explains to {hostage} that fair trade coffee actually tastes better "
              "and is better for the world.",
          "works with {hostage} to imagine the best possible world.",
          "asks {hostage} to imagine a world without prisons, and tries to "
              "engage {obj} in a discussion about how "
              "conflicts would be resolved if locking people away wasn't "
              "an option.",
          "asks {hostage} to imagine a world without borders, where moving "
              "between countries is as easy as moving between cities.",
          "tries to help {hostage} escape {possessive} old mindset.",
          "encourages {hostage} to admit {possessive} past mistakes, "
              "everything {pronoun} feels guilty or ashamed of, "
              "so {lead} can show unconditional acceptance and "
              "understanding of them instead of the rejection {hostage} was "
              "expecting.",
        ].random,
        {
          "lead": lead.name,
          "hostage": cr.name,
          "pronoun": cr.gender.heShe,
          "obj": cr.gender.himHer,
          "possessive": cr.gender.hisHer,
          "leadPossessive": lead.gender.hisHer,
        },
      ),
      "hostage": cr.name,
      "pronoun": cr.gender.heShe,
      "obj": cr.gender.himHer,
      "possessive": cr.gender.hisHer,
      "leadPossessive": lead.gender.hisHer,
    });
  }
  addparagraph(y, 0, message);
  y = console.y + 1;

  await getKey();

  //Target is swayed by Liberal Reason -- skilled interrogators, time held,
  //and rapport contribute to the likelihood of this
  int marginOfSuccess =
      cr.attribute(Attribute.wisdom) * 2 +
      cr.skill(Skill.business) +
      cr.skill(Skill.religion) +
      cr.skill(Skill.science) +
      cr.skill(Skill.psychology) * 2;
  if (marginOfSuccess < attack) {
    // Reduce juice if any is there
    if (cr.juice > 0) {
      cr.juice -= marginOfSuccess;
      if (cr.juice < 0) cr.juice = 0;
    } else if (cr.juice == 0) {
      // Otherwise, modify heart and wisdom when juice is 0
      if (cr.attribute(Attribute.wisdom) > 1) {
        cr.adjustAttribute(Attribute.wisdom, -1);
      }
      if (cr.attribute(Attribute.heart) < 10) {
        cr.adjustAttribute(Attribute.heart, 1);
      }
    }

    //Improve rapport with interrogator
    intr.rapport.update(
      lead.id,
      (v) => v + 1 + lcsRandom(5) * 0.2,
      ifAbsent: () => 1 + lcsRandom(5) * 0.2,
    );

    final lovebombResult = LcsI18n.processString(
      [
        "{name}'s Conservative beliefs are shaken.",
        "{name} quietly considers these ideas.",
        "{name} is beginning to see Liberal reason.",
        "{name} has a revelation of understanding.",
        "{name} grudgingly admits sympathy for LCS ideals.",
        "{name} is beginning to see the error of {possessive} ways.",
        "{name} is beginning to understand where the LCS is coming from.",
        "{name} never really thought about things this way before.",
      ].random,
      {"name": cr.name, "possessive": cr.gender.hisHer},
    );
    mvaddstrc(y++, 0, lightGray, lovebombResult);

    await getKey();
  }
  //Target is not sold on the LCS arguments and holds firm
  //This is the worst possible outcome if you use props
  else if (!cr.skillCheck(
        Skill.psychology,
        lead.attribute(Attribute.heart) + 5,
      ) ||
      intr.techniques[Technique.props] == true) {
    //Loses rapport
    intr.rapport.update(
      lead.id,
      (v) => v - 0.2 - lcsRandom(5) * 0.1,
      ifAbsent: () => -0.2 - lcsRandom(5) * 0.1,
    );

    String description;
    if (rapportTemp > lcsRandom(3) ||
        cr.skill(Skill.psychology) > lead.skill(Skill.psychology)) {
      if (cr.skill(Skill.psychology) > lead.skill(Skill.psychology)) {
        description = LcsI18n.processComposedString(
          [
            "{name} plays along but somehow makes everything seem so "
                "silly and trivial.",
            "{lead} somehow ends up on the defensive as {name} calls "
                "out every manipulative comment {leadPronoun} makes "
                "in the effort to get {obj} to change "
                "{objPossessive} views.",
            "{name} sardonically critiques this \"recruitment strategy\" "
                "of love bombing hostages until they think this miserable "
                "existence as a criminal on the fringes of society is somehow "
                "better than the alternative.",
            "{name} suggests {lead} should see a therapist to deal "
                "with {leadPossessive} issues instead of kidnapping and "
                "brainwashing people.",
            "{name} offers some sardonically deadpan advice on how "
                "{lead} could make this more coercive and convincing.",
            "{name} keeps asking {lead} the same questions for "
                "some reason and it's just pissing {leadPossessive} off.",
            "{name} dismisses the activities and asks some rather "
                "rather uncomfortable questions about {lead}'s past.",
          ].random,
          {
            "name": cr.name,
            "lead": lead.name,
            "obj": cr.gender.himHer,
            "leadPronoun": lead.gender.heShe,
            "objPossessive": cr.gender.hisHer,
            "leadPossessive": lead.gender.hisHer,
          },
        );
        lead.train(Skill.psychology, cr.skill(Skill.psychology) * 4);
        intr.rapport[lead.id] =
            (intr.rapport[lead.id] ?? 0) - lcsRandom(10) * 0.1;
      } else if (cr.skill(Skill.religion) > lead.skill(Skill.religion)) {
        final religionQuestion = lead.gender == Gender.nonbinary
            ? "{name} asks {lead} if {leadPronoun} ever think about Jesus."
            : "{name} asks {lead} if {leadPronoun} ever thinks about Jesus.";
        description = LcsI18n.processString(
          [
            "{lead} is unable to shake {name}'s religious conviction.",
            "{name} draws strength from God.",
            "{lead}'s efforts to shake {name}'s faith seem futile.",
            "{name} explains the Conservative tenets of {namePossessive} faith.",
            "{name} praises the Lord for this moment to converse.",
            "{name} prays that health finds them both.",
            religionQuestion,
          ].random,
          {
            "name": cr.name,
            "lead": lead.name,
            "namePossessive": cr.gender.hisHer,
            "leadPronoun": lead.gender.heShe,
          },
        );
        lead.train(Skill.religion, cr.skill(Skill.religion) * 4);
      } else if (cr.skill(Skill.business) > lead.skill(Skill.business)) {
        description = LcsI18n.processString(
          [
            "{name} offers to make a deal.",
            "{name} asks if there's a ransom.",
            "{name} asks if the LCS plans to make money from kidnapping.",
            "{name} suggests the interrogation room could be better decorated.",
            "{name} explains the basics of supply and demand.",
            "{name} talks about economic theory.",
            "{name} mounts a defense of Reaganomics.",
            "{name} talks about the importance of the free market.",
            "{name} explains the importance of capitalism.",
            "{name} professes faith in the invisible hand.",
          ].random,
          {"name": cr.name},
        );
        lead.train(Skill.business, cr.skill(Skill.business) * 4);
      } else {
        description = LcsI18n.processString(
          [
            "The conversation is polite.",
            "{name} engages but is not swayed.",
            "{name} is not convinced.",
            "{name} asks questions, but seems unmoved.",
            "{name} teases {lead} a bit.",
            "{name} asks for {item}.",
            "{name} explains why {pronoun} disagrees.",
            "{name} debates the points raised.",
          ].random,
          {
            "name": cr.name,
            "lead": lead.name,
            "item": ["coffee", "tea", "water", "a burger"].random,
            "pronoun": cr.gender.heShe,
          },
        );
      }
    } else {
      description = LcsI18n.processString(
        [
          "{name} just stares.",
          "{name} demands to be released.",
          "{name} refuses to speak.",
          "{name} yells at {lead}.",
          "{name} huffs indignantly.",
          "{name} insults {lead}.",
          "{name} looks at the walls.",
          "{name} ignores {lead}.",
        ].random,
        {"name": cr.name, "lead": lead.name},
      );
    }
    addparagraph(y, 0, description);
    y = console.y + 1;
    await getKey();
  }
  //Target actually wins the argument so successfully that the Liberal
  //interrogator's convictions are the ones that are shaken
  else {
    //Consolation prize is that they end up liking each other more
    intr.rapport.update(lead.id, (v) => v + 1.5, ifAbsent: () => 1.5);

    lead.adjustAttribute(Attribute.wisdom, 1);

    addparagraph(
      y,
      0,
      LcsI18n.processComposedString(
        "{name} makes some fascinating points that {lead} has "
        "never considered before...",
        {"name": cr.name, "lead": lead.name},
      ),
    );
    y = console.y + 1;

    mvaddstrc(
      y++,
      0,
      red,
      "{name} has been tainted with wisdom!",
      params: {"name": lead.name},
    );
    await getKey();
  }
}
