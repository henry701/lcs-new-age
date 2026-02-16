import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/untranslated_logger.dart';

Iterable<File> _logFiles(Directory directory) sync* {
  if (!directory.existsSync()) {
    return;
  }

  for (final entity in directory.listSync()) {
    if (entity is! File) {
      continue;
    }

    final fileName = entity.uri.pathSegments.last;
    if (fileName.startsWith('untranslated_strings_') &&
        fileName.endsWith('.json')) {
      yield entity;
    }
  }
}

Future<(File, Map<String, dynamic>)> _waitForLoggedEntry(String key) async {
  final logDirectory = Directory('translation_workspace');

  for (var attempt = 0; attempt < 120; attempt++) {
    for (final file in _logFiles(logDirectory)) {
      try {
        final content = file.readAsStringSync();
        if (content.trim().isEmpty) {
          continue;
        }

        final decoded = json.decode(content) as Map<String, dynamic>;
        final entry = decoded[key];
        if (entry is Map<String, dynamic>) {
          return (file, entry);
        }
      } catch (_) {
        // Continue polling while asynchronous writes are in flight.
      }
    }

    await Future<void>.delayed(const Duration(milliseconds: 25));
  }

  throw TestFailure('Timed out waiting for untranslated entry "$key"');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late String previousWorkingDirectory;
  late Directory tempWorkingDirectory;

  setUp(() async {
    previousWorkingDirectory = Directory.current.path;
    tempWorkingDirectory = await Directory.systemTemp.createTemp(
      'untranslated_logger_test_',
    );
    Directory.current = tempWorkingDirectory.path;
    Directory('translation_workspace').createSync(recursive: true);
  });

  tearDown(() async {
    Directory.current = previousWorkingDirectory;
    if (tempWorkingDirectory.existsSync()) {
      await tempWorkingDirectory.delete(recursive: true);
    }
  });

  group('UntranslatedStringLogger.shouldIgnoreString', () {
    test('ignores non-translatable technical patterns', () {
      expect(UntranslatedStringLogger.shouldIgnoreString('   '), isTrue);
      expect(
        UntranslatedStringLogger.shouldIgnoreString(r'C:\temp\\save.dat'),
        isTrue,
      );
      expect(UntranslatedStringLogger.shouldIgnoreString('0xFA12'), isTrue);
      expect(UntranslatedStringLogger.shouldIgnoreString('1234.50'), isTrue);
      expect(
        UntranslatedStringLogger.shouldIgnoreString('DEBUG trace'),
        isTrue,
      );
      expect(
        UntranslatedStringLogger.shouldIgnoreString('TODO next step'),
        isTrue,
      );
      expect(UntranslatedStringLogger.shouldIgnoreString('FIXME bug'), isTrue);
      expect(UntranslatedStringLogger.shouldIgnoreString('{name}'), isTrue);
      expect(UntranslatedStringLogger.shouldIgnoreString('!!!'), isTrue);
      expect(UntranslatedStringLogger.shouldIgnoreString('&R'), isTrue);
    });

    test('keeps human-readable text for translation', () {
      expect(UntranslatedStringLogger.shouldIgnoreString('OK'), isFalse);
      expect(
        UntranslatedStringLogger.shouldIgnoreString(
          'Press any key to continue',
        ),
        isFalse,
      );
      expect(
        UntranslatedStringLogger.shouldIgnoreString('weapon_slot_1'),
        isFalse,
      );
    });
  });

  group('UntranslatedStringLogger.logUntranslatedString', () {
    test('writes metadata for untranslated entries', () async {
      const key = 'Unit Test Missing String';

      await UntranslatedStringLogger.logUntranslatedString(
        key,
        'pt_BR',
        noTranslate: true,
      );

      final (_, entry) = await _waitForLoggedEntry(key);

      expect(entry['original'], equals(key));
      expect(entry['locale'], equals('pt_BR'));
      expect(entry['no_translate'], isTrue);
      expect(entry['file_index'], inInclusiveRange(0, 63));
      expect(DateTime.tryParse(entry['timestamp'] as String), isNotNull);
    });

    test('recovers from corrupted json logs', () async {
      const key = 'Corrupted File Recovery String';

      await UntranslatedStringLogger.logUntranslatedString(key, 'pt_BR');
      final (logFile, _) = await _waitForLoggedEntry(key);

      logFile.writeAsStringSync('{corrupted-json');

      await UntranslatedStringLogger.logUntranslatedString(key, 'en_US');
      final (_, recoveredEntry) = await _waitForLoggedEntry(key);

      expect(recoveredEntry['locale'], equals('en_US'));
      expect(recoveredEntry['original'], equals(key));
    });
  });

  test(
    'getStatistics reports valid files and ignores corrupted payloads',
    () async {
      final logDirectory = Directory('translation_workspace')
        ..createSync(recursive: true);

      File(
        '${logDirectory.path}/untranslated_strings_1.json',
      ).writeAsStringSync(
        json.encode({
          'A': {'original': 'A'},
          'B': {'original': 'B'},
        }),
      );
      File(
        '${logDirectory.path}/untranslated_strings_2.json',
      ).writeAsStringSync(
        json.encode({
          'C': {'original': 'C'},
        }),
      );
      File(
        '${logDirectory.path}/untranslated_strings_3.json',
      ).writeAsStringSync('{broken-json');

      final stats = await UntranslatedStringLogger.getStatistics();

      expect(stats['total_files'], equals(3));
      expect(stats['total_strings'], equals(3));

      final perFile = <String, Map<String, dynamic>>{
        for (final entry
            in (stats['files'] as List<dynamic>).cast<Map<String, dynamic>>())
          entry['file'] as String: entry,
      };

      expect(perFile.length, equals(2));
      expect(perFile['untranslated_strings_1.json']?['strings'], equals(2));
      expect(perFile['untranslated_strings_2.json']?['strings'], equals(1));
      expect(perFile.containsKey('untranslated_strings_3.json'), isFalse);
    },
  );
}
