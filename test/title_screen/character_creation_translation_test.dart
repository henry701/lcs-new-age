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

  test('founder biography choices avoid gendered self-description', () {
    const neutralTranslations = {
      'I was obsessed with Japanese swords and started lifting weights.':
          'Eu tinha obsessão por espadas japonesas e comecei a levantar pesos.',
      'I volunteered for a left-wing candidate.  {pronoun} didn\'t even come close.':
          'Fiz voluntariado para uma candidatura de esquerda. {pronoun} nem chegou perto de vencer.',
      'I got caught making out with {person}.  So God hated me for that?':
          'Me pegaram aos beijos com {person}. Então Deus me odiava por isso?',
      'I was a daydreamer.  What is, what was, what could be.':
          'Eu vivia no mundo da lua. O que é, o que foi, o que poderia ser.',
      'I got caught hacking my grades.  But they made it so fucking easy!':
          'Me pegaram hackeando minhas notas. Mas deixaram tudo fácil pra caralho!',
      'a violent gang leader.  Nothing can change me, or stand in my way.':
          'Eu liderava uma gangue violenta. Nada pode me mudar nem ficar no meu caminho.',
      'I was mischevious, and always up to something.':
          'Eu vivia aprontando e sempre inventava alguma coisa.',
      'I was grounded from electronics.  I spent a lot of time drawing.':
          'Me proibiram de usar aparelhos eletrônicos. Passei muito tempo desenhando.',
      'I was the head of the class, and I worked very hard.':
          'Eu liderava a turma e trabalhava muito.',
      'I was never punished.  I was good at lying.  Their innocent little angel.':
          'Nunca recebi castigo. Eu sabia mentir. Para eles, eu era a inocência em pessoa.',
      'I was locked in my room, where I studied quietly by myself, alone.':
          'Eu passava o tempo no quarto, estudando em silêncio por conta própria.',
      'I was the class clown.  I even had some friends.':
          'Eu era quem fazia a turma rir. Eu até tinha alguns amigos.',
      'I started robbing houses:  rich people only.  I was fed up with their crap.':
          'Comecei a roubar casas: só de gente rica. Eu já não aguentava mais aquela merda.',
      'surviving alone, just like everyone else.  But we can\'t go on like this.':
          'sobreviver por conta própria, assim como todo mundo. Mas não podemos continuar assim.',
      'I was unruly and often fought with other children.':
          'Eu vivia arrumando confusão e frequentemente brigava com outras crianças.',
      'I tried starting a band.  I had to play all the instruments myself.':
          'Tentei formar uma banda. Tive que tocar todos os instrumentos por conta própria.',
      'writing my manifesto and refining my image.  I\'m ready to change the world.':
          'escrevendo meu manifesto e refinando minha imagem. Estou a postos para mudar o mundo.',
    };

    for (final entry in neutralTranslations.entries) {
      expect(LcsI18n.tr(entry.key), entry.value, reason: entry.key);
    }
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
        'Fiz voluntariado para uma candidatura de esquerda. '
        'Ela nem chegou perto de vencer.',
      ),
    );
  });
}
