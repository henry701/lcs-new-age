import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese bar rejection parameters preserve both tone settings', () {
    const translations = {
      "That's hot.": 'Isso é quente.',
      "[I won't look.]": '[Não vou olhar.]',
      '[Yuck!]': '[Eca!]',
      'Fuck!': 'Porra!',
      'ass': 'bunda',
      '[body]': '[corpo]',
      '[Heavens]': '[Céus]',
      'Hell': 'Inferno',
      '[fellow child of God]': '[filho de Deus]',
      'idiot': 'idiota',
      'moron': 'idiota',
    };

    for (final entry in translations.entries) {
      expect(LcsI18n.hasTranslation(entry.key), isTrue, reason: entry.key);
      expect(LcsI18n.tr(entry.key), entry.value, reason: entry.key);
    }

    final nakedNoProfanity = LcsI18n.processString(
      '"Naked? {comment} But no, you can\'t come in."',
      {'comment': LcsI18n.tr("[I won't look.]")},
    );
    final nakedProfanity = LcsI18n.processString(
      '"Naked? {comment} But no, you can\'t come in."',
      {'comment': LcsI18n.tr("That's hot.")},
    );
    final bodyNoProfanity = LcsI18n.processString(
      '" {expletive} I did not want to see your naked {bodyPart}."',
      {'expletive': LcsI18n.tr('[Yuck!]'), 'bodyPart': LcsI18n.tr('[body]')},
    );
    final bodyProfanity = LcsI18n.processString(
      '" {expletive} I did not want to see your naked {bodyPart}."',
      {'expletive': LcsI18n.tr('Fuck!'), 'bodyPart': LcsI18n.tr('ass')},
    );
    final transNoProfanity = LcsI18n.processString(
      '"Ugh, trans people. {reaction} no."',
      {'reaction': LcsI18n.tr('[Heavens]')},
    );
    final transProfanity = LcsI18n.processString(
      '"Ugh, trans people. {reaction} no."',
      {'reaction': LcsI18n.tr('Hell')},
    );
    final transMenNoProfanity = LcsI18n.processString(
      '"Trans men are men, {comment}. Get out."',
      {'comment': LcsI18n.tr('[fellow child of God]')},
    );
    final transMenProfanity = LcsI18n.processString(
      '"Trans men are men, {comment}. Get out."',
      {'comment': LcsI18n.tr('idiot')},
    );
    final transWomenProfanity = LcsI18n.processString(
      '"Trans women are women, {comment}. Leave."',
      {'comment': LcsI18n.tr('moron')},
    );

    expect(
      nakedNoProfanity,
      '"Nua? [Não vou olhar.] Mas não, você não pode entrar."',
    );
    expect(
      nakedProfanity,
      '"Nua? Isso é quente. Mas não, você não pode entrar."',
    );
    expect(bodyNoProfanity, '"[Eca!] eu não queria ver seu [corpo] nu."');
    expect(bodyProfanity, '"Porra! eu não queria ver seu bunda nu."');
    expect(transNoProfanity, '"Ugh, pessoas trans. [Céus] não."');
    expect(transProfanity, '"Ugh, pessoas trans. Inferno não."');
    expect(
      transMenNoProfanity,
      '"Homens trans são homens, [filho de Deus]. Cai fora."',
    );
    expect(transMenProfanity, '"Homens trans são homens, idiota. Cai fora."');
    expect(
      transWomenProfanity,
      '"Mulheres trans são mulheres, idiota. Vá embora."',
    );

    for (final rendered in [
      nakedNoProfanity,
      nakedProfanity,
      bodyNoProfanity,
      bodyProfanity,
      transNoProfanity,
      transProfanity,
      transMenNoProfanity,
      transMenProfanity,
      transWomenProfanity,
    ]) {
      expect(rendered, isNot(contains('I won\'t look')));
      expect(rendered, isNot(contains('That\'s hot')));
      expect(rendered, isNot(contains('Fuck!')));
      expect(rendered, isNot(contains('[body]')));
      expect(rendered, isNot(contains('[Heavens]')));
      expect(rendered, isNot(contains('Hell')));
      expect(rendered, isNot(contains('fellow child of God')));
      expect(
        strLenX(rendered),
        lessThanOrEqualTo(console.width),
        reason: rendered,
      );
    }
  });

  test(
    'bar rejection source translates every dynamic reaction before rendering',
    () {
      final source = File('lib/sitemode/map_specials.dart').readAsStringSync();

      for (final parameter in [
        'comment',
        'expletive',
        'bodyPart',
        'reaction',
      ]) {
        expect(
          RegExp('"$parameter": LcsI18n\\.tr\\(').hasMatch(source),
          isTrue,
          reason: parameter,
        );
      }
      expect(source, isNot(contains('"comment": noProfanity ?')));
      expect(source, isNot(contains('"expletive": noProfanity ?')));
      expect(source, isNot(contains('"bodyPart": noProfanity ?')));
      expect(source, isNot(contains('"reaction": noProfanity ?')));
    },
  );
}
