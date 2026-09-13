import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/disbanding.dart';
import 'package:lcs_new_age/basemode/review_mode.dart';
import 'package:lcs_new_age/common_actions/equipment.dart';
import 'package:lcs_new_age/daily/siege.dart';
import 'package:lcs_new_age/engine/console.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/newspaper/television.dart';
import 'package:lcs_new_age/talk/talk_outside_combat.dart';
import 'package:lcs_new_age/title_screen/launch_game.dart';

String _line(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

String _cells(int y, int start, int end) => console.buffer[y]
    .sublist(start, end)
    .map((character) => character.glyph)
    .join();

String _normalized(int first, int last) => List.generate(
  last - first + 1,
  (offset) => _line(first + offset),
).join(' ').replaceAll(RegExp(r'\s+'), ' ').trim();

const _televisionCases = [
  (
    topY: 19,
    x: 13,
    frameWidth: 65,
    english:
        'The police have brutally beaten a black man in Los Angeles.  '
        'The entire thing is caught on video by a passerby and it '
        'saturates the news.',
    portuguese:
        'A polícia espancou brutalmente um homem negro em Los Angeles. '
        'Tudo é gravado em vídeo por um transeunte e domina o noticiário.',
  ),
  (
    topY: 19,
    x: 13,
    frameWidth: 65,
    english:
        'A Cable News anchor just accidentally let a Liberal guest '
        'finish a sentence.  Many viewers across the nation were listening.',
    portuguese:
        'Uma âncora de TV a cabo deixou acidentalmente um convidado Liberal '
        'terminar uma frase. Muitos telespectadores de todo o país estavam ouvindo.',
  ),
  (
    topY: 19,
    x: 13,
    frameWidth: 65,
    english:
        "A new show glamorizing the lives of the rich begins airing this "
        "week.  With the nationwide advertising blitz, it's bound to be popular.",
    portuguese:
        'Um novo programa que glamoriza a vida dos ricos começa a ser exibido '
        'esta semana. Com a blitz publicitária nacional, certamente será popular.',
  ),
  (
    topY: 19,
    x: 13,
    frameWidth: 65,
    english:
        'A major Cable News channel has hired a slick new anchor for one of '
        'its news shows.  Guided by impressive advertising, America tunes in.',
    portuguese:
        'Um grande canal de notícias a cabo contratou um novo âncora '
        'sofisticado para um de seus programas de notícias. Guiada por uma '
        'publicidade impressionante, a América sintoniza.',
  ),
  (
    topY: 18,
    x: 11,
    frameWidth: 65,
    english:
        'A mutant affected by nuclear power appears on a popular talk show '
        'and demonstrates his superhuman intelligence and charisma, '
        'showcasing the upsides of consuming nuclear waste.',
    portuguese:
        'Um mutante afetado pela energia nuclear aparece em um popular '
        'programa de entrevistas e demonstra sua inteligência e carisma '
        'sobre-humanos, mostrando as vantagens de consumir lixo nuclear.',
  ),
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
    erase();
    move(0, 0);
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('PT-419 keeps disband controls complete and separated', () {
    printDisbandingFooter();

    final row = _line(24);
    expect(row, contains('R - Recriar o Esquadrão do Crime Liberal'));
    expect(row, contains('Qualquer Outra Tecla - Próximo Mês'));
    expect(row.indexOf('Qualquer Outra Tecla'), greaterThan(43));
    expect(console.buffer[24].length, CONSOLE_WIDTH);
    expect(_line(24).length, lessThanOrEqualTo(CONSOLE_WIDTH));
    expect(
      row.substring(row.indexOf('Esquadrão do Crime Liberal') + 26),
      isNot(contains('Recriar')),
    );
  });

  test('PT-420 preserves the complete disband confirmation instruction', () {
    printDisbandConfirmationPrompt();

    expect(
      _normalized(13, 14),
      equals(
        'Digite esta frase Liberal para confirmar '
        '(pressione uma letra errada para repensar):',
      ),
    );
    expect(_line(13).length, lessThanOrEqualTo(CONSOLE_WIDTH));
    expect(_line(14).length, lessThanOrEqualTo(CONSOLE_WIDTH));
    expect(_line(15), isEmpty);
  });

  test('PT-421 keeps review and equipment base instructions complete', () {
    printReviewBaseAssignPrompt();
    expect(
      _line(21),
      equals(
        'Use letras para designar bases. Use números para selecionar uma base.',
      ),
    );

    erase();
    printEquipmentBaseAssignPrompt();
    expect(
      _line(22),
      equals(
        'Use letras para atribuir bases. Use números para selecionar uma base.',
      ),
    );
    expect(_line(22).length, lessThanOrEqualTo(CONSOLE_WIDTH));
  });

  test('PT-422 renders siege warnings without edge clipping', () {
    final nextRow = printDeathSquadWarning(10);
    expect(
      _normalized(10, 11),
      equals(
        'Eles estão prontos para usar força letal se houver qualquer sinal '
        'de resistência.',
      ),
    );
    expect(nextRow, 12);

    erase();
    printAnonymousCorporateRaidWarning();
    expect(
      _normalized(8, 9),
      equals(
        'Você recebeu uma dica anônima de que várias corporações estão '
        'contratando mercenários para atacar o LCS.',
      ),
    );

    erase();
    printEscapeSiegePrompt();
    expect(
      _line(13).trim(),
      equals(
        'Pressione qualquer tecla para se separar e ficar escondido por alguns dias',
      ),
    );
    expect(_line(13), endsWith(' dias'));
    expect(_line(13).length, lessThanOrEqualTo(CONSOLE_WIDTH));
  });

  test('PT-423 keeps every television overlay frame closed and localized', () {
    for (final overlay in _televisionCases) {
      erase();
      renderTelevisionOverlay(
        topY: overlay.topY,
        x: overlay.x,
        frameWidth: overlay.frameWidth,
        body: overlay.english,
      );

      final bottomY = overlay.topY + 4;
      expect(console.buffer[overlay.topY][overlay.x].glyph, '┌');
      expect(
        console.buffer[overlay.topY][overlay.x + overlay.frameWidth - 1].glyph,
        '┐',
      );
      expect(console.buffer[bottomY][overlay.x].glyph, '└');
      expect(
        console.buffer[bottomY][overlay.x + overlay.frameWidth - 1].glyph,
        '┘',
      );
      for (var y = overlay.topY; y <= bottomY; y++) {
        expect(y, lessThan(console.height));
        expect(
          overlay.x + overlay.frameWidth,
          lessThanOrEqualTo(CONSOLE_WIDTH),
        );
      }
      for (var y = overlay.topY + 1; y < bottomY; y++) {
        expect(
          console.buffer[y][overlay.x + overlay.frameWidth - 1].glyph,
          '│',
          reason: 'row $y of ${overlay.english}',
        );
      }

      final prose = [
        _cells(
          overlay.topY + 1,
          overlay.x + 1,
          overlay.x + overlay.frameWidth - 1,
        ),
        _cells(
          overlay.topY + 2,
          overlay.x + 1,
          overlay.x + overlay.frameWidth - 1,
        ),
        _cells(
          overlay.topY + 3,
          overlay.x + 1,
          overlay.x + overlay.frameWidth - 1,
        ),
      ].join(' ').replaceAll(RegExp(r'\s+'), ' ').trim();
      expect(prose, equals(overlay.portuguese));
      expect(prose, isNot(contains('The police have brutally beaten')));
      expect(prose, isNot(contains('A Cable News anchor just accidentally')));
      expect(prose, isNot(contains("it's bound to be popular")));
      expect(prose, isNot(contains('America tunes in')));
      expect(prose, isNot(contains('consuming nuclear waste')));
    }
  });

  test('PT-424 wraps the homeless relocation note with its punctuation', () {
    printHomelessPossessionNote();

    expect(
      _normalized(15, 16),
      equals(
        '<Seus pertences neste local foram movidos para o acampamento '
        'de moradores de rua.>',
      ),
    );
    expect(_line(16), endsWith('>'));
    expect(_line(15).length, lessThanOrEqualTo(CONSOLE_WIDTH));
    expect(_line(16).length, lessThanOrEqualTo(CONSOLE_WIDTH));
  });

  test('PT-425 shows complete conservative interruption footers', () {
    printConservativeInterruptionFooter(true);
    expect(
      _line(24),
      equals(
        'Pressione uma tecla para continuar o jogo após esta interrupção Conservadora.',
      ),
    );

    erase();
    printConservativeInterruptionFooter(false);
    expect(
      _line(24),
      equals(
        'Pressione uma tecla para reiniciar o jogo após esta interrupção Conservadora.',
      ),
    );
    expect(_line(24).length, lessThanOrEqualTo(CONSOLE_WIDTH));
    expect(_line(24), endsWith('.'));
  });
}
