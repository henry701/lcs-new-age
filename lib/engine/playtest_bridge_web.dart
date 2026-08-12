import 'dart:async';
import 'dart:convert';

import 'package:lcs_new_age/engine/console.dart';
import 'package:lcs_new_age/engine/console_char.dart';
import 'package:web/web.dart' as web;

/// Exposes the fixed-width console to headless browser playtesters.
///
/// The bridge is opt-in (`?playtest=1`) and writes a small DOM node rather
/// than changing the rendered game surface. This makes the canvas-backed
/// Flutter UI inspectable without OCR or screenshots.
class PlaytestBridge {
  static bool get _enabled => web.window.location.search.contains('playtest=1');
  static bool _keyboardBridgeInstalled = false;
  static Timer? _commandPoller;

  static void _recordKey(web.Element? node, String key) {
    node?.setAttribute('data-last-key', key);
  }

  static void _installKeyboardBridge(Console console) {
    if (_keyboardBridgeInstalled) return;
    _keyboardBridgeInstalled = true;
    web.window.onKeyDown.listen((event) {
      final key = switch (event.key) {
        'Enter' ||
        'Escape' ||
        'ArrowUp' ||
        'ArrowDown' ||
        'ArrowLeft' ||
        'ArrowRight' ||
        'Tab' ||
        'Backspace' => event.key,
        _ when event.key.length == 1 => event.key,
        _ => '',
      };
      if (key.isEmpty) return;
      console.injectKey(key);
      _recordKey(
        web.window.document.querySelector('#lcs-playtest-buffer'),
        key,
      );
    });

    // Headless CDP keyboard events do not consistently reach Flutter's focus
    // node. Polling an opt-in DOM command attribute keeps playtests reliable
    // without requiring a headed window or compositor focus.
    _commandPoller ??= Timer.periodic(const Duration(milliseconds: 25), (_) {
      final node = web.window.document.querySelector('#lcs-playtest-buffer');
      final key = node?.getAttribute('data-key');
      if (key == null || key.isEmpty) return;
      node!.removeAttribute('data-key');
      console.injectKey(key);
      _recordKey(node, key);
    });
  }

  static void publish(Console console) {
    if (!_enabled) return;
    _installKeyboardBridge(console);

    final lines = console.buffer
        .map(
          (row) => row
              .map((character) => displayableConsoleGlyph(character.glyph))
              .join(),
        )
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
