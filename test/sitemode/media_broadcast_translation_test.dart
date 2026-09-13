import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese radio and TV broadcast labels are localized', () {
    const translations = {
      'camera': 'da câmera',
      'microphone': 'do microfone',
      'viewers': 'telespectadores',
      'listeners': 'ouvintes',
      'trans rights': 'direitos trans',
      'the death penalty': 'a pena de morte',
      'taxes': 'impostos',
      'nuclear power': 'energia nuclear',
      'animal research': 'Pesquisa com animais',
      'police violence': 'violência policial',
      'torture': 'tortura',
      'prison reform': 'reforma penitenciária',
      'privacy laws': 'leis de privacidade',
      'free speech': 'liberdade de expressão',
      'genetic research': 'pesquisa genética',
      'the Supreme Court': 'o Supremo Tribunal',
      'gun violence': 'violência armada',
      'sweatshops': 'fábricas exploradoras',
      'pollution': 'poluição',
      'corporations': 'corporações',
      'billionaires': 'bilionários',
      'gender equality': 'igualdade de gênero',
      'civil rights': 'direitos civis',
      'drug laws': 'leis sobre drogas',
      'immigration': 'imigração',
      'housing': 'moradia',
      'healthcare': 'cuidados de saúde',
      'retirement': 'aposentadoria',
      'military spending': 'gastos militares',
      'AM radio shows': 'Programas de rádio AM',
      'Conservative media bias': 'Viés conservador na mídia',
    };

    for (final entry in translations.entries) {
      expect(LcsI18n.tr(entry.key), entry.value);
    }

    final tvTakeover = LcsI18n.processString(
      'The Squad takes control of the {takeover} and ',
      {'takeover': LcsI18n.tr('camera')},
    );
    final tvIssue = LcsI18n.processString('talks about {issue}.', {
      'issue': LcsI18n.tr('taxes'),
    });
    final radioTakeover = LcsI18n.processString(
      'The Squad takes control of the {takeover} and ',
      {'takeover': LcsI18n.tr('microphone')},
    );
    final hostageIntro = LcsI18n.processString(
      'The hostage {name} is forced on air to ',
      {'name': 'Anchor'},
    );
    final hostageIssue = LcsI18n.processString('discuss {issue}.', {
      'issue': LcsI18n.tr('healthcare'),
    });
    final quality = LcsI18n.processString(
      'The Squad leaves {viewer} weeping for freedom!',
      {'viewer': LcsI18n.tr('viewers')},
    );

    expect(tvTakeover, 'O Esquadrão assume o controle da câmera e ');
    expect(tvIssue, 'fala sobre impostos.');
    expect(radioTakeover, 'O Esquadrão assume o controle do microfone e ');
    expect(hostageIntro, 'O refém Anchor é forçado a entrar no ar para ');
    expect(hostageIssue, 'discutir cuidados de saúde.');
    expect(
      quality,
      'O Esquadrão deixa telespectadores chorando pela liberdade!',
    );

    for (final line in [
      tvTakeover,
      tvIssue,
      radioTakeover,
      hostageIntro,
      hostageIssue,
      quality,
    ]) {
      expect(line.length, lessThanOrEqualTo(80));
    }
  });

  test('radio and TV paths localize dynamic labels before rendering', () {
    final source = File('lib/sitemode/miscactions.dart').readAsStringSync();

    expect(source, contains('"camera",'));
    expect(source, contains('"microphone",'));
    expect(source, contains('final localizedTakeover = LcsI18n.tr(takeover);'));
    expect(
      source,
      contains('final localizedViewerName = LcsI18n.tr(viewername);'),
    );
    expect(source, contains('final localizedViewIssue ='));
    expect(source, contains('final localizedHostageViewIssue ='));
    expect(source, contains('"takeover": localizedTakeover'));
    expect(source, contains('"issue": localizedViewIssue'));
    expect(source, contains('"issue": localizedHostageViewIssue'));
    expect(source, contains('"viewer": localizedViewerName'));
    expect(source, contains('line2: "talks about {issue}."'));
    expect(source, contains('line2: "discuss {issue}."'));
    expect(source, isNot(contains('"takeover": takeover')));
    expect(source, isNot(contains('"issue": _mediaIssueDescription(viewhit)')));
    expect(
      source,
      isNot(contains('"issue": _mediaIssueDescription(hostageviewhit)')),
    );
    expect(source, isNot(contains('"viewer": viewername')));
  });
}
