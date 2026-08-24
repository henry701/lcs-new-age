import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese knife actions and dodge composition stay localized', () {
    expect(LcsI18n.tr('lunges at'), 'avança contra');
    expect(LcsI18n.tr('snarls and lunges at'), 'rosna e avança contra');
    expect(
      LcsI18n.processString('{name} {action}', {
        'name': 'Patton Meir',
        'action': LcsI18n.tr('dodges the attack!'),
      }),
      'Patton Meir desvia o ataque!',
    );
  });
}
