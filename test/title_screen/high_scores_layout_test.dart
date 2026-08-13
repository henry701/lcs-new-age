import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/saveload/save_load.dart';
import 'package:lcs_new_age/title_screen/game_over.dart';
import 'package:lcs_new_age/title_screen/high_scores.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _HighScorePathProvider extends PathProviderPlatform {
  _HighScorePathProvider(this.path);

  final String path;

  @override
  Future<String?> getApplicationDocumentsPath() async => path;
}

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final tempDirectory = await Directory.systemTemp.createTemp(
      'lcs-high-score-layout-test-',
    );
    addTearDown(() => tempDirectory.delete(recursive: true));
    PathProviderPlatform.instance = _HighScorePathProvider(tempDirectory.path);
    await initStorage();
    await LcsI18n.initialize('pt_BR');
    console.injectedKeys.clear();
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    console.injectedKeys.clear();
    erase();
  });

  test(
    'Portuguese game-over ending rows fit the fixed console width',
    () async {
      final score = HighScore(
        slogan: 'Avante',
        month: 9,
        year: 2026,
        statRecruits: 0,
        statMartyrs: 0,
        statKills: 0,
        statKidnappings: 0,
        statFunds: 0,
        statSpent: 0,
        statBuys: 0,
        statBurns: 0,
        endType: Ending.medicalSiege,
      );
      final highScores = HighScores()..scoreList.add(score);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('scoreVersion', scoreVersion);
      await prefs.setString('score', jsonEncode(highScores.toJson()));

      console.injectKey('Enter');
      await viewHighScores(score);

      final fullEnding = LcsI18n.processString(
        'The Liberal Crime Squad was billed to death in {month} {year}.',
        {'month': 'Setembro', 'year': 2026},
      );
      expect(
        fullEnding,
        'O Esquadrão do Crime Liberal foi à falência por contas médicas em '
        'Setembro de 2026.',
      );
      expect(fullEnding.length, greaterThan(console.width));
      expect(
        _consoleLine(3),
        equals(fitConsoleText(fullEnding, console.width)),
      );
    },
  );
}
