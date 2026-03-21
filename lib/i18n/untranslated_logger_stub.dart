import 'package:lcs_new_age/i18n/untranslated_logger_common.dart';

/// Web-safe no-op implementation used on targets without `dart:io`.
class UntranslatedStringLogger {
  static bool shouldIgnoreString(String englishText) =>
      shouldIgnoreUntranslatedString(englishText);

  static Future<void> logUntranslatedString(
    String englishText,
    String locale, {
    bool noTranslate = false,
  }) async {}

  static Future<Map<String, dynamic>> getStatistics() async => {
    'total_files': 0,
    'total_strings': 0,
    'files': <Map<String, dynamic>>[],
  };
}
