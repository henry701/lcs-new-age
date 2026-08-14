import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('ordinary and Guardian ad labels are localized before layout', () {
    const expected = {
      'No Fee': 'Sem Taxa',
      'Consignment Program': 'Programa de Consignação',
      'Call for Details': 'Ligue para mais detalhes',
      'Fine Leather Chairs': 'Cadeiras de Couro Fino',
      'Special Purchase': 'Compra Especial',
      'Paris Flea Market': 'Mercado de Pulgas de Paris',
      'Sale': 'Oferta',
      '50% Off': '50% de Desconto',
      'Quality Pre-Owned': 'Usado de Qualidade',
      'Vehicles': 'Veículos',
      'Sedan 4D': 'Sedã 4 Portas',
      'Spa': 'Centro de Spa',
      'Health, Beauty': 'Saúde, Beleza',
      'and Fitness': 'e Fitness',
      '7 Days a Week': '7 Dias por Semana',
      'Searching For Love': 'Procurando Amor',
      'Seeking Love': 'Buscando Amor',
      'Are You Lonely?': 'Você Está Solitário?',
      'Looking For Love': 'Procurando Amor',
      'Soulmate Wanted': 'Procura-se Alma Gêmea',
      'Debuggers Needed': 'Precisamos de Depuradores',
      'It Seems': 'Parece que',
      "You've Found": 'Você Encontrou',
      'A Bug!': 'Um Bug!',
      'Want Organic?': 'Quer Orgânicos?',
      'Visit The Vegan': 'Visite o Vegano',
      'Co-Op': 'Cooperativa',
      'Liberal Defense Lawyer': 'Advogado de Defesa Liberal',
      'Years Experience': 'Anos de Experiência',
      'Call Today': 'Ligue Hoje',
      'Abortion Clinic': 'Clínica de Aborto',
      'Walk-in, No': 'Atendimento sem Hora Marcada, Sem',
      'Questions Asked': 'Sem Perguntas',
      'Open 24/7': 'Aberto 24 Horas',
      'Marijuana Dispensary': 'Dispensário de Maconha',
      'No ID Or Prescription Needed!': 'Não Precisa de Identidade ou Receita!',
      'Please Pay In Cash.': 'Pague em Dinheiro.',
      'Got Slack?': 'Tem Slack?',
      'Visit Your Local': 'Visite o Seu',
      'SubGenius Clench': 'Aperto SubGenius',
      'For More Info': 'Para Mais Informações',
      'Searching For Sex': 'Procurando Sexo',
      'Seeking Sex': 'Buscando Sexo',
      'Wanna Have Sex?': 'Quer Fazer Sexo?',
      'Looking For Sex': 'Procurando Sexo',
      'Sex Partner Wanted': 'Procura-se Parceiro Sexual',
    };

    for (final entry in expected.entries) {
      expect(LcsI18n.tr(entry.key), entry.value, reason: entry.key);
    }

    final ads = File('lib/newspaper/ads.dart').readAsStringSync();
    for (final key in expected.keys) {
      expect(
        ads,
        contains('LcsI18n.tr("$key")'),
        reason: 'Ad label "$key" must be translated before noTranslate layout.',
      );
    }
  });
}
