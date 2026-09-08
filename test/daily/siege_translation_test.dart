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

  test('Portuguese police subdue terminal uses physical-restraint wording', () {
    final rendered = LcsI18n.tr('The police subdue and arrest the squad.');

    expect(rendered, 'A polícia imobiliza e prende o esquadrão.');
    expect(rendered, isNot(contains('domina')));
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

  test('Portuguese rare siege and interview templates stay localized', () {
    const templates = {
      'Hidden locations cannot be directly attacked until they are revealed by finding a CCS member in that city and either turning them to your cause, or capturing and interrogating them for information.':
          'Locais ocultos não podem ser atacados diretamente',
      "The Conservative Crime Squad doesn't usually advertise its members, but they can be found in cities where the CCS is active. CCS members often have clothing and weapons that don't match their cover identities.":
          'O Esquadrão do Crime Conservador geralmente não anuncia',
      'In a groundbreaking act of synergy, the Corporations have decided to diversify their operations into a micro-targeted deplatforming campaign with the goal of downsizing the LCS into a fine red mist.':
          'Em um ato inovador de sinergia',
      'Leveraging their unparalleled expertise in tactical engagement and displacement logistics, a globally recognized private military company has initiated a daylight operation against the {location} to seamlessly deliver live munitions into your skull.':
          'Valendo-se de sua experiência incomparável',
      'A loosely-organized column of pickup trucks sporting gun racks and Confederate flags is approaching the {location}.':
          'Uma coluna pouco organizada de picapes',
      'Overnight, a fringe far-right social media account published a detailed conspiracy theory about a building where an enclave of hundreds of Liberal elites were supposedly generating forgeries, deepfakes, and committing unspeakable crimes against innocent children.':
          'Durante a noite, uma conta de mídia social de extrema-direita',
      'Rallied by misguided calls to violence that swept through social media, the Conservative masses are pouring into {district} to assault the {location}!':
          'Reunidas por apelos equivocados à violência',
      '{journalist} canceled the interview halfway through and later used the material for a Broadway play called {playName}.':
          'cancelou a entrevista no meio',
    };

    for (final entry in templates.entries) {
      final rendered = LcsI18n.processString(entry.key, {
        'location': 'o Antigo Motel',
        'district': 'Centro de Seattle',
        'journalist': 'Joyce Storm',
        'playName': 'A Grande Farsa',
      });

      expect(rendered, contains(entry.value), reason: entry.key);
      expect(rendered, isNot(contains('groundbreaking act of synergy')));
      expect(rendered, isNot(contains('Leveraging their unparalleled')));
      expect(rendered, isNot(contains('loosely-organized column')));
      expect(rendered, isNot(contains('Broadway play called')));
    }
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

  test('Portuguese homeless-camp briefing wraps every translated line', () {
    renderHomelessCampSiegeBriefing();

    final body = List.generate(
      20,
      _consoleLine,
    ).join(' ').replaceAll(RegExp(r'\s+'), ' ');
    const resistanceSentence =
        'The enemy is expecting resistance, and you will have to '
        'defeat them all or run away to survive this encounter.';
    const expectedResistanceSentence =
        'O inimigo está esperando resistência, e você terá que '
        'derrotá-los todos ou fugir para sobreviver a este encontro.';
    final translatedLines = [
      'You are about to mount a defense of the homeless camp.',
      resistanceSentence,
      'Some agitators are also turning out to resist with you.',
      'Your Squad has filled out to six members if any were ',
      'available.  If you have a larger pool of Liberals, they',
      'will provide cover fire and hang back until needed.',
    ];
    for (final source in translatedLines) {
      final expected = LcsI18n.tr(
        source,
      ).trim().replaceAll(RegExp(r'\s+'), ' ');
      expect(body, contains(expected));
      expect(body, isNot(contains(source.trim())));
    }
    expect(body, contains(expectedResistanceSentence));
    expect(body, isNot(contains('terá que derrote')));
    expect(body, isNot(contains('terá que fuja')));

    final prompt = _consoleLine(23);
    expect(
      prompt.trim(),
      LcsI18n.tr('Press any key to Confront the Conservative Aggressors'),
    );
    expect(prompt.length, lessThanOrEqualTo(console.width));
    for (var y = 0; y < console.height; y++) {
      expect(_consoleLine(y).length, lessThanOrEqualTo(console.width));
    }
  });

  test(
    'Portuguese CCS final victory translates action prose in context',
    () async {
      ccsBaseKills = 3;
      ccsSiegeConverts = 11;
      console
        ..injectKey('c')
        ..injectKey('c');

      await conquerTextCCS();

      final body = List.generate(
        console.height,
        _consoleLine,
      ).join(' ').replaceAll(RegExp(r'\s+'), ' ');
      expect(body, contains('A CCS foi completamente neutralizada.'));
      expect(body, contains('POR CONVERTER O ESQUADRÃO DO CRIME CONSERVADOR'));
      expect(body, isNot(contains('neutralized')));
      expect(body, isNot(contains('CONVERTING')));
      expect(body, isNot(contains('ERADICATING')));
    },
  );

  test('Portuguese CCS final victory translates lethal action prose', () async {
    ccsBaseKills = 3;
    ccsSiegeKills = 11;
    console
      ..injectKey('c')
      ..injectKey('c');

    await conquerTextCCS();

    final body = List.generate(
      console.height,
      _consoleLine,
    ).join(' ').replaceAll(RegExp(r'\s+'), ' ');
    expect(body, contains('A CCS foi completamente destruída.'));
    expect(body, contains('POR ERRADICAR O ESQUADRÃO DO CRIME CONSERVADOR'));
    expect(body, isNot(contains('destroyed')));
    expect(body, isNot(contains('ERADICATING')));
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

    expect(
      _consoleLine(6),
      contains(r'Total da dívida pendente....US$ 50.000'),
    );
    expect(_consoleLine(7), contains(r'Valor pago..................US$ 7'));
    expect(
      _consoleLine(8),
      contains(r'Ajuste de boa-fé............US$ 49.993'),
    );
    expect(
      _consoleLine(10),
      contains(r'Total da dívida quitada.....US$ 50.000'),
    );
    expect(_consoleLine(11), contains(r'Dívida restante.............US$ 0'));
    expect(_consoleLine(6).indexOf(r'US$ 50.000'), 50);
    expect(_consoleLine(7).indexOf(r'US$ 7'), 50);
    expect(_consoleLine(8).indexOf(r'US$ 49.993'), 50);
    expect(_consoleLine(10).indexOf(r'US$ 50.000'), 50);
    expect(_consoleLine(11).indexOf(r'US$ 0'), 50);
    final receiptTitle =
        '${_consoleLine(2)} ${_consoleLine(3)} ${_consoleLine(4)}';
    expect(receiptTitle, contains('PARA ${site.getName().toUpperCase()}:'));
    expect(receiptTitle, isNot(contains('HOMELESS CAMP')));
  });
}
