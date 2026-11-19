import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const translations = <String, String>{
    'Firefighter': 'Bombeiro',
    'Plumber': 'Encanador',
    'Corporate Manager': 'Gerente Corporativo',
    'Prison Guard': 'Guarda Prisional',
    'Army Veteran': 'Militar Veterano',
    'Retiree': 'Aposentado',
    'Camera Operator': 'Cinegrafista',
    'Construction Worker': 'Profissional de Obras',
    'Nursing Home Admin': 'Gerente de Asilos',
    'Servant': 'Criado',
  };

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });
  tearDown(LcsI18n.reset);

  test('Portuguese localizes encounter labels and alternate names', () {
    for (final entry in translations.entries) {
      expect(LcsI18n.hasTranslation(entry.key), isTrue, reason: entry.key);
      expect(
        localizedCreatureNameValue(entry.key, 'Some Other Type'),
        entry.value,
        reason: entry.key,
      );
    }
  });

  test('sleeper roles use the existing gender inflection where supported', () {
    expect(localizedProfessionName('Servant', Gender.female), 'Criada');
    expect(localizedProfessionName('Firefighter', Gender.female), 'Bombeira');
    expect(localizedProfessionName('Retiree', Gender.female), 'Aposentada');
    expect(
      localizedProfessionName('Camera Operator', Gender.female),
      'Cinegrafista',
    );
    expect(
      localizedProfessionName('Nursing Home Admin', Gender.female),
      'Gerente de Asilos',
    );
    expect(
      localizedProfessionName('Army Veteran', Gender.female),
      'Militar Veterana',
    );
    expect(
      localizedProfessionName('Corporate Manager', Gender.female),
      'Gerente Corporativa',
    );
  });

  test('English leaves the original profession labels unchanged', () async {
    LcsI18n.reset();
    await LcsI18n.initialize('en_US');
    for (final name in translations.keys) {
      expect(localizedCreatureNameValue(name, name), name);
      expect(localizedProfessionName(name, Gender.female), name);
    }
  });
}
