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

  test('Portuguese police siege copy avoids a gendered site article', () {
    expect(
      LcsI18n.tr('The police have surrounded the {location}!'),
      equals('A polícia cercou este local: {location}!'),
    );
  });
}
