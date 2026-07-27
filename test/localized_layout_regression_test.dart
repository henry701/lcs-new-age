import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/saveload/save_load.dart';
import 'package:lcs_new_age/title_screen/title_screen.dart';
import 'package:lcs_new_age/utils/colors.dart';

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

  test(
    'long Portuguese continue-founder option cannot collide with right column',
    () {
      addOptionTextFitted(
        11,
        titleMenuLeftColumnX,
        'C',
        'C - Continue as {founder:color}',
        titleMenuLeftColumnWidth,
        params: {'founder': 'Bree Underdown', 'founderColor': 'G'},
      );
      addOptionText(11, titleMenuRightColumnX, 'L', 'L - Load & Manage Saves');

      expect(
        _consoleLine(11).substring(titleMenuLeftColumnX, titleMenuRightColumnX),
        isNot(contains('UnderdownL')),
      );
      expect(console.x, lessThanOrEqualTo(titleMenuRightEdgeExclusive));
    },
  );

  test('Portuguese regular-activity submenu labels translate and fit', () {
    const labels = {
      '1 - Community Service': '1 - Serviço Comunitário',
      '2 - Liberal Disobedience': '2 - Desobediência Liberal',
      '3 - Graffiti': '3 - Grafite',
      '4 - Hacking (Need Den)': '4 - Hackeamento (Precisa de Covil)',
      '6 - Stream Guardian TV (Need Studio)':
          '6 - TV Guardião (Precisa de Estúdio)',
      '1 - Solicit Donations': '1 - Solicitar Doações',
      '2 - Make and Sell Clothing': '2 - Fazer e Vender Roupas',
      '3 - Make and Sell Art': '3 - Fazer e Vender Arte',
      '4 - Perform Live Music': '4 - Fazer Música ao Vivo',
      '1 - Practice a Skill (Free)': '1 - Praticar uma Habilidade (Grátis)',
      '2 - Take Paid Classes (\$30/day)': '2 - Fazer Aulas Pagas (\$30/dia)',
      '1 - Recruiting': '1 - Recrutar',
      '2 - Steal a Car': '2 - Roubar um Carro',
      '3 - Make Clothing': '3 - Fazer Roupas',
      '1 - Teach Liberal Arts': '1 - Ensinar Artes Liberais',
      '2 - Teach Covert Ops': '2 - Ensinar Operações Secretas',
      '3 - Teach Fighting': '3 - Ensinar Luta',
      '1 - Go to the Hospital': '1 - Ir ao Hospital',
    };

    var y = 0;
    for (final entry in labels.entries) {
      addOptionTextFitted(y++, 40, entry.key[0], entry.key, 40);
      final line = _consoleLine(y - 1);
      expect(line, contains(entry.value));
      expect(line.length, lessThanOrEqualTo(80));
      expect(line, isNot(contains(entry.key.substring(4))));
    }
  });

  test('Portuguese acquisition footer stays inside the right column', () {
    mvaddstrcFitted(0, 40, lightGray, 'Laundry and mending clothing are', 40);
    mvaddstrcFitted(
      1,
      40,
      lightGray,
      'handled by Liberals set to Lay Low.',
      40,
    );

    expect(_consoleLine(0), contains('Lavar e remendar roupas é tarefa dos'));
    expect(_consoleLine(0).length, lessThanOrEqualTo(80));
    expect(_consoleLine(1).length, lessThanOrEqualTo(80));
  });

  test('Portuguese save-list cells do not merge at column boundaries', () {
    renderSaveMenuListRow(
      y: 2,
      key: 'A',
      inGameDate: '6 de jan de 2023',
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

  test('Portuguese save actions and compact dates stay readable', () {
    addOptionText(0, 0, 'L', 'L - Load Game');
    expect(_consoleLine(0), contains('L - Carregar jogo'));

    erase();
    renderSaveMenuListRow(
      y: 0,
      key: 'A',
      inGameDate: '18/jul/2026',
      founder: 'Justin Arafata',
      lastPlayed: '18 de Jul de 2026',
      version: '1.5.5',
      isOutdated: false,
    );
    expect(_consoleLine(0), contains('18/jul/2026'));
    expect(_consoleLine(0), isNot(contains('20…')));
  });

  test('Portuguese high-score labels fit their fixed columns', () {
    for (final text in [
      LcsI18n.processString('Flags Bought: {buys}', {'buys': '12'}),
      LcsI18n.processString('Flags Burned: {burns}', {'burns': '12'}),
    ]) {
      expect(text.length, lessThanOrEqualTo(20), reason: text);
    }
    expect(
      LcsI18n.processString('Fastest Victory: {month} {year}', {
        'month': 'Fevereiro',
        'year': '2026',
      }).length,
      lessThanOrEqualTo(36),
    );
  });

  test('Portuguese vehicle guidance keeps every line visible', () {
    for (final text in [
      'Note:  Vehicles in yellow have already been selected by another squad.',
      '       Vehicles in red have been selected by both this squad and another.',
      '       These cars may be used by both squads but not on the same day.',
    ]) {
      expect(
        LcsI18n.processString(text, null).length,
        lessThanOrEqualTo(79),
        reason: text,
      );
    }
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

  test('Portuguese squadless-base footer fits without truncation', () {
    addOptionTextFitted(24, 0, 'Z', 'Z - Assemble a New Squad.  ', 31);
    addOptionTextFitted(
      24,
      31,
      'T',
      'T - Assign New Bases to the Squadless.',
      49,
    );

    expect(
      _consoleLine(24),
      endsWith('T - Atribuir bases aos Liberais sem esquadrão.'),
    );
    expect(_consoleLine(24).length, lessThanOrEqualTo(80));
  });

  test('Portuguese squad review names stay inside the location column', () {
    final squadName = LcsI18n.tr('The Liberal Crime Squad');
    addOptionTextFitted(2, 0, 'A', 'A - $squadName', 31, noTranslate: true);

    expect(_consoleLine(2), endsWith('…'));
    expect(_consoleLine(2), isNot(contains('Crime LiberaSEA')));
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
