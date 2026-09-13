import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese Political Activist profile type is localized', () {
    expect(LcsI18n.hasTranslation('Political Activist'), isTrue);
    expect(LcsI18n.tr('Political Activist'), 'Ativista Político');

    final profileHeading =
        LcsI18n.processString('Name: {name}, {title} ({type})', {
          'name': 'Margaret bin LadenR',
          'title': 'Ameaça Socialista',
          'type': LcsI18n.tr('Political Activist'),
        });
    expect(
      profileHeading,
      'Nome: Margaret bin LadenR, Ameaça Socialista (Ativista Político)',
    );
  });
}
