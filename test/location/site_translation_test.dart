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

  test('Portuguese police siege copy avoids a gendered site article', () {
    expect(
      LcsI18n.tr('The police have surrounded the {location}!'),
      equals('A polícia cercou este local: {location}!'),
    );
  });
}
