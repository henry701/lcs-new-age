import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/catalog_audit.dart';

void main() {
  group('i18n static coverage gate', () {
    late CatalogAuditResult audit;

    setUp(() {
      audit = auditArbCatalogs();
    });

    test('catalog files parse without malformed JSON', () {
      expect(
        audit.malformedFiles,
        isEmpty,
        reason: 'Malformed ARB files: ${audit.malformedFiles.join(", ")}',
      );
    });

    test('no duplicate keys across shard files per locale', () {
      expect(
        audit.duplicateKeys,
        isEmpty,
        reason:
            'Duplicate ARB keys: ${audit.duplicateKeys.take(20).join(", ")}',
      );
    });

    test('every source key exists in pt_BR', () {
      expect(
        audit.missingInTarget,
        equals(0),
        reason:
            'Missing pt_BR keys (${audit.missingKeys.length}): '
            '${audit.missingKeys.take(20).join(" | ")}',
      );
    });

    test('no empty pt_BR values for source keys', () {
      expect(
        audit.emptyInTarget,
        equals(0),
        reason: 'Empty pt_BR values: ${audit.emptyKeys.take(20).join(" | ")}',
      );
    });

    test('placeholder parity between en_US and pt_BR', () {
      expect(
        audit.placeholderMismatches,
        isEmpty,
        reason: _formatPlaceholderMismatches(audit.placeholderMismatches),
      );
    });

    test('translated control prefixes remain unchanged', () {
      expect(
        audit.prefixMismatches,
        isEmpty,
        reason: audit.prefixMismatches
            .map(
              (mismatch) =>
                  '${mismatch.key}: expected ${mismatch.sourcePrefix}, '
                  'found ${mismatch.targetPrefix}',
            )
            .join('\n'),
      );
    });

    test('pt_BR catalog values do not contain raw Dart interpolation', () {
      expect(
        audit.rawInterpolationInTarget,
        isEmpty,
        reason: _formatInterpolationIssues(audit.rawInterpolationInTarget),
      );
    });

    test(
      'i18n invariants always hold (missing/empty/placeholders/interp/dupes clean)',
      () {
        expect(audit.missingInTarget, equals(0));
        expect(audit.emptyInTarget, equals(0));
        expect(audit.placeholderMismatches, isEmpty);
        expect(audit.rawInterpolationInTarget, isEmpty);
        expect(audit.duplicateKeys, isEmpty);
        expect(audit.malformedFiles, isEmpty);
      },
    );

    test('lib source has no raw interpolated possessive strings', () {
      final offenders = Directory('lib')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .where((file) => !file.path.endsWith('.g.dart'))
          .expand((file) sync* {
            final lines = file.readAsLinesSync();
            final pattern = RegExp(r"""(?:\$\{[^}]+\}|\$[A-Za-z_][\w.]*)\'s""");
            for (var i = 0; i < lines.length; i++) {
              if (pattern.hasMatch(lines[i])) {
                yield '${file.path}:${i + 1}: ${lines[i].trim()}';
              }
            }
          })
          .toList();

      expect(offenders, isEmpty, reason: offenders.take(20).join('\n'));
    });

    test('lib source has no possessive helper fragments', () {
      final offenders = Directory('lib')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .where((file) => !file.path.endsWith('.g.dart'))
          .where((file) => file.readAsStringSync().contains("_possessive("))
          .map((file) => file.path)
          .toList();

      expect(offenders, isEmpty, reason: offenders.join('\n'));
    });

    test(
      'site names are assigned from full templates, not appended fragments',
      () {
        final source = File('lib/location/site.dart').readAsStringSync();
        expect(source, isNot(contains('loc.name +=')));
        expect(source, isNot(contains('loc.name = "\$')));
      },
    );

    test('daily trouble activity messages are full actor templates', () {
      final source = File(
        'lib/daily/activities/trouble.dart',
      ).readAsStringSync();
      expect(source, isNot(contains('message +=')));
      expect(source, isNot(contains('{prefix}')));
    });

    test('flag creation messages are complete actor templates', () {
      final source = File(
        'lib/daily/activities/flag_creation.dart',
      ).readAsStringSync();
      expect(source, isNot(contains(r'${cr.name}')));
      expect(source, isNot(contains(r'${flag.name}')));
      expect(source, contains('"{name} sewed a {flag}."'));
      expect(source, contains('params: {"name": cr.name, "flag": flag.name}'));
    });

    test('daily activity and flag prompts use complete templates', () {
      final advanceDay = File('lib/daily/advance_day.dart').readAsStringSync();
      final flag = File('lib/basemode/flag.dart').readAsStringSync();
      expect(advanceDay, isNot(contains(r'logBlindEvent("${p.name}')));
      expect(advanceDay, isNot(contains(r'"${p.name} has been discharged')));
      expect(advanceDay, contains('"{name} has been discharged from {site}."'));
      expect(advanceDay, contains('showAdvanceDayMessage('));
      expect(
        advanceDay,
        contains(
          'showAdvanceDayMessage(\n'
          '          8,\n'
          '          1,\n'
          '          white,\n'
          '          "{name}\'s injuries require professional treatment.",',
        ),
      );
      expect(flag, isNot(contains(r'${loc.getName(short: true)}')));
      expect(flag, contains('"Change the flag flying over the {site}:"'));
      expect(flag, contains('"Fly a flag over the {site}:"'));
    });

    test('recruitment options use complete grammar variants', () {
      final source = File('lib/daily/recruitment.dart').readAsStringSync();
      expect(source, isNot(contains('articlePart')));
      expect(source, isNot(contains('recruitmentText +=')));
      expect(source, contains('mvaddstr(\n            y++,\n            0,'));
      expect(
        source,
        contains(r'"A - Spend \$50 on props and a book for them to keep."'),
      );
      expect(
        source,
        contains(r'"A - Spend \$50 on props and an e-book for them to keep."'),
      );
      expect(source, contains('"C - {recruit} joins the LCS."'));
      expect(
        source,
        contains('"C - {recruiter} needs more Juice to recruit."'),
      );
      expect(source, contains('"C - {recruit} isn\'t ready to join the LCS."'));
    });

    test('corrupt-save restart prompt names the game explicitly', () {
      final source = File('lib/l10n/app_pt_BR_part13.arb').readAsStringSync();
      expect(
        source,
        contains(
          'Pressione qualquer tecla para reiniciar o jogo após esta interrupção Conservadora.',
        ),
      );
    });

    test('regular activity footer uses complete actor templates', () {
      final source = File(
        'lib/basemode/activate_regulars.dart',
      ).readAsStringSync();
      expect(source, isNot(contains(r'"${cr.name} will')));
      expect(source, contains('"{name} will act with their squad."'));
      expect(source, contains('"{name} will independently study {skill}."'));
      expect(source, contains('activityMessage, noTranslate: true'));
      expect(source, contains('eraseLine(22);'));
      expect(source, contains('eraseLine(23);'));
      expect(source, contains('eraseLine(24);'));
      expect(source, contains('if (!isTeaching)'));
    });

    test('business-front names are complete templates', () {
      final source = File(
        'lib/basemode/invest_in_location.dart',
      ).readAsStringSync();
      expect(source, isNot(contains(r'"$first')));
      expect(source, isNot(contains(r'"$first & $second')));
      expect(source, contains('"{first} & {second} Accounts"'));
      expect(source, contains('LcsI18n.processString(longTemplate'));
      expect(
        source,
        contains('LcsI18n.tr("Fortify the compound for a siege")'),
      );
    });

    test('vehicle choice labels are complete templates', () {
      final source = File('lib/daily/shopsnstuff.dart').readAsStringSync();
      expect(source, isNot(contains(r'"${vt.longName}')));
      expect(source, contains('"{vehicle} ({price})"'));
      expect(source, contains('LcsI18n.processString'));
    });

    test('dynamic activity descriptions are rendered before display', () {
      final activity = File('lib/basemode/activities.dart').readAsStringSync();
      final creatureInfo = File(
        'lib/common_display/print_creature_info.dart',
      ).readAsStringSync();
      expect(activity, isNot(contains(r'"Tending to ${')));
      expect(activity, isNot(contains(r'"Making ${')));
      expect(activity, contains('"Tending to {creature}"'));
      expect(activity, contains('"Practice {skill}"'));
      expect(creatureInfo, contains('noTranslate: true'));
    });

    test('kidnap guard messages use complete templates', () {
      final source = File('lib/sitemode/haul_kidnap.dart').readAsStringSync();
      expect(source, isNot(contains(r'"${guard.name}')));
      expect(source, isNot(contains(r'${target.name}')));
      expect(source, contains('"{guard} stays close to {target}'));
      expect(source, contains('"Try to take {target} anyway?'));
      expect(source, contains('"phrase": LcsI18n.tr(phrase)'));
      expect(source, contains('LcsI18n.tr(cr.type.name)'));
    });

    test('sleeper leak descriptions translate before insertion', () {
      final source = File('lib/monthly/sleeper_update.dart').readAsStringSync();
      expect(source, contains('"description": LcsI18n.tr(description)'));
      expect(source, contains('LcsI18n.tr(e.type.name)'));
    });

    test('creature type names translate before template insertion', () {
      final sitemode = File('lib/sitemode/sitemode.dart').readAsStringSync();
      final recruitment = File('lib/daily/recruitment.dart').readAsStringSync();
      final creatureInfo = File(
        'lib/common_display/print_creature_info.dart',
      ).readAsStringSync();
      final sleeperJoin = File(
        'lib/daily/activities/sleeper_join_lcs.dart',
      ).readAsStringSync();
      expect(sitemode, contains('LcsI18n.tr(conservative.type.name)'));
      expect(sitemode, isNot(contains('"type": conservative.type.name')));
      expect(recruitment, contains('LcsI18n.tr(r.recruit.type.name)'));
      expect(recruitment, contains('LcsI18n.tr("via video chat.")'));
      expect(creatureInfo, contains('LcsI18n.tr(cr.type.name)'));
      expect(sleeperJoin, contains('LcsI18n.tr(location.name)'));
    });

    test('crime labels translate before template insertion', () {
      final mapSpecials = File(
        'lib/sitemode/map_specials.dart',
      ).readAsStringSync();
      final creatureInfo = File(
        'lib/common_display/print_creature_info.dart',
      ).readAsStringSync();
      final siege = File('lib/daily/siege.dart').readAsStringSync();
      expect(mapSpecials, contains('"crime": LcsI18n.tr(crime)'));
      expect(creatureInfo, contains('LcsI18n.tr(crime.chargedWith)'));
      expect(siege, contains('?.chargedWith'));
      expect(siege, contains('LcsI18n.tr('));
    });

    test('car theft messages do not append weapon fragments', () {
      final source = File(
        'lib/daily/activities/car_theft.dart',
      ).readAsStringSync();
      expect(source, isNot(contains(r'" with a ${cr.weapon')));
      expect(source, isNot(contains('smashes the window{weapon}')));
      expect(source, contains('smashes the window with a {weapon}.'));
      expect(source, contains('final breakInMessage = LcsI18n.tr('));
      expect(source, contains('final securityFailure = LcsI18n.tr('));
      expect(source, contains('LcsI18n.tr(location)'));
      expect(source, contains('What type of car will {name} try to find'));
    });

    test('dating name lists use locale-controlled templates', () {
      final source = File('lib/daily/dating.dart').readAsStringSync();
      expect(source, isNot(contains(r'"${styledNames[0]}')));
      expect(source, isNot(contains(r'"$leadingNames')));
      expect(source, contains('"{first} and {second}"'));
      expect(source, contains('"{leading}, and {last}"'));
    });

    test('squad vehicle choices use complete templates', () {
      final source = File('lib/basemode/base_actions.dart').readAsStringSync();
      expect(source, isNot(contains(r'${driver ?')));
      expect(source, isNot(contains(r'" in Spot ${')));
      expect(
        source,
        contains('"Choose squad member to replace {name} in Spot {spot}"'),
      );
      expect(source, contains('addOptionTextFitted('));
      expect(source, contains('x += 40;'));
    });

    test('visit activity descriptions localize known site names', () {
      final source = File('lib/basemode/activities.dart').readAsStringSync();
      expect(source, contains('LcsI18n.hasTranslation(site.name)'));
      expect(source, contains('LcsI18n.tr(site.name)'));
      expect(source, contains('site.type == SiteType.pawnShop'));
      expect(source, contains('site.getName(short: true)'));
    });

    test('regular activity menus use whole labels and templates', () {
      final source = File(
        'lib/basemode/activate_regulars.dart',
      ).readAsStringSync();
      expect(source, isNot(contains(r'"4 - Hacking$needHackerDen"')));
      expect(
        source,
        isNot(contains(r'"6 - Stream Guardian TV$needVideoRoom"')),
      );
      expect(source, isNot(contains(r'"Which will ${cr.name}')));
      expect(source, contains('"Which will {name} try to make?'));
    });

    test('age and gender summaries use complete templates', () {
      final source = File(
        'lib/common_display/print_creature_info.dart',
      ).readAsStringSync();
      expect(source, isNot(contains(r'"${person.age')));
      expect(source, isNot(contains(r'"($age,')));
      expect(source, contains('"({age}, {gender})"'));
      expect(source, contains('"({age}, {gender}, Trans)"'));
    });

    test('base flag labels do not append a price fragment', () {
      final source = File('lib/basemode/base_mode.dart').readAsStringSync();
      expect(source, isNot(contains(r'"P - Pride: Switch flags $price"')));
      expect(source, isNot(contains(r'"P - Pride: Fly a flag here $price"')));
      expect(source, contains(r'"P - Pride: Switch flags (\$20)"'));
    });

    test('combat attack announcements are single full templates', () {
      final source = File('lib/sitemode/fight.dart').readAsStringSync();
      expect(source, isNot(contains('mvaddstr(9, 1, "{name} "')));
      expect(source, isNot(contains('addstr(" with a {weapon}"')));
      expect(source, isNot(contains('str += "{name}')));
      expect(source, contains('{attacker} {action} {target}!'));
      expect(source, contains('{attacker} {action} {target} with a {weapon}!'));
    });

    test('remaining menu counters and rendered names use templates', () {
      final regulars = File(
        'lib/basemode/activate_regulars.dart',
      ).readAsStringSync();
      final siteMode = File('lib/sitemode/sitemode.dart').readAsStringSync();
      final agenda = File(
        'lib/basemode/liberal_agenda.dart',
      ).readAsStringSync();
      final review = File('lib/basemode/review_mode.dart').readAsStringSync();

      expect(regulars, contains('" ({current}/{total})"'));
      expect(siteMode, contains('" ({current}/{total})"'));
      expect(agenda, contains('fitConsoleText(renderedIssue, 61)'));
      expect(agenda, contains('LcsI18n.tr(issue)'));
      expect(review, contains('LcsI18n.processString("{name}"'));
      expect(review, contains('noTranslate: true'));
    });

    test('bank teller reactions are full sentence templates', () {
      final source = File(
        'lib/talk/talk_outside_combat.dart',
      ).readAsStringSync();
      expect(source, isNot(contains('addstr("gestures, "')));
      expect(source, isNot(contains('addstr("nods calmly, "')));
      expect(
        source,
        contains(
          'The bank teller reads the note, {reaction}, and dives for cover',
        ),
      );
      expect(
        source,
        contains(
          'The bank teller reads the note, {reaction}, and slips several bricks',
        ),
      );
      expect(source, isNot(contains('whileNaked')));
      expect(source, contains('A - Quietly pass the teller a robbery note.'));
      expect(
        source,
        contains('A - Quietly pass the teller a robbery note while naked.'),
      );
    });

    test('high score endings include the date in each full template', () {
      final source = File(
        'lib/title_screen/high_scores.dart',
      ).readAsStringSync();
      expect(source, isNot(contains('liberalized the country in "')));
      expect(source, contains('liberalized the country in {month} {year}.'));
      expect(source, contains('was defeated in {month} {year}.'));
      expect(
        source,
        contains('params: {"month": getMonth(s.month), "year": s.year}'),
      );
      expect(source, isNot(contains('LcsI18n.tr(getMonth(s.month))')));
    });

    test('shop sale totals are full currency templates', () {
      final source = File('lib/sitemode/shop.dart').readAsStringSync();
      expect(source, isNot(contains(r'{prefix} \${amount} {suffix}')));
      expect(source, isNot(contains(r'{label}: \${ret}')));
      expect(source, contains('You add {amount} to Liberal Funds.'));
      expect(source, contains('Estimated Liberal Amount: {amount}'));
    });

    test('pickup-line generated responses use complete templates', () {
      final source = File(
        'lib/talk/drop_a_pickup_line.dart',
      ).readAsStringSync();
      expect(source, isNot(contains("\"Actually I'm \$aSuccubus")));
      expect(source, isNot(contains(r'I like ${a.gender == Gender.female')));
      expect(source, isNot(contains('my \$gay era')));
      expect(source, isNot(contains('trans \$guyGirl')));
      expect(source, isNot(contains('return "\$first \$second \$third"')));
      expect(source, contains("Actually I'm {demon} from hell"));
      expect(source, contains('I like {people}.'));
      expect(source, contains('{first} {second} {third}'));
      expect(source, contains('{name} responds'));
      expect(source, contains('{name} looks away'));
    });

    test('siege generated prose uses complete translated templates', () {
      final dailySiege = File('lib/daily/siege.dart').readAsStringSync();
      final locationSiege = File('lib/location/siege.dart').readAsStringSync();
      expect(locationSiege, isNot(contains(r'$namePart, aka')));
      expect(locationSiege, contains('{properName}, aka {name}'));
      expect(
        dailySiege,
        isNot(contains(r"'${LcsI18n.tr(newsNameA)} ${LcsI18n.tr(newsNameB)}'")),
      );
      expect(
        dailySiege,
        isNot(contains(r'&G${pool[best].name.toUpperCase()}')),
      );
      expect(dailySiege, contains('{firstWord} {secondWord}'));
      expect(dailySiege, contains('&G{name} (singing):'));
      expect(dailySiege, isNot(contains('text +=')));
      expect(
        dailySiege,
        contains('The CCS has been completely {pacifistAction}.'),
      );
    });

    test('kidnap news story uses a full article template', () {
      final source = File('lib/newspaper/display_news.dart').readAsStringSync();
      expect(
        source,
        isNot(contains('The disappearance of \${ns.cr!.properName}')),
      );
      expect(source, contains('{city} - The disappearance of {name}'));
      expect(source, contains('{spokesperson}, speaking on behalf'));
      expect(source, contains('{days} days ago'));
    });

    test('newspaper story fragments use complete templates', () {
      final displayNews = File(
        'lib/newspaper/display_news.dart',
      ).readAsStringSync();
      final majorEvent = File(
        'lib/newspaper/major_event.dart',
      ).readAsStringSync();
      final squadStory = File(
        'lib/newspaper/squad_story_text.dart',
      ).readAsStringSync();

      expect(displayNews, contains('The {culprit} was seen to use firearms'));
      expect(
        displayNews,
        contains('The slogan, "{slogan}" was found painted on the walls.'),
      );
      expect(displayNews, contains('found in the {location} yesterday.'));
      expect(
        squadStory,
        contains(
          'A group calling itself the Liberal Crime Squad burst briefly onto the scene of political activism yesterday, according to a spokesperson from the police department.&r',
        ),
      );
      expect(
        squadStory,
        contains(
          'The notorious Liberal Crime Squad went on another rampage, but they got what they deserved.&r',
        ),
      );
      expect(
        squadStory,
        contains(
          'A gang of heavily armed vigilantes calling themselves the Conservative Crime Squad went on a suicidal rampage yesterday, according to a spokesperson from the police department.&r',
        ),
      );
      expect(squadStory, isNot(contains(r'"${placename.substring')));
      expect(squadStory, contains('"{before} and {after}"'));
      expect(majorEvent, isNot(contains("String _possessive(")));
      expect(
        majorEvent,
        contains('Investors out billions as {company} collapses.'),
      );
      expect(
        majorEvent,
        contains('The procedure I needed was going to cost {cost}'),
      );
      expect(majorEvent, contains('This major CEO {critique}.'));
      expect(
        majorEvent,
        contains(
          "Tens of thousands marched downtown today in support of women's rights",
        ),
      );
      expect(
        majorEvent,
        contains(
          'A huge crowd gathered downtown today for a march celebrating LGBT rights',
        ),
      );
      expect(
        majorEvent,
        isNot(contains("There's no good news story for \$view")),
      );
      expect(
        majorEvent,
        isNot(contains("There's no bad news story for \$view")),
      );
      expect(
        majorEvent,
        contains(
          r'{city} - A local wedding venue has conducted a so-called \"wedding\" between a {person} and {partner}.',
        ),
      );
      expect(
        majorEvent,
        contains(
          '{city} - Chaos erupted online after self-proclaimed drug expert {drugExpert}',
        ),
      );
      expect(
        majorEvent,
        contains('{city} - A local white supremacist group has seen a surge'),
      );
      expect(
        majorEvent,
        contains('{city} - A local company has been accused of discrimination'),
      );
      expect(
        majorEvent,
        contains('{city} - A {civilRightsMarch} blocked traffic'),
      );
      expect(
        majorEvent,
        contains('{city} - Torture isn\'t what it used to be'),
      );
      expect(
        majorEvent,
        contains('{city} - Perhaps parents can rest easier tonight.'),
      );
      expect(
        majorEvent,
        contains('{city} - Researchers {fromCountry} report that they have'),
      );
      expect(
        majorEvent,
        contains(
          'Washington, DC - The CIA announced yesterday that it has averted',
        ),
      );
      expect(
        majorEvent,
        contains(
          "smashed the guard's skull with the toilet seat from {possessive} cell",
        ),
      );
      expect(
        majorEvent,
        contains('{city} - The genetic foods industry staged a major event'),
      );
      expect(
        majorEvent,
        contains(
          '{city} - The conviction of confessed serial killer {serialKiller}',
        ),
      );
      expect(
        majorEvent,
        contains('{city} - Pollution might not be so bad after all.'),
      );
      expect(
        majorEvent,
        isNot(contains(r'"${randomCityName()} - A local wedding venue')),
      );
      expect(
        majorEvent,
        isNot(contains(r'"${randomCityName()} - Chaos erupted online')),
      );
      expect(majorEvent, contains("There's no good news story for {view}"));
      expect(majorEvent, contains("There's no bad news story for {view}"));
      expect(
        majorEvent,
        contains(
          'In an uplifting turn, a {massShooting} was prevented by a bystander with a gun.',
        ),
      );
      expect(
        majorEvent,
        contains(
          '{modifier} {noun}: A new book lauding Reagan and the greatest generation.',
        ),
      );
      expect(
        majorEvent,
        contains(
          'Researchers {fromCountry} report that they have discovered an amazing new wonder drug.',
        ),
      );
      expect(
        majorEvent,
        contains(
          'The hostage crisis at the {prisonName} Correctional Facility ended tragically yesterday',
        ),
      );
      expect(
        majorEvent,
        contains(
          'A new book has quickly risen to the top of the bestseller lists, {bookTitle}.',
        ),
      );
      expect(
        majorEvent,
        contains(
          'The National Health Service (NHS) has been brought to its knees by record-breaking waiting times',
        ),
      );
      expect(
        majorEvent,
        contains(
          'The Social Security Administration has announced that the program is on the brink of insolvency',
        ),
      );
      expect(
        majorEvent,
        contains(
          'Several major companies have announced at a joint news conference here that they will be expanding their work forces',
        ),
      );
      expect(
        majorEvent,
        contains(
          'Infamous FM radio shock jock {shockJock} has brought radio entertainment to a new low.',
        ),
      );
      expect(
        majorEvent,
        contains(
          'The public housing crisis has reached a tipping point, with record numbers of people living in overcrowded and unsafe conditions.',
        ),
      );
      expect(
        majorEvent,
        contains('An innocent citizen has been put to death {method}.'),
      );
      expect(
        majorEvent,
        contains(
          'A doctor that routinely performed {abortions} was ruthlessly gunned down',
        ),
      );
      expect(
        majorEvent,
        contains(
          'The nationwide manhunt is over after authorities finally caught {criminal}',
        ),
      );
      expect(
        majorEvent,
        contains(
          'A new study has found that {legalizing} {drug} could be the key',
        ),
      );
      expect(
        majorEvent,
        contains('As the U.S. military prepares to deploy to the {country}'),
      );
      expect(
        majorEvent,
        contains('{city} - {victim}, a {victimLabel}, was {murdered}'),
      );
      expect(
        majorEvent,
        contains(
          '{city} - A student has gone on a {shootingRampage} at a local {school}.',
        ),
      );
      expect(
        majorEvent,
        contains(
          '{modifier} {noun}: A new book further documenting the other side of Reagan.',
        ),
      );
      expect(majorEvent, contains('{name} Clinic'));
      expect(majorEvent, contains('{name} Correctional Facility'));
      expect(
        majorEvent,
        contains(
          '{city} - A former prisoner has written a book describing in horrifying detail',
        ),
      );
      expect(
        majorEvent,
        contains('Washington, DC - The FBI might be keeping tabs on you.'),
      );
      expect(
        majorEvent,
        contains(
          "{city} - A children's story has been removed from libraries here",
        ),
      );
      expect(
        majorEvent,
        contains('{city} - Conservative federal judge {judge} has resigned'),
      );
      expect(
        majorEvent,
        contains('{city} - Well-known AM radio personality {radioHost}'),
      );
      expect(
        majorEvent,
        contains('{city} - Masked ICE agents seized dozens of people'),
      );
      expect(
        majorEvent,
        contains('{city} - {company} has announced a major overhaul'),
      );
      expect(
        majorEvent,
        contains('{city} - Two police officers, {officer1} and {officer2}'),
      );
      expect(
        majorEvent,
        contains('{city} - Police officer {officer} is under investigation'),
      );
      expect(
        majorEvent,
        contains('{city} - Police raided a warehouse where dozens'),
      );
      expect(
        majorEvent,
        contains('Washington, D.C. - Photos leaked from an overseas facility'),
      );
    });

    test('cable-news show names use complete templates', () {
      final source = File('lib/newspaper/television.dart').readAsStringSync();
      expect(source, isNot(contains('showName +=')));
      expect(source, isNot(contains('str += showName')));
      expect(source, contains('"{first} {second} with {host}"'));
      expect(source, contains('"Tonight on a Cable News channel: {showName}"'));
    });

    test(
      'newspaper ad values are rendered through templates before layout',
      () {
        final ads = File('lib/newspaper/ads.dart').readAsStringSync();
        final displayNews = File(
          'lib/newspaper/display_news.dart',
        ).readAsStringSync();

        expect(ads, contains('&cNow {amount}49.99'));
        expect(ads, contains('&c{description} {who} {seeking}&r'));
        expect(ads, isNot(contains(r'&cNow $${')));
        expect(ads, isNot(contains(r'&c${sexdesc()}')));
        expect(
          displayNews,
          contains('addstrx(lines.first, noTranslate: true)'),
        );
      },
    );

    test('swept generated-news sources contain no raw Dart interpolation', () {
      final interpolation = RegExp(r'\$(?:\{|[A-Za-z_])');
      final sources = [
        'lib/newspaper/major_event.dart',
        'lib/newspaper/ads.dart',
      ];

      for (final path in sources) {
        final source = File(path).readAsStringSync();
        expect(
          interpolation.hasMatch(source),
          isFalse,
          reason: 'Raw interpolation remains in $path',
        );
      }
    });

    test('menu, hospital, and debt-receipt output use full templates', () {
      final newGame = File('lib/title_screen/new_game.dart').readAsStringSync();
      final flag = File('lib/basemode/flag.dart').readAsStringSync();
      final advanceDay = File('lib/daily/advance_day.dart').readAsStringSync();
      final dailySiege = File('lib/daily/siege.dart').readAsStringSync();
      final locationSiege = File('lib/location/siege.dart').readAsStringSync();

      expect(newGame, isNot(contains(r'"$key - $category:"')));
      expect(newGame, contains('"{key} - {category}:"'));
      expect(flag, isNot(contains(r'"$key - ${flag.name}"')));
      expect(flag, contains('"{key} - {name}"'));
      expect(advanceDay, contains('{name} is being discharged from {site}.'));
      expect(
        dailySiege,
        contains(
          'A small fleet of ambulances surrounds the front of {location}.',
        ),
      );
      expect(
        dailySiege,
        contains(
          'Hospital debt collectors are moving to settle with the {location}.',
        ),
      );
      expect(
        dailySiege,
        contains('You have received a warning from {sleeper}'),
      );
      expect(
        dailySiege,
        contains(
          'You have received an anonymous tip that the medical industry',
        ),
      );
      expect(
        locationSiege,
        contains('MEDICAL DEBT COLLECTION RECEIPT FOR {location}:'),
      );
    });

    test('new hostages, prison, siege, and fight templates stay complete', () {
      final hostages = File(
        'lib/daily/hostages/traumatize.dart',
      ).readAsStringSync();
      final prison = File('lib/justice/prison.dart').readAsStringSync();
      final siege = File('lib/daily/siege.dart').readAsStringSync();
      final fight = File('lib/sitemode/fight.dart').readAsStringSync();

      expect(hostages, contains('{name} loses Heart.'));
      expect(
        hostages,
        contains('{name} is haunted by the memory of the {action}.'),
      );
      expect(hostages, contains('{name} doesn\'t want to talk to anyone.'));
      expect(prison, contains('{name} renounces the LCS!'));
      expect(prison, contains('{experience}{suffix}'));
      expect(prison, contains('(+{delta} juice)'));
      expect(siege, contains('You have received a warning from {name}'));
      expect(siege, contains('{location} Defense'));
      expect(siege, contains('{site} in {city}'));
      expect(fight, contains('{name} {deathMessage}'));
    });

    test('trial outcome logs use complete templates', () {
      final source = File('lib/justice/trial.dart').readAsStringSync();
      expect(source, isNot(contains(r'logBlindEvent("${g.name}')));
      expect(source, contains('{name} was acquitted and set free.'));
      expect(
        source,
        contains('{name} was sentenced to {years} years in prison.'),
      );
      expect(
        source,
        contains('{name} was sentenced to {months} months in prison.'),
      );
    });

    test('nursing-home and insurance special messages use full templates', () {
      final source = File('lib/sitemode/map_specials.dart').readAsStringSync();
      expect(source, isNot(contains(r'"Mr. $patientLastName"')));
      expect(source, isNot(contains('%FIRSTLAST%')));
      expect(source, contains('The squad has already checked up on {name}.'));
      expect(source, contains('Claim: {claim}.'));
      expect(source, contains('{name} approves the {claim} claim.'));
      expect(
        source,
        contains('{firstLast} is lonely and feels isolated here.'),
      );
      expect(source, contains('LcsI18n.processString(template,'));
      expect(source, contains('noTranslate: true'));
    });

    test('character-creation options render parameterized templates first', () {
      final source = File('lib/title_screen/questions.dart').readAsStringSync();
      expect(
        source,
        isNot(contains(r'"I got caught making out with $makeOutWith')),
      );
      expect(source, contains('"I got caught making out with {person}.'));
      expect(source, contains('option.option,'));
      expect(
        source,
        contains('final optionLines = _wrapCharacterCreationText'),
      );
    });

    test('priority source areas contain no unreviewed interpolation', () {
      const paths = [
        'lib/newspaper',
        'lib/talk',
        'lib/sitemode/fight.dart',
        'lib/daily/siege.dart',
        'lib/sitemode/shop.dart',
      ];
      final interpolation = RegExp(r'(?<!\\)\$(?:\{|[A-Za-z_])');
      final offenders = <String>[];

      for (final path in paths) {
        final entity = FileSystemEntity.typeSync(path);
        final files = entity == FileSystemEntityType.directory
            ? Directory(path)
                  .listSync(recursive: true)
                  .whereType<File>()
                  .where((file) => file.path.endsWith('.dart'))
            : [File(path)];
        for (final file in files.where(
          (file) => !file.path.endsWith('.g.dart'),
        )) {
          final lines = file.readAsLinesSync();
          for (var index = 0; index < lines.length; index++) {
            if (interpolation.hasMatch(lines[index]) &&
                !_isReviewedPriorityInterpolation(file.path, lines[index])) {
              offenders.add(
                '${file.path}:${index + 1}: ${lines[index].trim()}',
              );
            }
          }
        }
      }

      expect(offenders, isEmpty, reason: offenders.join('\n'));
    });

    test('full interpolation audit classifies every priority-area raw literal', () {
      final result = Process.runSync('dart', [
        'run',
        'scripts/interpolation_status.dart',
        '--all',
        '--json',
      ]);
      expect(result.exitCode, 0, reason: result.stderr);
      final audit = jsonDecode(result.stdout as String) as Map<String, dynamic>;
      final records = (audit['allInterpolation'] as List<dynamic>)
          .cast<Map<String, dynamic>>();
      const priorityPaths = {
        'daily/siege.dart',
        'newspaper/display_news.dart',
        'sitemode/fight.dart',
        'sitemode/shop.dart',
        'talk/talk_about_issues.dart',
        'talk/talk_outside_combat.dart',
      };
      const reviewed = {
        r'daily/siege.dart:Heat from ${p.name}: ${p.heat} -> ${sqrt(p.heat).ceil()}',
        r'daily/siege.dart:Heat for ${l.getName()}: $beforeHeat -> ${l.heat} ($beforeCrimes -> $crimes)',
        r'daily/siege.dart:\n\n$paragraph',
        r'daily/siege.dart:bestvalue: $bestvalue',
        r'daily/siege.dart:segmentpower: $segmentpower',
        r'daily/siege.dart:\$$confiscated',
        r'newspaper/display_news.dart:typesum: $typesum',
        r'sitemode/fight.dart:${a.name} rolls $aroll + $bonus, ${t.name} rolls $droll',
        r'sitemode/fight.dart:Damage mod: $mod, damage before application: $damamount',
        r'sitemode/fight.dart:Damage reduced to $damamount',
        r'sitemode/fight.dart:Damage increased to $damamount',
        r'sitemode/fight.dart:Random: $random, fixed: $fixed, hits: $bursthits',
        r'sitemode/fight.dart:Initial damage roll: $damamount',
        r'sitemode/fight.dart:Final damage after hit location effects: $damamount',
        r'sitemode/fight.dart:Target blood before hit: ${target.blood}/${target.maxBlood}',
        r'sitemode/fight.dart:Target blood after hit: ${target.blood}/${target.maxBlood}',
        r'sitemode/fight.dart:Making loot for ${cr.name} into $lootPile',
        r'sitemode/shop.dart:\$${(availableOptions[p] as ShopItem).price(false)}',
        r'sitemode/shop.dart:\$${(availableOptions[i] as ShopItem).price(false)}',
        r'sitemode/shop.dart:\$${(availableOptions[index] as ShopItem).price(false)}',
        r'sitemode/shop.dart:\$$fenceamount',
        r'sitemode/shop.dart:\$$ret',
        r'talk/talk_about_issues.dart:Talk about issues: $succeeded, $difficulty',
        r'talk/talk_outside_combat.dart:\$$rent',
      };
      final offenders = records
          .where((record) => priorityPaths.contains(record['file']))
          .map((record) => '${record['file']}:${record['text']}')
          .where((entry) => !reviewed.contains(entry))
          .toList();

      expect(offenders, isEmpty, reason: offenders.join('\n'));
    });

    test('full interpolation audit classifies every lib interpolation', () {
      final result = Process.runSync('dart', [
        'run',
        'scripts/interpolation_status.dart',
        '--all',
        '--check',
        '--json',
      ]);
      expect(result.exitCode, 0, reason: result.stderr);
      final audit = jsonDecode(result.stdout as String) as Map<String, dynamic>;
      expect(
        audit['unclassifiedAllInterpolation'],
        isEmpty,
        reason:
            'All lib interpolations must be localized or explicitly classified.',
      );
    });

    test('composed item and location labels use complete templates', () {
      final district = File('lib/location/district.dart').readAsStringSync();
      final weapon = File('lib/items/weapon.dart').readAsStringSync();
      final clothing = File('lib/items/clothing.dart').readAsStringSync();

      expect(district, contains('"{district}, {city}"'));
      expect(district, isNot(contains(r'"$name, ${city.name}"')));
      expect(weapon, contains('"{weapon} ({ammo})"'));
      expect(weapon, isNot(contains(r'et += " ($ammo)"')));
      expect(weapon, contains('return LcsI18n.tr(type.name)'));
      expect(
        weapon,
        contains('return LcsI18n.tr(type.largeSubtypeName ?? type.name)'),
      );
      expect(clothing, contains('"{clothing} (d)"'));
      expect(clothing, isNot(contains(r'"${type.name} (d)"')));
    });

    test('vehicle and officeholder names use locale-controlled templates', () {
      final vehicle = File('lib/vehicles/vehicle.dart').readAsStringSync();
      final sleepers = File(
        'lib/monthly/sleeper_update.dart',
      ).readAsStringSync();

      expect(vehicle, contains('"Stolen {color} {vehicle}"'));
      expect(vehicle, contains('"{color} {year} {vehicle}"'));
      expect(vehicle, isNot(contains(r's += "$color "')));
      expect(sleepers, contains('"Vice President {last}"'));
      expect(sleepers, isNot(contains(r'"Vice President ${oldName.last}"')));
    });

    test('ballot measure names use complete numbered templates', () {
      final elections = File('lib/politics/elections.dart').readAsStringSync();
      expect(elections, contains('"AK Measure {number}"'));
      expect(elections, contains('"WA Initiative {number}"'));
      expect(elections, contains('LcsI18n.processString('));
      expect(elections, isNot(contains(r'"AK Measure ${')));
      expect(elections, isNot(contains(r'"WA Initiative ${')));
    });

    test('equipment movement stack counts use complete templates', () {
      final equipment = File(
        'lib/common_actions/equipment.dart',
      ).readAsStringSync();
      expect(equipment, contains('"{letter} - {item} x{count}"'));
      expect(equipment, contains('"{letter} - {title} {stackSuffix}"'));
      expect(equipment, contains('"{title} {selection}"'));
      expect(equipment, contains('"{selected}/{total}"'));
      expect(equipment, isNot(contains(r'"stack": items[p].stackSize')));
      expect(equipment, isNot(contains(r'" x${items[p].stackSize}"')));
    });

    test('funds display uses a complete translated currency template', () {
      final display = File(
        'lib/common_display/common_display.dart',
      ).readAsStringSync();
      expect(display, contains('"Money: {amount}"'));
      expect(
        display,
        isNot(contains(r'String str = "$prefix \$${ledger.funds}"')),
      );
      expect(display, contains('text,\n    noTranslate: true'));
    });

    test(
      'localized option footers measure translated labels independently',
      () {
        final flag = File('lib/basemode/flag.dart').readAsStringSync();
        final regulars = File(
          'lib/basemode/activate_regulars.dart',
        ).readAsStringSync();
        expect(flag, isNot(contains(r'"$enterText   $cancelText"')));
        expect(flag, contains('LcsI18n.tr(cancelText).length'));
        expect(
          regulars,
          isNot(
            contains(r"'${LcsI18n.tr(enterText)}   ${LcsI18n.tr(escapeText)}'"),
          ),
        );
        expect(regulars, contains('LcsI18n.tr(escapeText).length'));
      },
    );

    test('map editor status and result messages use complete templates', () {
      final editor = File(
        'lib/map_editor/map_editor_screen.dart',
      ).readAsStringSync();
      expect(editor, contains("'Floor {current} / {count}'"));
      expect(editor, contains("'Imported \"{name}\" ({count} floor(s)).'"));
      expect(editor, contains("'Exported {count} floor(s) to {filename}'"));
      expect(editor, contains("'Export failed: {error}'"));
      expect(editor, isNot(contains(r"'Floor ${controller.currentFloor")));
      expect(editor, isNot(contains(r'''Text('Imported "$base"''')));
      expect(editor, isNot(contains(r"'Export failed: $e'")));
    });

    test('map editor validation issues use complete templates', () {
      final controller = File(
        'lib/map_editor/map_editor_controller.dart',
      ).readAsStringSync();
      expect(
        controller,
        contains("'Entrance at ({x}, {y}) is blocked — squads cannot enter.'"),
      );
      expect(
        controller,
        contains(
          "'Floors {lower} and {upper} have no stairs connecting them.'",
        ),
      );
      expect(
        controller,
        contains("'This {site} map has no {objective} (the site objective).'"),
      );
      expect(controller, isNot(contains(r"'Floor $floorCount has stairs")));
      expect(controller, isNot(contains(r"'This ${siteType.name} map")));
    });

    test('map editor door labels use whole translated variants', () {
      final tools = File('lib/map_editor/editor_tools.dart').readAsStringSync();
      expect(tools, contains("LcsI18n.tr('Locked alarmed metal door')"));
      expect(tools, contains("LcsI18n.tr('Alarmed door')"));
      expect(tools, isNot(contains(r"'${joined[0].toUpperCase()}")));
    });

    test(
      'constitutional purge prose uses complete singular/plural paragraphs',
      () {
        final constitution = File(
          'lib/politics/constitution.dart',
        ).readAsStringSync();
        expect(
          constitution,
          contains('the aforementioned former citizen may not serve'),
        );
        expect(
          constitution,
          contains('the aforementioned former citizens may not serve'),
        );
        expect(constitution, isNot(contains(r'${tossnum != 1')));
        expect(constitution, isNot(contains('addstr(", also of")')));
      },
    );

    test('page controls and presidential titles use complete templates', () {
      final options = File(
        'lib/utils/interface_options.dart',
      ).readAsStringSync();
      final unique = File(
        'lib/creature/unique_creatures.dart',
      ).readAsStringSync();
      expect(options, contains('"{key} - Previous"'));
      expect(
        options,
        contains('"{keys} - View other Liberal pages ({current}/{max})"'),
      );
      expect(options, isNot(contains(r'return "$str - Previous"')));
      expect(unique, contains('"President {last}"'));
      expect(unique, isNot(contains(r'"President ${politics.execName')));
    });

    test('generated monster and attorney names use structural templates', () {
      final monsters = File(
        'lib/creature/monster_name.dart',
      ).readAsStringSync();
      final unique = File(
        'lib/creature/unique_creatures.dart',
      ).readAsStringSync();
      expect(monsters, contains('"{first} {middle}{last}"'));
      expect(monsters, isNot(contains(r'return "$first ${colors.random}')));
      expect(unique, contains('LcsI18n.processString("{first} {last}"'));
      expect(unique, isNot(contains(r'"${[')));
    });

    test('personal, country, capital, and company names use templates', () {
      final names = File('lib/creature/name.dart').readAsStringSync();
      expect(names, contains('"{first} {middle} {last}"'));
      expect(names, contains('"{title} of {country}"'));
      expect(names, contains('"{prefix} {suffix}"'));
      expect(names, contains('"{prefix}{stem} {type}"'));
      expect(names, isNot(contains(r'"$first $middle $last"')));
      expect(names, isNot(contains(r'"St. ${lastName()}"')));
    });

    test('monthly finance values use locale-controlled currency templates', () {
      final monthly = File('lib/monthly/lcs_monthly.dart').readAsStringSync();
      expect(monthly, contains('"+{amount}"'));
      expect(monthly, contains('"-{amount}"'));
      expect(monthly, contains('"(+{amount})"'));
      expect(monthly, contains('"(-{amount})"'));
      expect(monthly, isNot(contains(r'"+\$${ledger.income[inc]}"')));
      expect(monthly, isNot(contains(r'" (-\$${dailymoney.abs()})"')));
    });

    test('monthly loot expose stories translate fragments before display', () {
      final monthly = File('lib/monthly/lcs_monthly.dart').readAsStringSync();
      expect(monthly, contains('story += LcsI18n.tr('));
      expect(
        monthly,
        contains('addparagraph(startY, 1, story, noTranslate: true)'),
      );
      expect(monthly, isNot(contains('story += "sexually assaulting')));
    });

    test('crime news drama fragments translate before story assembly', () {
      final displayNews = File(
        'lib/newspaper/display_news.dart',
      ).readAsStringSync();
      expect(displayNews, contains('void appendNews(String text)'));
      expect(displayNews, contains('story += LcsI18n.tr(text);'));
      expect(
        displayNews,
        contains('appendNews("Members of the Liberal Crime Squad ");'),
      );
      expect(displayNews, contains('story += LcsI18n.tr(drama);'));
      expect(displayNews, contains('appendNews("One vehicle crashed.  ");'));
      expect(displayNews, isNot(contains('story += "arson"')));
    });

    test('massacre news story fragments translate before story assembly', () {
      final displayNews = File(
        'lib/newspaper/display_news.dart',
      ).readAsStringSync();
      expect(displayNews, contains('appendNews("Two bodies were ");'));
      expect(displayNews, contains('appendNews("A body was ");'));
      expect(displayNews, contains('appendNews("victims were members ");'));
      expect(
        displayNews,
        contains('It was execution style.  Professional.  We\'ve got nothing'),
      );
      expect(displayNews, isNot(contains('story += " Two bodies were "')));
      expect(
        displayNews,
        isNot(contains('story += "The bodies had no faces or "')),
      );
    });

    test(
      'centered newspaper headlines translate in displayCenteredNewsFont',
      () {
        final displayNews = File(
          'lib/newspaper/display_news.dart',
        ).readAsStringSync();
        expect(displayNews, contains('str = LcsI18n.tr(str);'));
        expect(displayNews, contains('displayCenteredNewsFont("CCS MASSACRE"'));
        expect(displayNews, contains('displayCenteredNewsFont("KIDNAPPED"'));
      },
    );

    test(
      'hostage plan labels render their params and costs before display',
      () {
        final hostage = File(
          'lib/daily/hostages/tend_hostage.dart',
        ).readAsStringSync();
        expect(hostage, contains('String text = LcsI18n.processString('));
        expect(hostage, contains('ifActive,\n        params,'));
        expect(hostage, contains('"{label} ({cost})"'));
        expect(hostage, isNot(contains(r'String costStr = "(\$$cost)"')));
        expect(hostage, isNot(contains('String text = ifActive;')));
      },
    );

    test('founder, CEO, level, and pronoun labels use complete templates', () {
      final newGame = File('lib/title_screen/new_game.dart').readAsStringSync();
      final questions = File(
        'lib/title_screen/questions.dart',
      ).readAsStringSync();
      final creatures = File(
        'lib/creature/hardcoded_creature_type_stuff.dart',
      ).readAsStringSync();
      final levels = File('lib/creature/level.dart').readAsStringSync();

      expect(newGame, contains('"{first} {last}"'));
      expect(questions, contains("{pronoun} didn't even come close."));
      expect(creatures, contains('"CEO {name}"'));
      expect(levels, contains('"{title} {numeral}"'));
      expect(newGame, isNot(contains(r'"${first[sex]!} $last"')));
      expect(creatures, isNot(contains(r'"CEO ${cr.properName}"')));
    });

    test('trial charges use complete defendant, count, and list templates', () {
      final trial = File('lib/justice/trial.dart').readAsStringSync();
      expect(
        trial,
        contains('"The defendant, {name}, is charged with {charges}."'),
      );
      expect(trial, contains('"{count} counts of {crime}"'));
      expect(trial, contains('"{first} and {second}"'));
      expect(trial, isNot(contains(r'"The defendant, ${g.properName}')));
      expect(trial, isNot(contains(r'charges += "${g.wantedForCrimes')));
    });

    test('graffiti mural quality uses complete sentence variants', () {
      final graffiti = File(
        'lib/daily/activities/graffiti.dart',
      ).readAsStringSync();
      expect(
        graffiti,
        contains('"{name} has completed a beautiful mural about {issue}."'),
      );
      expect(
        graffiti,
        contains('"{name} has completed a mural about {issue}."'),
      );
      expect(graffiti, contains('LcsI18n.tr(issue.label)'));
      expect(graffiti, isNot(contains('a{quality} mural')));
      expect(graffiti, isNot(contains(r'LcsI18n.tr("beautiful")')));
    });

    test('clothing quality ordinal and name translate before insertion', () {
      final creation = File(
        'lib/daily/activities/clothing_creation.dart',
      ).readAsStringSync();
      expect(creation, contains('LcsI18n.processString("{quality}th"'));
      expect(creation, contains('"clothing": LcsI18n.tr(clothing.name)'));
      expect(creation, isNot(contains(r'rate = "${quality}th"')));
    });

    test(
      'generated dynamic action and question phrases translate before insertion',
      () {
        final ransom = File(
          'lib/daily/hostages/ransom.dart',
        ).readAsStringSync();
        final interrogation = File(
          'lib/daily/hostages/interrogate.dart',
        ).readAsStringSync();
        final hardliner = File(
          'lib/daily/activities/hardliner_fight.dart',
        ).readAsStringSync();

        expect(ransom, isNot(contains('"action": [')));
        expect(interrogation, isNot(contains('"action": [')));
        expect(interrogation, isNot(contains('"question": [')));
        expect(hardliner, isNot(contains('"action": [')));
        expect(
          hardliner,
          contains('"result": LcsI18n.tr(noProfanity ? "[tar]" : "shit")'),
        );

        final recruitment = File(
          'lib/daily/recruitment.dart',
        ).readAsStringSync();
        final lovebomb = File(
          'lib/daily/hostages/lovebomb.dart',
        ).readAsStringSync();
        final fight = File('lib/sitemode/fight.dart').readAsStringSync();
        expect(
          recruitment,
          contains('"topic": LcsI18n.tr(_issueEventStrings.random)'),
        );
        expect(
          recruitment,
          contains('"law": LcsI18n.tr(Law.values.random.label)'),
        );
        expect(lovebomb, contains('"activity": LcsI18n.tr('));
        expect(lovebomb, contains('"holiday": LcsI18n.tr('));
        expect(
          lovebomb,
          contains('"item1": LcsI18n.tr(miniOptions.randomPop())'),
        );
        expect(
          fight,
          contains('"attack": LcsI18n.tr(attackUsed.attackDescription.random)'),
        );
        expect(
          fight,
          contains('"part": LcsI18n.tr(hitPart.name).toLowerCase()'),
        );
        expect(fight, isNot(contains('hitPart.name.toLowerCase()')));

        final miscactions = File(
          'lib/sitemode/miscactions.dart',
        ).readAsStringSync();
        final learning = File(
          'lib/daily/activities/learning.dart',
        ).readAsStringSync();
        final traumatize = File(
          'lib/daily/hostages/traumatize.dart',
        ).readAsStringSync();
        final monthly = File('lib/monthly/lcs_monthly.dart').readAsStringSync();
        final recruitingActivity = File(
          'lib/daily/activities/recruiting.dart',
        ).readAsStringSync();
        final regulars = File(
          'lib/basemode/activate_regulars.dart',
        ).readAsStringSync();
        final activities = File(
          'lib/basemode/activities.dart',
        ).readAsStringSync();
        final sleepers = File(
          'lib/monthly/sleeper_update.dart',
        ).readAsStringSync();

        expect(miscactions, contains('"action": LcsI18n.tr(action)'));
        expect(learning, contains('"level": LcsI18n.tr(level)'));
        expect(learning, contains('"skill": LcsI18n.tr(skill.displayName)'));
        expect(traumatize, contains('"action": LcsI18n.tr(action)'));
        expect(
          monthly,
          contains('"name": LcsI18n.tr(lootTypesAvailable[index].name)'),
        );
        expect(recruitingActivity, contains('"type": LcsI18n.tr(name)'));
        expect(regulars, contains('"skill": LcsI18n.tr(skill.displayName)'));
        expect(
          regulars,
          contains('cr.activity.skill?.displayName ?? "unknown skill"'),
        );
        expect(
          regulars,
          contains('"activity": LcsI18n.tr(cr.activity.type.label)'),
        );
        expect(activities, contains('"skill": skill?.localizedName'));
        expect(
          sleepers,
          contains('"position": LcsI18n.tr(positionToFill.displayName)'),
        );
      },
    );

    test('i18n completion gate target (PLAN.md)', () {
      // Gate implemented in CatalogAuditResult.passesCompletionGate.
      expect(audit.passesCompletionGate, isTrue);
    });
  });
}

String _formatPlaceholderMismatches(
  List<CatalogPlaceholderMismatch> mismatches,
) {
  if (mismatches.isEmpty) return '';
  final buffer = StringBuffer('Placeholder mismatches:\n');
  for (final mismatch in mismatches.take(20)) {
    buffer.writeln(
      '  ${mismatch.key}: source=${mismatch.sourcePlaceholders} '
      'target=${mismatch.targetPlaceholders}',
    );
  }
  return buffer.toString();
}

String _formatInterpolationIssues(List<CatalogInterpolationIssue> issues) {
  if (issues.isEmpty) return '';
  final buffer = StringBuffer('Raw interpolation in pt_BR values:\n');
  for (final issue in issues.take(20)) {
    buffer.writeln('  ${issue.key} => ${issue.value}');
  }
  return buffer.toString();
}

bool _isReviewedPriorityInterpolation(String path, String line) {
  final trimmed = line.trim();

  // Developer diagnostics and commented-out diagnostics never reach players.
  if (trimmed.startsWith('//') || trimmed.contains('debugPrint(')) return true;

  // json_serializable helper symbols are identifiers, not interpolation.
  if (trimmed.contains(r'_$NewsStory')) return true;

  // Currency interpolation formats only a value passed into a complete
  // surrounding template; it does not compose translatable prose.
  if ((trimmed.startsWith('params:') || trimmed.startsWith('"price":')) &&
      trimmed.contains(r'\$$')) {
    return true;
  }

  if (path == 'lib/daily/siege.dart') {
    // Continuation lines belonging to multiline debugPrint calls.
    if (trimmed.startsWith('"Heat from ') || trimmed.startsWith('"Heat for ')) {
      return true;
    }
    // Paragraphs are translated independently; this joins them for layout.
    if (trimmed == r'newsBody += "\n\n$paragraph";') return true;
  }

  return false;
}
