import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/saveload/save_load.dart';
import 'package:lcs_new_age/title_screen/title_screen.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    erase();
    move(0, 0);
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese save-management title option fits inside its frame', () {
    addOptionText(11, titleMenuRightColumnX, 'L', 'L - Load & Manage Saves');

    expect(_consoleLine(11), contains('L - Carregar e gerenciar salvamentos'));
    expect(console.x, lessThanOrEqualTo(titleMenuRightEdgeExclusive));
  });

  test('Portuguese save-list cells do not merge at column boundaries', () {
    renderSaveMenuListRow(
      y: 2,
      key: 'A',
      inGameDate: '6 de Jan de 2023',
      founder: 'Justin Arafata',
      lastPlayed: '18 de Jul de 2026',
      version: '1.5.5',
      isOutdated: false,
    );

    final line = _consoleLine(2);
    expect(line, contains('2023  Justin'));
    expect(line, contains('Arafata'));
    expect(line, contains('2026'));
    expect(line, contains('1.5.5'));
  });

  test('save manager uses one localized back instruction', () {
    console.addstrx(LcsI18n.processString(saveMenuFooterPrompt, null));
    expect(_consoleLine(0), equals('Pressione + para importar um salvamento.'));
    erase();
    expect(
      LcsI18n.processString(saveMenuBackButtonText, null),
      equals('Enter - Retornar ao menu principal'),
    );
    expect(saveMenuFooterPrompt, isNot(contains('Enter')));
  });

  test('save manager headers are localized', () {
    expect(
      LcsI18n.processString('Liberal Save Game Management System', null),
      equals('Sistema de Gerenciamento de Salvamentos Liberal'),
    );
    expect(
      saveMenuHeaders.map(
        (x, text) => MapEntry(x, LcsI18n.processString(text, null)),
      ),
      equals({
        saveMenuInGameDateX: 'DATA NO JOGO',
        saveMenuFounderX: 'LÍDER DO LCS',
        saveMenuLastPlayedX: 'ÚLTIMO ACESSO',
        saveMenuVersionX: 'VERSÃO',
      }),
    );
  });

  test('localized fallback hotkey highlights without duplicating a letter', () {
    addOptionText(
      24,
      0,
      'Any other key',
      'Any other key - continue the Struggle',
    );

    expect(_consoleLine(24), equals('Qualquer outra tecla - continue a Luta'));
  });

  test('wrapped inline options move intact to the next console row', () {
    move(23, 72);

    addInlineOptionTextWrapped(
      'O',
      'O - Order, ',
      leftMargin: 1,
      rightMargin: 1,
    );

    expect(_consoleLine(23), isEmpty);
    expect(_consoleLine(24), equals(' O - Ordenar,'));
  });

  test('Portuguese site-action legend fits in two console rows', () {
    move(23, 1);
    for (final (key, label) in [
      ('W', 'W,A,D,X - Move, '),
      ('G', 'G - Get, '),
      ('M', 'M - Map, '),
      ('E', 'E - Equip, '),
      ('S', 'S - Stall, '),
      ('L', 'L - Load, '),
      ('O', 'O - Order, '),
      ('U', 'U - Use, '),
      ('V', 'V - Flee, '),
      ('F', 'F - Fight, '),
      ('K', 'K - Kidnap, '),
      ('T', 'T - Talk, '),
      ('R', 'R - Release, '),
    ]) {
      addInlineOptionTextWrapped(
        key,
        label,
        leftMargin: 1,
        rightMargin: 1,
        compactLayout: true,
      );
    }
    addstr('?', noTranslate: true);

    expect(_consoleLine(23), contains('L:Carregar'));
    expect('${_consoleLine(23)}${_consoleLine(24)}', contains('U:Usar'));
    expect(_consoleLine(24), endsWith('?'));
    expect(console.y, equals(24));
    expect(console.x, lessThanOrEqualTo(79));
  });

  test('long Portuguese site actions never advance beyond the last row', () {
    move(23, 1);
    for (final (key, label) in [
      ('W', 'W,A,D,X - Move, '),
      ('G', 'G - Get, '),
      ('M', 'M - Map, '),
      ('E', 'E - Equip, '),
      ('S', 'S - Stall, '),
      ('L', 'L - Load, '),
      ('O', 'O - Order, '),
      ('U', 'U - Graffiti, '),
      ('V', 'V - Sneak, '),
      ('F', 'F - Fight, '),
      ('K', 'K - Kidnap, '),
      ('T', 'T - Talk, '),
      ('R', 'R - Reorganize, '),
    ]) {
      addInlineOptionTextWrapped(
        key,
        label,
        leftMargin: 1,
        rightMargin: 1,
        compactLayout: true,
      );
    }
    addstr('?', noTranslate: true);

    expect(_consoleLine(24), contains('R:Reorganizar'));
    expect(_consoleLine(24), endsWith('?'));
    expect(console.y, equals(24));
    expect(console.x, lessThanOrEqualTo(79));
  });
}
