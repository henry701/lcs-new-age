import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese CCS bouncer and alarm messages are localized', () {
    expect(
      LcsI18n.tr('The bouncer assesses your squad.'),
      'O segurança avalia seu esquadrão.',
    );
    expect(
      LcsI18n.processString(
        '{name} observes your Liberal activity and lets forth a piercing Conservative alarm cry!',
        {'name': 'Soldier'},
      ),
      'Soldier observa sua atividade Liberal e solta um grito de alarme Conservador penetrante!',
    );
    expect(
      LcsI18n.processString(
        '{name} observes your Liberal activity and shouts for help!',
        {'name': 'Office Worker'},
      ),
      'Office Worker observa sua atividade Liberal e grita por ajuda!',
    );
  });
}
