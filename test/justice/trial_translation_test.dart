import 'package:flutter_test/flutter_test.dart';
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
}
