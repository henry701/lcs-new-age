import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/level.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese level-two liberal title is localized', () {
    expect(LcsI18n.tr('Activist'), equals('Ativista'));
    expect(levelTitle(2, Alignment.liberal), equals('Ativista'));
  });
}
