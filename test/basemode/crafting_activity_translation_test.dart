import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

import '../test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(ensureGameDataLoaded);

  tearDown(LcsI18n.reset);

  test('Portuguese crafting task localizes overalls', () async {
    await LcsI18n.initialize('pt_BR');

    expect(
      Activity(
        ActivityType.makeClothing,
        idString: 'CLOTHING_OVERALLS',
      ).description,
      'Fazendo Macacão',
    );
  });

  test('Portuguese clothing task localizes armor-upgraded names', () async {
    await LcsI18n.initialize('pt_BR');

    expect(
      Activity(
        ActivityType.makeClothing,
        idString: 'CLOTHING_SECURITYUNIFORM:ARMOR0',
      ).description,
      'Fazendo Unif. de Segurança',
    );
  });

  test('Portuguese flag task localizes flag names', () async {
    await LcsI18n.initialize('pt_BR');

    expect(
      Activity(ActivityType.makeFlag, idString: 'FLAG_RAINBOW').description,
      'Fazendo Bandeira Arco-Íris',
    );
  });

  test('missing crafting types retain the localized fallback', () async {
    await LcsI18n.initialize('pt_BR');

    expect(Activity(ActivityType.makeClothing).description, 'Fazendo um erro');
    expect(Activity(ActivityType.makeFlag).description, 'Fazendo um erro');
  });

  test('English crafting task keeps the original names', () async {
    await LcsI18n.initialize('en_US');

    expect(
      Activity(
        ActivityType.makeClothing,
        idString: 'CLOTHING_OVERALLS',
      ).description,
      'Making Overalls',
    );
    expect(
      Activity(ActivityType.makeFlag, idString: 'FLAG_RAINBOW').description,
      'Making Rainbow Flag',
    );
  });
}
