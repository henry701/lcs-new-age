import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/title_screen/new_game.dart';
import 'package:lcs_new_age/title_screen/questions.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

String _normalizedConsoleLines(int first, int last) => List.generate(
  last - first + 1,
  (offset) => _consoleLine(first + offset),
).join(' ').replaceAll(RegExp(r'\s+'), ' ').trim();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
    erase();
    move(0, 0);
  });

  tearDown(LcsI18n.reset);

  test(
    'gameplay option categories, choices, and descriptions render in Portuguese',
    () {
      renderNewGameOptions(gameWorld: 0, ccsOption: 1, initiative: 0);

      expect(_consoleLine(7), contains('Clima político inicial'));
      expect(_consoleLine(7), contains('Os tempos estão mudando'));
      expect(
        _consoleLine(8),
        contains(
          'O país começa a deslizar para o autoritarismo de extrema-direita.',
        ),
      );
      expect(_consoleLine(10), contains('Esquadrão do Crime Conservador'));
      expect(_consoleLine(10), contains('Sangue Ruim'));
      expect(_consoleLine(13), contains('Dificuldade de combate'));
      expect(_consoleLine(13), contains('Poder para o povo'));

      renderNewGameOptions(gameWorld: 1, ccsOption: 0, initiative: 1);
      expect(_consoleLine(7), contains('O fim do mundo como o conhecemos'));
      expect(_consoleLine(10), contains('Céu Azul e Límpido'));
      expect(_consoleLine(11), contains('O CCS nunca aparecerá.'));
      expect(_consoleLine(13), contains('Bem-vindo à Selva'));

      renderNewGameOptions(gameWorld: 0, ccsOption: 2, initiative: 0);
      expect(_consoleLine(10), contains('Nós não iniciamos o fogo'));
      expect(
        _consoleLine(11),
        contains('O CCS começa ativo e extremamente forte.'),
      );
    },
  );

  test('Portuguese difficulty legend wraps without clipping', () {
    renderNewGameOptions(gameWorld: 0, ccsOption: 1, initiative: 0);

    expect(
      _normalizedConsoleLines(16, 18),
      equals('Dificuldade: Mais fácil - Padrão - Mais difícil'),
    );
    for (int y = 16; y <= 18; y++) {
      expect(_consoleLine(y).length, lessThanOrEqualTo(76));
    }
    expect(_consoleLine(20).trim(), equals('Entre - Continuar...'));
  });

  test('English difficulty legend remains on one line', () async {
    LcsI18n.reset();
    await LcsI18n.initialize('en_US');
    erase();

    renderNewGameOptions(gameWorld: 0, ccsOption: 1, initiative: 0);

    expect(
      _consoleLine(16).trim(),
      equals('Option difficulty ratings: Easier - Standard - Harder'),
    );
    expect(_consoleLine(17), isEmpty);
    expect(_consoleLine(20).trim(), equals('Enter - Continue...'));
  });

  test('character-creation prompts, options, and effects render in Portuguese', () {
    renderCharacterCreationPrompt(
      question: 'In the moments after I was born in 2004...',
      answers: const [
        (
          option:
              'American torture of prisoners in Iraq was revealed on national TV.',
          description: '+2 Agility, June 30th',
          params: null,
        ),
      ],
      choose: true,
    );

    expect(
      _consoleLine(9),
      equals('Nos momentos após meu nascimento, em 2004...'),
    );
    expect(
      _consoleLine(11),
      contains(
        'A - A tortura americana de prisioneiros no Iraque foi revelada na TV nacional.',
      ),
    );
    expect(_consoleLine(12), contains('+2 Agilidade, 30 de junho'));
  });

  test('gender-neutral goth biography stays neutral in Portuguese', () {
    expect(
      LcsI18n.tr(
        'and I went completely goth.  I had no friends and made my own clothes.',
      ),
      'e eu adotei o estilo gótico.  Não tinha amigos e fazia minhas próprias roupas.',
    );
  });

  test('long biography options wrap instead of disappearing at the edge', () {
    const option =
        'This biography answer is deliberately long enough to require a second line in the fixed-width console.';

    renderCharacterCreationPrompt(
      question: 'In the moments after I was born in 2004...',
      answers: const [
        (option: option, description: '+2 Agility, June 30th', params: null),
      ],
      choose: true,
    );

    final rendered = _normalizedConsoleLines(11, 13);
    expect(rendered, contains(option));
    expect(rendered, contains('+2 Agilidade, 30 de junho'));
  });

  test('wrapped biography option continuations stay indented', () {
    const option =
        'This biography answer is deliberately long enough to require a second line in the fixed-width console.';

    renderCharacterCreationPrompt(
      question: 'In the moments after I was born in 2004...',
      answers: const [(option: option, description: '', params: null)],
      choose: true,
    );

    expect(_consoleLine(12).substring(0, 4), equals('    '));
  });

  test('volunteer answer uses a translated capitalized pronoun', () {
    expect(
      localizedVolunteerCandidateOption(),
      equals(
        'Trabalhei como voluntário para uma candidatura de esquerda. '
        'Ela nem chegou perto de vencer.',
      ),
    );
  });
}
