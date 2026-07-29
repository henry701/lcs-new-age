import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/basemode/help_system.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

String _consoleText() => console.buffer
    .map((row) => row.map((character) => character.glyph).join())
    .join('\n');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    erase();
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    erase();
    LcsI18n.reset();
  });

  test('Guardian writing help renders its complete Portuguese body', () async {
    console.injectKey('x');

    await helpOnActivity(ActivityType.writeGuardian);

    final text = _consoleText();
    expect(text, contains('O Guardião Liberal é a presença midiática do LCS.'));
    expect(
      text,
      contains('Escrever para o Guardião Liberal coloca artigos no site.'),
    );
    expect(text, isNot(contains('The Liberal Guardian is the LCS')));
    expect(text, isNot(contains('Writing for the Liberal Guardian')));
  });

  test(
    'Guardian streaming help renders its complete Portuguese body',
    () async {
      console.injectKey('x');

      await helpOnActivity(ActivityType.streamGuardian);

      final text = _consoleText();
      expect(
        text,
        contains('Transmitir para o Guardião Liberal usa a plataforma'),
      );
      expect(text, contains('neutralizar a Máquina de Mídia Conservadora'));
      expect(text, isNot(contains('Streaming for the Liberal Guardian')));
    },
  );

  test(
    'all activity help bodies avoid their English source prefixes',
    () async {
      const sourcePrefixes = {
        'Community service is',
        'Liberal Disobedience is',
        'Spraying political graffiti is',
        'Hacking is a highly illegal',
        'Soliciting donations is',
        'Selling Clothing is',
        'Performing Music is',
        'Selling Art is',
        'Selling Brownies on the street is',
        'Prostitution is an illegal',
        'Credit Card Fraud is an illegal',
        'Stealing a car will have',
        'This really doesn\'t do much if the public is Liberal.',
        'If rebel art goes out of style',
        'Street Smarts is essential for avoiding the cops.',
        'Some of those cops are out to get you.',
        'This activity is not yet documented.',
      };

      for (final type in ActivityType.values) {
        erase();
        console.injectKey('x');
        await helpOnActivity(type);
        final text = _consoleText();
        for (final prefix in sourcePrefixes) {
          expect(text, isNot(contains(prefix)), reason: type.name);
        }
      }
    },
  );
}
