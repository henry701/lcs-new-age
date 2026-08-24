import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/ledger.dart';
import 'package:lcs_new_age/gamestate/time.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/monthly/lcs_monthly.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

Map<String, String> _loadCatalog(String locale) {
  final entries = <String, String>{};
  final pattern = RegExp('app_${locale}_part\\d+\\.arb\$');
  for (final file in Directory('lib/l10n').listSync().whereType<File>()) {
    if (!pattern.hasMatch(file.path)) continue;
    final decoded = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    for (final entry in decoded.entries) {
      if (!entry.key.startsWith('@') && entry.value is String) {
        entries[entry.key] = entry.value as String;
      }
    }
  }
  return entries;
}

void _queueEnter() {
  console.keyEvent(
    KeyDownEvent(
      physicalKey: PhysicalKeyboardKey.enter,
      logicalKey: LogicalKeyboardKey.enter,
      timeStamp: Duration.zero,
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    LcsI18n.reset();
    gameState = GameState();
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('month-end keys have exact English and Portuguese catalog entries', () {
    final english = _loadCatalog('en_US');
    final portuguese = _loadCatalog('pt_BR');
    const expectedPortuguese = {
      'Congress is acting on legislation!':
          'O Congresso está deliberando sobre projetos de lei!',
      'House': 'Câmara',
      'Senate': 'Senado',
      'President': 'Presidente',
      'Cash': 'Dinheiro',
      'Tools and Weapons': 'Ferramentas e Armas',
      'Clothing and Armor': 'Roupas e Armaduras',
      'Ammunition': 'Munição',
      'Miscellaneous Loot': 'Outros Espólios',
    };

    for (final entry in expectedPortuguese.entries) {
      expect(english[entry.key], entry.key, reason: entry.key);
      expect(portuguese[entry.key], entry.value, reason: entry.key);
    }
  });

  test('Portuguese constitutional amendment fragments remain grammatical', () {
    final portuguese = _loadCatalog('pt_BR');
    const expectedPortuguese = {
      'In light of the Conservative nature of entrenched politicians,':
          'À luz da natureza Conservadora de políticos arraigados,',
      'and the corrupting influence of incumbency on the democratic process,':
          'e da influência corruptora da permanência no cargo sobre o processo democrático,',
      'all members of the House of Representatives and Senate shall henceforth':
          'todos os membros da Câmara dos Deputados e do Senado deverão, daqui em diante,',
      'be limited to one term in office.  This shall be immediately enforced':
          'ter apenas um mandato. Essa regra será aplicada imediatamente',
      'by holding elections to replace all members of Congress upon the':
          'por meio de eleições para substituir todos os membros do Congresso após a',
      'ratification of this amendment.': 'ratificação desta emenda.',
    };

    for (final entry in expectedPortuguese.entries) {
      expect(portuguese[entry.key], entry.value, reason: entry.key);
    }
  });

  test(
    'Portuguese Supreme Court purge headings localize singular and plural forms',
    () async {
      const expectedPortuguese = {
        'The following former citizens are branded Arch-Conservative:':
            'Os seguintes ex-cidadãos são classificados como Arqui-Conservadores:',
        'The following former citizen is branded Arch-Conservative:':
            'A seguinte pessoa é classificada como Arqui-Conservadora:',
      };

      final constitution = File(
        'lib/politics/constitution.dart',
      ).readAsStringSync();
      expect(constitution, contains('final purgeHeading = tossnum != 1'));
      expect(constitution, contains('LcsI18n.tr('));
      expect(
        constitution,
        contains(
          '"The following former citizens are branded Arch-Conservative:"',
        ),
      );
      expect(
        constitution,
        contains(
          '"The following former citizen is branded Arch-Conservative:"',
        ),
      );
      expect(
        constitution,
        contains('mvaddstr(2, 5, purgeHeading, noTranslate: true);'),
      );

      final portuguese = _loadCatalog('pt_BR');
      for (final entry in expectedPortuguese.entries) {
        expect(portuguese[entry.key], entry.value, reason: entry.key);
      }

      await LcsI18n.initialize('pt_BR');
      for (final entry in expectedPortuguese.entries) {
        final translatedHeading = LcsI18n.tr(entry.key);
        expect(translatedHeading, entry.value, reason: entry.key);
        mvaddstr(0, 0, translatedHeading, noTranslate: true);
        expect(_consoleLine(0), startsWith(entry.value), reason: entry.key);
      }
      expect(LcsI18n.getMissingTranslations(), isEmpty);
    },
  );

  test('Portuguese month names and abbreviations are localized', () async {
    await LcsI18n.initialize('pt_BR');

    expect(getMonth(1), equals('Janeiro'));
    expect(getMonth(2), equals('Fevereiro'));
    expect(getMonth(5), equals('Maio'));
    expect(getMonthShort(1), equals('jan'));
    expect(getMonthShort(2), equals('fev'));
  });

  test(
    'Portuguese Congress notice and result labels render within 80 columns',
    () async {
      await LcsI18n.initialize('pt_BR');
      _queueEnter();

      await showMessage('Congress is acting on legislation!');
      mvaddstr(0, 62, LcsI18n.tr('House'), noTranslate: true);
      mvaddstr(0, 70, LcsI18n.tr('Senate'), noTranslate: true);
      mvaddstr(1, 35, LcsI18n.tr('President'), noTranslate: true);

      expect(
        _consoleLine(8),
        contains('O Congresso está deliberando sobre projetos de lei!'),
      );
      expect(_consoleLine(0).substring(62), startsWith('Câmara'));
      expect(_consoleLine(0).substring(70), startsWith('Senado'));
      expect(_consoleLine(1).substring(35), startsWith('Presidente'));
      for (final y in [0, 1, 8]) {
        expect(_consoleLine(y).length, lessThanOrEqualTo(80), reason: 'row $y');
      }
    },
  );

  test('Portuguese funding report renders every localized asset row', () async {
    await LcsI18n.initialize('pt_BR');
    ledger.forceSetFunds(7);
    _queueEnter();

    await fundReport(false);

    expect(_consoleLine(2), startsWith('Dinheiro'));
    expect(_consoleLine(2), contains('US\$ 7'));
    expect(_consoleLine(3), startsWith('Ferramentas e Armas'));
    expect(_consoleLine(4), startsWith('Roupas e Armaduras'));
    expect(_consoleLine(5), startsWith('Munição'));
    expect(_consoleLine(6), startsWith('Outros Espólios'));
    for (var y = 2; y <= 6; y++) {
      expect(_consoleLine(y).length, lessThanOrEqualTo(80), reason: 'row $y');
    }
    expect(LcsI18n.getMissingTranslations(), isEmpty);
  });

  test(
    'Portuguese funding report renders dynamic currency values once',
    () async {
      await LcsI18n.initialize('pt_BR');
      ledger.forceSetFunds(7);
      ledger.income[Income.donations] = 1200;
      ledger.dailyIncome[Income.donations] = 120;
      ledger.expense[Expense.travel] = 300;
      ledger.dailyExpense[Expense.travel] = 30;
      _queueEnter();

      await fundReport(false);

      final rendered = List.generate(25, _consoleLine).join('\n');
      expect(rendered, contains('US\$ 1.200'));
      expect(rendered, contains('US\$ 300'));
      final missing = LcsI18n.getMissingTranslations();
      expect(missing, isNot(contains('+US\$ 1.200')));
      expect(missing, isNot(contains('-US\$ 300')));
    },
  );

  test('English month-end rendering remains unchanged', () async {
    await LcsI18n.initialize('en_US');
    ledger.forceSetFunds(7);
    _queueEnter();

    await fundReport(false);

    expect(_consoleLine(2), startsWith('Cash'));
    expect(_consoleLine(3), startsWith('Tools and Weapons'));
    expect(_consoleLine(4), startsWith('Clothing and Armor'));
    expect(_consoleLine(5), startsWith('Ammunition'));
    expect(_consoleLine(6), startsWith('Miscellaneous Loot'));

    _queueEnter();
    await showMessage('Congress is acting on legislation!');
    mvaddstr(0, 62, 'House');
    mvaddstr(0, 70, 'Senate');
    mvaddstr(1, 35, 'President');

    expect(_consoleLine(8), contains('Congress is acting on legislation!'));
    expect(_consoleLine(0).substring(62), startsWith('House'));
    expect(_consoleLine(0).substring(70), startsWith('Senate'));
    expect(_consoleLine(1).substring(35), startsWith('President'));
  });
}
