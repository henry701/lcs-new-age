import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/basemode/disbanding.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/crime_squad.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/politics/laws.dart';
import 'package:lcs_new_age/saveload/save_load.dart';
import 'package:lcs_new_age/title_screen/game_over.dart';
import 'package:lcs_new_age/title_screen/high_scores.dart';
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

  test('built-in squad name is localized in daily activity messages', () {
    expect(
      localizedSquadName('The Liberal Crime Squad'),
      equals('O Esquadrão do Crime Liberal'),
    );
    expect(localizedSquadName('Minha Equipe'), equals('Minha Equipe'));
  });

  test('high scores localize built-in slogans but preserve custom text', () {
    expect(
      CrimeSquad.localizedSlogan('Revolution never comes with a warning!'),
      equals('A revolução nunca avisa quando vem!'),
    );
    expect(
      CrimeSquad.localizedSlogan('Minha palavra de ordem'),
      'Minha palavra de ordem',
    );
  });

  test('activity banner clears stale text before a shorter result', () {
    final squad = Squad.temporary();
    squad.activity = Activity(ActivityType.recruiting);
    console.mvaddstr(0, 40, 'STALE ACTIVITY', noTranslate: true);

    printSquadActivityDescription(0, 40, squad);

    expect(_consoleLine(0), isNot(contains('STALE ACTIVITY')));
    expect(_consoleLine(0), contains('Recrutando'));
  });

  test('daily event messages clear stale row text before a shorter result', () {
    console.mvaddstr(
      8,
      1,
      'Uma mensagem diária muito mais longa que a próxima',
      noTranslate: true,
    );
    showAdvanceDayMessage(8, 1, lightGray, 'Recruiting');

    expect(_consoleLine(8), equals(' Recrutando'));
  });

  test('long Portuguese daily result messages end with an ellipsis', () {
    showAdvanceDayMessage(
      8,
      1,
      lightGray,
      '{squad} decided {site} was too hot to risk.',
      params: {
        'squad': 'O Esquadrão do Crime Liberal',
        'site': 'Estação Velho',
      },
    );

    final line = _consoleLine(8);
    expect(line, endsWith('…'));
    expect(line.length, lessThanOrEqualTo(console.width));
  });

  test('Portuguese agenda alignment legend is translated and fits one row', () {
    const labels = [
      'Elite Liberal',
      'Liberal',
      'moderate',
      'Conservative',
      'Arch Conservative',
    ];
    final legend = labels
        .map((label) => LcsI18n.processString(label, null))
        .join(' - ');

    expect(legend, contains('Liberal de Elite'));
    expect(legend, contains('moderado'));
    expect(legend, contains('Conservador'));
    expect(legend, contains('Arqui-Conservador'));
    expect(legend.length, lessThanOrEqualTo(80));
  });

  test('Portuguese agenda exit footer stays readable at the console edge', () {
    expect(LcsI18n.tr('Any Other Key - Exit'), equals('Outra tecla - Sair'));
    expect(LcsI18n.tr('Any Other Key - Exit').length, lessThanOrEqualTo(20));
  });

  test('Portuguese agenda polling headline translates dynamic labels', () {
    expect(
      LcsI18n.processString('President {name}', {'name': 'Alex'}),
      equals('Presidente Alex'),
    );
    expect(
      LcsI18n.tr('a recent sports scandal'),
      equals('um escândalo esportivo recente'),
    );
    expect(
      LcsI18n.processString('{percent}% ', {'percent': '42.0'}),
      equals('42.0% '),
    );
  });

  test('Portuguese agenda polling phrases use plural finite verbs', () {
    const expected = {
      'support LGBTQ+ rights': 'apoiam os direitos LGBTQ+',
      'oppose the death penalty': 'opõem-se à pena de morte',
      'favor doing more for gender equality':
          'defendem mais ações pela igualdade de gênero',
      'agree that more work is needed for racial equality':
          'concordam que é preciso fazer mais pela igualdade racial',
      'want to legalize marijuana': 'querem legalizar a maconha',
      'support keeping marijuana legal': 'apoiam manter a maconha legalizada',
      'support Liberal immigration policy':
          'apoiam a política liberal de imigração',
      'find Conservative AM Radio distasteful':
          'consideram o Rádio AM Conservador de mau gosto',
      'support universal healthcare': 'apoiam a saúde universal',
      'want a government-run retirement system':
          'querem um sistema de aposentadoria estatal',
    };

    for (final entry in expected.entries) {
      expect(LcsI18n.tr(entry.key), equals(entry.value), reason: entry.key);
    }
  });

  test('Portuguese agenda public-interest levels are translated', () {
    expect(LcsI18n.tr('Huge'), equals('Enorme'));
    expect(LcsI18n.tr('High'), equals('Alto'));
    expect(LcsI18n.tr('Moderate'), equals('Moderado'));
    expect(LcsI18n.tr('Low'), equals('Baixo'));
    expect(LcsI18n.tr('Minimal'), equals('Mínimo'));
    expect(LcsI18n.tr('None'), equals('Nenhuma'));
  });

  test(
    'Portuguese agenda polling rows expose clipped text with an ellipsis',
    () {
      final fitted = fitConsoleText(
        LcsI18n.tr('want more freedom to criticize the government'),
        30,
      );

      expect(fitted.length, lessThanOrEqualTo(30));
      expect(fitted, endsWith('…'));
    },
  );

  test('Portuguese agenda law labels are fitted to their cells', () {
    mvaddstrcFitted(0, 8, lightGreen, Law.animalRights.label, 18);

    final line = _consoleLine(0);
    expect(line, contains('Direitos dos Anim…'));
    expect(line.length, lessThanOrEqualTo(26));
  });

  test('Portuguese political summaries are bounded to the console width', () {
    final summary = summaryText([125, 50, 30, 15, 170]);

    mvaddstrFitted(
      0,
      0,
      'House: {summary}',
      console.width,
      params: {'summary': summary},
    );

    expect(_consoleLine(0).length, lessThanOrEqualTo(80));
    expect(_consoleLine(0), contains('Casa:'));
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
      '4 - Make a Flag': '4 - Fazer uma Bandeira',
      '5 - Procure a Wheelchair': '5 - Arranjar uma cadeira de rodas',
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
      equals('Entre - Retornar ao menu principal'),
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
      LcsI18n.processString(r'$ Taxed: {count}', {'count': '1200'}),
      LcsI18n.processString(r'$ Spent: {count}', {'count': '1200'}),
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

  test(
    'Portuguese fastest-victory title score stays inside the frame border',
    () {
      final highScores = HighScores();
      highScores.universalVictories = 1;
      highScores.scoreList.add(
        HighScore(
          slogan: 'Avante',
          month: 2,
          year: 2026,
          statRecruits: 1,
          statMartyrs: 0,
          statKills: 0,
          statKidnappings: 0,
          statFunds: 0,
          statSpent: 0,
          statBuys: 0,
          statBurns: 0,
          endType: Ending.victory,
        ),
      );

      titleScreenFrame(bottom: 23);
      titleScreenScores(highScores, startY: 17);

      expect(_consoleLine(20), contains('Vitória mais rápida: Fevereiro/2026'));
      expect(console.buffer[20][78].glyph, ' ');
      expect(console.buffer[20][79].glyph, ' ');
    },
  );

  test('Portuguese high-score heading uses normal noun capitalization', () {
    expect(LcsI18n.tr('The Liberal ELITE'), equals('A Elite Liberal'));
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

  test('Portuguese activity header stays inside its right-hand cell', () {
    final previousCities = gameState.cities;
    try {
      final city = City('Seattle, WA', 'Seattle', '');
      gameState.cities = [city];
      final district = city.addDistrict('Comércio', 'Comércio');
      final site = Site(SiteType.pawnShop, city, district)
        ..rename('Storms — Casa de penhores e armas', 'Pawnshop');
      district.sites.add(site);
      final squad = Squad()
        ..activity = Activity(ActivityType.visit, idString: site.idString);

      printSquadActivityDescription(0, 41, squad);

      final line = _consoleLine(0);
      expect(line.length, lessThanOrEqualTo(80));
      expect(line.substring(41), equals('Visitando Casa de Penhores'));
    } finally {
      gameState.cities = previousCities;
    }
  });

  test('Portuguese sleeper site cells leave room for activity text', () {
    mvaddstrcFitted(
      2,
      42,
      lightGray,
      'DC — Casa Branca',
      15,
      noTranslate: true,
    );
    mvaddstr(2, 58, 'Mantendo Discrição', noTranslate: true);

    final line = _consoleLine(2);
    expect(line.length, lessThanOrEqualTo(80));
    expect(console.buffer[2][58].glyph, equals('M'));
    expect(line.substring(42, 58).trimRight(), endsWith('…'));
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
