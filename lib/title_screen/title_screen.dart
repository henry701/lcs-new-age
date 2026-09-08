import 'package:collection/collection.dart';
import 'package:lcs_new_age/basemode/base_mode.dart';
import 'package:lcs_new_age/common_display/common_display.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_mode.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/time.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/map_editor/map_editor_screen.dart';
import 'package:lcs_new_age/politics/alignment.dart';
import 'package:lcs_new_age/saveload/save_load.dart';
import 'package:lcs_new_age/title_screen/high_scores.dart';
import 'package:lcs_new_age/title_screen/new_game.dart';
import 'package:lcs_new_age/title_screen/world.dart';
import 'package:lcs_new_age/utils/colors.dart';
import 'package:lcs_new_age/utils/debug_flags.dart';
import 'package:lcs_new_age/utils/game_options.dart';
import 'package:lcs_new_age/utils/interface_options.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String gameVersion = "1.5.5.HF.1-SNAPSHOT";
const String gameSaveCompatVersion = "1.5.5";
const int titleMenuLeftColumnX = 10;
const int titleMenuRightColumnX = 42;
const int titleMenuLeftColumnWidth =
    titleMenuRightColumnX - titleMenuLeftColumnX - 1;
const int titleMenuRightEdgeExclusive = 78;
// Columns 78 and 79 are the title frame's right border; keep score text clear
// of that border when a localized label expands.
const int titleStatsRightColumnX = 43;
bool megaFounderCheat = false;

Future<void> titleScreen() async {
  HighScores? highScores = await loadHighScores();
  printTitleScreen(highScores);

  // Get the last save file to show founder name
  final prefs = await SharedPreferences.getInstance();
  int? lastGameId = prefs.getInt("lastGameId");
  String continueText = "C - Continue Last Game";
  Map<String, dynamic>? continueParams;
  if (lastGameId != null) {
    List<SaveFile> saveFiles = await loadGameList();
    SaveFile? lastSave = saveFiles.firstWhereOrNull(
      (save) => save.gameId == lastGameId.toString(),
    );
    if (lastSave?.gameState != null) {
      String founder =
          lastSave!.gameState!.lcs.pool
              .firstWhereOrNull(
                (e) => e.hireId == null && e.align == Alignment.liberal,
              )
              ?.name ??
          "Unknown";
      continueText = "C - Continue as {founder:color}";
      continueParams = {"founder": founder, "founderColor": "G"};
    } else {
      lastGameId = null;
    }
  }

  // Check if there are any saved games
  List<SaveFile> saveFiles = await loadGameList();
  bool hasSaves = saveFiles.isNotEmpty;

  // Check if there are any high scores
  bool hasHighScores = highScores.scoreList.isNotEmpty;

  // Add menu options
  setColor(white);
  mvaddstrCenter(10, "Select an Option to Pursue your Liberal Agenda");
  setColor(lightGray);
  addOptionTextFitted(
    11,
    titleMenuLeftColumnX,
    "C",
    continueText,
    titleMenuLeftColumnWidth,
    enabledWhen: lastGameId != null,
    params: continueParams,
  );
  addOptionText(
    11,
    titleMenuRightColumnX,
    "L",
    "L - Load & Manage Saves",
    enabledWhen: hasSaves,
  );
  addOptionText(12, titleMenuLeftColumnX, "N", "N - Start a New Game");
  addOptionText(12, titleMenuRightColumnX, "I", "I - Import a Save");
  addOptionText(
    13,
    10,
    "H",
    "H - View High Scores",
    enabledWhen: hasHighScores,
  );
  addOptionText(13, titleMenuRightColumnX, "V", "V - View Changelog");
  addOptionText(14, 10, "O", "O - Gameplay Options");
  addOptionText(14, titleMenuRightColumnX, "A", "A - Language Selection");
  if (debugShowMapEditor) {
    addOptionText(15, titleMenuRightColumnX, "M", "M - Mod Tools");
  }

  while (true) {
    int c = await getKey();

    switch (c) {
      case Key.c:
        if (lastGameId != null) {
          List<SaveFile> saveFiles = await loadGameList();
          SaveFile? lastSave = saveFiles.firstWhereOrNull(
            (save) => save.gameId == lastGameId.toString(),
          );
          if (lastSave != null && await loadGameFromSave(lastSave)) {
            mode = GameMode.base;
            await baseMode();
            return;
          }
        }
      case Key.n:
        await setupNewGame();
        makeWorld();
        await makeCharacter();
        mode = GameMode.base;
        await baseMode();
        return;
      case Key.l:
        if (await loadGameMenu()) {
          mode = GameMode.base;
          await baseMode();
          return;
        }
        return;
      case Key.h:
        if (hasHighScores) {
          await viewHighScores();
          return;
        }
      case Key.i:
        await importSave();
        return;
      case Key.v:
        await showChangelog();
        return;
      case Key.o:
        await optionsMenu();
        return;
      case Key.a:
        await languageMenu();
        return;
      case Key.m:
        if (debugShowMapEditor) {
          await moddingMenu();
          return;
        }
    }
  }
}

String _toggleState(bool enabled) => LcsI18n.processString(
  enabled ? "&G{state}&x" : "&R{state}&x",
  {"state": LcsI18n.tr(enabled ? "On" : "Off")},
  noTranslate: true,
);

String _highlightedInterfaceKey(String key) =>
    LcsI18n.processString("&G{key}&x", {"key": key}, noTranslate: true);

void _addLocalizedParagraph(
  int y,
  int x, {
  required List<String> fragments,
  required int x2,
}) {
  final paragraph = StringBuffer();
  for (final fragment in fragments) {
    final translated = LcsI18n.tr(fragment);
    paragraph.write(translated);
    if (fragment.endsWith(" ") && !translated.endsWith(" ")) {
      paragraph.write(" ");
    }
  }
  addparagraph(y, x, paragraph.toString(), x2: x2, noTranslate: true);
}

Future<void> optionsMenu() async {
  while (true) {
    erase();
    setColor(lightGreen);
    mvaddstrCenter(2, "GAME OPTIONS");
    setColor(lightGray);
    mvaddstrCenter(4, "Configure your Liberal Crime Squad experience");

    addOptionText(8, 4, "I", "I - Interface Options");
    addOptionText(console.y + 1, 4, "C", "C - Content and Tone Options");
    addOptionText(console.y + 2, 4, "B", "B - Back to Title Screen");

    int c = await getKey();

    switch (c) {
      case Key.i:
        await interfaceOptionsMenu();
      case Key.c:
        await contentAndToneOptionsMenu();
      case Key.b:
        return;
    }
  }
}

Future<void> interfaceOptionsMenu() async {
  while (true) {
    renderInterfaceOptionsMenu();

    int c = await getKey();

    switch (c) {
      case Key.e:
        gameOptions.encounterWarnings = !gameOptions.encounterWarnings;
        await gameOptions.save();
      case Key.m:
        gameOptions.mouseInput = !gameOptions.mouseInput;
        await gameOptions.save();
      case Key.u:
        gameOptions.logUntranslatedStrings =
            !gameOptions.logUntranslatedStrings;
        await gameOptions.save();
      case Key.p:
        switch (interfacePgUp) {
          case "[":
            gameOptions.interfacePgUp = ";";
          case ";":
            gameOptions.interfacePgUp = ",";
          case ",":
            gameOptions.interfacePgUp = "[";
        }
        await gameOptions.save();
      case Key.d:
        gameOptions.fontSize = gameOptions.fontSize - 1;
        if (gameOptions.fontSize < 14) {
          gameOptions.fontSize = 14;
        }
        await gameOptions.save();
      case Key.i:
        gameOptions.fontSize = gameOptions.fontSize + 1;
        if (gameOptions.fontSize > 32) {
          gameOptions.fontSize = 32;
        }
        await gameOptions.save();
      case Key.b:
        return;
    }
  }
}

void renderInterfaceOptionsMenu() {
  erase();
  setColor(lightGreen);
  mvaddstrCenter(2, "INTERFACE OPTIONS");

  addOptionText(
    4,
    4,
    "E",
    "E - Encounter Warnings: {state}",
    params: {"state": _toggleState(gameOptions.encounterWarnings)},
  );
  setColor(midGray);
  _addLocalizedParagraph(
    5,
    8,
    x2: 72,
    fragments: const [
      "Adds an extra prompt when you run into people so you don't ",
      "accidentally walk past them. Default is off.",
    ],
  );

  addOptionText(
    console.y,
    4,
    "M",
    "M - Experimental Mouse Input: {state}",
    params: {"state": _toggleState(gameOptions.mouseInput)},
  );
  setColor(midGray);
  _addLocalizedParagraph(
    console.y + 1,
    8,
    x2: 72,
    fragments: const [
      "This feature is not complete and not all screens support ",
      "mouse input. Default is on.",
    ],
  );

  addOptionText(
    console.y,
    4,
    "U",
    "U - Log Untranslated Strings: {state}",
    params: {"state": _toggleState(gameOptions.logUntranslatedStrings)},
  );
  setColor(midGray);
  _addLocalizedParagraph(
    console.y + 1,
    8,
    x2: 72,
    fragments: const [
      "When enabled, untranslated strings encountered during gameplay will be ",
      "written to JSON files in game directory for translation. Default is on ",
      "for Windows builds and debug mode only.",
    ],
  );

  addOptionText(
    console.y,
    4,
    "P",
    "P - Default Page Up/Down Keys: {pgUp} and {pgDown}",
    params: {
      "pgUp": _highlightedInterfaceKey(interfacePgUp),
      "pgDown": _highlightedInterfaceKey(interfacePgDown),
    },
  );
  setColor(midGray);
  _addLocalizedParagraph(
    console.y + 1,
    8,
    x2: 72,
    fragments: const [
      "Only changes the prompts. All options are accepted regardless. ",
      "Default is [ and ].",
    ],
  );

  addOptionText(console.y, 4, "D", "D - Decrease");
  addstrc(lightGray, " / ");
  addOptionText(console.y, console.x, "I", "I - Increase Font Size");
  addstrx(
    "&w (&G{fontSize}&w)",
    params: {"fontSize": gameOptions.fontSize.toStringAsFixed(0)},
  );
  setColor(midGray);
  _addLocalizedParagraph(
    console.y + 1,
    8,
    x2: 72,
    fragments: const [
      "This option changes the size of the font in the game. Sizes that are ",
      "too large for the screen will be scaled down and may cause small ",
      "black lines to appear. Default is 16.",
    ],
  );
  addOptionText(console.y, 4, "B", "B - Back to Title Screen");
}

Future<void> contentAndToneOptionsMenu() async {
  while (true) {
    renderContentAndToneOptionsMenu();

    int c = await getKey();

    switch (c) {
      case Key.l:
        gameOptions.lighterTone = !gameOptions.lighterTone;
        await gameOptions.save();
      case Key.b:
        return;
    }
  }
}

void renderContentAndToneOptionsMenu() {
  erase();
  setColor(lightGreen);
  mvaddstrCenter(2, "CONTENT AND TONE");

  addOptionText(
    4,
    4,
    "L",
    "L - Lighter Tone: {state}",
    params: {"state": _toggleState(gameOptions.lighterTone)},
  );
  setColor(midGray);
  _addLocalizedParagraph(
    5,
    8,
    x2: 72,
    fragments: const [
      "Adjusts some of the heavier, darker flavor text to use more ",
      "direct and straightforward wording. This affects how your people are ",
      "shown to respond to traumatic experiences, some combat flavor text, ",
      "and some bad endings. Also reduces how often news stories about ",
      "hate crimes are shown, instead generating other news stories that ",
      "have the same impact on the game world. This option does not change ",
      "the mechanics of the game. Default is off.",
    ],
  );

  addOptionText(console.y + 1, 4, "B", "B - Back to Options");
}

Future<void> moddingMenu() async {
  while (true) {
    renderModdingMenu();

    addOptionText(console.y + 1, 4, "B", "B - Back to Title Screen");

    int c = await getKey();

    switch (c) {
      case Key.e:
        await mapEditor();
      case Key.b:
        return;
    }
  }
}

void renderModdingMenu() {
  erase();
  setColor(lightGreen);
  mvaddstrCenter(2, "MOD TOOLS");

  addOptionText(4, 4, "E", "E - Map Editor");
  setColor(midGray);
  _addLocalizedParagraph(
    console.y + 1,
    8,
    x2: 72,
    fragments: const [
      "Create and edit custom maps for Liberal Crime Squad. This feature is ",
      "currently under development.",
    ],
  );
}

void printTitleScreen(HighScores? highScores) {
  erase();
  titleScreenFrame(bottom: 23);
  titleScreenScores(highScores, startY: 17);
  setColor(lightGreen);
  final title = LcsI18n.tr("LIBERAL CRIME SQUAD: NEW AGE");
  final titleSuffix = LcsI18n.tr("NEW AGE");
  mvaddstrCenter(2, title, noTranslate: true);
  move(2, console.x - strLenX(titleSuffix));
  setColor(RainbowFlag.lightBlue);
  addstr(titleSuffix, noTranslate: true);
  setColor(midGray);
  mvaddstrCenter(4, "Maintained by Ashley S. Fox, with gratitude to:");
  mvaddstrCenter(
    5,
    "Bay 12 Games, IsaacG, SlatersQuest, TheCheshireCat, Kamal-Sadek,",
    noTranslate: true,
  );
  mvaddstrCenter(
    6,
    "and many others who have contributed to LCS over the years",
  );

  setColor(black, background: lightGray);
  mvaddstrRight(
    23,
    "Version {version}",
    marginX: 2,
    params: {"version": gameVersion},
  );
  setColor(lightGray);
  mvaddstrCenter(24, "(click the game window to give it keyboard focus)");
}

void titleScreenFrame({bool includeEmDash = true, int bottom = 22}) {
  setColor(green, background: lightGray);
  mvaddstr(0, 0, "".padLeft(80));
  for (int i = 1; i <= bottom; i++) {
    mvaddstr(i, 0, " ");
    mvaddstr(i, 1, " ");
    mvaddstr(i, 78, " ");
    mvaddstr(i, 79, " ");
  }
  mvaddstr(bottom, 0, "".padLeft(80));
  setColor(lightGray);
  if (includeEmDash) {
    mvaddstr(7, 2, "".padLeft(76, emDash));
    mvaddstr(16, 2, "".padLeft(76, emDash));
  }
}

void titleScreenScores(HighScores? highScores, {int startY = 9}) {
  highScores ??= HighScores();
  mvaddstrc(startY, 4, white, "Universal Liberal Statistics");
  setColor(lightGray);
  mvaddstr(
    startY + 1,
    4,
    "Total Liberals Recruited: {count}",
    params: {'count': highScores.universalRecruits},
  );
  mvaddstr(
    startY + 2,
    4,
    "Total Liberals Martyred: {count}",
    params: {'count': highScores.universalMartyrs},
  );
  mvaddstr(
    startY + 3,
    4,
    "Total Conservatives Killed: {count}",
    params: {'count': highScores.universalKills},
  );
  mvaddstr(
    startY + 4,
    4,
    "Total Conservatives Kidnapped: {count}",
    params: {'count': highScores.universalKidnappings},
  );
  mvaddstr(
    startY + 1,
    titleStatsRightColumnX,
    "Total Americans Lost: {count}",
    params: {'count': highScores.universalLosses},
  );
  mvaddstr(
    startY + 2,
    titleStatsRightColumnX,
    "Total Americans Saved: {count}",
    params: {'count': highScores.universalVictories},
  );
  if (highScores.wins.isNotEmpty) {
    mvaddstr(
      startY + 3,
      titleStatsRightColumnX,
      "Fastest Victory: {month} {year}",
      params: {
        "month": getMonth(highScores.scoreList.first.month),
        "year": highScores.scoreList.first.year,
      },
    );
  }
}

void rainbowLine(
  int y,
  int x,
  int lengthPerSegment,
  String character, {
  bool reverse = false,
}) {
  int sign = reverse ? -1 : 1;
  setColor(RainbowFlag.red, background: console.currentBackground);
  mvaddstr(y, x, "".padLeft(lengthPerSegment, character));
  setColor(RainbowFlag.orange, background: console.currentBackground);
  mvaddstr(
    y,
    x + lengthPerSegment * sign,
    "".padLeft(lengthPerSegment, character),
  );
  setColor(RainbowFlag.yellow, background: console.currentBackground);
  mvaddstr(
    y,
    x + 2 * lengthPerSegment * sign,
    "".padLeft(lengthPerSegment, character),
  );
  setColor(RainbowFlag.green, background: console.currentBackground);
  mvaddstr(
    y,
    x + 3 * lengthPerSegment * sign,
    "".padLeft(lengthPerSegment, character),
  );
  setColor(RainbowFlag.blue, background: console.currentBackground);
  mvaddstr(
    y,
    x + 4 * lengthPerSegment * sign,
    "".padLeft(lengthPerSegment, character),
  );
  setColor(RainbowFlag.purple, background: console.currentBackground);
  mvaddstr(
    y,
    x + 5 * lengthPerSegment * sign,
    "".padLeft(lengthPerSegment, character),
  );
}

void addQuote() {
  List<List<String>> quotes = [
    [
      "\"For some, a dream come true —",
      "to others, an offensive piece of crap!\"",
    ],
  ];

  int centerX = 55;

  List<String> quote = quotes.random;
  mvaddstr(2, centerX - quote[0].length ~/ 2, quote[0]);
  mvaddstr(3, centerX - quote[1].length ~/ 2, quote[1]);
}

Future<void> languageMenu() async {
  while (true) {
    renderLanguageOptionsMenu();

    int c = await getKey();

    switch (c) {
      case Key.e:
      case Key.p:
        final languageMap = {Key.e: 'en_US', Key.p: 'pt_BR'};
        final selectedLanguage = languageMap[c]!;
        gameOptions.language = selectedLanguage;
        await gameOptions.save();
        await LcsI18n.initialize(selectedLanguage);
        return;
      case Key.b:
        return;
    }
  }
}

void renderLanguageOptionsMenu() {
  erase();
  setColor(lightGreen);
  mvaddstrCenter(2, "LANGUAGE OPTIONS");
  setColor(lightGray);
  mvaddstrCenter(4, "Select your preferred language");

  String languageState(String locale, String label) =>
      gameOptions.language == locale
      ? LcsI18n.processString("&G{state}&x", {
          "state": LcsI18n.tr("Selected"),
        }, noTranslate: true)
      : label;

  addOptionText(
    6,
    4,
    "E",
    "English: {state}",
    params: {"state": languageState('en_US', LcsI18n.tr("English"))},
    enabledWhen: true,
  );
  addOptionText(
    7,
    4,
    "P",
    "Portuguese: {state}",
    params: {"state": languageState('pt_BR', LcsI18n.tr("Português"))},
    enabledWhen: true,
  );

  setColor(midGray);
  _addLocalizedParagraph(
    console.y + 1,
    8,
    x2: 72,
    fragments: const [
      "Language selection affects all text in the game. ",
      "Changes take effect immediately.",
    ],
  );

  addOptionText(console.y + 1, 4, "B", "B - Back to Title Screen");
}
