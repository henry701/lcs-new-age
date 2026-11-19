import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/district.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/newspaper/display_news.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/saveload/load_cpc_images.dart';

import '../test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(ensureGameDataLoaded);
  setUpAll(loadCpcGraphics);

  setUp(() async {
    gameState = GameState();
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
    console.injectedKeys.clear();
    erase();
  });

  tearDown(() {
    console.injectedKeys.clear();
    LcsI18n.reset();
    erase();
  });

  Future<String> article(NewsStories type) async {
    final city = City('Seattle, WA', 'SEA', 'Test city');
    gameState.cities.add(city);
    final district = District('Shopping', 'Shopping', city.id, area: 1);
    city.districts.add(district);
    final site = Site(SiteType.dirtyIndustry, city, district);
    district.sites.add(site);
    final story = NewsStory.unpublished(type)
      ..publication = Publication.amRadio
      ..loc = site;
    console.injectKey('Enter');
    await displayStory(story, null);
    return story.body;
  }

  testWidgets('gun advocacy reaction in an LCS raid uses one coherent tense', (
    tester,
  ) async {
    final body = await article(NewsStories.squadSiteAction);
    expect(
      body,
      contains(
        'observou que era uma pena que não houvesse mais cidadãos armados '
        'na área para impedir que isso aconteça.',
      ),
    );
    expect(body, isNot(contains('era é uma pena')));
  });

  testWidgets('other gun advocacy reactions compose naturally', (tester) async {
    final killed = await article(NewsStories.squadKilledInSiteAction);
    expect(
      killed,
      contains(
        'era apenas graças à coragem de pessoas portando armas que isso não virou algo pior',
      ),
    );
    final ccs = await article(NewsStories.ccsSiteAction);
    expect(
      ccs,
      contains(
        'observou que o aumento da posse de armas ajudaria a pôr fim a uma violência como esta de vez.',
      ),
    );
  });

  testWidgets('the English raid reaction is unchanged', (tester) async {
    await LcsI18n.setLocale('en_US');
    final body = await article(NewsStories.squadSiteAction);
    expect(
      body,
      contains(
        "noted that it was unfortunate that there weren't more armed citizens in the area to stop this from happening.",
      ),
    );
  });
}
