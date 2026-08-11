import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/sitemode/site_display.dart';
import 'package:lcs_new_age/sitemode/sitemap.dart';
import 'package:lcs_new_age/sitemode/sitemode.dart';

import '../test_support.dart';

String _line(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    final city = City('Seattle, WA', 'SEA', '');
    gameState.cities = [city];
    final district = city.addDistrict('Comércio', 'Comércio');
    activeSite = Site(SiteType.warehouse, city, district);
    for (final tile in levelMap.all) {
      tile.known = false;
    }
    locx = 0;
    locy = 0;
    locz = 0;
    erase();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    activeSite = null;
    LcsI18n.reset();
    erase();
  });

  test('full map overlay clears stale controls and reserves a prompt row', () {
    mvaddstr(1, 0, 'STALE ROSTER');
    mvaddstr(23, 0, 'W,A,D,X:Mover');

    showFullSiteMap();

    expect(_line(1), isNot(contains('STALE ROSTER')));
    expect(_line(23), isNot(contains('W,A,D,X:Mover')));
    expect(_line(24), contains('Pressione qualquer tecla para continuar.'));
  });

  test('localized site special labels fit full and compact map overlays', () {
    final squad = Squad.temporary();
    gameState.lcs.squads.add(squad);
    activeSquad = squad;
    locx = 0;
    locy = 0;
    locz = 0;
    final tile = levelMap[locx][locy][locz]
      ..known = true
      ..special = TileSpecial.policeStationLockup;

    printSiteMap(locx, locy, locz);
    expect(_line(24), contains('Sala de Detenção da Polícia'));
    expect(_line(24).length, lessThanOrEqualTo(console.width));

    erase();
    printSiteMapSmall(locx, locy, locz);
    expect(_line(23), contains('Sala de Detenção da Po…'));
    expect(_line(23).length, lessThanOrEqualTo(console.width));

    tile.special = TileSpecial.none;
  });
}
