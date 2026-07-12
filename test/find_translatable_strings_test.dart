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
}
