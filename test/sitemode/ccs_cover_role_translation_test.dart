import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test(
    'Portuguese CCS cover roles preserve and localize the full role pool',
    () {
      const expected = {
        'Soldier': 'Soldado',
        'CCS Heavy': 'CCS Pesado',
        'Transient': 'Sem-teto',
        'Crackhead': 'Cracudo',
        'Biker': 'Motociclista',
        'Fast Food Worker': 'Trabalhador de Fast Food',
        'Telemarketer': 'Teleoperador',
        'Office Worker': 'Trabalhador de Escritório',
        'Mailman': 'Carteiro',
        'Musician': 'Músico',
        'Hairstylist': 'Cabeleireiro',
        'Bartender': 'Barman',
      };

      for (final entry in expected.entries) {
        expect(
          localizedCreatureNameValue(entry.key, entry.key),
          entry.value,
          reason: entry.key,
        );
      }
    },
  );
}
