import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese Secret Service role names are localized', () {
    expect(
      localizedCreatureNameValue('Secret Service', 'Secret Service'),
      'Serviço Secreto',
    );
  });
}
