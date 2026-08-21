import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test(
    'Portuguese clothing destruction names are translated before interpolation',
    () {
      const template = "{name}'s {clothing} has been destroyed.";
      const englishName = 'Black Suit';
      final localizedClothing = LcsI18n.tr(englishName);

      expect(localizedClothing, 'Terno preto');
      final rendered = LcsI18n.processString(template, {
        'name': 'Alex Liberal',
        'clothing': localizedClothing,
      });
      expect(rendered, 'a Terno preto de Alex Liberal foi destruída.');
      expect(rendered, isNot(contains(englishName)));
      expect(rendered.length, lessThanOrEqualTo(console.width));
    },
  );

  test('severloot translates the clothing interpolation value', () {
    final source = File('lib/sitemode/fight.dart').readAsStringSync();
    final templateStart = source.indexOf(
      '"{name}\'s {clothing} has been destroyed."',
    );
    final destructionBranch = source.substring(
      source.lastIndexOf('mvaddstrcFitted(', templateStart),
      source.indexOf('await getKey();', templateStart),
    );

    expect(
      destructionBranch,
      contains('"clothing": LcsI18n.tr(cr.clothing.shortName)'),
    );
    expect(
      destructionBranch,
      isNot(contains('"clothing": cr.clothing.shortName')),
    );
    expect(destructionBranch, contains('mvaddstrcFitted('));
  });
}
