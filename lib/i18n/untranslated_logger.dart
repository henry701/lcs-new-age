import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Handles logging untranslated strings to 64 deterministic JSON files
class UntranslatedStringLogger {
  static const int _numFiles = 64;
  static const String _filePrefix = 'untranslated_strings_';
  static const String _fileExtension = '.json';

  /// Directory where untranslated string files are stored
  static Directory _getLogDirectory() {
    try {
      // Use a dedicated translation workspace folder
      return Directory('translation_workspace');
    } catch (e) {
      // Fallback to a temporary directory
      return Directory.systemTemp;
    }
  }

  /// Determines which file to use based on string hash
  static int _getFileIndex(String englishText) {
    // Use a deterministic hash to distribute strings across 64 files
    return (englishText.hashCode & 0x7FFFFFFF) % _numFiles;
  }

  /// Gets file path for a given string
  static File _getFilePath(String englishText) {
    final fileIndex = _getFileIndex(englishText);
    final fileName = '$_filePrefix$fileIndex$_fileExtension';
    return File('${_getLogDirectory().path}/$fileName');
  }

  /// Enhanced ignore algorithm to filter out strings that don't benefit from translation
  static bool shouldIgnoreString(String englishText) {
    // Empty or whitespace only
    if (englishText.trim().isEmpty) return true;

    // Strings that look like file paths or URLs
    if (englishText.contains('/') || englishText.contains('\\')) return true;

    // Strings that look like hex codes or IDs
    if (RegExp(r'^[0-9a-fA-FxX]+$').hasMatch(englishText)) return true;

    // Strings that look like numeric values
    if (RegExp(r'^[\d.]+$').hasMatch(englishText)) return true;

    // Common internal/debug strings
    if (englishText.toUpperCase().startsWith('DEBUG')) return true;
    if (englishText.toUpperCase().startsWith('TODO')) return true;
    if (englishText.toUpperCase().startsWith('FIXME')) return true;

    // Spacing-only patterns (multiple spaces, tabs, newlines)
    if (RegExp(r'^[\s\t\r\n]+$').hasMatch(englishText)) return true;

    // One-parameter-only patterns (like "{param}" or just placeholders)
    // Note: This allows strings with multiple parameters and context
    if (RegExp(r'^\{[^{}]+\}$').hasMatch(englishText)) return true;

    // Single character patterns (punctuation, symbols)
    if (RegExp(
      r'^[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]+$',
    ).hasMatch(englishText)) {
      return true;
    }

    // Color codes or formatting patterns
    if (RegExp(r'^&[a-zA-Z]$').hasMatch(englishText)) return true;

    // Strings that are purely technical characters
    final techPattern = RegExp(
      r'^[a-zA-Z0-9_./\\$@#%&*+\-=\[\]{}()|;:<>?,!\"]+$',
    );
    if (techPattern.hasMatch(englishText)) {
      return false; // Keep technical strings that might have meaningful content
    }

    // Include if it contains at least one letter (allows short strings like "OK", "Go", "No")
    final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(englishText);

    return !hasLetters;
  }

  /// Logs an untranslated string to the appropriate JSON file
  static Future<void> logUntranslatedString(
    String englishText,
    String locale, {
    bool noTranslate = false,
  }) async {
    try {
      final file = _getFilePath(englishText);
      final fileIndex = _getFileIndex(englishText);

      // Read existing data
      Map<String, dynamic> existingData = {};
      if (file.existsSync()) {
        try {
          final content = file.readAsStringSync();
          if (content.isNotEmpty) {
            existingData = json.decode(content) as Map<String, dynamic>;
          }
        } catch (e) {
          // File exists but is corrupted, start fresh
          existingData = {};
        }
      }

      // Add untranslated string entry
      final timestamp = DateTime.now().toIso8601String();
      existingData[englishText] = {
        'original': englishText,
        'locale': locale,
        'timestamp': timestamp,
        'file_index': fileIndex,
        'no_translate':
            noTranslate, // Mark if this string should not be translated
      };

      // Write back to file with proper formatting
      const encoder = JsonEncoder.withIndent('  ');
      await file.writeAsString('${encoder.convert(existingData)}\n');
    } catch (e) {
      // Silently fail to avoid disrupting gameplay
      // In a real implementation, you might want to log this to a debug file
    }
  }

  /// Get statistics about untranslated string files
  static Future<Map<String, dynamic>> getStatistics() async {
    final stats = <String, dynamic>{
      'total_files': 0,
      'total_strings': 0,
      'files': <Map<String, dynamic>>[],
    };

    try {
      for (int i = 0; i < _numFiles; i++) {
        final fileName = '$_filePrefix$i$_fileExtension';
        final file = File('${_getLogDirectory().path}/$fileName');
        if (file.existsSync()) {
          stats['total_files'] = (stats['total_files'] as int) + 1;

          try {
            final content = file.readAsStringSync();
            if (content.isNotEmpty) {
              final Map<String, dynamic> data =
                  json.decode(content) as Map<String, dynamic>;
              final int stringCount = data.length;
              final int totalStrings =
                  (stats['total_strings'] as int) + stringCount;
              stats['total_strings'] = totalStrings;

              final List<Map<String, dynamic>> filesList =
                  stats['files'] as List<Map<String, dynamic>>;
              filesList.add({
                'file': fileName,
                'strings': stringCount,
                'size': content.length,
              });
            }
          } catch (e) {
            // File exists but is corrupted
          }
        }
      }
    } catch (e) {
      // Silently fail
    }

    return stats;
  }
}
