import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('jury results use complete Portuguese templates', () async {
    await LcsI18n.initialize('pt_BR');
    const key =
        '{name} charms the jury into not calling the guards, but fails to show why {crime} should go unpunished.';
    final result = LcsI18n.processString(key, {
      'name': 'Amy',
      'crime': 'homicídio',
    });
    expect(result, contains('Amy convence o júri'));
    expect(result, contains('homicídio deve ficar impune'));
    expect(result, isNot(contains('should go unpunished')));
    LcsI18n.reset();
  });
}
