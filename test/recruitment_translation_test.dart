import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese recruitment meeting options preserve their hotkeys', () {
    expect(
      LcsI18n.processString(
        'A - Spend \$50 on props and a book for them to keep.',
        null,
      ),
      equals('A - Gaste \$50 em materiais e um livro para guardar.'),
    );
    expect(
      LcsI18n.processString('C - {recruit} joins the LCS.', {
        'recruit': 'Alex',
      }),
      equals('C - Alex entra para o LCS.'),
    );
    expect(
      LcsI18n.processString('D - Break off the meetings.', null),
      equals('D - Interromper as reuniões.'),
    );
  });

  test('Portuguese recruitment status templates translate placeholders', () {
    expect(
      LcsI18n.processString(
        '{name} can manage {subordinateCount} more {subordinateLabel}, and has {meetingCount} {meetingLabel} scheduled.',
        {
          'name': 'Alex',
          'subordinateCount': 2,
          'subordinateLabel': LcsI18n.tr('subordinates'),
          'meetingCount': 1,
          'meetingLabel': LcsI18n.tr('meeting'),
        },
      ),
      equals(
        'Alex pode gerenciar mais 2 subordinados e tem 1 reunião na agenda.',
      ),
    );
    expect(
      LcsI18n.processString(
        '{pronounCap} cannot maintain any more relationships, but still has {dateCount} {dateLabel} lined up.',
        {
          'pronounCap': 'Ela',
          'dateCount': 2,
          'dateLabel': LcsI18n.tr('hot dates'),
        },
      ),
      equals(
        'Ela não pode manter mais relacionamentos, mas ainda tem 2 encontros marcados.',
      ),
    );
  });

  test('Portuguese issue discussion fragments translate before quote wrapping', () {
    final firstLine = LcsI18n.tr(
      'The prison system doesn\'t help criminals by providing rehabilitation, so',
    );
    final secondLine = LcsI18n.tr(
      'when they get released, they mostly become criminals again.',
    );

    expect(
      '"$firstLine $secondLine"',
      equals(
        '"O sistema prisional não ajuda criminosos fornecendo reabilitação, então quando são libertados, a maioria se torna criminosos novamente."',
      ),
    );
    expect(LcsI18n.tr('"What?"'), equals('"O quê?"'));
  });

  test('Portuguese recruitment type labels are localized', () {
    const labels = {
      'College Student': 'Estudante Universitário',
      'Drug Addict': 'Dependente Químico',
      'Emo': 'Emo (estilo)',
      'Goth': 'Gótico',
      'Highschool Dropout': 'Evadido do Ensino Médio',
      'Hippie': 'Hippie (movimento)',
      'Homeless': 'Sem-teto',
      'Punk': 'Punk (estilo)',
      'Gang Member': 'Membro de Gangue',
      'Janitor': 'Zelador',
      'Lab Tech': 'Técnico de Laboratório',
      'Liberal Judge': 'Juiz Liberal',
      'Lawyer': 'Advogado',
    };

    for (final entry in labels.entries) {
      expect(LcsI18n.tr(entry.key), equals(entry.value));
    }
  });
}
