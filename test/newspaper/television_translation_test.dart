import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/console.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

const _televisionBodies = [
  "The police have brutally beaten a black man in Los Angeles.  "
      "The entire thing is caught on video by a passerby and it "
      "saturates the news.",
  "A Cable News anchor just accidentally let a Liberal guest "
      "finish a sentence.  Many viewers across the nation were listening.",
  "A new show glamorizing the lives of the rich begins "
      "airing this week.  With the nationwide advertising "
      "blitz, it's bound to be popular.",
  "A major Cable News channel has hired a slick new anchor "
      "for one of its news shows.  Guided by impressive "
      "advertising, America tunes in.",
  "A mutant affected by nuclear power appears on a popular "
      "talk show and demonstrates his superhuman intelligence and "
      "charisma, showcasing the upsides of consuming nuclear waste.",
];

const _portugueseBodies = [
  'A polícia espancou brutalmente um homem negro em Los Angeles.  '
      'Tudo é gravado em vídeo por um transeunte e domina o noticiário.',
  'Uma âncora de TV a cabo deixou acidentalmente um convidado Liberal '
      'terminar uma frase.  Muitos telespectadores de todo o país estavam ouvindo.',
  'Um novo programa que glamoriza a vida dos ricos começa a ser exibido '
      'esta semana.  Com a blitz publicitária nacional, certamente será popular.',
  'Um grande canal de notícias a cabo contratou um novo âncora sofisticado '
      'para um de seus programas de notícias.  Guiada por uma publicidade '
      'impressionante, a América sintoniza.',
  'Um mutante afetado pela energia nuclear aparece em um popular programa '
      'de entrevistas e demonstra sua inteligência e carisma sobre-humanos, '
      'mostrando as vantagens de consumir lixo nuclear.',
];

const _englishBodyMarkers = [
  'The police have brutally beaten',
  'The entire thing is caught on video',
  'saturates the news.',
  'A Cable News anchor just accidentally',
  'finish a sentence.  Many viewers across the nation were',
  'listening.',
  'A new show glamorizing the lives of the rich',
  'airing this week.  With the nationwide advertising',
  "blitz, it's bound to be popular.",
  'A major Cable News channel has hired a slick new anchor',
  'for one of its news shows.  Guided by impressive',
  'advertising, America tunes in.',
  'A mutant affected by nuclear power appears on a popular',
  'talk show and demonstrates his superhuman intelligence',
  'charisma, showcasing the upsides of consuming nuclear waste.',
];

String _normalizeWhitespace(String text) =>
    text.replaceAll(RegExp(r'\s+'), ' ').trim();

List<String> _renderArchiveBody(String body) {
  erase();
  addparagraph(0, 0, body, y2: console.height - 1, x2: console.width - 1);
  return console.buffer
      .map((row) => row.map((character) => character.glyph).join().trimRight())
      .where((line) => line.isNotEmpty)
      .toList();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test(
    'all television archive bodies translate at read time and fit the console',
    () {
      for (var index = 0; index < _televisionBodies.length; index++) {
        final rawBody = _televisionBodies[index];
        final translatedBody = LcsI18n.processString(rawBody, null);
        final renderedLines = _renderArchiveBody(rawBody);

        expect(translatedBody, equals(_portugueseBodies[index]));
        expect(
          _normalizeWhitespace(renderedLines.join(' ')),
          equals(_normalizeWhitespace(_portugueseBodies[index])),
        );
        expect(
          renderedLines,
          everyElement(hasLength(lessThanOrEqualTo(CONSOLE_WIDTH - 1))),
        );
        for (final marker in _englishBodyMarkers) {
          expect(translatedBody, isNot(contains(marker)), reason: marker);
          expect(
            renderedLines.join(' '),
            isNot(contains(marker)),
            reason: marker,
          );
        }
      }

      final rawArchive = _televisionBodies.join(' ');
      for (final marker in _englishBodyMarkers) {
        expect(rawArchive, contains(marker), reason: marker);
      }
    },
  );

  test(
    'raw television archive bodies follow a runtime locale switch',
    () async {
      for (var index = 0; index < _televisionBodies.length; index++) {
        final ptLines = _renderArchiveBody(_televisionBodies[index]);
        expect(
          _normalizeWhitespace(ptLines.join(' ')),
          equals(_normalizeWhitespace(_portugueseBodies[index])),
        );
      }

      await LcsI18n.setLocale('en_US');
      for (final body in _televisionBodies) {
        expect(LcsI18n.processString(body, null), equals(body));
        expect(
          _normalizeWhitespace(_renderArchiveBody(body).join(' ')),
          equals(_normalizeWhitespace(body)),
        );
      }
    },
  );
}
