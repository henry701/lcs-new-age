import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/creature/gender.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/location.dart';
import 'package:lcs_new_age/map_editor/map_canvas.dart';
import 'package:lcs_new_age/map_editor/map_editor_screen.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/saveload/save_load.dart';
import 'package:lcs_new_age/sitemode/sitemap.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_support.dart';

class _PathProvider extends PathProviderPlatform {
  _PathProvider(this.path);

  final String path;

  @override
  Future<String?> getApplicationDocumentsPath() async => path;
}

class _ArraySavePicker extends FilePicker {
  @override
  Future<FilePickerResult?> pickFiles({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool allowCompression = false,
    int compressionQuality = 0,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
    bool lockParentWindow = false,
    bool readSequential = false,
  }) async {
    return FilePickerResult([
      PlatformFile(
        name: 'broken.json',
        size: 2,
        bytes: Uint8List.fromList(utf8.encode('[]')),
      ),
    ]);
  }
}

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

const _expectedPtAlignmentLabels = {
  DeepAlignment.archConservative: 'Arqui-Conservador',
  DeepAlignment.conservative: 'Conservador',
  DeepAlignment.moderate: 'moderado',
  DeepAlignment.liberal: 'Liberal (pol.)',
  DeepAlignment.eliteLiberal: 'Liberal de Elite',
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    LcsI18n.reset();
    erase();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    console.injectedKeys.clear();
    LcsI18n.reset();
    erase();
  });

  test('presidential nominee alignment is prose with one separator', () async {
    await LcsI18n.initialize('pt_BR');
    for (final alignment in DeepAlignment.values) {
      final expectedLabel = _expectedPtAlignmentLabels[alignment]!;
      expect(LcsI18n.tr(alignment.label), expectedLabel);

      final row = LcsI18n.processString('{name}, {align}', {
        'name': 'Alex Roe',
        'align': LcsI18n.tr(alignment.label),
      }, noTranslate: true);

      expect(row, 'Alex Roe, $expectedLabel');
      expect(row.contains(RegExp(r',\s{2,}')), isFalse);
      expect(row.length, lessThanOrEqualTo(console.width));
    }
  });

  test('desktop save-import dialog title is localized', () {
    expect(LcsI18n.hasTranslation('Select an LCS: New Age Save File'), isTrue);
    expect(
      LcsI18n.tr('Select an LCS: New Age Save File'),
      'Selecionar um arquivo de salvamento do LCS: New Age',
    );
  });

  test('save-import errors wrap without colliding with actions', () async {
    SharedPreferences.setMockInitialValues({});
    final directory = await Directory.systemTemp.createTemp(
      'lcs-import-error-batch-c-',
    );
    addTearDown(() => directory.delete(recursive: true));
    PathProviderPlatform.instance = _PathProvider(directory.path);
    await initStorage();
    FilePicker.platform = FilePickerIO();
    final previousPicker = FilePicker.platform;
    FilePicker.platform = _ArraySavePicker();
    addTearDown(() => FilePicker.platform = previousPicker);
    console.injectKey('Enter');

    await importSave();

    expect(_consoleLine(1).trim(), startsWith('Erro ao importar salvamento:'));
    expect(_consoleLine(1).length, lessThanOrEqualTo(80));
    expect(_consoleLine(2), isNotEmpty);
    expect(_consoleLine(2), contains("Map<String, dynamic>'"));
    expect(_consoleLine(3), contains('R - Gerar Relatório de Falha'));
    expect(_consoleLine(4), contains('Qualquer Outra Tecla'));
    expect(_consoleLine(3).length, lessThanOrEqualTo(80));
    expect(_consoleLine(4).length, lessThanOrEqualTo(80));
  });

  test('interrogation workplace and quotation punctuation localize cleanly', () {
    final workplace = LcsI18n.processString(
      "{name} talks about {location}, though it doesn't seem like {pronoun} knows anything new.",
      {
        'name': 'Jamie Doe',
        'location': localizedAboutLocation(_WorkLocation('Centro Médico UW')),
        'pronoun': LcsI18n.tr('she'),
      },
    );
    expect(workplace, contains('sobre o Centro Médico UW'));
    expect(workplace, isNot(contains('the Centro Médico UW')));

    final quote = LcsI18n.processString(
      '{lead} interrogates {hostage}, {action} "{question}"',
      {
        'lead': 'Alex Roe',
        'hostage': 'Jamie Doe',
        'action': LcsI18n.tr('saying'),
        'question': LcsI18n.tr('What do you know?'),
      },
    );
    expect(quote, contains('dizendo "O que você sabe?"'));
    expect(quote.contains('" '), isFalse);
  });

  test('ransom outcomes agree across lead genders and branches', () {
    final subjects = {
      Gender.male: 'Ele',
      Gender.female: 'Ela',
      Gender.nonbinary: 'Elu',
    };
    final arrestEndings = {
      Gender.male: 'dominado e preso',
      Gender.female: 'dominada e presa',
      Gender.nonbinary: 'dominade e prese',
    };

    for (final entry in subjects.entries) {
      final arrest = LcsI18n.processString('{subject} {action}.', {
        'subject': entry.value,
        'action': LcsI18n.trGendered(
          'is quickly overwhelmed and arrested',
          gender: entry.key,
        ),
      });
      expect(arrest, contains(arrestEndings[entry.key]!));

      final custody = LcsI18n.processString('{subject} {action}.', {
        'subject': entry.value,
        'action': LcsI18n.trGendered(
          'is taken into custody without incident',
          gender: entry.key,
        ),
      });
      expect(custody, contains('sob custódia sem incidentes'));

      final narrowEscape = LcsI18n.processString('{subject} {action}...', {
        'subject': entry.value,
        'action': LcsI18n.trGendered(
          'gets away by the skin of {possessive} teeth',
          gender: entry.key,
        ),
        'possessive': entry.key.hisHer,
      });
      expect(narrowEscape, isNot(contains('his ')));
      expect(narrowEscape, isNot(contains('her ')));
      expect(narrowEscape, isNot(contains('their ')));
    }
  });

  test('sleeper and president nouns agree across genders', () {
    final expectations = {
      Gender.male: 'O agente infiltrado Jamie Doe',
      Gender.female: 'A agente infiltrada Jamie Doe',
      Gender.nonbinary: 'Agente infiltrade Jamie Doe',
    };
    for (final entry in expectations.entries) {
      final leak =
          LcsI18n.processString('{role} {name} has leaked {description}.', {
            'role': LcsI18n.trGendered('Sleeper', gender: entry.key),
            'name': 'Jamie Doe',
            'description': LcsI18n.tr('secret intelligence files'),
          });
      expect(leak, startsWith(entry.value));
    }

    final presidents = {
      Gender.male: 'O presidente Jamie Doe',
      Gender.female: 'A presidente Jamie Doe',
      Gender.nonbinary: 'Presidente Jamie Doe',
    };
    for (final entry in presidents.entries) {
      final president = LcsI18n.processString(
        '{role} {name} has been impeached for corruption.',
        {
          'role': LcsI18n.trGendered('President', gender: entry.key),
          'name': 'Jamie Doe',
        },
      );
      expect(president, startsWith(entry.value));
    }
  });

  test('Portuguese location connector selects definite article', () {
    expect(
      localizedAboutLocation(_WorkLocation('Centro Médico UW')),
      'o Centro Médico UW',
    );
    expect(localizedAboutLocation(_WorkLocation('Loja Zhang')), 'a Loja Zhang');
  });

  testWidgets('map editor fits narrow palette and status layouts', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 240);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      const MaterialApp(home: MapEditorScreen(directLaunch: true)),
    );
    for (var i = 0; i < 12; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }

    final canvas = tester.widget<MapCanvas>(find.byType(MapCanvas));
    var hoveredSpecial = false;
    outer:
    for (var x = 0; x < MAPX; x++) {
      for (var y = 0; y < MAPY; y++) {
        if (levelMap[x][y][canvas.controller.currentFloor].special !=
            TileSpecial.none) {
          canvas.controller.setHover(x, y);
          hoveredSpecial = true;
          break outer;
        }
      }
    }
    expect(hoveredSpecial, isTrue);
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.textContaining('('), findsWidgets);
    expect(find.text('Terreno'), findsOneWidget);
    expect(find.text('Cofre'), findsOneWidget);
  });

  testWidgets('map editor status remains bounded at 480 by 320', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(480, 320);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      const MaterialApp(home: MapEditorScreen(directLaunch: true)),
    );
    for (var i = 0; i < 12; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }

    expect(tester.takeException(), isNull);
    expect(find.text('Passe o mouse no mapa'), findsOneWidget);
  });
}

final class _WorkLocation implements Location {
  _WorkLocation(this._name);

  final String _name;

  @override
  String get name => _name;
  @override
  set name(String value) {}

  @override
  int get area => 0;

  @override
  City get city => throw UnimplementedError();

  @override
  String get idString => 'test-location';

  @override
  void init() {}

  @override
  String getName({bool short = false, bool includeCity = false}) => _name;
}
