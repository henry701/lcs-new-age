import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

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
      'Highschool Dropout': 'Desistente do Ensino Médio',
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

  test(
    'Portuguese recruitment and rejection fallback labels are localized',
    () {
      expect(LcsI18n.tr('Biker'), equals('Motociclista'));
      expect(LcsI18n.tr('"Whatever."'), equals('"Tanto faz."'));
    },
  );

  test('Portuguese recruitment discussions localize law labels', () {
    const labels = {
      'Abortion Rights': 'Direitos ao Aborto',
      'Animal Rights': 'Direitos dos Animais',
      'Police Regulation': 'Regulação Policial',
      'Privacy Rights': 'Direito à Privacidade',
      'Death Penalty': 'Pena de Morte',
      'Nuclear Power': 'Energia Nuclear',
      'Pollution': 'Poluição',
      'Labor Rights': 'Direitos Trabalhistas',
      'LGBTQ+ Rights': 'Direitos LGBTQ+',
      'Corporate Law': 'Lei Corporativa',
      'Free Speech': 'Liberdade de Expressão',
      'Flag Burning': 'Queima de Bandeira',
      'Gun Control': 'Controle de Armas',
      'Tax Structure': 'Estrutura Tributária',
      'Gender Equality': 'Igualdade de Gênero',
      'Civil Rights': 'Direitos Civis',
      'Drug Laws': 'Leis sobre Drogas',
      'Immigration': 'Imigração',
      'Election Reform': 'Reforma Eleitoral',
      'Military Spending': 'Gastos Militares',
      'Prison Reform': 'Reforma Prisional',
      'Torture': 'Tortura',
      'Housing': 'Moradia',
      'Healthcare': 'Saúde',
      'Retirement': 'Aposentadoria',
    };

    for (final entry in labels.entries) {
      expect(LcsI18n.tr(entry.key), equals(entry.value));
    }
  });

  test('Portuguese recruitment status wording avoids gendered agreement', () {
    expect(
      LcsI18n.processString('{name} is ready to fight for the Liberal Cause.', {
        'name': 'Ramona Friend',
      }),
      equals('Ramona Friend está a postos para lutar pela Causa Liberal.'),
    );
    expect(
      LcsI18n.processString(
        'B - Just casually chat with them and discuss politics.',
        null,
      ),
      equals(
        'B - Apenas converse casualmente e discuta política com essa pessoa.',
      ),
    );
    expect(
      LcsI18n.processString(
        "{recruit} isn't convinced {recruiter} really understands the problem.",
        {'recruit': 'Milena', 'recruiter': 'Sally'},
      ),
      equals('Milena não acredita que Sally realmente entenda o problema.'),
    );
  });

  test('Portuguese recruit acceptance wording is gender-neutral', () {
    expect(
      LcsI18n.processString('{recruit} accepts, and is eager to get started.', {
        'recruit': 'Ariana Dench',
      }),
      equals('Ariana Dench aceita, e quer começar logo.'),
    );
  });

  test('Portuguese recruitment follow-up text wraps instead of clipping', () {
    erase();
    addparagraph(
      0,
      1,
      'After more discussion, {name} agrees to come by later tonight.',
      params: {'name': 'Estudante Universitário'},
      x2: 79,
    );

    final rendered = '${_consoleLine(0)}${_consoleLine(1)}';
    expect(rendered, contains('à noite.'));
    expect(_consoleLine(0).length, lessThanOrEqualTo(79));
    expect(_consoleLine(1).length, lessThanOrEqualTo(79));
  });

  test('Portuguese fallback activity uses the recruiting infinitive', () {
    expect(
      LcsI18n.processString(
        '{member} acted with {squad} instead of recruiting.',
        {'member': 'Rich Nevinson', 'squad': 'O Esquadrão do Crime Liberal'},
      ),
      equals(
        'Rich Nevinson agiu com O Esquadrão do Crime Liberal em vez de recrutar.',
      ),
    );
  });

  test('Portuguese generic activity mismatch uses a grammatical fallback', () {
    expect(
      LcsI18n.processString(
        '{member} acted with {squad} instead of carrying out the planned activity.',
        {'member': 'Hiro Németh', 'squad': 'O Esquadrão do Crime Liberal'},
      ),
      'Hiro Németh agiu com O Esquadrão do Crime Liberal em vez de cumprir a atividade planejada.',
    );
  });
}
