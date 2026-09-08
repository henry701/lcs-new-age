import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/creature/level.dart';
import 'package:lcs_new_age/engine/console.dart';
import 'package:lcs_new_age/engine/engine.dart';
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

  test('Portuguese low-level titles are localized for every alignment', () {
    const expected = <int, String>{
      -2: 'Em Crise',
      -1: 'Instável',
      0: 'Em Dificuldades',
    };

    for (final alignment in Alignment.values) {
      for (final entry in expected.entries) {
        final title = levelTitle(entry.key, alignment);
        expect(title, equals(entry.value));
        expect(strLenX(title), lessThanOrEqualTo(CONSOLE_WIDTH));
      }
    }
  });

  test('Portuguese moderate peacemaker title is localized', () {
    final title = levelTitle(6, Alignment.moderate);

    expect(title, equals('Pacificador'));
    expect(strLenX(title), lessThanOrEqualTo(CONSOLE_WIDTH));
  });

  test('English level titles remain unchanged', () async {
    LcsI18n.reset();
    await LcsI18n.initialize('en_US');

    expect(levelTitle(-2, Alignment.liberal), equals('In Crisis'));
    expect(levelTitle(-1, Alignment.moderate), equals('Unstable'));
    expect(levelTitle(0, Alignment.conservative), equals('Struggling'));
    expect(levelTitle(6, Alignment.moderate), equals('Peacemaker'));
  });
}
