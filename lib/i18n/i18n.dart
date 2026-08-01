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

enum PronounRole { subject, object, possessive }

/// Central translation interface for LCS New Age
///
/// NCurses-style API: Use English strings directly in code.
/// Translations are looked up at runtime from ARB files.
///
/// Example:
///   addstr("Press any key to continue.");  // Translates automatically
///   addstr(
///     "You hit the {target}!",
///     params: {"target": "Conservative"},
///   );
class LcsI18n {
  static bool _initialized = false;
  static String _currentLocale = 'en_US';
  static AssetManifest? _assetManifest;
  static final Map<String, Map<String, dynamic>> _translations = {};
  static final Set<String> _missingTranslations = <String>{};
  static final Set<String> _warnedUntranslatedKeys = <String>{};
  static final Set<String> _fileLoggedUntranslatedKeys = <String>{};
  static final RegExp _placeholderPattern = RegExp(r'\{(\w+)(?::(\w+))?\}');
  static const Set<String> _translatablePronounParameters = {
    'he',
    'his',
    'her',
    'she',
    'him',
    'their',
    'they',
    'them',
  };

  static String _localeScopedKey(String locale, String englishText) =>
      '$locale::$englishText';

  static void _activateLocale(String locale) {
    if (_currentLocale != locale) {
      _missingTranslations.clear();
      _warnedUntranslatedKeys.clear();
      _fileLoggedUntranslatedKeys.clear();
    }

    _currentLocale = locale;
    Intl.defaultLocale = locale;
  }

  static String _normalizeColorizedPlaceholders(String template) => template
      .replaceAllMapped(_placeholderPattern, (match) => '{${match.group(1)!}}');

  static Future<AssetManifest> _loadAssetManifest() async {
    _assetManifest ??= await AssetManifest.loadFromAssetBundle(rootBundle);
    return _assetManifest!;
  }

  /// Initialize the translation system with the specified locale
  static Future<void> initialize([String locale = 'en_US']) async {
    if (_initialized && _currentLocale == locale) {
      print('LcsI18n: Already initialized with locale "$locale"');
      return;
    }

    print('LcsI18n: Initializing with locale "$locale"');

    await _loadLocale(locale);

    // Preload English as fallback
    if (locale != 'en_US') {
      await _loadLocale('en_US');
    }

    _activateLocale(locale);
    _initialized = true;
    print('LcsI18n: Successfully initialized with locale "$locale"');
  }

  /// Load ARB file(s) for the specified locale
  /// Supports multiple ARB shard files per locale:
  /// `app_<locale>_part01.arb` ... `app_<locale>_part32.arb`.
  static Future<void> _loadLocale(String locale) async {
    try {
      // Load only canonical shard files (unlabeled legacy files are ignored).
      final shardRegex = RegExp(
        r'^lib/l10n/app_' + RegExp.escape(locale) + r'_part\d{2}\.arb$',
      );
      final localeFiles =
          (await _loadAssetManifest())
              .listAssets()
              .where(shardRegex.hasMatch)
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
            final normalizedKey = entry.key.startsWith('@')
                ? entry.key
                : _normalizeColorizedPlaceholders(entry.key);
            final normalizedValue = entry.value is String
                ? _normalizeColorizedPlaceholders(entry.value as String)
                : entry.value;

            if (mergedTranslations.containsKey(normalizedKey)) {
              duplicateKeys.add(normalizedKey);
              print(
                'LcsI18n: WARNING - Duplicate key "$normalizedKey" found in $file (previously loaded)',
              );
            } else {
              mergedTranslations[normalizedKey] = normalizedValue;
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
          'LcsI18n: Run "dart run scripts/maintain_arb_catalogs.dart --check" to validate',
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
          final logKey = _localeScopedKey(_currentLocale, englishText);
          final shouldIgnore = UntranslatedStringLogger.shouldIgnoreString(
            englishText,
          );
          final shouldWarn =
              !shouldIgnore && _warnedUntranslatedKeys.add(logKey);
          final shouldLogToFile =
              !shouldIgnore &&
              gameOptions.logUntranslatedStrings &&
              _fileLoggedUntranslatedKeys.add(logKey);

          if (shouldWarn) {
            print(
              'LcsI18n: WARNING - Untranslated string in $_currentLocale: "$englishText"',
            );
          }

          if (shouldLogToFile) {
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
          _recordMissingTranslation(englishText, usesEnglishFallback: true);
          return enData[englishText] as String;
        }
      }

      // Track missing translations (skip for en_US since it's the source language)
      if (_currentLocale != 'en_US') {
        _recordMissingTranslation(englishText);
      }
      return englishText;
    } catch (e) {
      print('LcsI18n: Translation error for "$englishText": $e');
      return englishText;
    }
  }

  static void _recordMissingTranslation(
    String englishText, {
    bool usesEnglishFallback = false,
  }) {
    if (_currentLocale == 'en_US') {
      return;
    }

    final shouldIgnore = UntranslatedStringLogger.shouldIgnoreString(
      englishText,
    );
    if (shouldIgnore) {
      return;
    }

    final isNewMissing = _missingTranslations.add(englishText);
    if (isNewMissing) {
      if (usesEnglishFallback) {
        print(
          'LcsI18n: Using English fallback for "$englishText" in $_currentLocale',
        );
      } else {
        print(
          'LcsI18n: Missing translation for "$englishText" in $_currentLocale',
        );
      }
    }

    final logKey = _localeScopedKey(_currentLocale, englishText);
    if (gameOptions.logUntranslatedStrings &&
        _fileLoggedUntranslatedKeys.add(logKey)) {
      unawaited(
        UntranslatedStringLogger.logUntranslatedString(
          englishText,
          _currentLocale,
        ),
      );
    }
  }

  /// Returns whether the active locale has an explicit catalog entry.
  static bool hasTranslation(String englishText) {
    if (!_initialized) return false;
    return _translations[_currentLocale]?.containsKey(englishText) ?? false;
  }

  /// Shorthand alias for [translate]
  ///
  /// [noTranslate] - When true, skips translation entirely.
  static String tr(
    String englishText, {
    String? context,
    bool noTranslate = false,
  }) => translate(englishText, context: context, noTranslate: noTranslate);

  static String translatePronoun(String pronoun, {required PronounRole role}) {
    if (_currentLocale == 'en_US') {
      return pronoun;
    }

    final key = switch (role) {
      PronounRole.possessive => '$pronoun (possessive)',
      PronounRole.subject || PronounRole.object => pronoun,
    };
    return translate(key);
  }

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

  static bool _isPossessiveParameter(String parameterName) {
    final normalized = parameterName.toLowerCase();
    return normalized == 'hisher' ||
        normalized.endsWith('hisher') ||
        normalized.contains('possessive');
  }

  static String _translateParameterValue(String parameterName, String value) {
    if (_currentLocale == 'en_US' ||
        !_translatablePronounParameters.contains(value)) {
      return value;
    }
    if (_isPossessiveParameter(parameterName)) {
      return switch (value) {
        'his' => translate('his (possessive)'),
        'her' => translate('her (possessive)'),
        'their' => translate('their (possessive)'),
        _ => translate(value),
      };
    }
    return translate(value);
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

  /// Process a template: translate if needed, then format with params
  ///
  /// Supports inline color syntax: {param:color} where color can be:
  /// - Color name: 'white', 'red', 'lightGreen', etc.
  /// - Dynamic: 'color' (uses {param}Color parameter as color key)
  ///
  /// Color specifications are extracted BEFORE translation, so translators only see {param}.
  /// Colors are re-applied AFTER translation using the extracted mappings.
  ///
  /// [template] - The English template string with {placeholders}
  /// [params] - Values to substitute for placeholders (optional)
  /// [noTranslate] - If true, skips translation and returns template as-is
  /// [baseColorKey] - The default color key to restore after colored segments (e.g., 'w' for lightGray)
  ///
  /// Flow:
  /// 1. Extract color specs from template (e.g., {name:white} -> store "name":"white", clean to {name})
  /// 2. If noTranslate=false: translate clean template (with placeholders intact)
  /// 3. If noTranslate=true: use clean template as-is
  /// 4. Replace {placeholders} with values from params, adding color markers (&X)
  ///
  /// Example:
  ///   processString("{attacker:red} attacks {target}!", {"attacker": "Tank", "target": "Dog"})
  ///   → Extract colors → Translate "{attacker} attacks {target}!"
  ///   → "Você acertou o {attacker} ataca {target}!" → "&RTank&w ataca &RDog&w!"
  static String processString(
    String template,
    Map<String, dynamic>? params, {
    bool noTranslate = false,
    String baseColorKey = 'w',
  }) {
    final cleanTemplate = template.replaceAllMapped(_placeholderPattern, (
      match,
    ) {
      final paramName = match.group(1)!;
      return '{$paramName}';
    });

    if (params == null) {
      // No params, but still normalize inline color specs before translation.
      return noTranslate ? cleanTemplate : translate(cleanTemplate);
    }

    // STEP 1: Extract color specifications and build clean template
    // Maps paramName -> colorSpec (e.g., "name" -> "white", "target" -> "color")
    final colorMappings = <String, String>{};

    final normalizedTemplate = template.replaceAllMapped(_placeholderPattern, (
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
    String translated = noTranslate
        ? normalizedTemplate
        : translate(normalizedTemplate);

    // STEP 3: Format with params and re-apply colors using stored mappings
    String result = translated;
    final cleanPlaceholderPattern = RegExp(r'\{(\w+)\}');

    result = result.replaceAllMapped(cleanPlaceholderPattern, (match) {
      final paramName = match.group(1)!;
      final rawValue = params[paramName]?.toString();
      final value = rawValue == null
          ? match.group(0)!
          : _translateParameterValue(paramName, rawValue);

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
    if (!_translations.containsKey(locale)) {
      await _loadLocale(locale);
    }

    if (locale != 'en_US' && !_translations.containsKey('en_US')) {
      await _loadLocale('en_US');
    }

    _activateLocale(locale);
    _initialized = true;
  }

  /// Get missing translations (for debugging)
  static Set<String> getMissingTranslations() {
    return Set<String>.from(_missingTranslations);
  }

  /// Translates a composed paragraph when extraction captured its source as
  /// adjacent phrase fragments rather than as one complete catalog key.
  ///
  /// This is intentionally opt-in for prose composed in code. Normal calls
  /// should continue to use [processString], while callers that pass a long
  /// paragraph assembled from literals can preserve the existing fragment
  /// translations without rendering the entire paragraph in English.
  static String translateComposed(String englishText) {
    if (!_initialized || _currentLocale == 'en_US') return englishText;

    final localeData = _translations[_currentLocale];
    if (localeData == null) return englishText;
    final exact = localeData[englishText];
    if (exact is String) return exact;

    final fallback = _translations['en_US'] ?? const <String, dynamic>{};
    final keys =
        <String>{
            ...localeData.keys,
            ...fallback.keys,
          }.where((key) => key.length >= 20).toList()
          ..sort((a, b) => b.length.compareTo(a.length));

    final output = StringBuffer();
    var offset = 0;
    while (offset < englishText.length) {
      String? matchedKey;
      for (final key in keys) {
        if (englishText.startsWith(key, offset)) {
          matchedKey = key;
          break;
        }
      }
      if (matchedKey == null) {
        output.write(englishText[offset]);
        offset++;
        continue;
      }

      final translated = localeData[matchedKey] ?? fallback[matchedKey];
      output.write(translated is String ? translated : matchedKey);
      offset += matchedKey.length;
    }
    return output.toString();
  }

  /// Reset state (for testing)
  static void reset() {
    _initialized = false;
    _currentLocale = 'en_US';
    _translations.clear();
    _missingTranslations.clear();
    _warnedUntranslatedKeys.clear();
    _fileLoggedUntranslatedKeys.clear();
  }
}
