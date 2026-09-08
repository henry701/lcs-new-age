import 'dart:io' show Platform;

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/utils/game_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('GameOptions', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('load uses defaults when preferences are missing', () async {
      final options = GameOptions();

      await options.load();

      final isDesktop = Platform.isWindows || Platform.isLinux;
      expect(options.encounterWarnings, isFalse);
      expect(options.mouseInput, isTrue);
      expect(options.interfacePgUp, equals('['));
      expect(options.language, equals('en_US'));
      expect(options.logUntranslatedStrings, equals(isDesktop));
    });

    test('load reads saved values from preferences', () async {
      SharedPreferences.setMockInitialValues({
        'encounterWarnings': true,
        'mouseInput': false,
        'interfacePgUp': ';',
        'language': 'pt_BR',
        'logUntranslatedStrings': false,
      });
      final options = GameOptions();

      await options.load();

      expect(options.encounterWarnings, isTrue);
      expect(options.mouseInput, isFalse);
      expect(options.interfacePgUp, equals(';'));
      expect(options.language, equals('pt_BR'));
      expect(options.logUntranslatedStrings, isFalse);
    });

    test('load normalizes unsupported saved locales back to en_US', () async {
      SharedPreferences.setMockInitialValues({'language': 'de'});
      final options = GameOptions();

      await options.load();

      expect(options.language, equals('en_US'));
    });

    test('save persists all option fields', () async {
      final options = GameOptions()
        ..encounterWarnings = true
        ..mouseInput = false
        ..interfacePgUp = ','
        ..language = 'de'
        ..logUntranslatedStrings = true;

      await options.save();

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('encounterWarnings'), isTrue);
      expect(prefs.getBool('mouseInput'), isFalse);
      expect(prefs.getString('interfacePgUp'), equals(','));
      expect(prefs.getString('language'), equals('en_US'));
      expect(prefs.getBool('logUntranslatedStrings'), isTrue);
    });
  });
}
