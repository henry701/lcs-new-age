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

Future<(File, Map<String, dynamic>)> _waitForLoggedEntry(
  String key,
  Directory logDirectory,
) async {
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

Future<List<String>> _keysSharingLogFile(
  Directory logDirectory, {
  int count = 3,
}) async {
  final groups = <String, List<String>>{};

  for (var i = 0; i < 512; i++) {
    final key = 'Collision Candidate $i';
    await UntranslatedStringLogger.logUntranslatedString(key, 'pt_BR');
    final (file, _) = await _waitForLoggedEntry(key, logDirectory);

    final group = groups.putIfAbsent(file.path, () => <String>[])..add(key);
    if (group.length >= count) {
      return List<String>.from(group.take(count));
    }
  }

  throw TestFailure('Could not find $count keys sharing the same log shard');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempWorkingDirectory;
  late Directory logDirectory;

  setUp(() async {
    tempWorkingDirectory = await Directory.systemTemp.createTemp(
      'untranslated_logger_test_',
    );
    logDirectory = Directory(
      '${tempWorkingDirectory.path}/translation_workspace',
    );
    UntranslatedStringLogger.setLogDirectoryOverrideForTesting(
      logDirectory.path,
    );
    logDirectory.createSync(recursive: true);
  });

  tearDown(() async {
    UntranslatedStringLogger.setLogDirectoryOverrideForTesting(null);
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
      expect(UntranslatedStringLogger.shouldIgnoreString('./save.dat'), isTrue);
      expect(
        UntranslatedStringLogger.shouldIgnoreString('../save.dat'),
        isTrue,
      );
      expect(UntranslatedStringLogger.shouldIgnoreString('/tmp'), isTrue);
      expect(
        UntranslatedStringLogger.shouldIgnoreString('assets/icon.png'),
        isTrue,
      );
      expect(UntranslatedStringLogger.shouldIgnoreString('0xFA12'), isTrue);
      expect(UntranslatedStringLogger.shouldIgnoreString('1234.50'), isTrue);
      expect(UntranslatedStringLogger.shouldIgnoreString('+152'), isTrue);
      expect(UntranslatedStringLogger.shouldIgnoreString('-3.5'), isTrue);
      expect(UntranslatedStringLogger.shouldIgnoreString('.44 Magnum'), isTrue);
      expect(UntranslatedStringLogger.shouldIgnoreString('Banjo'), isTrue);
      expect(
        UntranslatedStringLogger.shouldIgnoreString('{letter} - {name}'),
        isTrue,
      );
      expect(
        UntranslatedStringLogger.shouldIgnoreString('~{current}/{max}'),
        isTrue,
      );
      expect(
        UntranslatedStringLogger.shouldIgnoreString('{current}/{max}'),
        isTrue,
      );
      expect(UntranslatedStringLogger.shouldIgnoreString('+{armor}'), isTrue);
      expect(UntranslatedStringLogger.shouldIgnoreString(' ({price})'), isTrue);
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
      expect(UntranslatedStringLogger.shouldIgnoreString('face'), isFalse);
      expect(UntranslatedStringLogger.shouldIgnoreString('Yes/No'), isFalse);
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

    test('ignores long generated prose that is not a stable translation key', () {
      expect(
        UntranslatedStringLogger.shouldIgnoreString(
          'This is a long generated article body that keeps going with enough '
          'words to exceed the prose threshold and should never be recorded as '
          'a reusable translation key for the catalog.',
        ),
        isTrue,
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

      final (_, entry) = await _waitForLoggedEntry(key, logDirectory);

      expect(entry['original'], equals(key));
      expect(entry['locale'], equals('pt_BR'));
      expect(entry['no_translate'], isTrue);
      expect(entry['file_index'], inInclusiveRange(0, 63));
      expect(DateTime.tryParse(entry['timestamp'] as String), isNotNull);
    });

    test('creates the translation workspace before writing logs', () async {
      const key = 'Missing Workspace Recovery String';
      await logDirectory.delete(recursive: true);

      await UntranslatedStringLogger.logUntranslatedString(key, 'pt_BR');

      expect(logDirectory.existsSync(), isTrue);
      final (_, entry) = await _waitForLoggedEntry(key, logDirectory);
      expect(entry['original'], equals(key));
    });

    test('recovers from corrupted json logs', () async {
      const key = 'Corrupted File Recovery String';

      await UntranslatedStringLogger.logUntranslatedString(key, 'pt_BR');
      final (logFile, _) = await _waitForLoggedEntry(key, logDirectory);

      logFile.writeAsStringSync('{corrupted-json');

      await UntranslatedStringLogger.logUntranslatedString(key, 'en_US');
      final (_, recoveredEntry) = await _waitForLoggedEntry(key, logDirectory);

      expect(recoveredEntry['locale'], equals('en_US'));
      expect(recoveredEntry['original'], equals(key));
    });

    test('serializes concurrent writes for the same shard', () async {
      final keys = await _keysSharingLogFile(logDirectory, count: 3);

      await logDirectory.delete(recursive: true);
      logDirectory.createSync(recursive: true);

      await Future.wait(
        keys.map(
          (key) => UntranslatedStringLogger.logUntranslatedString(key, 'pt_BR'),
        ),
      );

      final (file, _) = await _waitForLoggedEntry(keys.first, logDirectory);
      final decoded =
          json.decode(file.readAsStringSync()) as Map<String, dynamic>;

      for (final key in keys) {
        expect(decoded, contains(key));
      }
    });
  });

  test(
    'getStatistics reports valid files and ignores corrupted payloads',
    () async {
      logDirectory.createSync(recursive: true);

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
