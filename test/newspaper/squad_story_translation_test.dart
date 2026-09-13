import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/newspaper/squad_story_text.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    gameState = GameState();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese CCS spoof locations are localized', () {
    const expected = <SiteType, String>{
      SiteType.upscaleApartment: 'Dormitório Universitário',
      SiteType.barAndGrill: 'Boate Gay',
      SiteType.cosmeticsLab: 'Abrigo de Animais',
      SiteType.geneticsLab: 'Sede da Comissão de Ética em Pesquisa',
      SiteType.policeStation: 'Escritório de Reforma Policial',
      SiteType.courthouse: 'Clínica de Aborto',
      SiteType.prison: 'Centro de Reabilitação',
      SiteType.intelligenceHQ: 'Escritório de Independência da Mídia',
      SiteType.sweatshop: 'Sede do Sindicato',
      SiteType.dirtyIndustry: 'Centro de Pesquisa em Energia Sustentável',
      SiteType.nuclearPlant: 'Museu das Ervilhas Rodopiantes',
      SiteType.corporateHQ: 'Agência de Assistência Social',
      SiteType.ceoHouse: 'Agência de Arrecadação de Impostos',
      SiteType.amRadioStation: 'Estação de Rádio Pública',
      SiteType.cableNewsStation: 'Estação de Notícias da Rede',
      SiteType.armyBase: 'Escritórios do Greenpeace',
      SiteType.fireStation: 'Escritório Regional da ACLU',
      SiteType.bank: 'Banco de Alimentos Richard Dawkins',
      SiteType.whiteHouse: 'Escritório de Lobby Progressista',
    };

    for (final entry in expected.entries) {
      expect(
        mapCCSPlace(Site(entry.key), entry.key.name),
        entry.value,
        reason: entry.key.name,
      );
    }
  });
}
