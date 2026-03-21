import 'dart:io' show Platform;

bool get defaultLogUntranslatedStringsForPlatform =>
    Platform.isWindows || Platform.isLinux;
