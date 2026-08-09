import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/daily/siege.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/title_screen/world.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    gameState = GameState();
    makeWorld();
    await LcsI18n.initialize('pt_BR');
    erase();
    move(0, 0);
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese police warning uses a natural questioning phrase', () async {
    final site = sites.first;
    console.injectKey('Enter');

    await stateBrokenLaws(site);

    expect(
      _consoleLine(4).trim(),
      'Você está sendo procurado para interrogatório!',
    );
    expect(_consoleLine(4), isNot(contains('procurado por interrogatório')));
  });

  test('Portuguese CIA raid arrival sentence translates the full template', () {
    const template =
        'In the dead of the night, a column of unmarked black vans with '
        'tinted windows surrounds the {location}.';

    expect(
      LcsI18n.processString(template, {'location': 'Antigo Motel'}),
      'No meio da noite, uma coluna de vans pretas sem identificação e com '
      'vidros escuros cerca o Antigo Motel.',
    );
  });

  test('CIA suspense paragraphs wrap long Portuguese messages', () {
    final source = File('lib/daily/siege.dart').readAsStringSync();
    final wrappedMessage = RegExp(
      r'addparagraph\(\s*console\.y \+ 2,\s*1,\s*'
      r'compoundSuspense\.random\s*\);',
    );
    final wrappedDarkness = RegExp(
      r'addparagraph\(\s*console\.y \+ 2,\s*1,\s*'
      r'"The compound is plunged into darkness as the doors spontaneously unlock\."',
    );

    expect(wrappedMessage.hasMatch(source), isTrue);
    expect(wrappedDarkness.hasMatch(source), isTrue);

    erase();
    addparagraph(
      0,
      1,
      'Every security camera simultaneously pivots to stare directly at squad '
      'members.',
    );
    addparagraph(
      3,
      1,
      'The compound is plunged into darkness as the doors spontaneously unlock.',
    );

    final rendered =
        '${_consoleLine(0)} ${_consoleLine(1)} '
                '${_consoleLine(3)} ${_consoleLine(4)}'
            .replaceAll(RegExp(r'\s+'), ' ');
    expect(rendered, contains('membros do esquadrão.'));
    expect(rendered, contains('destrancam espontaneamente.'));
    expect(_consoleLine(0).length, lessThanOrEqualTo(console.width - 1));
    expect(_consoleLine(1).length, lessThanOrEqualTo(console.width - 1));
    expect(_consoleLine(3).length, lessThanOrEqualTo(console.width - 1));
    expect(_consoleLine(4).length, lessThanOrEqualTo(console.width - 1));
  });

  test('under-attack briefing wraps translated body before the prompt', () {
    final source = File('lib/daily/siege.dart').readAsStringSync();

    expect(source, contains('final engagementBriefing ='));
    expect(
      RegExp(
        r'addparagraph\(\s*3,\s*2,\s*engagementBriefing,\s*'
        r'y2:\s*21,\s*x2:\s*console\.width - 1,\s*'
        r'noTranslate:\s*true,\s*\)',
      ).hasMatch(source),
      isTrue,
    );
  });
}
