import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese prison sentence keeps singular and plural forms', () {
    final singular = LcsI18n.processString('{months} month in prison', {
      'months': '1',
    });
    final plural = LcsI18n.processString('{months} months in prison', {
      'months': '2',
    });

    expect(singular, '1 mês na prisão');
    expect(plural, '2 meses na prisão');
    expect(singular.length, lessThanOrEqualTo(80));
    expect(plural.length, lessThanOrEqualTo(80));
  });

  test('Portuguese gendered self-defense verdict is translated', () {
    final rendered = LcsI18n.processStringGendered(
      "{name}'s arguments are pretty good.",
      {'name': 'Blake Rivera'},
      gender: Gender.male,
    );

    expect(rendered, 'Os argumentos de Blake Rivera são muito bons.');
    expect(rendered, isNot(contains('(male)')));
  });
}
