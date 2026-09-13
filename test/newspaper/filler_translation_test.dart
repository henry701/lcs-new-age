import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/newspaper/filler.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    reseedRNG(seed: 20260814);
    LcsI18n.reset();
  });

  test(
    'filler translates catalog cities and preserves proper-name fallbacks',
    () {
      var sawCatalogBackedCity = false;
      var sawUncataloguedCity = false;

      for (var seed = 1; seed <= 500; seed++) {
        reseedRNG(seed: seed);
        final rawCityName = randomCityName();
        final catalogBacked = LcsI18n.hasTranslation(rawCityName);
        final expectedCityName = catalogBacked
            ? LcsI18n.tr(rawCityName)
            : rawCityName;

        reseedRNG(seed: seed);
        final filler = generateFiller(1);

        expect(filler, contains(expectedCityName), reason: 'seed $seed');
        if (catalogBacked) {
          sawCatalogBackedCity = true;
        } else {
          sawUncataloguedCity = true;
          expect(
            LcsI18n.getMissingTranslations(),
            isNot(contains(rawCityName)),
            reason: 'seed $seed must not log proper-name fallback',
          );
        }
      }

      expect(sawCatalogBackedCity, isTrue);
      expect(sawUncataloguedCity, isTrue);
    },
  );
}
