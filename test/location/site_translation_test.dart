import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/site.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese generated church names preserve feminine agreement', () {
    expect(
      localizedGeneratedSiteName('Old', 'Church'),
      equals('Igreja Antiga'),
    );
  });

  test('Portuguese generated site names inflect generic adjectives', () {
    expect(
      localizedGeneratedSiteName('Old', 'Steel Plant'),
      equals('Siderúrgica Velha'),
    );
    expect(
      localizedGeneratedSiteName('Abandoned', 'Warehouse'),
      equals('Armazém Abandonado'),
    );
  });

  test('Portuguese nursing-home names use a phrase-level template', () {
    expect(
      localizedGeneratedNursingHomeName('Tender', 'Reflections'),
      equals('Casa de repouso Reflexões Carinhosas'),
    );
  });

  test('Portuguese generated site labels cover full location names', () {
    expect(LcsI18n.tr('The Oubliette'), equals('O Calabouço'));
    expect(LcsI18n.tr('Oubliette'), equals('Calabouço'));
    expect(
      LcsI18n.tr('Cable News Station'),
      equals('Canal de Notícias a Cabo'),
    );
    expect(LcsI18n.tr('CEO Mansion'), equals('Mansão do CEO'));
    expect(LcsI18n.tr('CEO House'), equals('Casa do CEO'));
    expect(LcsI18n.tr('CEO Castle'), equals('Castelo do CEO'));
    expect(LcsI18n.tr('NursingHome'), equals('Casa de repouso'));
    expect(LcsI18n.tr('White House'), equals('Casa Branca'));
    expect(LcsI18n.tr('Juice Bar'), equals('Bar de Sucos'));
    expect(
      LcsI18n.tr('{adjective} {noun} Juice Bar'),
      equals('Bar de Sucos {noun} {adjective}'),
    );
    expect(
      localizedGeneratedJuiceBarName('New You', 'Orange'),
      equals('Bar de Sucos Laranja Novo Você'),
    );
    expect(
      localizedGeneratedJuiceBarName('Harmonious', 'Methods'),
      equals('Bar de Sucos Métodos Harmoniosos'),
    );
  });

  test('Portuguese street-site names use natural Brazilian word order', () {
    const expected = {
      '{name} St. Housing Projects':
          'Conjuntos habitacionais da Rua {name}',
      '{name} St. Recreational Drugs Center':
          'Centro de Drogas Recreativas da Rua {name}',
      '{name} St. Marijuana Dispensary':
          'Dispensário de Maconha da Rua {name}',
      '{name} St. Drug House': 'Casa de Drogas da Rua {name}',
    };
    for (final entry in expected.entries) {
      expect(LcsI18n.tr(entry.key), entry.value, reason: entry.key);
    }
  });

  test('Portuguese generated condominiums put the name after the noun', () {
    expect(LcsI18n.tr('{name} Condominiums'), 'Condomínios {name}');
  });

  test('Portuguese juice-bar adjectives agree with plural nouns', () {
    expect(
      localizedGeneratedJuiceBarName('Natural', 'Methods'),
      'Bar de Sucos Métodos Naturais',
    );
  });

  test('Portuguese generated internet cafes omit translator glosses', () {
    expect(
      LcsI18n.processString('{adjective} {noun} Internet Cafe', {
        'adjective': LcsI18n.tr('Nano'),
        'noun': LcsI18n.tr('Panda'),
      }),
      'Internet Café Panda Nano',
    );
  });

  test('Portuguese generated motel names do not add an English gloss', () {
    expect(localizedGeneratedSiteName('Abandoned', 'Motel'), 'Motel Abandonado');
  });

  test('Portuguese vegan co-op names preserve the linking preposition', () {
    expect(
      LcsI18n.processString('{vegetable} {noun} Vegan Co-op', {
        'vegetable': LcsI18n.tr('Asparagus'),
        'noun': LcsI18n.tr('Meadow'),
      }),
      equals('Cooperativa Vegana Prado de Aspargo'),
    );
  });

  test(
    'English generated juice-bar names preserve source word order',
    () async {
      await LcsI18n.initialize('en_US');
      expect(
        localizedGeneratedJuiceBarName('Natural', 'Diet'),
        equals('Natural Diet Juice Bar'),
      );
    },
  );

  test('Portuguese police siege copy avoids a gendered site article', () {
    expect(
      LcsI18n.tr('The police have surrounded the {location}!'),
      equals('A polícia cercou o local: {location}!'),
    );
  });
}
