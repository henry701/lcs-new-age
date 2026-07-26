import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  const fixtureRelativePath = 'lib/__i18n_extractor_fixture_test.dart';
  final fixture = File(fixtureRelativePath);

  tearDown(() async {
    if (fixture.existsSync()) {
      await fixture.delete();
    }
  });

  test(
    'extractor rejects leading flavor fragments from random lists',
    () async {
      await fixture.writeAsString(r'''
const crashFlavorText = [
  " slams into a wall.",
  "\'s wounds reopen.",
  "{name} survives the crash.",
];

void renderCrash() {
  final template = crashFlavorText.random;
  addstr(template, params: {"name": "Jane"});
}
''');

      final result = await Process.run('dart', [
        'run',
        'scripts/find_translatable_strings.dart',
        '--print-only',
        '--glob=__i18n_extractor_fixture_test.dart',
      ]);

      expect(result.exitCode, 0, reason: result.stderr.toString());
      final output = result.stdout.toString();
      expect(output, contains('{name} survives the crash.'));
      expect(output, isNot(contains(' slams into a wall.')));
      expect(output, isNot(contains("'s wounds reopen.")));
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  test(
    'extractor captures wrapped multiline assignment literals',
    () async {
      await fixture.writeAsString(r'''
void renderCapture() {
  late final String captureTemplate;
  captureTemplate =
      "{name} is seized, thrown to the ground, and TAZED TO DEATH!";
  mvaddstrc(9, 1, lightBlue, captureTemplate, params: {"name": "Jane"});
}
''');

      final result = await Process.run('dart', [
        'run',
        'scripts/find_translatable_strings.dart',
        '--print-only',
        '--glob=__i18n_extractor_fixture_test.dart',
      ]);

      expect(result.exitCode, 0, reason: result.stderr.toString());
      expect(
        result.stdout.toString(),
        contains('{name} is seized, thrown to the ground, and TAZED TO DEATH!'),
      );
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  test(
    'extractor captures triple-quoted processString templates as one key',
    () async {
      await fixture.writeAsString(r'''
void renderVictory() {
  LcsI18n.processString(
    """{name} wins the battle.

The safehouse is secure.""",
    {"name": "Jane"},
  );
}
''');

      final result = await Process.run('dart', [
        'run',
        'scripts/find_translatable_strings.dart',
        '--print-only',
        '--glob=__i18n_extractor_fixture_test.dart',
      ]);

      expect(result.exitCode, 0, reason: result.stderr.toString());
      expect(
        result.stdout.toString(),
        contains('{name} wins the battle.\n\nThe safehouse is secure.'),
      );
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  test(
    'extractor captures declarative character-creation questions and options',
    () async {
      await fixture.writeAsString(r'''
final questions = [
  _Question("In the moments after I was born...", [
    _Option(
      "A historic event happened.",
      "+2 Agility, June 30th",
      () {},
    ),
    _Option("Violently.", "+2 Strength", () {}),
  ]),
];
''');

      final result = await Process.run('dart', [
        'run',
        'scripts/find_translatable_strings.dart',
        '--print-only',
        '--glob=__i18n_extractor_fixture_test.dart',
      ]);

      expect(result.exitCode, 0, reason: result.stderr.toString());
      final output = result.stdout.toString();
      expect(output, contains('In the moments after I was born...'));
      expect(output, contains('A historic event happened.'));
      expect(output, contains('+2 Agility, June 30th'));
      expect(output, contains('Violently.'));
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  test(
    'extractor captures paged-interface prompts and column headers',
    () async {
      await fixture.writeAsString(r'''
Future<void> renderShop() async {
  await pagedInterface(
    headerPrompt: "What will {name} buy?",
    headerKey: {4: "NAME", 20: "AMMO TYPE", 47: "DAMAGE", 59: "PRICE"},
    footerPrompt: "Press a Letter to buy a Sufficiently Liberal Weapon",
    count: 0,
    lineBuilder: (_, _, _) {},
    onChoice: (_) async => false,
  );
}
''');

      final result = await Process.run('dart', [
        'run',
        'scripts/find_translatable_strings.dart',
        '--print-only',
        '--glob=__i18n_extractor_fixture_test.dart',
      ]);

      expect(result.exitCode, 0, reason: result.stderr.toString());
      final output = result.stdout.toString();
      expect(output, contains('What will {name} buy?'));
      expect(output, contains('NAME'));
      expect(output, contains('AMMO TYPE'));
      expect(output, contains('DAMAGE'));
      expect(output, contains('PRICE'));
      expect(
        output,
        contains('Press a Letter to buy a Sufficiently Liberal Weapon'),
      );
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  test(
    'extractor captures complete metadata for XML-backed purchasable items',
    () async {
      final result = await Process.run('dart', [
        'run',
        'scripts/find_translatable_strings.dart',
        '--json',
        '--glob=sitemode/shop.dart',
      ]);

      expect(result.exitCode, 0, reason: result.stderr.toString());
      final entries = jsonDecode(result.stdout.toString()) as List<dynamic>;
      final keys = entries
          .cast<Map<String, dynamic>>()
          .map((entry) => entry['text'] as String)
          .toSet();

      expect(
        keys,
        containsAll(<String>[
          'Conservative Guns',
          'Buy a Cheap Dress',
          '.22 Revolver',
          '.22 Rev',
          'Old west stylings.  But did cowboys have bullets this small?',
          '12ga 00 Buckshot',
          'Motorcycle Leathers',
          'Biker Leather',
        ]),
      );
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  test(
    'extractor captures month-end wrapper and explicit label keys',
    () async {
      await fixture.writeAsString(r'''
Future<void> renderMonthEnd() async {
  await showMessage("Congress is acting on legislation!");
  mvaddstr(0, 62, LcsI18n.tr("House"), noTranslate: true);
  mvaddstr(0, 70, LcsI18n.tr("Senate"), noTranslate: true);
  mvaddstr(0, 35, LcsI18n.tr("President"), noTranslate: true);
  liquidAssetLine(LcsI18n.tr("Cash"), 7);
  liquidAssetLine(LcsI18n.tr("Tools and Weapons"), 0);
  liquidAssetLine(LcsI18n.tr("Clothing and Armor"), 0);
  liquidAssetLine(LcsI18n.tr("Ammunition"), 0);
  liquidAssetLine(LcsI18n.tr("Miscellaneous Loot"), 0);
}
''');

      final result = await Process.run('dart', [
        'run',
        'scripts/find_translatable_strings.dart',
        '--print-only',
        '--glob=__i18n_extractor_fixture_test.dart',
      ]);

      expect(result.exitCode, 0, reason: result.stderr.toString());
      final output = result.stdout.toString();
      for (final key in [
        'Congress is acting on legislation!',
        'House',
        'Senate',
        'President',
        'Cash',
        'Tools and Weapons',
        'Clothing and Armor',
        'Ammunition',
        'Miscellaneous Loot',
      ]) {
        expect(output, contains(key), reason: key);
      }
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  test(
    'extractor emits a machine-readable live key set',
    () async {
      await fixture.writeAsString(r'''
void renderJson() {
  addstr('A live localization key.');
}
''');

      final result = await Process.run('dart', [
        'run',
        'scripts/find_translatable_strings.dart',
        '--json',
        '--glob=__i18n_extractor_fixture_test.dart',
      ]);

      expect(result.exitCode, 0, reason: result.stderr.toString());
      final entries = jsonDecode(result.stdout.toString()) as List<dynamic>;
      expect(
        entries,
        contains(
          isA<Map<String, dynamic>>().having(
            (entry) => entry['text'],
            'text',
            'A live localization key.',
          ),
        ),
      );
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}
