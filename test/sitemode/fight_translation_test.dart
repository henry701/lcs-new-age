import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/weapon_type.dart';

import '../test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese knife actions and dodge composition stay localized', () {
    expect(LcsI18n.tr('lunges at'), 'avança contra');
    expect(LcsI18n.tr('snarls and lunges at'), 'rosna e avança contra');
    expect(
      LcsI18n.processString('{name} {action}', {
        'name': 'Patton Meir',
        'action': LcsI18n.tr('dodges the attack!'),
      }),
      'Patton Meir desvia o ataque!',
    );
  });

  test('Portuguese catalogs cover every XML weapon attack description', () {
    final descriptions = weaponTypes.values
        .expand((weapon) => weapon.attacks)
        .expand((attack) => attack.attackDescription)
        .toSet();

    expect(
      descriptions.where((description) => !LcsI18n.hasTranslation(description)),
      isEmpty,
    );
  });
}
