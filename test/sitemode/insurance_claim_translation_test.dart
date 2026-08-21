import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test(
    'Portuguese insurance claim values are localized before interpolation',
    () {
      const translations = {
        'Chemotherapy': 'Quimioterapia',
        'Insulin': 'Insulina',
        'Emergency Room Visit': 'Visita ao pronto-socorro',
        'Depression Counseling': 'Aconselhamento sobre depressão',
        'Assistive Device': 'Dispositivo Assistivo',
        'HIV Treatment': 'Tratamento do VIH',
        'Comprehensive Bloodwork': 'Sangue Abrangente',
        "Alzheimer's Treatment": 'Tratamento de Alzheimer',
        'MRI Scan': 'Exame de ressonância magnética',
        'CT Scan': 'Tomografia computadorizada',
        'Post-Operative Physical Therapy': 'Fisioterapia Pós-Operatória',
        'Double Bypass Surgery': 'Cirurgia de bypass duplo',
        'Drug Addiction Treatment': 'Tratamento da Dependência Química',
        'Hormone Replacement Therapy': 'Terapia de reposição hormonal',
        'Missing Documentation': 'Documentação ausente',
        'Name Spelled Incorrectly': 'Nome escrito incorretamente',
        'Out of Network': 'Fora de rede',
        'Not Medically Necessary': 'Não é clinicamente necessário',
        'No Prior Authorization': 'Nenhuma Autorização prévia',
        'Coverage Limit Exceeded': 'Limite de cobertura excedido',
        'Experimental': 'Em fase experimental',
        'Coding Error': 'Erro de codificação',
        'chemo': 'quimio',
        'insulin': 'insulina',
        'ER visit': 'Visita ao Pronto-Socorro',
        'therapy': 'terapia',
        'assistive device': 'dispositivo auxiliar',
        'HIV treatment': 'Tratamento do HIV',
        'bloodwork': 'exames de sangue',
        "Alzheimer's": 'Alzheimer',
        'MRI': 'RM',
        'CT': 'TC',
        'physical therapy': 'Fisioterapia',
        'surgery': 'cirurgia',
        'addiction treatment': 'tratamento de dependência',
        'HRT': 'TRH',
      };

      for (final entry in translations.entries) {
        expect(LcsI18n.tr(entry.key), entry.value);
      }

      final claim = LcsI18n.processString('Claim: {claim}.', {
        'claim': LcsI18n.tr('Post-Operative Physical Therapy'),
      });
      final denial = LcsI18n.processString(
        'Denied: {reason}. Override and approve? (Yes or No)',
        {'reason': LcsI18n.tr('Not Medically Necessary')},
      );
      final approval = LcsI18n.processString(
        '{name} approves the {claim} claim.',
        {'name': 'Hacker', 'claim': LcsI18n.tr('physical therapy')},
      );

      expect(claim, 'Solicitação: Fisioterapia Pós-Operatória.');
      expect(
        denial,
        'Negada: Não é clinicamente necessário. Substituir e aprovar? (Sim ou Não)',
      );
      expect(approval, 'Hacker aprova a solicitação de Fisioterapia.');
      expect(claim.length, lessThanOrEqualTo(80));
      expect(denial.length, lessThanOrEqualTo(80));
      expect(approval.length, lessThanOrEqualTo(80));
    },
  );

  test(
    'insurance claim terminal localizes dynamic values before noTranslate render',
    () {
      final source = File('lib/sitemode/map_specials.dart').readAsStringSync();

      expect(source, contains('final localizedClaimDescription ='));
      expect(source, contains('final localizedDenialReason ='));
      expect(source, contains('final localizedClaimDescriptionShort ='));
      expect(source, contains('"claim": localizedClaimDescription'));
      expect(source, contains('"reason": localizedDenialReason'));
      expect(source, contains('"claim": localizedClaimDescriptionShort'));
      expect(source, isNot(contains('"claim": claimDescription')));
      expect(source, isNot(contains('"reason": denialReason')));
      expect(source, isNot(contains('"claim": claimDescriptionShort')));
    },
  );
}
