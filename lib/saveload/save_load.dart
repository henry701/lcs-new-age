import 'dart:convert';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/daily/recruitment.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/time.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/city.dart';
import 'package:lcs_new_age/location/district.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/newspaper/news_story.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/politics/laws.dart';
import 'package:lcs_new_age/politics/views.dart';
import 'package:lcs_new_age/saveload/storage/game_storage.dart';
import 'package:lcs_new_age/saveload/storage/storage_factory.dart';
import 'package:lcs_new_age/title_screen/launch_game.dart';
import 'package:lcs_new_age/title_screen/title_screen.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/interface_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'save_load.g.dart';

late GameStorage _storage;

const int saveMenuInGameDateX = 4;
const int saveMenuFounderX = 22;
const int saveMenuLastPlayedX = 48;
const int saveMenuVersionX = 70;
const Map<int, String> saveMenuHeaders = {
  saveMenuInGameDateX: "IN GAME DATE",
  saveMenuFounderX: "LCS LEADER",
  saveMenuLastPlayedX: "LAST PLAYED",
  saveMenuVersionX: "VERSION",
};
const String saveMenuFooterPrompt = "Press &B+&w to import a save.";
const String saveMenuBackButtonText = "Enter - Return to main menu";

Future<void> initStorage() async {
  _storage = createGameStorage();
  await _storage.init();

  // Check if we've already migrated
  final prefs = await SharedPreferences.getInstance();
  final bool hasMigrated = prefs.getBool('has_migrated_to_indexeddb') ?? false;

  if (!hasMigrated) {
    final bool migrated = await _migrateFromSharedPreferences();
    if (migrated) {
      await prefs.setBool('has_migrated_to_indexeddb', true);
    }
  }
}

Future<bool> _migrateFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final List<String>? saveGameIds = prefs.getStringList("savedGameIds");
  if (saveGameIds == null) return true;

  bool migrationSuccessful = true;
  for (final gameId in saveGameIds) {
    final String? version = prefs.getString("gameVersion$gameId");
    final String? savedGame = prefs.getString("savedGame$gameId");
    final String? lastPlayed = prefs.getString("lastPlayed$gameId");

    if (savedGame != null) {
      final DateTime? lastPlayedDate = lastPlayed != null
          ? DateTime.tryParse(lastPlayed)
          : null;
      try {
        final saveFile = SaveFile(
          version: version ?? "ERROR",
          saveData: jsonDecode(savedGame),
          gameId: gameId,
          lastPlayed: lastPlayedDate,
        );
        await _storage.saveGame(saveFile);
      } catch (e) {
        debugPrint('Error migrating save game $gameId: $e');
        migrationSuccessful = false;
      }
    }
  }

  // Only delete from SharedPreferences if migration was successful
  if (migrationSuccessful) {
    // Delete all save-related keys
    for (final gameId in saveGameIds) {
      await prefs.remove("gameVersion$gameId");
      await prefs.remove("savedGame$gameId");
      await prefs.remove("lastPlayed$gameId");
    }
    // Delete the list of game IDs
    await prefs.remove("savedGameIds");
  }

  return migrationSuccessful;
}

Future<void> autoSaveGame() async {
  final saveFile = SaveFile(
    version: gameSaveCompatVersion,
    saveData: gameState.toJson(),
    gameId: gameState.uniqueGameId.toString(),
    lastPlayed: DateTime.now(),
  );
  await _storage.saveGame(saveFile);
  await _storage.updateLastGameId(saveFile.gameId);
}

@JsonSerializable()
class SaveFile {
  SaveFile({
    required this.version,
    required this.saveData,
    required this.gameId,
    required this.lastPlayed,
    this.gameState,
  });
  factory SaveFile.fromJson(Map<String, dynamic> json) {
    // Older (pre-1.0.2) saves stored saveData as a JSON-encoded string rather
    // than a nested object. Previously this code decoded it based on version
    // number, but migrating between save formats could cause this to be already
    // decoded regardless of version.
    if (json["saveData"] is String) {
      json["saveData"] = jsonDecode(json["saveData"] as String);
    }
    return _$SaveFileFromJson(json);
  }
  Map<String, dynamic> toJson() => _$SaveFileToJson(this);

  final String gameId;
  final String version;
  final Map<String, dynamic> saveData;
  final DateTime? lastPlayed;
  @JsonKey(includeToJson: false, includeFromJson: false)
  final GameState? gameState;
}

String _nameOfFounder(GameState gameState) {
  return gameState.lcs.pool
          .firstWhereOrNull(
            (e) => e.hireId == null && e.align == Alignment.liberal,
          )
          ?.name ??
      "Unknown";
}

Future<bool> loadGameMenu() async {
  while (true) {
    List<SaveFile> saveFiles = await loadGameList();
    if (saveFiles.isEmpty) {
      return false;
    }
    int selectedGame = -1;
    bool import = false;
    erase();
    await pagedInterface(
      count: saveFiles.length,
      headerPrompt: "Liberal Save Game Management System",
      headerKey: saveMenuHeaders,
      footerPrompt: saveMenuFooterPrompt,
      backButtonText: saveMenuBackButtonText,
      lineBuilder: (y, key, index) {
        final SaveFile saveFile = saveFiles[index];
        DateTime? lastPlayed = saveFile.lastPlayed?.toLocal();
        String version = saveFile.version;
        String inGameDate;
        String founder;
        String lastPlayedStr;
        if (lastPlayed != null) {
          lastPlayedStr = LcsI18n.processString("{month} {day}, {year}", {
            "month": getMonthShort(lastPlayed.month),
            "day": lastPlayed.day,
            "year": lastPlayed.year,
          });
        } else {
          lastPlayedStr = LcsI18n.tr("Unknown");
        }
        if (saveFile.gameState != null) {
          inGameDate = _formatSaveMenuDate(saveFile.gameState!.date);

          founder = _nameOfFounder(saveFile.gameState!);
        } else {
          inGameDate = LcsI18n.tr("Error");
          founder = LcsI18n.tr("Error - Crash Expected");
        }
        renderSaveMenuListRow(
          y: y,
          key: key,
          inGameDate: inGameDate,
          founder: founder,
          lastPlayed: lastPlayedStr,
          version: version,
          isOutdated: compareVersionStrings(version, "1.2.0") < 0,
          isBroken: saveFile.gameState == null,
        );
      },
      onChoice: (index) async {
        selectedGame = index;
        return true;
      },
      onOtherKey: (key) {
        if (key == Key.plus) {
          import = true;
          return true;
        } else if (isBackKey(key)) {
          return true;
        }
        return false;
      },
    );
    if (import) {
      await importSave();
      continue;
    }
    SaveFile? selectedSave = selectedGame >= 0 ? saveFiles[selectedGame] : null;
    if (selectedSave != null) {
      if (await loadGame(selectedSave)) {
        return true;
      }
    } else {
      return false;
    }
  }
}

String _formatSaveMenuDate(DateTime date) {
  if (LcsI18n.currentLocale == 'pt_BR') {
    return "${date.day}/${getMonthShort(date.month)}/${date.year}";
  }
  return LcsI18n.processString("{month} {day}, {year}", {
    "month": getMonthShort(date.month),
    "day": date.day,
    "year": date.year,
  });
}

void renderSaveMenuListRow({
  required int y,
  required String key,
  required String inGameDate,
  required String founder,
  required String lastPlayed,
  required String version,
  required bool isOutdated,
  bool isBroken = false,
}) {
  setColor(isBroken ? red : lightGray);
  addOptionText(y, 0, key, "{key} - ", params: {"key": key});
  _writeSaveMenuCell(
    y: y,
    x: saveMenuInGameDateX,
    endX: saveMenuFounderX - 2,
    text: inGameDate,
  );
  _writeSaveMenuCell(
    y: y,
    x: saveMenuFounderX,
    endX: saveMenuLastPlayedX - 2,
    text: founder,
  );
  _writeSaveMenuCell(
    y: y,
    x: saveMenuLastPlayedX,
    endX: saveMenuVersionX - 2,
    text: lastPlayed,
  );
  setColor(isOutdated ? orange : lightGray);
  _writeSaveMenuCell(
    y: y,
    x: saveMenuVersionX,
    endX: console.width,
    text: version,
  );
}

void _writeSaveMenuCell({
  required int y,
  required int x,
  required int endX,
  required String text,
}) {
  final width = endX - x;
  final fittedText = text.length <= width
      ? text
      : '${text.substring(0, width - 1)}…';
  mvaddstr(y, x, fittedText, noTranslate: true);
}

Future<bool> loadGame(SaveFile selectedSave) async {
  bool broken = selectedSave.gameState == null;
  String titleText = broken
      ? LcsI18n.tr("Manage Conservatively Broken Saved Game")
      : LcsI18n.tr("Manage Saved Game");
  erase();
  int y = 3;
  if (!broken && compareVersionStrings(selectedSave.version, "1.2.0") < 0) {
    titleText = LcsI18n.tr("Manage Outdated ({version}) Saved Game");
    setColor(orange);
    mvaddstr(
      y++,
      1,
      "This older save is expected to load, but some major changes are expected:",
    );
    mvaddstr(y++, 1, "- Many weapons will be renamed or replaced");
    mvaddstr(
      y++,
      1,
      "- Clips in inventory will be replaced with single bullets or shells",
    );
    mvaddstr(
      y++,
      1,
      "- Existing Black Bloc Armor items will become Black Bloc Outfits",
    );
    y++;
  }
  mvaddstrc(
    1,
    1,
    lightGray,
    titleText,
    params: {"version": selectedSave.version},
    noTranslate: true,
  );
  addOptionText(
    y++,
    1,
    "L",
    selectedSave.gameState != null
        ? "L - Load Game"
        : "L - Load Game (Crash Report Expected)",
  );
  addOptionText(y++, 1, "D", "D - Delete Save");
  addOptionText(y++, 1, "E", "E - Export Save File");
  mvaddstr(++y, 1, "Press the key for the action you want to take.");
  while (true) {
    int c = await getKey();
    if (c == Key.l) {
      return await loadGameFromSave(selectedSave);
    } else if (c == Key.d) {
      await deleteSave(selectedSave);
      return false;
    } else if (c == Key.e) {
      await backupSave(selectedSave);
    } else if (c == Key.q || isBackKey(c)) {
      return false;
    }
  }
}

Future<bool> loadGameFromSave(SaveFile selectedSave) async {
  if (selectedSave.gameState == null) {
    debugPrint("Generating crash report from ${selectedSave.version}");
    gameState = GameState.fromJson(selectedSave.saveData);
  } else {
    debugPrint("Loading game from ${selectedSave.version}");
    gameState = selectedSave.gameState!;
  }
  applyBugFixes(selectedSave.version);
  return true;
}

Future<void> deleteSave(SaveFile selectedSave) async {
  erase();
  mvaddstrc(1, 1, lightGray, "Delete Saved Game");
  mvaddstr(3, 1, "Are you SURE you want to delete this saved game?");
  addOptionText(5, 1, "Y", "Y - Yes, delete the save.");
  addOptionText(6, 1, "N", "N - No, do not delete the save.");
  while (true) {
    int c = await getKey();
    if (isYesKey(c)) {
      await deleteSaveGameId(selectedSave.gameId);
      return;
    } else if (c == Key.n) {
      return;
    }
  }
}

Future<void> deleteSaveGameId(String gameId) async {
  await _storage.deleteGame(gameId);
}

Future<void> backupSave(SaveFile selectedSave) async {
  // When trying to figure out which save is which, your founder's
  // name is probably the most memorable thing we've got to offer.
  // If your founder's name is " ", this will return "", but honestly
  // at that point it's your fault.
  final founderFirstName = _nameOfFounder(
    selectedSave.gameState!,
  ).toLowerCase().split(" ").first;
  final now = DateTime.now()
      .toIso8601String()
      .replaceAll("-", "_") // - in YYYY-MM-DD
      .replaceAll("T", "-") // T between date and time
      .replaceAll(":", "_") // : in HH:MM:SS
      .replaceAll(".", "-") // . before ms and us
      .replaceAll("Z", "") // Z at the end if the clock is in UTC
      ;

  String json = jsonEncode(selectedSave.toJson());
  await FileSaver.instance.saveFile(
    name: "lcsna_${founderFirstName}_$now.json",
    bytes: const Utf8Encoder().convert(json),
  );
}

Future<SaveFile?> importSave() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ["json"],
    withData: true,
    dialogTitle: LcsI18n.tr("Select an LCS: New Age Save File"),
  );
  if (result != null) {
    Uint8List fileBytes = result.files.single.bytes!;
    String json = const Utf8Decoder().convert(fileBytes);
    try {
      final Map<String, dynamic> saveData = jsonDecode(json);
      final SaveFile saveFile = SaveFile.fromJson(saveData);
      await saveGameFile(saveFile);
      erase();
      mvaddstrc(1, 1, lightGray, "Save imported successfully.");
      addOptionText(3, 1, "Any Key", "Any Key - Continue");
      await getKey();
      return saveFile;
    } catch (e) {
      erase();
      addparagraph(
        1,
        1,
        "Error importing save: {error}",
        params: {"error": e.toString()},
      );
      if (e is Error) {
        addOptionText(3, 1, "R", "R - Generate a Crash Report");
        addOptionText(
          4,
          1,
          "Any Other Key",
          "Any Other Key - Return to the title screen",
        );
      } else {
        addOptionText(3, 1, "Any Key", "Any Key - Return to the title screen");
      }
      int c = await getKey();
      if (c == Key.r && e is Error) await errorScreen(e);
      return null;
    }
  } else {
    return null;
  }
}

Future<void> saveGameFile(SaveFile saveFile) async {
  await _storage.saveGame(saveFile);
}

Future<List<SaveFile>> loadGameList() async {
  final List<String> gameIds = await _storage.listGameIds();
  List<SaveFile> saveFiles = [];

  for (final gameId in gameIds) {
    final saveFile = await _storage.loadGame(gameId);
    if (saveFile != null) {
      try {
        final GameState gameState = GameState.fromJson(saveFile.saveData);
        saveFiles.add(
          SaveFile(
            version: saveFile.version,
            saveData: saveFile.saveData,
            lastPlayed: saveFile.lastPlayed,
            gameId: saveFile.gameId,
            gameState: gameState,
          ),
        );
      } catch (e) {
        debugPrint('Error loading save game $gameId: $e');
        saveFiles.add(saveFile);
      }
    }
  }

  return saveFiles;
}

Future<void> deleteSaveGame() async {
  await deleteSaveGameId(gameState.uniqueGameId.toString());
}

int compareVersionStrings(String a, String b) {
  List<int> aParts = a.split(".").map(int.parse).toList();
  List<int> bParts = b.split(".").map(int.parse).toList();
  for (int i = 0; i < aParts.length; i++) {
    if (i >= bParts.length) {
      return 1;
    }
    if (aParts[i] > bParts[i]) {
      return 1;
    } else if (aParts[i] < bParts[i]) {
      return -1;
    }
  }
  if (aParts.length < bParts.length) {
    return -1;
  }
  return 0;
}

void applyBugFixes(String version) {
  gameState.uniqueCreatures.syncWithPool();
  for (RecruitmentSession recruitmentSession in gameState.recruitmentSessions) {
    recruitmentSession.recruiter = pool.firstWhere(
      (p) => p.id == recruitmentSession.recruiterId,
      orElse: () => pool[0],
    );
  }
  if (compareVersionStrings(version, "1.0.5") < 0) {
    // Fix for the bug where CCS safehouses don't get marked as such if you
    // play in "We Didn't Start The Fire" mode
    if (ccsActive) {
      for (Site s in sites.where(
        (s) =>
            s.controller == SiteController.unaligned &&
            [
              SiteType.barAndGrill,
              SiteType.bombShelter,
              SiteType.bunker,
            ].contains(s.type),
      )) {
        s.controller = SiteController.ccs;
      }
    }
  }
  if (compareVersionStrings(version, "1.3.4") < 0) {
    for (NewsStory newsStory in gameState.newsArchive) {
      if (newsStory.byline == "") newsStory.byline = null;
      if (newsStory.newspaperPhotoId == 0 &&
          newsStory.headline != "HELL ON EARTH") {
        newsStory.newspaperPhotoId = null;
      }
    }
  }
  if (compareVersionStrings(version, "1.5.0") < 0) {
    // 1.5: Add new insurance office and nursing home locations
    for (City city in gameState.cities) {
      for (District district in city.districts) {
        if (district.name.contains("Downtown")) {
          district.addSites([SiteType.insuranceOffice]);
        }
        if (district.name.contains("University") ||
            district.name.contains("Brooklyn") ||
            district.name.contains("Hollywood")) {
          district.addSites([SiteType.nursingHome]);
        }
      }
    }
  }
  // Fix ceo and president locations
  if (!uniqueCreatures.ceo.kidnapped &&
      !uniqueCreatures.ceo.missing &&
      uniqueCreatures.ceo.align == Alignment.conservative &&
      uniqueCreatures.ceo.site?.type != SiteType.ceoHouse) {
    uniqueCreatures.ceo.location = sites.firstWhere(
      (s) => s.type == SiteType.ceoHouse,
    );
    uniqueCreatures.ceo.workLocation = uniqueCreatures.ceo.location;
  }
  if (!uniqueCreatures.president.kidnapped &&
      !uniqueCreatures.president.missing &&
      uniqueCreatures.president.align == Alignment.conservative &&
      uniqueCreatures.president.site?.type != SiteType.whiteHouse) {
    uniqueCreatures.president.location = sites.firstWhere(
      (s) => s.type == SiteType.whiteHouse,
    );
    uniqueCreatures.president.workLocation = uniqueCreatures.president.location;
  }
  // Populate any missing laws
  Map<DeepAlignment, int> lawAlignments = {};
  for (DeepAlignment alignment in gameState.politics.laws.values) {
    lawAlignments[alignment] = (lawAlignments[alignment] ?? 0) + 1;
  }
  MapEntry<DeepAlignment, int>? mostCommonLawAlignment = lawAlignments.entries
      .fold(
        null,
        (max, entry) => entry.value > (max?.value ?? 0) ? entry : max,
      );
  for (Law law in Law.values) {
    gameState.politics.laws[law] ??=
        mostCommonLawAlignment?.key ?? DeepAlignment.conservative;
  }
  // Populate any missing public opinion issues
  double publicMood = gameState.politics.publicMood();
  for (View view in View.issues) {
    gameState.politics.publicOpinion[view] ??= publicMood;
    gameState.politics.publicInterest[view] ??= 0;
    gameState.politics.backgroundInfluence[view] ??= 0;
  }
}
