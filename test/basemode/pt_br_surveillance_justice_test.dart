import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/base_mode.dart';
import 'package:lcs_new_age/basemode/review_mode.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';

import '../test_support.dart';

String row(int y) => console.buffer[y].map((c) => c.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(ensureGameDataLoaded);
  late GameState previousState;
  late Site warehouse;
  late Site prison;

  setUp(() async {
    previousState = gameState;
    gameState = GameState();
    final city = City('Seattle, WA', 'SEA', '');
    gameState.cities = [city];
    final district = city.addDistrict('Comércio', 'Comércio');
    warehouse = Site(SiteType.warehouse, city, district);
    prison = Site(SiteType.prison, city, district);
    district.sites.addAll([warehouse, prison]);
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
    erase();
  });
  tearDown(() {
    gameState = previousState;
    LcsI18n.reset();
    erase();
  });

  for (final example in [
    (heat: 5, first: 'Possível', second: 'vigilância'),
    (heat: 10, first: 'Provável', second: 'vigilância'),
    (heat: 14, first: 'Vigilância', second: 'ostensiva'),
  ]) {
    test(
      'Portuguese surveillance warning at heat ${example.heat} fits box',
      () {
        warehouse.extraHeatFromCorps = example.heat;
        printSafehouseSecurityBox(warehouse);
        expect(row(12), contains(example.first));
        expect(row(13), contains(example.second));
        expect(console.buffer[12][18].glyph, '│');
        expect(console.buffer[13][18].glyph, '│');
      },
    );
  }

  for (final example in [
    (months: 1, death: false, expected: '1 mês'),
    (months: 28, death: false, expected: '28 meses'),
    (months: 1, death: true, expected: 'EXECUÇÃO: 1 mês'),
    (months: 28, death: true, expected: 'EXECUÇÃO: 28 meses'),
  ]) {
    test(
      'Portuguese justice duration ${example.months}, death ${example.death}',
      () async {
        final prisoner = Creature()
          ..name = 'Teste'
          ..location = prison
          ..sentence = example.months
          ..deathPenalty = example.death;
        pool.add(prisoner);
        console.keyEvent(
          const KeyDownEvent(
            physicalKey: PhysicalKeyboardKey.enter,
            logicalKey: LogicalKeyboardKey.enter,
            timeStamp: Duration.zero,
          ),
        );
        await reviewMode(ReviewMode.justice);
        expect(row(2), contains(example.expected));
        expect(row(2), isNot(contains('Month')));
        expect(row(2).length, lessThanOrEqualTo(console.width));
      },
    );
  }

  test('surveillance warning remains absent below the threshold', () {
    warehouse.extraHeatFromCorps = 4;
    printSafehouseSecurityBox(warehouse);
    expect(row(12), contains('└────────────────┘'));
    expect(row(13).trim(), isEmpty);
  });

  test('English surveillance and justice labels remain readable', () async {
    await LcsI18n.initialize('en_US');
    warehouse.extraHeatFromCorps = 14;
    printSafehouseSecurityBox(warehouse);
    expect(row(12), contains('Overt'));
    expect(row(13), contains('Surveillance'));

    pool.add(
      Creature()
        ..name = 'Test'
        ..location = prison
        ..sentence = 28
        ..deathPenalty = true,
    );
    console.keyEvent(
      const KeyDownEvent(
        physicalKey: PhysicalKeyboardKey.enter,
        logicalKey: LogicalKeyboardKey.enter,
        timeStamp: Duration.zero,
      ),
    );
    await reviewMode(ReviewMode.justice);
    expect(row(2), contains('DEATH ROW: 28 months'));
  });
}
