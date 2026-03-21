import 'package:lcs_new_age/utils/log_untranslated_defaults.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameOptions {
  static const String _encounterWarningsKey = 'encounterWarnings';
  static const String _mouseInputKey = 'mouseInput';
  static const String _interfacePgUpKey = 'interfacePgUp';
  static const String _languageKey = 'language';
  static const String _logUntranslatedKey = 'logUntranslatedStrings';

  bool encounterWarnings = false;
  bool mouseInput = true;
  String interfacePgUp = "[";
  String language = 'en_US';
  bool logUntranslatedStrings = false;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    encounterWarnings = prefs.getBool(_encounterWarningsKey) ?? false;
    mouseInput = prefs.getBool(_mouseInputKey) ?? true;
    interfacePgUp = prefs.getString(_interfacePgUpKey) ?? "[";
    language = prefs.getString(_languageKey) ?? 'en_US';

    logUntranslatedStrings =
        prefs.getBool(_logUntranslatedKey) ??
        defaultLogUntranslatedStringsForPlatform;
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_encounterWarningsKey, encounterWarnings);
    await prefs.setBool(_mouseInputKey, mouseInput);
    await prefs.setString(_interfacePgUpKey, interfacePgUp);
    await prefs.setString(_languageKey, language);
    await prefs.setBool(_logUntranslatedKey, logUntranslatedStrings);
  }
}

final gameOptions = GameOptions();
