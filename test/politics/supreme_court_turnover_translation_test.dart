import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/console.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/supreme_court.dart';
import 'package:lcs_new_age/utils/colors.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

const _expectedLabels = {
  DeepAlignment.archConservative: 'Arqui-Conservador',
  DeepAlignment.conservative: 'Conservador',
  DeepAlignment.moderate: 'moderado',
  DeepAlignment.liberal: 'Liberal (pol.)',
  DeepAlignment.eliteLiberal: 'Liberal de Elite',
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    erase();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('all Supreme Court alignments have localized labels', () {
    for (final entry in _expectedLabels.entries) {
      expect(
        localizedSupremeCourtAlignment(entry.key),
        equals(entry.value),
        reason: entry.key.name,
      );
    }
    expect(LcsI18n.tr(' is stepping down.'), equals(' está deixando o cargo.'));
  });

  test('turnover sentences localize labels and preserve name colors', () {
    for (final entry in _expectedLabels.entries) {
      final alignment = entry.key;
      final localizedLabel = entry.value;
      const name = 'Jennifer Wolfe';

      erase();
      mvaddstrc(
        0,
        0,
        white,
        '{label} Justice ',
        params: {'label': localizedSupremeCourtAlignment(alignment)},
      );
      addstrc(alignment.color, name, noTranslate: true);
      addstrc(white, ' is stepping down.');

      final departing = _consoleLine(0);
      expect(
        departing,
        equals('$localizedLabel Justiça $name está deixando o cargo.'),
        reason: alignment.name,
      );
      expect(departing, isNot(contains('stepping down')));
      expect(departing.length, lessThanOrEqualTo(CONSOLE_WIDTH));
      final nameStart = '$localizedLabel Justiça '.length;
      expect(console.buffer[0][nameStart].foreground, equals(alignment.color));
      expect(
        console.buffer[0][nameStart + name.length].foreground,
        equals(white),
      );

      erase();
      mvaddstr(
        0,
        0,
        'After much debate and televised testimony, a new justice,',
      );
      move(1, 0);
      addstr('the Honorable ');
      addstrc(alignment.color, name, noTranslate: true);
      addstrc(
        lightGray,
        ', {alignment}, is appointed to the bench.',
        params: {'alignment': localizedSupremeCourtAlignment(alignment)},
      );

      final appointment = _consoleLine(1);
      expect(
        _consoleLine(0),
        equals('Após muito debate e testemunho televisionado, um novo juiz,'),
        reason: alignment.name,
      );
      expect(
        appointment,
        equals('o Honorável $name, $localizedLabel, é nomeado para o banco.'),
        reason: alignment.name,
      );
      expect(appointment, isNot(contains(', ${entry.key.label},')));
      expect(appointment.length, lessThanOrEqualTo(CONSOLE_WIDTH));
      final appointmentNameStart = 'o Honorável '.length;
      expect(
        console.buffer[1][appointmentNameStart].foreground,
        equals(alignment.color),
      );
    }
    expect(LcsI18n.getMissingTranslations(), isEmpty);
  });
}
