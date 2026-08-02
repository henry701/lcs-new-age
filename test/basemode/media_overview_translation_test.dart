import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/media_overview.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/politics/views.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese media overview localizes its chrome', () {
    expect(LcsI18n.tr('Media Overview'), equals('Visão geral da mídia'));
    expect(LcsI18n.tr('HEADLINE'), equals('MANCHETE'));
    expect(LcsI18n.tr('DATE'), equals('DATA'));
    expect(LcsI18n.tr('SOURCE'), equals('FONTE'));
    expect(LcsI18n.tr('IMPACT'), equals('IMPACTO'));
    expect(
      LcsI18n.tr('Press a Letter to read a news article'),
      equals('Pressione uma letra para ler uma notícia'),
    );
    expect(
      LcsI18n.tr(
        'LCS activities will inspire supporters, but may alienate detractors.',
      ),
      equals(
        'As atividades da LCS inspirarão apoiadores, mas podem afastar detratores.',
      ),
    );
    expect(
      LcsI18n.tr(
        'Avoiding violence will increase public support for your actions.',
      ),
      equals('Evitar a violência aumentará o apoio público às suas ações.'),
    );
  });

  test('media overview reserves space for localized dates and sources', () {
    expect(MediaOverviewLayout.dateX, 36);
    expect(MediaOverviewLayout.sourceX, 55);
    expect(MediaOverviewLayout.impactX, 72);
    expect(MediaOverviewLayout.sourceWidth, 16);
    expect(
      MediaOverviewLayout.sourceX - MediaOverviewLayout.dateX,
      greaterThanOrEqualTo(19),
    );
  });

  test('The Daily chrome has Portuguese catalog coverage', () {
    expect(LcsI18n.tr('The Daily'), 'O Diário');
    expect(LcsI18n.tr('FOR JUST \$1/WK'), 'POR APENAS US\$ 1/SEM');
    expect(LcsI18n.tr("AMERICA'S NEWSROOM"), 'SALA DE NOTÍCIAS DA AMÉRICA');
  });

  test('publication names are localized in Portuguese', () {
    const expected = {
      'The Times': 'O Times',
      'The Herald': 'O Arauto',
      'The Post': 'O Post',
      'The Globe': 'O Globo',
      'The Daily': 'O Diário',
      'Liberal Guardian': 'Guardião Liberal',
      'Cable News': 'Notícias a Cabo',
      'AM Radio': 'Rádio AM',
      'Conservative Star': 'Estrela Conservadora',
    };
    expect(Publication.values, hasLength(expected.length));
    for (final entry in expected.entries) {
      expect(LcsI18n.tr(entry.key), entry.value);
    }
  });

  test('every media impact label is localized in Portuguese', () {
    const expected = {
      'Animal Research': 'Pesquisa Animal',
      'Intelligence': 'Inteligência',
      'Justices': 'Juízes',
      'Corporations': 'Corporações',
      'Military': 'Gastos Militares',
      'Prisons': 'Prisões',
      'LCS Known': 'Conhecimento do LCS',
      'LCS Liked': 'Apoio ao LCS',
      'CCS Hated': 'Rejeição ao CCS',
    };
    for (final entry in expected.entries) {
      expect(LcsI18n.tr(entry.key), entry.value);
    }
    expect(View.values, hasLength(30));
  });
}
