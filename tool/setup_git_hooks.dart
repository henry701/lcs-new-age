import 'dart:io';

Future<void> main() async {
  final hookFile = File('.git/hooks/pre-commit');

  await hookFile.parent.create(recursive: true);

  await hookFile.writeAsString('''#!/bin/sh
# Run dart_pre_commit with only essential checks
# Config in pubspec.yaml disables: format, flutter_compat, outdated, pull-up-dependencies
# Only runs: analyze, test
dart run dart_pre_commit
''');

  if (!Platform.isWindows) {
    await Process.run('chmod', ['+x', hookFile.path]);
  }

  stdout.writeln('Git pre-commit hook installed at ${hookFile.path}');
}
