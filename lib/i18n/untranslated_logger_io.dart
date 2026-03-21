import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lcs_new_age/i18n/untranslated_logger_common.dart';

/// Handles logging untranslated strings to 64 deterministic JSON files.
class UntranslatedStringLogger {
  static const int _numFiles = 64;
  static const String _filePrefix = 'untranslated_strings_';
  static const String _fileExtension = '.json';
  static final Map<int, Future<void>> _pendingWritesByFile = {};

  /// Directory where untranslated string files are stored.
  static Directory _getLogDirectory() {
    try {
      // Use a dedicated translation workspace folder.
      return Directory('translation_workspace');
    } catch (e) {
      // Fallback to a temporary directory.
      return Directory.systemTemp;
    }
  }

  /// Determines which file to use based on string hash.
  static int _getFileIndex(String englishText) {
    // Use a deterministic hash to distribute strings across 64 files.
    return (englishText.hashCode & 0x7FFFFFFF) % _numFiles;
  }

  /// Gets file path for a given string.
  static File _getFilePath(String englishText) {
    final fileIndex = _getFileIndex(englishText);
    final fileName = '$_filePrefix$fileIndex$_fileExtension';
    return File('${_getLogDirectory().path}/$fileName');
  }

  /// Enhanced ignore algorithm to filter out strings that don't benefit from translation.
  static bool shouldIgnoreString(String englishText) =>
      shouldIgnoreUntranslatedString(englishText);

  /// Logs an untranslated string to the appropriate JSON file.
  static Future<void> logUntranslatedString(
    String englishText,
    String locale, {
    bool noTranslate = false,
  }) async {
    final fileIndex = _getFileIndex(englishText);
    final previousWrite =
        _pendingWritesByFile[fileIndex] ?? Future<void>.value();

    late final Future<void> scheduledWrite;
    scheduledWrite = previousWrite
        .catchError((Object _) {})
        .then(
          (_) => _writeUntranslatedString(
            englishText,
            locale,
            noTranslate: noTranslate,
          ),
        );

    _pendingWritesByFile[fileIndex] = scheduledWrite;
    try {
      await scheduledWrite;
    } finally {
      if (identical(_pendingWritesByFile[fileIndex], scheduledWrite)) {
        unawaited(_pendingWritesByFile.remove(fileIndex));
      }
    }
  }

  static Future<void> _writeUntranslatedString(
    String englishText,
    String locale, {
    bool noTranslate = false,
  }) async {
    try {
      final logDirectory = _getLogDirectory();
      if (!logDirectory.existsSync()) {
        await logDirectory.create(recursive: true);
      }

      final file = _getFilePath(englishText);
      final fileIndex = _getFileIndex(englishText);

      Map<String, dynamic> existingData = {};
      if (file.existsSync()) {
        try {
          final content = file.readAsStringSync();
          if (content.isNotEmpty) {
            existingData = json.decode(content) as Map<String, dynamic>;
          }
        } catch (e) {
          existingData = {};
        }
      }

      final timestamp = DateTime.now().toIso8601String();
      existingData[englishText] = {
        'original': englishText,
        'locale': locale,
        'timestamp': timestamp,
        'file_index': fileIndex,
        'no_translate': noTranslate,
      };

      const encoder = JsonEncoder.withIndent('  ');
      await file.writeAsString('${encoder.convert(existingData)}\n');
    } catch (e) {
      // Silently fail to avoid disrupting gameplay.
    }
  }

  /// Get statistics about untranslated string files.
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
            // File exists but is corrupted.
          }
        }
      }
    } catch (e) {
      // Silently fail.
    }

    return stats;
  }
}
