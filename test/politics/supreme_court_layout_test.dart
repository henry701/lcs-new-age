import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/console.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/politics/supreme_court.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join();

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

  test(
    'long Portuguese Supreme Court precedents leave room for both vote labels',
    () {
      const precedents = [
        'expand landlord rights',
        'curtail abusive police behavior',
      ];

      for (var index = 0; index < precedents.length; index++) {
        final precedentRow = index * 3 + 3;
        mvaddstr(
          precedentRow,
          0,
          LcsI18n.tr('A new precedent would '),
          noTranslate: true,
        );
        addstr(fitSupremeCourtPrecedent(precedents[index]), noTranslate: true);
        addstr('. ', noTranslate: true);

        mvaddstr(
          precedentRow - 1,
          supremeCourtVoteColumn,
          '{votes} for Change',
          params: {'votes': '4'},
        );
        mvaddstr(
          precedentRow,
          supremeCourtVoteColumn,
          '{votes} for Status Quo',
          params: {'votes': '6'},
        );

        final line = _consoleLine(precedentRow);
        expect(line.length, equals(CONSOLE_WIDTH));
        expect(
          line.substring(supremeCourtVoteColumn),
          startsWith('6 pelo Status Quo'),
        );
        expect(
          line.substring(0, supremeCourtVoteColumn - 1),
          equals(
            '${LcsI18n.tr('A new precedent would ')}'
            '${fitSupremeCourtPrecedent(precedents[index])}.',
          ),
        );
        expect(line[supremeCourtVoteColumn - 1], equals(' '));
        expect(line, isNot(contains('expand landlord rights')));
        expect(line, isNot(contains('curtail abusive police behavior')));
      }

      expect(
        _consoleLine(2).substring(supremeCourtVoteColumn),
        startsWith('4 pela Mudança'),
      );
      expect(
        _consoleLine(5).substring(supremeCourtVoteColumn),
        startsWith('4 pela Mudança'),
      );
      expect(LcsI18n.getMissingTranslations(), isEmpty);
    },
  );
}
