/* news - show major news story */

import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/creature_type.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/name.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/siege.dart';
import 'package:lcs_new_age/newspaper/ads.dart';
import 'package:lcs_new_age/newspaper/filler.dart';
import 'package:lcs_new_age/newspaper/headline.dart';
import 'package:lcs_new_age/newspaper/layout.dart';
import 'package:lcs_new_age/newspaper/major_event.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/newspaper/squad_story_text.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/laws.dart';
import 'package:lcs_new_age/politics/views.dart';
import 'package:lcs_new_age/saveload/load_cpc_images.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/interface_options.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

Future<void> displayStory(NewsStory ns, View? header) async {
  bool liberalguardian = ns.publication == Publication.liberalGuardian;
  erase();
  preparePage(ns, liberalguardian);

  String story = '';
  List<int> storyXStart = [for (var i = 0; i < 25; i++) 1];
  List<int> storyXEnd = [for (var i = 0; i < 25; i++) 78];
  displayAds(ns, liberalguardian, storyXStart, storyXEnd);

  String city = ns.loc?.city.name ?? randomCityName();

  void appendNews(String text) {
    story += LcsI18n.tr(text);
  }

  switch (ns.type) {
    case NewsStories.majorEvent:
      displayMajorEventStory(ns, storyXStart, storyXEnd);
    case NewsStories.ccsNoBackers:
    case NewsStories.ccsDefeated:
    case NewsStories.squadSiteAction:
    case NewsStories.squadEscapedSiege:
    case NewsStories.squadFledAttack:
    case NewsStories.squadDefended:
    case NewsStories.squadBrokeSiege:
    case NewsStories.squadKilledInSiegeAttack:
    case NewsStories.squadKilledInSiegeEscape:
    case NewsStories.squadKilledInSiteAction:
    case NewsStories.ccsSiteAction:
    case NewsStories.ccsKilledInSiteAction:
    case NewsStories.carTheft:
    case NewsStories.arrestGoneWrong:
      int y = 2;
      if ((!liberalguardian && ns.page == 1) ||
          (liberalguardian && ns.guardianpage == 1)) {
        y = displayStoryHeader(ns, header);
      }

      story = city;
      story += " - ";

      Map<Drama, int> drama = {for (Drama c in Drama.values) c: 0};
      for (var c in ns.drama) {
        drama.update(c, (level) => level + 1);
      }

      switch (ns.type) {
        case NewsStories.ccsNoBackers:
          appendNews(
            "The FBI investigation into the Conservative Crime Squad's government connections has led to the arrest of more than ",
          );
          appendNews(
            "a dozen elected officials and revealed extensive corruption in law enforcement.",
          );
          story += "&r";
          appendNews(
            "  \"The uphevals in the police force, and arrest of corrupt officials, are only the beginning,\" FBI Chief ",
          );
          appendNews(
            "Roberta T. Malton said during a news conference.  \"A major focus ",
          );
          appendNews(
            "of our efforts will be on the complete destruction of the Conservative Crime Squad. Within six months, we'll have their ",
          );
          appendNews(
            "entire leadership, dead or alive. I personally guarantee it.\"",
          );
          story += "&r";
        case NewsStories.ccsDefeated:
          appendNews("An elite FBI force conducted simultaneous ");
          appendNews(
            "raids on several suspected Conservative Crime Squad safehouses in the early hours. Despite resistance from ",
          );
          appendNews(
            "CCS terrorists armed with automatic weapons and body armor, no FBI agents were killed in the raids, and all ",
          );
          appendNews(
            "three raids were successful. Seventeen suspects were killed in the fighting, and twenty-three are ",
          );
          appendNews("now in custody.");
          story += "&r";
          appendNews(
            "  The Conservative Crime Squad fell on hard times when the alternative news site Liberal Guardian published ",
          );
          appendNews(
            "1147 pages of documents showing extensive government support for the group. The ensuing scandal ",
          );
          appendNews(
            "led to the arrest of twenty-five members of Congress, as well as several leadership figures in the ",
          );
          appendNews("Conservative Party's National Committee.");
          story += "&r";
          appendNews("  \"I want parents to rest easy tonight,\" FBI Chief ");
          appendNews(
            "Roberta T. Malton said during a news conference to announce the raids.  \"You don't need the Liberal Crime Squad ",
          );
          appendNews("to protect you. The Government can handle it.\"");
          story += "&r";
        case NewsStories.arrestGoneWrong:
        case NewsStories.carTheft:
          appendNews("A routine arrest went horribly wrong yesterday, ");
          appendNews(
            "according to a spokesperson from the police department.&r",
          );
          appendNews("  A suspect, whose identity is unclear, killed ");
          if (drama[Drama.killedSomebody]! > 1) {
            story += LcsI18n.processString(
              "{count} police officers that were",
              {"count": drama[Drama.killedSomebody].toString()},
            );
          } else {
            appendNews("a police officer that was");
          }
          appendNews(" attempting to perform an arrest.  ");

          if (drama[Drama.killedSomebody]! > 1) {
            appendNews(
              "The names of the officers have not been released pending notification of their families.",
            );
          } else {
            appendNews(
              "The name of the officer has not been released pending notification of the officer's family.",
            );
          }
          story += "&r";
        case NewsStories.squadEscapedSiege:
          appendNews("Members of the Liberal Crime Squad ");
          appendNews("escaped from a police siege yesterday, according ");
          if (!liberalguardian) {
            appendNews("to a spokesperson from the police department.");
          } else {
            appendNews("to a Liberal Crime Squad spokesperson.");
          }
          story += "&r";
        case NewsStories.squadFledAttack:
          appendNews("Members of the Liberal Crime Squad ");
          appendNews(
            "escaped from police officers during a raid yesterday, according ",
          );
          if (!liberalguardian) {
            appendNews("to a spokesperson from the police department.");
          } else {
            appendNews("to a Liberal Crime Squad spokesperson.");
          }
          story += "&r";
        case NewsStories.squadDefended:
          appendNews("Members of the Liberal Crime Squad ");
          appendNews("fought off a police raid yesterday, according ");
          if (!liberalguardian) {
            appendNews("to a spokesperson from the police department.");
          } else {
            appendNews("to a Liberal Crime Squad spokesperson.");
          }
          story += "&r";
        case NewsStories.squadBrokeSiege:
          appendNews("Members of the Liberal Crime Squad ");
          appendNews("violently broke a police siege yesterday, according ");
          if (!liberalguardian) {
            appendNews("to a spokesperson from the police department.");
          } else {
            appendNews("to a Liberal Crime Squad spokesperson.");
          }
          story += "&r";
        case NewsStories.squadKilledInSiegeAttack:
          appendNews("Members of the Liberal Crime Squad were ");
          if (!liberalguardian) {
            appendNews("slain during a police raid yesterday, according ");
            appendNews("to a spokesperson from the police department.");
          } else {
            appendNews("murdered during a police raid yesterday, according ");
            appendNews("to a Liberal Crime Squad spokesperson.");
          }
          story += "&r";
        case NewsStories.squadKilledInSiegeEscape:
          appendNews("Members of the Liberal Crime Squad were ");
          if (!liberalguardian) {
            appendNews(
              "slain trying to escape from a police siege yesterday, according ",
            );
            appendNews("to a spokesperson from the police department.");
          } else {
            appendNews(
              "murdered trying to escape from a police siege yesterday, according ",
            );
            appendNews("to a Liberal Crime Squad spokesperson.");
          }
          story += "&r";
        default:
          bool ccs =
              ns.type == NewsStories.ccsKilledInSiteAction ||
              ns.type == NewsStories.ccsSiteAction;

          story += squadStoryTextOpening(ns, ccs);

          bool did(Drama d) => drama[d]! > 0;

          int typesum = drama.entries
              .where((entry) => entry.value >= 1)
              .whereNot(
                (entry) => [
                  Drama.openedCEOSafe,
                  Drama.stoleCorpFiles,
                  Drama.shutDownReactor,
                  Drama.bankVaultRobbery,
                  Drama.bankTellerRobbery,
                  Drama.bankStickup,
                  Drama.openedPoliceLockup,
                  Drama.openedCourthouseLockup,
                  Drama.releasedPrisoners,
                  Drama.juryTampering,
                  Drama.hackedIntelSupercomputer,
                  Drama.openedArmory,
                  Drama.carChase,
                  Drama.carCrash,
                  Drama.footChase,
                  Drama.hijackedBroadcast,
                  Drama.legalGunUsed,
                  Drama.illegalGunUsed,
                ].contains(entry.key),
              )
              .length;

          if (did(Drama.shutDownReactor)) {
            if (laws[Law.nuclearPower] == DeepAlignment.eliteLiberal) {
              if (!liberalguardian) {
                appendNews("  According to sources that were at the scene, ");
                appendNews(
                  "the Liberal Crime Squad contaminated the state's water supply",
                );
                story += " ";
                appendNews(
                  "yesterday by tampering with equipment on the site.",
                );
                story += "&r";
              } else {
                appendNews(
                  "  The Liberal Crime Squad tampered with the state's water supply yesterday, ",
                );
                appendNews(
                  "demonstrating the extreme dangers of Nuclear Waste. ",
                );
                story += "&r";
              }
            } else {
              if (!liberalguardian) {
                appendNews("  According to sources that were at the scene, ");
                appendNews(
                  "the Liberal Crime Squad nearly caused a catastrophic meltdown of the nuclear ",
                );
                appendNews("reactor.");
                story += "&r";
              } else {
                appendNews(
                  "  The Liberal Crime Squad brought the reactor to the verge of a nuclear meltdown, ",
                );
                appendNews(
                  "demonstrating the extreme vulnerability and danger of Nuclear Power Plants. ",
                );
                story += "&r";
              }
            }
          }
          if (did(Drama.openedPoliceLockup)) {
            if (!liberalguardian) {
              appendNews("  According to sources that were at the scene, ");
              appendNews(
                "the Liberal Crime Squad allegedly freed or attempted to free prisoners from the police lockup.",
              );
              story += "&r";
            } else {
              appendNews(
                "  The Liberal Crime Squad attempted to rescue innocent people from the police lockup, ",
              );
              appendNews(
                "saving them from torture and brutality at the hands of Conservative police interrogators.",
              );
              story += "&r";
            }
          }
          if (did(Drama.bankVaultRobbery)) {
            if (!liberalguardian) {
              appendNews("  According to sources that were at the scene, ");
              appendNews(
                "the Liberal Crime Squad opened the bank vault, which held more than \$100,000 at the time.",
              );
              story += "&r";
            } else {
              appendNews("  The Liberal Crime Squad opened the bank vault, ");
              appendNews(
                "showing the triumph of Liberal ideals over Conservative economics.",
              );
              story += "&r";
            }
          } else if (did(Drama.bankStickup)) {
            if (!liberalguardian) {
              appendNews("  According to sources that were at the scene, ");
              appendNews(
                "the Liberal Crime Squad threatened innocent bystanders in order to rob the bank vault.",
              );
              story += "&r";
            } else {
              appendNews(
                "  The Liberal Crime Squad demanded access to the bank vault, ",
              );
              appendNews("hoping to acquire the resources to overcome evil.");
              story += "&r";
            }
          }
          if (did(Drama.openedCourthouseLockup)) {
            if (!liberalguardian) {
              appendNews("  According to sources that were at the scene, ");
              appendNews(
                "the Liberal Crime Squad allegedly freed or attempted to free prisoners from the courthouse lockup.",
              );
              story += "&r";
            } else {
              appendNews(
                "  The Liberal Crime Squad attempted to rescue innocent people from the courthouse lockup, ",
              );
              appendNews(
                "saving them from the highly corrupt Conservative justice system.",
              );
              story += "&r";
            }
          }
          if (did(Drama.releasedPrisoners)) {
            if (!liberalguardian) {
              appendNews("  According to sources that were at the scene, ");
              appendNews(
                "the Liberal Crime Squad allegedly freed prisoners while in the facility.",
              );
              story += "&r";
            } else {
              appendNews(
                "  The Liberal Crime Squad attempted to rescue innocent people from the abusive Conservative conditions ",
              );
              appendNews("at the prison.");
              story += "&r";
            }
          }
          if (did(Drama.juryTampering)) {
            if (!liberalguardian) {
              appendNews(
                "  According to police sources that were at the scene, ",
              );
              appendNews(
                "the Liberal Crime Squad allegedly violated the sacred ",
              );
              appendNews("trust and attempted to influence a jury.");
              story += "&r";
            } else {
              appendNews(
                "  The Liberal Crime Squad has apologized over reports that the operation ",
              );
              appendNews("may have interfered with jury deliberations.");
              story += "&r";
            }
          }
          if (did(Drama.hackedIntelSupercomputer)) {
            if (!liberalguardian) {
              appendNews(
                "  According to police sources that were at the scene, ",
              );
              appendNews(
                "intelligence officials seemed very nervous about something.",
              );
              story += "&r";
            } else {
              appendNews(
                "  Liberal Crime Squad computer specialists worked to liberate information from CIA computers.",
              );
              story += "&r";
            }
          }
          if (did(Drama.openedArmory)) {
            if (!liberalguardian) {
              appendNews("  According to sources, ");
              appendNews(
                "the Liberal Crime Squad attempted to break into the armory.",
              );
              story += "&r";
            } else {
              appendNews(
                "  Liberal Crime Squad infiltration specialists worked to liberate weapons from the oppressors.",
              );
              story += "&r";
            }
          }
          if (did(Drama.openedCEOSafe)) {
            if (!liberalguardian) {
              appendNews(
                "  According to police sources that were at the scene, ",
              );
              appendNews(
                "the owner of the house seemed very frantic about some missing property.",
              );
              story += "&r";
            } else {
              appendNews(
                "  The Liberal Crime Squad was attempting to uncover the CEO's Conservative corruption.",
              );
              story += "&r";
            }
          }
          if (did(Drama.stoleCorpFiles)) {
            if (!liberalguardian) {
              appendNews(
                "  According to police sources that were at the scene, ",
              );
              appendNews(
                "executives on the scene seemed very nervous about something.",
              );
              story += "&r";
            } else {
              appendNews(
                "  The Liberal Crime Squad was attempting to uncover the company's Conservative corruption.",
              );
              story += "&r";
            }
          }
          if (did(Drama.hijackedBroadcast)) {
            if (!liberalguardian) {
              appendNews(
                "  The Liberal Crime Squad hijacked a news broadcast, ",
              );
              appendNews("interrupting regular programming.");
              story += "&r";
            } else {
              appendNews(
                "  The Liberal Crime Squad delivered its message to the masses today.",
              );
              story += "&r";
            }
          }

          if (ns.publicationAlignment == DeepAlignment.eliteLiberal && !ccs) {
            if (did(Drama.killedSomebody)) typesum--;
          }

          if (typesum > 0) {
            if (!ccs) {
              if (!liberalguardian) {
                appendNews(
                  "  Further details are sketchy, but police sources suggest that the LCS ",
                );
                appendNews("engaged in ");
              } else {
                appendNews("  The Liberal Crime Squad ");
              }
            } else {
              appendNews(
                "  Further details are sketchy, but police sources suggest that the CCS ",
              );
              appendNews("engaged in ");
            }
            debugPrint("typesum: $typesum");
            void addDrama(String drama, [String? alt]) {
              if (!liberalguardian || ccs) {
                story += LcsI18n.tr(drama);
              } else {
                story += LcsI18n.tr(alt ?? drama);
              }
              if (typesum >= 3) {
                story += ", ";
              } else if (typesum == 2) {
                if (drama.contains(" and ") ||
                    (ns.publicationAlignment == DeepAlignment.eliteLiberal &&
                        !ccs)) {
                  story += LcsI18n.tr(", and ");
                } else {
                  story += LcsI18n.tr(" and ");
                }
              }
              typesum--;
            }

            if (did(Drama.arson)) {
              addDrama("arson", "set fire to Conservative property");
            }
            if (did(Drama.killedSomebody) && (!liberalguardian || ccs)) {
              addDrama("murder");
            }
            if (did(Drama.attacked)) {
              addDrama(
                "violence",
                "engaged in combat with Conservative forces",
              );
            }
            if (did(Drama.stoleSomething) || did(Drama.bankTellerRobbery)) {
              addDrama("theft", "liberated enemy resources");
            }
            if (did(Drama.freeRabbits) || did(Drama.freeMonsters)) {
              addDrama(
                "tampering with lab animals",
                "liberated abused animals",
              );
            }
            if (did(Drama.brokeSweatshopEquipment) ||
                did(Drama.brokeFactoryEquipment) ||
                did(Drama.vandalism)) {
              addDrama(
                "destruction of private property",
                "damaged enemy infrastructure",
              );
            }
            if (did(Drama.tagging)) {
              addDrama("vandalism", "marked the site for Liberation");
            }
            if (did(Drama.brokeDownDoor)) {
              addDrama("breaking and entering", "broke down doors");
            }
            if (did(Drama.unlockedDoor)) {
              addDrama("unlawful entry", "picked locks");
            }
            if (did(Drama.musicalRampage)) {
              addDrama("a musical rampage", "performed an impromptu concert");
            }
            if (did(Drama.openedNursingHomeSafe)) {
              addDrama(
                "accessed private documents",
                "uncovered evidence of elder abuse",
              );
            }
            if (did(Drama.openedInsuranceSafe)) {
              addDrama(
                "accessed private documents",
                "uncovered evidence of insurance fraud",
              );
            }

            story +=
                "."
                "&r";
          }

          if (did(Drama.carChase)) {
            if (!liberalguardian || ccs) {
              appendNews("  It is known that there was a high-speed chase ");
              appendNews("following the incident.  ");
            } else {
              appendNews("  Conservative operatives engaged in a reckless ");
              appendNews("pursuit of the LCS.  ");
            }

            if (did(Drama.carCrash)) {
              if (drama[Drama.carCrash]! > 1) {
                story += LcsI18n.processString("{count} vehicles crashed.  ", {
                  "count": drama[Drama.carCrash].toString(),
                });
              } else {
                appendNews("One vehicle crashed.  ");
              }
              if (!liberalguardian || ccs) {
                appendNews("Details about injuries were not released.  ");
              }
            }

            if (did(Drama.footChase)) {
              if (!liberalguardian || ccs) {
                appendNews(
                  "There was also a foot chase when the suspect or suspects bailed out after the high-speed pursuit.  ",
                );
              } else {
                appendNews(
                  "The Liberal Crime Squad ended the dangerous high-speed chase in order to protect the public, and attempted to escape on foot.  ",
                );
              }
            }
            story += "&r";
          }

          String culprit = ccs ? "CCS" : "LCS";
          if (ns.publicationAlignment == DeepAlignment.archConservative) {
            if (ns.type == NewsStories.squadKilledInSiteAction) {
              appendNews(
                "  A prominent gun advocacy group remarked that it was only ",
              );
              appendNews(
                "thanks to the bravery of people carrying guns that this ",
              );
              appendNews(
                "didn't turn out worse, and those who stood by and did nothing ",
              );
              appendNews(
                "were just as guilty as the ones who committed the crime.&r",
              );
            } else {
              if (ccs) {
                appendNews(
                  "  A prominent gun advocacy group noted that increased ",
                );
                appendNews(
                  "gun ownership would help to bring violence like this to ",
                );
                appendNews("an end.&r");
              } else {
                appendNews(
                  "  A prominent gun advocacy group noted that it was ",
                );
                appendNews(
                  "unfortunate that there weren't more armed citizens in ",
                );
                appendNews("the area to stop this from happening.&r");
              }
            }
          } else if (did(Drama.legalGunUsed)) {
            story += LcsI18n.processString(
              "  The {culprit} was seen to use firearms that are commonly sold in the state.&r",
              {"culprit": culprit},
            );
          } else if (did(Drama.illegalGunUsed)) {
            story += LcsI18n.processString(
              "  The {culprit} was seen to use firearms that are illegal for civilians to own in this state.&r",
              {"culprit": culprit},
            );
          }

          if (!ccs) {
            if (oneIn(8)) {
              if (did(Drama.tagging)) {
                story += LcsI18n.processString(
                  '  The slogan, "{slogan}" was found painted on the walls.',
                  {"slogan": slogan},
                );
              } else {
                switch (lcsRandom(3)) {
                  case 0:
                    if (ns.type == NewsStories.squadKilledInSiteAction) {
                      story += LcsI18n.processString(
                        '  One uttered the words, "{slogan}" before passing out.',
                        {"slogan": slogan},
                      );
                    } else {
                      story += LcsI18n.processString(
                        '  As they left, they shouted, "{slogan}"',
                        {"slogan": slogan},
                      );
                    }
                  case 1:
                    story += LcsI18n.processString(
                      '  One of them was rumored to have cried out, "{slogan}"',
                      {"slogan": slogan},
                    );
                  case 2:
                    story += LcsI18n.processString(
                      '  Witnesses reported hearing the phrase, "{slogan}"',
                      {"slogan": slogan},
                    );
                }
              }
              story += "&r";
            }
          }
      }

      story += generateFiller(200);
      displayNewsStory(story, storyXStart, storyXEnd, y, ns);

      if (ns.type == NewsStories.ccsSiteAction ||
          ns.type == NewsStories.ccsKilledInSiteAction) {
        ccsInPublicEye = true;
      } else if (!lcsInPublicEye) {
        lcsInPublicEye = true;
      }

    case NewsStories.massacre:
      int y = 3;
      if (ns.page == 1) {
        y = 19;
        if (ns.siegetype == SiegeType.ccs) {
          displayCenteredNewsFont("CCS MASSACRE", 5, ns);
        } else if (!liberalguardian) {
          displayCenteredNewsFont("MYSTERIOUS", 5, ns);
          displayCenteredNewsFont("MASSACRE", 10, ns);
        } else {
          displayCenteredNewsFont("CONSERVATIVE", 5, ns);
          displayCenteredNewsFont("MASSACRE", 10, ns);
        }
      }

      story = city;
      story += " - ";
      if (ns.siegebodycount > 2) {
        story += LcsI18n.processString("{count} bodies were ", {
          "count": ns.siegebodycount.toString(),
        });
      } else if (ns.siegebodycount > 1) {
        appendNews("Two bodies were ");
      } else {
        appendNews("A body was ");
      }
      story += LcsI18n.processString(" found in the {location} yesterday.", {
        "location": ns.loc!.name,
      });
      if (!liberalguardian) {
        appendNews("  According to a spokesperson for ");
        appendNews(
          "the police department, the matter is under investigation as a homicide.",
        );
        story += "&r";
        appendNews(
          "  Privately, sources in the department confide that there aren't any leads.  ",
        );
        appendNews('According to one person familiar with the case, "');
      } else {
        appendNews(
          "  The police have opened an investigation into the massacre, but seem ",
        );
        appendNews("unwilling to pursue the case with any serious effort.");
        story += "&r";
        appendNews("  The Liberal Crime Squad has claimed that the ");
        if (ns.siegebodycount > 1) {
          appendNews("victims were members ");
        } else {
          appendNews("victim was a member ");
        }
        appendNews(
          "of the LCS targeted simply due to their political beliefs.  ",
        );
        appendNews('According to an LCS spokesperson, "');
      }
      switch (ns.siegetype) {
        case SiegeType.none:
          appendNews(
            "We have no idea who did this, or why, or how it happened.  ",
          );
          appendNews("It's a complete mystery.  A bug in the game even.  ");
          appendNews(
            "We're working closely with the programmers to find out what happened.\"",
          );
        case SiegeType.cia:
          if (!liberalguardian) {
            if (ns.siegebodycount > 1) {
              appendNews("The bodies had no faces or ");
            } else {
              appendNews("The body had no face or ");
            }
            appendNews("fingerprints.  Like, it was all smooth.  ");
            if (noProfanity) {
              appendNews("[Strangest] thing I've ever seen");
            } else if (laws[Law.freeSpeech] == DeepAlignment.eliteLiberal) {
              appendNews("Damnedest thing I've ever seen");
            } else {
              appendNews("D*mnd*st thing I've ever seen");
            }
          } else {
            appendNews(
              "We have strong evidence that this was an extra-judicial slaughter ",
            );
            appendNews(
              "carried out by the Central Intelligence Agency in retaliation for our ",
            );
            appendNews(
              "previous actions to uncover human rights abuses and corruption in the ",
            );
            appendNews("intelligence community");
          }
        case SiegeType.police:
          if (!liberalguardian) {
            appendNews("It's just a gang-related incident.  ");
            appendNews("You know, the usual.  ");
            appendNews(
              "Some people just don't know how to live in a civilized society",
            );
          } else {
            appendNews(
              "It was the cops.  They'll say otherwise, but we know the truth.  ",
            );
            appendNews(
              "There is no excusing this kind of brutality.  We will not rest until ",
            );
            appendNews(
              "this kind of government-condoned violence is stopped.  We will not be ",
            );
            appendNews("intimidated, and we will not be silenced");
          }
        case SiegeType.angryRuralMob:
          if (!liberalguardian) {
            appendNews(
              "...  stabbed with, maybe, pitchforks.  There may have ",
            );
            appendNews(
              "been bite marks.  Nothing recognizable left.  Complete carnage.",
            );
          } else {
            appendNews(
              "We have reason to believe that this brutal massacre was ",
            );
            appendNews(
              "inspired by the Conservative media's brainwashing propaganda",
            );
          }
        case SiegeType.corporateMercs:
          if (!liberalguardian) {
            appendNews(
              "It was execution style.  Professional.  We've got nothing",
            );
          } else {
            appendNews(
              "This massacre has the signature mark of a group of mercenaries ",
            );
            appendNews(
              "known to work with several corporations we've had confrontations ",
            );
            appendNews(
              "with in the past.  *When* the police can't figure this one out, they're ",
            );
            appendNews("just covering it up");
          }
        case SiegeType.medicalDebtCollectors:
          if (!liberalguardian) {
            appendNews(
              "The victims were all found to have overdosed on drugs. ",
            );
            appendNews(
              "And there were bullet holes everywhere. The building was ",
            );
            appendNews(
              "more chewed up than the victims. Our lead theory is that ",
            );
            appendNews("they did it to themselves, but who knows?");
          } else {
            appendNews(
              "This was carried out by debt collectors for the medical ",
            );
            appendNews(
              "industry. They'll say otherwise, but we know the truth. ",
            );
            appendNews(
              "The sooner we can move to a single payer system, the better.",
            );
          }
        case SiegeType.ccs:
          if (!liberalguardian) {
            appendNews(
              "Look, it was a Conservative Crime Squad hit, that's all we know, ",
            );
            appendNews("no names, no faces, not even where it happened really");
          } else {
            appendNews(
              "This is the doing of the Conservative Crime Squad butchers.  ",
            );
            appendNews("They have to be stopped before they kill again");
          }
      }
      story += ".\"  ";
      story += "&r";

      story += generateFiller(200);
      displayNewsStory(story, storyXStart, storyXEnd, y, ns);
    case NewsStories.kidnapReport:
      int y = 2;

      if (ns.page == 1) {
        y = 19;
        if (liberalguardian) {
          displayCenteredNewsFont("LCS DENIES", 5, ns);
          displayCenteredNewsFont("KIDNAPPING", 10, ns);
        } else {
          switch (ns.cr!.type.id) {
            case CreatureTypeIds.president:
              displayCenteredNewsFont("PRESIDENT", 5, ns);
              displayCenteredNewsFont("KIDNAPPED", 10, ns);
              // Instantly bring a max military siege to the site
              if (ns.cr!.typeId == CreatureTypeIds.president) {
                ns.cr!.heat += 1000;
                ns.cr!.site?.heat += 1000 + lcsRandom(1000);
                ns.cr!.site?.siege.timeUntilCops = lcsRandom(3) + 1;
                ns.cr!.site?.siege.escalationState = SiegeEscalation.bombers;
              }
            case CreatureTypeIds.corporateCEO:
              displayCenteredNewsFont("CEO", 5, ns);
              displayCenteredNewsFont("KIDNAPPED", 10, ns);
            case CreatureTypeIds.radioPersonality:
              displayCenteredNewsFont("RADIO HOST", 5, ns);
              displayCenteredNewsFont("KIDNAPPED", 10, ns);
            case CreatureTypeIds.newsAnchor:
              displayCenteredNewsFont("NEWS ANCHOR", 5, ns);
              displayCenteredNewsFont("KIDNAPPED", 10, ns);
            case CreatureTypeIds.eminentScientist:
              displayCenteredNewsFont("SCIENTIST", 5, ns);
              displayCenteredNewsFont("KIDNAPPED", 10, ns);
            case CreatureTypeIds.liberalJudge:
            case CreatureTypeIds.conservativeJudge:
              displayCenteredNewsFont("JUDGE", 5, ns);
              displayCenteredNewsFont("KIDNAPPED", 10, ns);
            case CreatureTypeIds.policeChief:
              displayCenteredNewsFont("POLICE CHIEF", 5, ns);
              displayCenteredNewsFont("KIDNAPPED", 10, ns);
            case CreatureTypeIds.cop:
            case CreatureTypeIds.gangUnit:
              displayCenteredNewsFont("POLICE", 5, ns);
              displayCenteredNewsFont("KIDNAPPED", 10, ns);
            case CreatureTypeIds.deathSquad:
              displayCenteredNewsFont("DEATH COP", 5, ns);
              displayCenteredNewsFont("KIDNAPPED", 10, ns);
            case CreatureTypeIds.actor:
              displayCenteredNewsFont("ACTOR", 5, ns);
              displayCenteredNewsFont("KIDNAPPED", 10, ns);
            default:
              displayCenteredNewsFont("SUSPECTED", 5, ns);
              displayCenteredNewsFont("KIDNAPPING", 10, ns);
          }
        }
      }

      final lastKnownLocationText = LcsI18n.processString(
        "  According to sources, {name}'s last known location was the {location}.  Police were seen searching the surrounding area yesterday.",
        {"name": ns.cr!.properName, "location": ns.cr!.workLocation.name},
      );
      final kidnappingLead = LcsI18n.processString(
        "{city} - The disappearance of {name} is now considered a kidnapping, according to a police spokesperson.",
        {"city": city, "name": ns.cr!.properName},
      );
      final kidnappingStatement = LcsI18n.processString(
        '  {spokesperson}, speaking on behalf of the police department, stated "We now believe that {name} was taken {days} days ago, by a person or persons as yet undetermined.  We have several leads and are confident that we will bring {name} back home and bring the kidnappers to justice.  As the investigation is ongoing, I cannot be more specific at this time.  To the citizens, please contact the department if you have any additional information."',
        {
          "spokesperson": generateFullName(Gender.maleBias).firstLast,
          "name": ns.cr!.properName,
          "days": ns.cr!.daysSinceJoined - 1,
        },
      );
      story = (StringBuffer(
        [kidnappingLead, kidnappingStatement, lastKnownLocationText].join("&r"),
      )..write("&r")).toString();

      story += generateFiller(200);
      displayNewsStory(story, storyXStart, storyXEnd, y, ns);

    default:
      story = LcsI18n.tr(
        "The news is not yet written. Report this as a bug.&r",
      );
      displayNewsStory(story, storyXStart, storyXEnd, 3, ns);
  }

  int c;
  do {
    c = await getKey();
  } while (!isBackKey(c));
}

void displayCenteredNewsFont(
  String str,
  int y,
  NewsStory ns, {
  bool? useBigFont,
  bool noTranslate = false,
}) {
  if (!noTranslate) {
    str = LcsI18n.tr(str);
  }
  if (ns.headline == "") {
    ns.headline = str;
  } else {
    ns.headline = LcsI18n.processString("{headline} {str}", {
      "headline": ns.headline,
      "str": str,
    });
  }
  int width = -1;
  int s;
  bool isLetter(String letter) =>
      letter.codePoint >= 'A'.codePoint && letter.codePoint <= 'Z'.codePoint;
  for (s = 0; s < str.length; s++) {
    if (isLetter(str[s].toUpperCase())) {
      width += 6;
    } else if (str[s] == '\'') {
      width += 4;
    } else {
      width += 3;
    }
  }

  Map<String, List<List<int>>>? newsFont;
  if (useBigFont != true) {
    width = newsFontTextWidth(str, letters5x5);
    newsFont = letters5x5;
    if (width > 78) {
      final compactWidth = newsFontTextWidth(str, letters4x5);
      if (compactWidth <= 78) {
        width = compactWidth;
        newsFont = letters4x5;
      } else {
        width = newsFontTextWidth(str, letters3x5);
        newsFont = letters3x5;
      }
    }
    if (width > 78) {
      str = fitNewsTextToWidth(str, newsFont, 78);
      width = newsFontTextWidth(str, newsFont);
    }
  }

  int x = max(0, 39 - width ~/ 2);

  if (useBigFont == true) {
    for (s = 0; s < str.length; s++) {
      if (isLetter(str[s]) || str[s] == '\'') {
        int p;
        if (isLetter(str[s])) {
          p = str[s].codePoint - 'A'.codePoint;
        } else {
          p = 26;
        }
        int lim = 6;
        if (str[s] == '\'') lim = 4;
        if (s == str.length - 1) lim--;
        for (int x2 = 0; x2 < lim; x2++) {
          for (int y2 = 0; y2 < 7; y2++) {
            move(y + y2, x + x2);
            if (x2 == 5) {
              setColor(
                ns.publication.backgroundColor,
                background: ns.publication.backgroundColor,
              );
              addchar(' ');
            } else {
              drawCPCGlyph(
                bigletters[p][x2][y2],
                remapLightGray: ns.publication.backgroundColor,
              );
            }
          }
        }
        refresh();
        x += lim;
      } else {
        setColor(
          ns.publication.backgroundColor,
          background: ns.publication.backgroundColor,
        );
        for (int x2 = 0; x2 < 3; x2++) {
          for (int y2 = 0; y2 < 7; y2++) {
            move(y + y2, x + x2);
            addchar(' ');
          }
        }
        x += 3;
      }
    }
  } else {
    // Keep long localized headlines readable within the 80-column console.
    setColor(black, background: ns.publication.backgroundColor);
    move(y, x);
    printNewsText(str, newsFont!);
  }
}

void displayCenteredSmallNews(String str, int y, NewsStory ns) {
  ns.body = str;
  int x = 39 - ((str.length - 1) >> 1);
  move(y, x);
  setColor(black, background: ns.publication.backgroundColor);
  addstr(str);
}

void displayNewsPicture(
  int p,
  int y,
  NewsStory ns, [
  bool remapSkinTones = false,
]) {
  ns.newspaperPhotoId = p;
  ns.remapSkinTones = remapSkinTones;
  renderNewsPic(p, y, remapSkinTones);
}

void renderNewsPic(int p, int y, [bool remapSkinTones = false]) {
  for (int x2 = 0; x2 < 78; x2++) {
    for (int y2 = 0; y2 < 15; y2++) {
      if (y + y2 > 24) break;
      move(y + y2, 1 + x2);
      drawCPCGlyph(newspic[p][x2][y2], remapSkinTones: remapSkinTones);
    }
  }
}

/* news - draws the specified block of text to the screen */
void displayNewsStory(
  String story,
  List<int> storyXStart,
  List<int> storyXEnd,
  int y,
  NewsStory? ns, [
  bool noTranslate = false,
]) {
  ns?.body = newsprintToWebFormat(story);
  List<String> text = [];
  List<bool> centered = [];

  List<String> paragraphs = story.split("&r");
  List<String> lines = [];
  for (String paragraph in paragraphs) {
    bool isCentered = paragraph.contains("&c");
    if (isCentered) {
      paragraph = paragraph.replaceAll("&c", "");
    }

    List<String> words = paragraph.split(" ");
    List<String> line = [];
    int lineLength = 0;
    for (String word in words) {
      int lineY = min(y + lines.length, storyXStart.length - 1);
      int span = storyXEnd[lineY] - storyXStart[lineY] + 1;
      if (lineLength + line.length + word.length + 1 > span) {
        int spacesNeeded = span - lineLength;
        while (spacesNeeded > 0) {
          for (int i = 0; i < line.length - 1; i++) {
            int remainingInLine = line.length - 1 - i;
            if (line[i] != " " &&
                (spacesNeeded > remainingInLine ||
                    lcsRandom(remainingInLine) <= spacesNeeded)) {
              line[i] += " ";
              spacesNeeded--;
              if (spacesNeeded == 0) break;
            }
          }
        }
        lines.add(line.join());
        centered.add(isCentered);
        line = [word];
        lineLength = word.length;
      } else {
        lineLength += word.length;
        line.add(word);
      }
    }
    lines.add(line.join(' '));
    centered.add(isCentered);
  }

  Color bgColor = (ns?.publication ?? Publication.times).backgroundColor;
  setColor(black, background: bgColor);
  for (int cury = y; cury < 25; cury++) {
    if (lines.isEmpty) break;
    if (lines.first.isEmpty) {
      lines.removeAt(0);
      centered.removeAt(0);
      continue;
    }
    lines.first.trim();
    if (centered.first) {
      move(
        cury,
        (storyXStart[cury] + storyXEnd[cury] - lines.first.length + 1) >> 1,
      );
    } else {
      move(cury, storyXStart[cury]);
    }
    // Story text is already translated and may contain inline color markers
    // from generated filler (for example, `&R{city}`). Parse those markers
    // instead of writing them as visible article text.
    addstrx(lines.first, noTranslate: true);
    lines.removeAt(0);
    centered.removeAt(0);
  }

  setColor(black, background: bgColor);
  for (int t = 0; t < text.length; t++) {
    if (y + t >= 25) break;
    if (text[t].endsWith(' ')) {
      // remove trailing space
      // (necessary for proper centering and to not overwrite borders around an ad)
      text[t] = text[t].substring(0, text[t].length - 2);
    }
    if (centered[t]) {
      move(
        y + t,
        (storyXStart[y + t] + storyXEnd[y + t] - text[t].length + 1) >> 1,
      );
    } else {
      mvaddstr(y + t, storyXStart[y + t], text[t]);
    }
  }
  text.clear();
}

void archiveNewsStory(NewsStory ns) {
  ns.date = gameState.date.copyWith();
  if (gameState.newsArchive.contains(ns)) return;
  gameState.newsArchive.add(ns);
  if (gameState.newsArchive.length > 51) {
    gameState.newsArchive.removeAt(0);
  }
}
