import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/saveload/save_load.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakePathProvider extends PathProviderPlatform {
  _FakePathProvider(this.path);

  final String path;

  @override
  Future<String?> getApplicationDocumentsPath() async => path;
}

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
    erase();
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese save deletion accepts Sim', () async {
    SharedPreferences.setMockInitialValues({});
    final tempDirectory = await Directory.systemTemp.createTemp(
      'lcs-save-translation-test-',
    );
    addTearDown(() => tempDirectory.delete(recursive: true));
    PathProviderPlatform.instance = _FakePathProvider(tempDirectory.path);

    await initStorage();
    final gameId = 'pt-delete-${DateTime.now().microsecondsSinceEpoch}';
    final save = SaveFile(
      version: '1.5.0',
      saveData: <String, dynamic>{},
      gameId: gameId,
      lastPlayed: null,
    );
    addTearDown(() => deleteSaveGameId(gameId));

    await saveGameFile(save);
    console.injectKey('s');
    await deleteSave(save);

    expect(
      _consoleLine(3).trim(),
      'Tem CERTEZA de que quer excluir este salvamento?',
    );
    expect(_consoleLine(5), contains('Y - Sim, excluir o salvamento.'));
    expect(
      (await loadGameList()).where((item) => item.gameId == gameId),
      isEmpty,
    );
  });
}
