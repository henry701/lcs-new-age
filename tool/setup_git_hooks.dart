import 'dart:io';

Future<void> main() async {
  final hookFile = File('.git/hooks/pre-commit');

  await hookFile.parent.create(recursive: true);

  final hookContent = r'''#!/bin/bash --login
dart run scripts/validate.dart
''';

  await hookFile.writeAsString(hookContent);

  if (!Platform.isWindows) {
    await Process.run('chmod', ['+x', hookFile.path]);
  }

  stdout.writeln('Git pre-commit hook installed at ${hookFile.path}');
}
