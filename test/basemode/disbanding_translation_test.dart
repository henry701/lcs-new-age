import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/disbanding.dart';
import 'package:lcs_new_age/basemode/liberal_agenda.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/creature/name.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/politics.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

const _disbandConfirmationLines = [
  'Disbanding scatters the Liberal Crime Squad, sending all of its members',
  'into hiding, free to pursue their own lives.  You will be able to observe',
  'If at any time you determine that the Liberal Crime Squad will be needed',
  'again, you may return to the homeless camp to restart the campaign.',
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GameState previousGameState;

  setUp(() async {
    previousGameState = gameState;
    gameState = GameState();
    erase();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    gameState = previousGameState;
    LcsI18n.reset();
    erase();
  });

  test(
    'Portuguese disbanding summary translates executive alignment labels',
    () {
      politics.exec[Exec.president] = DeepAlignment.moderate;
      politics.execName[Exec.president] = FullName(
        'Don',
        '',
        'Justice',
        Gender.male,
      );

      printExec();

      expect(_consoleLine(1), contains('Presidente: Don Justice, moderado'));
      expect(_consoleLine(1), isNot(contains('moderate')));
    },
  );

  test('Portuguese disbanding summary translates conservative executives', () {
    politics.exec[Exec.president] = DeepAlignment.conservative;
    politics.execName[Exec.president] = FullName(
      'Aidan',
      '',
      'Woods',
      Gender.male,
    );

    printExec();

    expect(_consoleLine(1), contains('Presidente: Aidan Woods, Conservador'));
    expect(_consoleLine(1), isNot(contains('Conservative')));
  });

  test('Portuguese disband confirmation lines fit the 80-column console', () {
    for (final sourceLine in _disbandConfirmationLines) {
      final localizedLine = LcsI18n.processString(sourceLine, null);
      mvaddstr(0, 0, sourceLine);

      expect(strLenX(localizedLine), lessThanOrEqualTo(console.width));
      expect(_consoleLine(0), equals(localizedLine));
      erase();
    }
  });

  test(
    'Portuguese disband confirmation localizes and matches every issue phrase',
    () async {
      const expectedTranslations = {
        'Racial Justice': 'Justiça Racial',
        'Free Speech': 'Liberdade de Expressão',
        'Gay Marriage': 'Casamento Gay',
        'Abortion Rights': 'Direitos ao Aborto',
        'Separation Clause': 'Cláusula de Separação',
        'Racial Equality': 'Igualdade Racial',
        'Gun Control': 'Controle de Armas',
        'Campaign Finance Reform': 'Reforma de Financiamento de Campanha',
        'Animal Rights': 'Direitos dos Animais',
        'Union Organizing': 'Organização Sindical',
        'Black Lives Matter': 'Vidas Negras Importam',
        'Climate Change': 'Mudança Climática',
        'Immigration Reform': 'Reforma de Imigração',
        'Human Rights': 'Direitos Humanos',
        'Liberal Feminism': 'Feminismo Liberal',
        'Trans Rights': 'Direitos Trans',
        'Right To Privacy': 'Direito à Privacidade',
        'Legalized Marijuana': 'Maconha Legalizada',
        'Flag Burning': 'Queima de Bandeira',
        'Criminal Justice Reform': 'Reforma da Justiça Criminal',
        'Conflict Resolution': 'Resolução de Conflitos',
        'Progressive Taxation': 'Tributação Progressiva',
      };

      expect(disbandConfirmationIssues, hasLength(22));
      for (final issue in disbandConfirmationIssues) {
        final phrase = LcsI18n.tr(issue);
        expect(phrase, equals(expectedTranslations[issue]), reason: issue);
        expect(phrase, isNot(equals(issue)), reason: issue);

        for (var x = 0; x < phrase.length; x++) {
          mvaddchar(15, x, phrase[x]);
        }
        expect(_consoleLine(15), equals(phrase), reason: issue);

        var position = 0;
        while (position < phrase.length) {
          final expectedKey = phrase[position].toLowerCase().codePoint;
          expect(
            matchesDisbandConfirmationInput(phrase, position, expectedKey),
            isTrue,
            reason: '$issue at position $position',
          );
          expect(
            matchesDisbandConfirmationInput(phrase, position, expectedKey + 1),
            isFalse,
            reason: '$issue rejects wrong input at position $position',
          );
          position = nextDisbandConfirmationPosition(phrase, position);
        }
        erase();
      }

      await LcsI18n.setLocale('en_US');
      for (final issue in disbandConfirmationIssues) {
        expect(LcsI18n.tr(issue), equals(issue), reason: issue);
      }
    },
  );
}
