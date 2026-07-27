import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/title_screen/title_screen.dart';

String _consoleText() => console.buffer
    .map((line) => line.map((character) => character.glyph).join().trimRight())
    .join('\n');

String _normalizedConsoleText() =>
    _consoleText().replaceAll(RegExp(r'\s+'), ' ').trim();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
    erase();
    move(0, 0);
  });

  tearDown(LcsI18n.reset);

  test('interface option labels and explanations render in Portuguese', () {
    renderInterfaceOptionsMenu();

    final screen = _normalizedConsoleText();
    expect(screen, contains('E - Avisos de Encontros'));
    expect(screen, contains('Adiciona uma confirmação ao encontrar pessoas'));
    expect(screen, contains('passe acidentalmente por eles'));
    expect(screen, contains('P - Teclas padrão de Page Up/Down'));
    expect(screen, contains('Altera apenas os prompts'));
    expect(screen, contains('Esta opção altera o tamanho da fonte no jogo'));
    expect(screen, contains('linhas pretas apareçam'));
    expect(screen, contains('B - Voltar à Tela Inicial'));
    expect(screen, isNot(contains('Default is')));
    expect(screen, isNot(contains('Only changes the prompts')));
  });

  test('content option explanation renders in Portuguese', () {
    renderContentAndToneOptionsMenu();

    final screen = _normalizedConsoleText();
    expect(screen, contains('L - Tom mais claro'));
    expect(screen, contains('Ajusta parte dos textos de ambientação'));
    expect(screen, contains('experiências traumáticas'));
    expect(screen, contains('frequência com que notícias sobre'));
    expect(screen, contains('Esta opção não altera as mecânicas do jogo'));
    expect(screen, isNot(contains('Adjusts some of the heavier')));
  });

  test('language explanation renders in Portuguese', () {
    renderLanguageOptionsMenu();

    final screen = _normalizedConsoleText();
    expect(screen, contains('OPÇÕES DE IDIOMA'));
    expect(screen, contains('Selecione seu idioma preferido'));
    expect(screen, contains('A seleção de idioma afeta todo o texto do jogo'));
    expect(screen, contains('As mudanças entram em vigor imediatamente'));
    expect(screen, isNot(contains('Language selection affects')));
  });
}
