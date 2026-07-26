import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
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

  test(
    'Portuguese Congress notice and result labels render within 80 columns',
    () async {
      await LcsI18n.initialize('pt_BR');
      _queueEnter();

      await showMessage('Congress is acting on legislation!');
      mvaddstr(0, 62, 'House');
      mvaddstr(0, 70, 'Senate');
      mvaddstr(1, 35, 'President');

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
    expect(_consoleLine(3), startsWith('Ferramentas e Armas'));
    expect(_consoleLine(4), startsWith('Roupas e Armaduras'));
    expect(_consoleLine(5), startsWith('Munição'));
    expect(_consoleLine(6), startsWith('Outros Espólios'));
    for (var y = 2; y <= 6; y++) {
      expect(_consoleLine(y).length, lessThanOrEqualTo(80), reason: 'row $y');
    }
    expect(LcsI18n.getMissingTranslations(), isEmpty);
  });

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
