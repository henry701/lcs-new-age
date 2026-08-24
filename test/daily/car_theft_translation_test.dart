import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/vehicles/vehicle.dart';

import '../test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese car-theft vehicle parameters use localized XML names', () {
    final pickup = Vehicle('PICKUP');

    expect(LcsI18n.tr(pickup.type.longName), 'Picape');
    expect(
      LcsI18n.processString('{name} found a {car}.', {
        'name': 'Joana',
        'car': LcsI18n.tr(pickup.type.longName),
      }),
      'Joana encontrou um Picape.',
    );
    expect(
      LcsI18n.processString(
        '{name} was unable to find a {oldCar} but did find a {newCar}.',
        {
          'name': 'Joana',
          'oldCar': LcsI18n.tr(pickup.type.longName),
          'newCar': LcsI18n.tr(pickup.type.longName),
        },
      ),
      'Joana não conseguiu encontrar um Picape mas encontrou um Picape.',
    );
  });

  test('Portuguese car-theft failed window messages are localized', () {
    expect(
      LcsI18n.tr('{name} cracks the window, but it is still somewhat intact.'),
      '{name} trinca a janela, mas ela ainda está parcialmente intacta.',
    );
    expect(
      LcsI18n.tr(
        '{name} cracks the window with a {weapon}, but it is still somewhat intact.',
      ),
      '{name} trinca a janela com {weapon}, mas ela ainda está parcialmente intacta.',
    );
  });
}
