import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese display-case item descriptions are localized', () {
    expect(LcsI18n.tr('Smash it? (Yes or No)'), 'Quebrar isso? (Sim ou Não)');

    const translations = {
      'some neo-Nazi memorabilia': 'alguns itens de memorabilia neonazista',
      'a Confederate flag': 'uma bandeira confederada',
      'a portrait of Ronald Reagan': 'um retrato de Ronald Reagan',
      'a photo of a lynching': 'uma foto de um linchamento',
      'white supremacist literature': 'literatura supremacista branca',
      'a portrait of Strom Thurmond': 'um retrato de Strom Thurmond',
      'some old records with racist lyrics':
          'alguns discos antigos com letras racistas',
      'a portrait of some old white guy': 'um retrato de algum velho branco',
      'an old police badge': 'um distintivo de polícia antigo',
      'a copy of the US Constitution': 'uma cópia da Constituição dos EUA',
      'an old photo of the courthouse': 'uma foto antiga do tribunal',
      'an old photo of a hanging': 'uma foto antiga de um enforcamento',
      'an award from a Conservative group': 'um prêmio de um grupo Conservador',
      'a bust of some old white guy': 'um busto de algum velho branco',
      'some Conservative memoribilia':
          'alguns itens de memorabilia conservadora',
      'some random pointless shit': 'alguma merda aleatória sem sentido',
    };

    for (final entry in translations.entries) {
      expect(LcsI18n.tr(entry.key), entry.value);

      final prompt = LcsI18n.processString(
        'You see a display case containing {item}.',
        {'item': LcsI18n.tr(entry.key)},
      );
      expect(prompt, startsWith('Você vê uma vitrine contendo '));
      expect(prompt, endsWith('.'));
      expect(prompt.length, lessThanOrEqualTo(80));
    }
  });

  test(
    'display-case terminal localizes the selected item before rendering',
    () {
      final source = File('lib/sitemode/map_specials.dart').readAsStringSync();

      expect(
        source,
        contains('final localizedFeaturing = LcsI18n.tr(featuring);'),
      );
      expect(source, contains('"item": localizedFeaturing'));
      expect(source, isNot(contains('"item": featuring')));
    },
  );
}
