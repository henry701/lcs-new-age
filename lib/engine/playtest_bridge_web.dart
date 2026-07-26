import 'dart:convert';

import 'package:lcs_new_age/engine/console.dart';
import 'package:web/web.dart' as web;

/// Exposes the fixed-width console to headless browser playtesters.
///
/// The bridge is opt-in (`?playtest=1`) and writes a small DOM node rather
/// than changing the rendered game surface. This makes the canvas-backed
/// Flutter UI inspectable without OCR or screenshots.
class PlaytestBridge {
  static bool get _enabled => web.window.location.search.contains('playtest=1');

  static void publish(Console console) {
    if (!_enabled) return;

    final lines = console.buffer
        .map((row) => row.map((character) => character.glyph).join())
        .toList(growable: false);
    final options = lines
        .expand(
          (line) => RegExp(r'(?<!\S)([A-Za-z]) - ([^\n]+)').allMatches(line),
        )
        .map(
          (match) => StringBuffer()
            ..write(match.group(1))
            ..write(' - ')
            ..write(match.group(2)),
        )
        .map((buffer) => buffer.toString())
        .toList(growable: false);

    final document = web.window.document;
    web.Element? node = document.querySelector('#lcs-playtest-buffer');
    if (node == null) {
      node = document.createElement('pre')..id = 'lcs-playtest-buffer';
      document.body?.append(node);
    }

    node
      ..id = 'lcs-playtest-buffer'
      ..setAttribute(
        'style',
        'position:fixed;left:-10000px;top:0;width:1px;height:1px;overflow:hidden;',
      )
      ..textContent = lines.join('\n')
      ..setAttribute('data-options', jsonEncode(options))
      ..setAttribute('aria-label', 'LCS playtest console buffer');
  }
}
