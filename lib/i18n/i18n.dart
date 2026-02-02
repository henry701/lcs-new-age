// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lcs_new_age/i18n/untranslated_logger.dart';
import 'package:lcs_new_age/utils/game_options.dart';

/// Exception thrown when i18n system encounters unrecoverable errors
class LcsI18nException implements Exception {
  const LcsI18nException(this.message, [this.originalError]);

  final String message;
  final dynamic originalError;

  @override
  String toString() => 'LcsI18nException: $message';
}

/// Central translation interface for LCS New Age
///
/// NCurses-style API: Use English strings directly in code.
/// Translations are looked up at runtime from ARB files.
///
/// Example:
///   addstr("Press any key to continue.");  // Translates automatically
///   addstr(LcsI18n.format("You hit the {target}!", {"target": "Conservative"}));
class LcsI18n {
  static bool _initialized = false;
  static String _currentLocale = 'en_US';
  static final Map<String, Map<String, dynamic>> _translations = {};
  static final Set<String> _missingTranslations = <String>{};

  /// Initialize the translation system with the specified locale
  static Future<void> initialize([String locale = 'en_US']) async {
    if (_initialized && _currentLocale == locale) {
      print('LcsI18n: Already initialized with locale "$locale"');
      return;
    }

    print('LcsI18n: Initializing with locale "$locale"');

    _currentLocale = locale;
    Intl.defaultLocale = locale;
    await _loadLocale(locale);

    // Preload English as fallback
    if (locale != 'en_US') {
      await _loadLocale('en_US');
    }

    _initialized = true;
    print('LcsI18n: Successfully initialized with locale "$locale"');
  }

  /// Load ARB file(s) for the specified locale
  /// Supports multiple ARB files per locale: `app_<locale>.arb`, `app_<locale>_part1.arb`, etc.
  static Future<void> _loadLocale(String locale) async {
    try {
      // Load all ARB files matching the pattern app_<locale>*.arb
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifest =
          json.decode(manifestContent) as Map<String, dynamic>;

      final localeFiles =
          manifest.keys
              .where(
                (key) =>
                    key.startsWith('lib/l10n/app_$locale') &&
                    key.endsWith('.arb'),
              )
              .toList()
            ..sort(); // Sort to ensure consistent loading order

      if (localeFiles.isEmpty) {
        print('LcsI18n: No ARB files found for locale "$locale"');
        return;
      }

      final Map<String, dynamic> mergedTranslations = <String, dynamic>{};
      final Set<String> duplicateKeys = <String>{};

      for (final file in localeFiles) {
        try {
          final String jsonString = await rootBundle.loadString(file);
          final Map<String, dynamic> jsonData =
              json.decode(jsonString) as Map<String, dynamic>;

          // Merge entries, tracking duplicates
          for (final entry in jsonData.entries) {
            if (mergedTranslations.containsKey(entry.key)) {
              duplicateKeys.add(entry.key);
              print(
                'LcsI18n: WARNING - Duplicate key "${entry.key}" found in $file (previously loaded)',
              );
            } else {
              mergedTranslations[entry.key] = entry.value;
            }
          }
        } catch (e) {
          print('LcsI18n: Failed to load $file: $e');
        }
      }

      if (duplicateKeys.isNotEmpty) {
        print(
          'LcsI18n: ERROR - Found ${duplicateKeys.length} duplicate keys across ${localeFiles.length} files for locale "$locale"',
        );
        print(
          'LcsI18n: Duplicate keys: ${duplicateKeys.take(5).join(", ")}${duplicateKeys.length > 5 ? "..." : ""}',
        );
        print(
          'LcsI18n: Run "dart run scripts/clean_arb_duplicates.dart" to validate and fix',
        );
      } else {
        print(
          'LcsI18n: Loaded ${mergedTranslations.length} translations from ${localeFiles.length} file(s) for locale "$locale"',
        );
      }

      _translations[locale] = mergedTranslations;
    } catch (e) {
      print('LcsI18n: Failed to load locale "$locale": $e');
    }
  }

  /// Get the current locale
  static String get currentLocale => _currentLocale;

  /// Check if initialized
  static bool get isInitialized => _initialized;

  /// Translate a literal English string
  ///
  /// [noTranslate] - When true, skips translation entirely and does not log
  /// any warnings. Use for strings that should never be translated.
  ///
  /// NCurses-style usage via console wrappers:
  ///   addstr("Press any key to continue.");
  ///   mvaddstr(10, 5, "Game Over");
  static String translate(
    String englishText, {
    String? context,
    bool noTranslate = false,
  }) {
    // Skip translation entirely for noTranslate strings
    if (noTranslate) {
      return englishText;
    }

    if (!_initialized) {
      print(
        'LcsI18n: Not initialized, returning original text: "$englishText"',
      );
      return englishText;
    }

    try {
      final localeData = _translations[_currentLocale];
      if (localeData != null && localeData.containsKey(englishText)) {
        final translated = localeData[englishText] as String;

        // Warn if translation is the same as input (except for en_US)
        if (_currentLocale != 'en_US' && translated == englishText) {
          print(
            'LcsI18n: WARNING - Untranslated string in $_currentLocale: "$englishText"',
          );

          // Log to file if option is enabled and string should not be ignored
          if (gameOptions.logUntranslatedStrings &&
              !UntranslatedStringLogger.shouldIgnoreString(englishText)) {
            unawaited(
              UntranslatedStringLogger.logUntranslatedString(
                englishText,
                _currentLocale,
                noTranslate: noTranslate,
              ),
            );
          }
        }

        return translated;
      }

      // Fallback to English
      if (_currentLocale != 'en_US') {
        final enData = _translations['en_US'];
        if (enData != null && enData.containsKey(englishText)) {
          final fallbackText = enData[englishText] as String;
          print(
            'LcsI18n: Using English fallback for "$englishText" in $_currentLocale',
          );
          return fallbackText;
        }
      }

      // Track missing translations (skip for en_US since it's the source language)
      if (_currentLocale != 'en_US') {
        _missingTranslations.add(englishText);
        // Only log if string should not be ignored (has a-Z characters, etc.)
        if (!UntranslatedStringLogger.shouldIgnoreString(englishText)) {
          print(
            'LcsI18n: Missing translation for "$englishText" in $_currentLocale',
          );
        }
      }
      return englishText;
    } catch (e) {
      print('LcsI18n: Translation error for "$englishText": $e');
      return englishText;
    }
  }

  /// Shorthand alias for [translate]
  ///
  /// [noTranslate] - When true, skips translation entirely.
  static String tr(
    String englishText, {
    String? context,
    bool noTranslate = false,
  }) => translate(englishText, context: context, noTranslate: noTranslate);

  /// Format a string with named parameters (placeholder replacement only)
  ///
  /// Does NOT translate - use [translate] first or [processString] for both.
  ///
  /// Example:
  ///   format("Hello {name}!", {"name": "Conservador"}) → "Hello Conservador!"
  static String format(String template, Map<String, dynamic>? params) {
    if (params == null) return template;
    String result = template;
    params.forEach((key, value) {
      result = result.replaceAll('{$key}', value.toString());
    });
    return result;
  }

  /// Process a template: translate if needed, then format with params
  ///
  /// [template] - The English template string with {placeholders}
  /// [params] - Values to substitute for placeholders (optional)
  /// [noTranslate] - If true, skips translation and returns template as-is
  ///
  /// Flow:
  /// 1. If noTranslate=false: translate template (with placeholders intact)
  /// 2. If noTranslate=true: use template as-is
  /// 3. Replace {placeholders} with values from params
  ///
  /// Example:
  ///   processString("You hit the {target}!", {"target": "Conservador"})
  ///   → Translate → "Você acertou o {target}!" → "Você acertou o Conservador!"
  static String processString(
    String template,
    Map<String, dynamic>? params, {
    bool noTranslate = false,
  }) {
    // Translate template if not skipped
    final translated = noTranslate ? template : translate(template);

    // Format with params (placeholder replacement)
    return format(translated, params);
  }

  /// Color name to ColorKey mapping for inline color syntax
  static const Map<String, String> _colorNameToKey = {
    'white': 'W',
    'lightGray': 'w',
    'darkGray': 'K',
    'midGray': 'm',
    'black': 'k',
    'lightGreen': 'G',
    'green': 'g',
    'lightBlue': 'C',
    'blue': 'B',
    'darkBlue': 'b',
    'red': 'R',
    'darkRed': 'r',
    'yellow': 'Y',
    'halfYellow': 'y',
    'orange': 'O',
    'purple': 'p',
    'pink': 'P',
    'brown': 'o',
    'transparent': 'x',
    // Aliases
    'color': '', // Special: use the param value as color key directly
  };

  /// Process template with inline color syntax: {param:color}
  ///
  /// Converts "{name:white} talks to {target:color}" to "&W{name}&w talks to &{targetColor}{target}"
  /// where color markers (&X) are inserted around parameters.
  ///
  /// Color specifications are extracted BEFORE translation, so translators only see {name}, not {name:white}.
  /// Colors are re-applied AFTER translation using the extracted mappings.
  ///
  /// [baseColor] - The default color key to restore after colored segments (e.g., 'w' for lightGray)
  static String processStringWithInlineColors(
    String template,
    Map<String, dynamic>? params, {
    bool noTranslate = false,
    String baseColorKey = 'w',
  }) {
    if (params == null) {
      // No params, just translate the template as-is
      return noTranslate ? template : translate(template);
    }

    // STEP 1: Extract color specifications and build clean template
    // Maps paramName -> colorSpec (e.g., "name" -> "white", "target" -> "color")
    final colorMappings = <String, String>{};
    final placeholderPattern = RegExp(r'\{(\w+)(?::(\w+))?\}');

    String cleanTemplate = template.replaceAllMapped(placeholderPattern, (
      match,
    ) {
      final paramName = match.group(1)!;
      final colorSpec = match.group(2);

      if (colorSpec != null) {
        // Store the color mapping for this parameter
        colorMappings[paramName] = colorSpec;
      }

      // Return placeholder without color spec for clean template
      return '{$paramName}';
    });

    // STEP 2: Translate the clean template (no color specs)
    String translated = noTranslate ? cleanTemplate : translate(cleanTemplate);

    // STEP 3: Format with params and re-apply colors using stored mappings
    String result = translated;
    final cleanPlaceholderPattern = RegExp(r'\{(\w+)\}');

    result = result.replaceAllMapped(cleanPlaceholderPattern, (match) {
      final paramName = match.group(1)!;
      final value = params[paramName]?.toString() ?? match.group(0)!;

      // Check if this parameter had a color specification
      final colorSpec = colorMappings[paramName];
      if (colorSpec == null) {
        // No color specified, just return the value
        return value;
      }

      if (colorSpec == 'color') {
        // Dynamic color from param value (e.g., {target:color} becomes &{targetColor}{target})
        final colorKeyParam = '${paramName}Color';
        final colorKey = params[colorKeyParam]?.toString() ?? baseColorKey;
        return '&$colorKey$value&$baseColorKey';
      }

      // Static color from color name
      final colorKey = _colorNameToKey[colorSpec];
      if (colorKey == null) {
        // Unknown color, return without markers
        return value;
      }

      return '&$colorKey$value&$baseColorKey';
    });

    return result;
  }

  /// Change the current locale at runtime
  static Future<void> setLocale(String locale) async {
    _currentLocale = locale;
    Intl.defaultLocale = locale;

    if (!_translations.containsKey(locale)) {
      await _loadLocale(locale);
    }
  }

  /// Get missing translations (for debugging)
  static Set<String> getMissingTranslations() {
    return Set<String>.from(_missingTranslations);
  }

  /// Reset state (for testing)
  static void reset() {
    _initialized = false;
    _currentLocale = 'en_US';
    _translations.clear();
    _missingTranslations.clear();
  }
}
