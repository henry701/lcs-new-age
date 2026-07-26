import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese media overview localizes its chrome', () {
    expect(LcsI18n.tr('Media Overview'), equals('Visão geral da mídia'));
    expect(LcsI18n.tr('HEADLINE'), equals('MANCHETE'));
    expect(LcsI18n.tr('DATE'), equals('DATA'));
    expect(LcsI18n.tr('SOURCE'), equals('FONTE'));
    expect(LcsI18n.tr('IMPACT'), equals('IMPACTO'));
    expect(
      LcsI18n.tr('Press a Letter to read a news article'),
      equals('Pressione uma letra para ler uma notícia'),
    );
    expect(
      LcsI18n.tr(
        'LCS activities will inspire supporters, but may alienate detractors.',
      ),
      equals(
        'As atividades da LCS inspirarão apoiadores, mas podem afastar detratores.',
      ),
    );
    expect(
      LcsI18n.tr(
        'Avoiding violence will increase public support for your actions.',
      ),
      equals('Evitar a violência aumentará o apoio público às suas ações.'),
    );
  });
}
