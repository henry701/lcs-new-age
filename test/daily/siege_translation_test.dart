import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/daily/siege.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/siege.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/title_screen/world.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    makeWorld();
    await LcsI18n.initialize('pt_BR');
    erase();
    move(0, 0);
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese police warning uses a natural questioning phrase', () async {
    final site = sites.first;
    console.injectKey('Enter');

    await stateBrokenLaws(site);

    expect(
      _consoleLine(4).trim(),
      'Você está sendo procurado para interrogatório!',
    );
    expect(_consoleLine(4), isNot(contains('procurado por interrogatório')));
  });

  test('Portuguese CIA raid arrival sentence translates the full template', () {
    const template =
        'In the dead of the night, a column of unmarked black vans with '
        'tinted windows surrounds the {location}.';

    expect(
      LcsI18n.processString(template, {'location': 'Antigo Motel'}),
      'No meio da noite, uma coluna de vans pretas sem identificação e com '
      'vidros escuros cerca o local chamado Antigo Motel.',
    );

    expect(
      LcsI18n.processString(template, {'location': 'Estação Esquecida'}),
      'No meio da noite, uma coluna de vans pretas sem identificação e com '
      'vidros escuros cerca o local chamado Estação Esquecida.',
    );
  });

  test('pretranslated CIA paragraphs are not translated a second time', () {
    const template =
        'In the dead of the night, a column of unmarked black vans with '
        'tinted windows surrounds the {location}.';
    final rendered = LcsI18n.processString(template, {
      'location': 'Armazém Assombrado',
    });

    addparagraph(0, 1, rendered, noTranslate: true);

    expect(_consoleLine(0), contains('No meio da noite'));
    expect(LcsI18n.getMissingTranslations(), isNot(contains(rendered)));
  });

  test('Portuguese medical debt briefings translate complete templates', () {
    expect(
      LcsI18n.processString(medicalDebtArrivalBriefing, {
        'location': 'Acampamento sem-teto',
      }),
      'Uma pequena frota de ambulâncias cerca a entrada do local chamado '
      'Acampamento sem-teto. Quando as portas se abrem, um bando de '
      'trabalhadores de '
      'escritório em ternos baratos desce, segurando rifles que a maioria '
      'parece não saber usar.',
    );
    expect(
      LcsI18n.tr(medicalDebtCollectionSpeech),
      'Um contador desengonçado sobe em uma das ambulâncias e fala em um '
      'alto-falante: "Esquadrão do Crime Liberal! Viemos cobrar suas contas '
      'hospitalares em atraso! Não temos nada contra vocês por motivos '
      'políticos; não vamos tentar levá-los à justiça nem nada disso, mas '
      'vocês nos devem uma bolada e viemos acertar a dívida!"',
    );
    expect(
      LcsI18n.tr(medicalDebtFinanceSpeech),
      'O contador ergue um AR-15 de qualquer jeito e continua: "Abram e '
      'teremos uma conversa amigável! Sem nossas armas, inclusive! Tenho '
      'umas canetas ótimas para assinarmos a papelada, e até trouxemos '
      'donuts! São sem glúten; vocês vão gostar! Por favor, não queremos '
      'atirar em ninguém, somos do departamento financeiro!"',
    );
  });

  test('Portuguese unoccupied raid lines localize roles and fit site names', () {
    final source = File('lib/daily/siege.dart').readAsStringSync();
    expect(source, contains('localizedCreatureName(p)'));
    expect(source, contains('mvaddstrcFitted('));

    const template =
        'The cops have raided the {location}, an unoccupied safehouse.';
    final rendered = LcsI18n.processString(template, {
      'location': 'Escola Velha',
    });
    expect(
      rendered,
      'Os policiais invadiram o local chamado Escola Velha, um esconderijo vazio.',
    );
    expect(rendered, endsWith('.'));

    erase();
    mvaddstrFitted(
      8,
      1,
      template,
      console.width - 1,
      params: {'location': 'Escola Velha'},
    );
    expect(_consoleLine(8).trim(), rendered);
    expect(_consoleLine(8).length, lessThanOrEqualTo(console.width));
    expect(
      LcsI18n.processString('{name} has been rescued.', {
        'name': localizedCreatureNameValue('Police Officer', 'Police Officer'),
      }),
      'Conseguiram resgatar Oficial de Polícia.',
    );
  });

  test('Portuguese successful interview keeps both translated sentences', () {
    expect(
      LcsI18n.processString(
        '{journalist} later went on to win a Pulitzer for it. ',
        {'journalist': 'Theo Godwin'},
      ),
      'Theo Godwin mais tarde ganhou um Pulitzer por isso. ',
    );
    expect(
      LcsI18n.processString(
        "Virtually everyone in America was moved by {name}'s words.",
        {'name': 'Ricardo Mathers'},
      ),
      'Quase todos na América foram tocados pelas palavras de Ricardo Mathers.',
    );
  });

  test('Portuguese elite journalist copy agrees with every outlet type', () {
    const template =
        'Elite Journalist {journalist} from the {newsType} {publication} '
        'got into the compound somehow!';
    const outletTypes = {
      'news program': 'programa de notícias',
      'news magazine': 'revista de notícias',
      'website': 'site',
      'scandal rag': 'jornal sensacionalista',
      'newspaper': 'jornal',
    };

    for (final entry in outletTypes.entries) {
      final rendered = LcsI18n.processString(template, {
        'journalist': 'Joyce Storm',
        'newsType': LcsI18n.tr(entry.key),
        'publication': 'Atual Constituição',
      });

      expect(rendered, isNot(contains(' do revista ')));
      expect(rendered, isNot(contains(' do site ')));
      expect(rendered, isNot(contains(' do jornal ')));
      expect(rendered, contains('da publicação Atual Constituição'));
      expect(rendered, contains('(${entry.value})'));
      expect(rendered, contains('Joyce Storm'));
      expect(rendered, contains('Atual Constituição'));
    }
  });

  test('CIA suspense paragraphs wrap long Portuguese messages', () {
    final source = File('lib/daily/siege.dart').readAsStringSync();
    final wrappedMessage = RegExp(
      r'addparagraph\(\s*console\.y \+ 2,\s*1,\s*'
      r'compoundSuspense\.random\s*\);',
    );
    final wrappedDarkness = RegExp(
      r'addparagraph\(\s*console\.y \+ 2,\s*1,\s*'
      r'"The compound is plunged into darkness as the doors spontaneously unlock\."',
    );

    expect(wrappedMessage.hasMatch(source), isTrue);
    expect(wrappedDarkness.hasMatch(source), isTrue);

    erase();
    addparagraph(
      0,
      1,
      'Every security camera simultaneously pivots to stare directly at squad '
      'members.',
    );
    addparagraph(
      3,
      1,
      'The compound is plunged into darkness as the doors spontaneously unlock.',
    );

    final rendered =
        '${_consoleLine(0)} ${_consoleLine(1)} '
                '${_consoleLine(3)} ${_consoleLine(4)}'
            .replaceAll(RegExp(r'\s+'), ' ');
    expect(rendered, contains('membros do esquadrão.'));
    expect(rendered, contains('destrancam espontaneamente.'));
    expect(_consoleLine(0).length, lessThanOrEqualTo(console.width - 1));
    expect(_consoleLine(1).length, lessThanOrEqualTo(console.width - 1));
    expect(_consoleLine(3).length, lessThanOrEqualTo(console.width - 1));
    expect(_consoleLine(4).length, lessThanOrEqualTo(console.width - 1));
  });

  test('under-attack briefing wraps translated body before the prompt', () {
    final source = File('lib/daily/siege.dart').readAsStringSync();

    expect(source, contains('final engagementBriefing ='));
    expect(
      RegExp(
        r'addparagraph\(\s*3,\s*2,\s*engagementBriefing,\s*'
        r'y2:\s*21,\s*x2:\s*console\.width - 1,\s*'
        r'noTranslate:\s*true,\s*\)',
      ).hasMatch(source),
      isTrue,
    );
  });

  test(
    'empty safehouse defenses return with a localized explanation',
    () async {
      final site = sites.first;
      site.siege
        ..activeSiegeType = SiegeType.corporateMercs
        ..underAttack = true;
      activeSafehouse = site;
      console.injectKey('x');

      await escapeOrEngage();

      expect(
        _consoleLine(3),
        contains('Não há Liberais disponíveis para defender este esconderijo.'),
      );
      expect(activeSquad, isNull);
      expect(squads, isEmpty);
    },
  );

  test('medical debt receipt translates labels before dot alignment', () async {
    final site = sites.firstWhere(
      (site) => site.type == SiteType.homelessEncampment,
    );
    final liberal = Creature()
      ..align = Alignment.liberal
      ..location = site
      ..medicalBills = 50000;
    pool.add(liberal);
    ledger.forceSetFunds(7);
    console.injectKey('c');

    await surrenderToMedicalIndustry(site);

    expect(_consoleLine(6), contains('Total da dívida pendente....50000'));
    expect(_consoleLine(7), contains('Valor pago..................7'));
    expect(_consoleLine(8), contains('Ajuste de boa-fé............49993'));
    expect(_consoleLine(10), contains('Total da dívida quitada.....50000'));
    expect(_consoleLine(11), contains('Dívida restante.............0'));
    expect(_consoleLine(6).indexOf('50000'), 50);
    expect(_consoleLine(7).indexOf('7'), 50);
    expect(_consoleLine(8).indexOf('49993'), 50);
    expect(_consoleLine(10).indexOf('50000'), 50);
    expect(_consoleLine(11).indexOf('0'), 50);
    final receiptTitle =
        '${_consoleLine(2)} ${_consoleLine(3)} ${_consoleLine(4)}';
    expect(receiptTitle, contains('PARA ${site.getName().toUpperCase()}:'));
    expect(receiptTitle, isNot(contains('HOMELESS CAMP')));
  });
}
