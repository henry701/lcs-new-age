import 'package:flutter/material.dart';
import 'package:lcs_new_age/utils/colors.dart';

class ConsoleChar {
  ConsoleChar(
    this.glyph,
    this.foreground,
    this.background, {
    this.mouseClickKey,
  });
  factory ConsoleChar.blank() => ConsoleChar(" ", lightGray, black);
  String glyph = " ";
  Color foreground = lightGray;
  Color background = black;
  String? mouseClickKey;
  bool noHighlight = false;
}

/// Returns the glyph that should be exposed by a text renderer.
///
/// CPC artwork uses control-code values for cells that are intentionally
/// painted by the block renderer. Text surfaces (including the headless
/// playtest bridge) must expose those cells as spaces instead of raw control
/// characters.
String displayableConsoleGlyph(String glyph) {
  if (glyph.isEmpty || glyph.codeUnitAt(0) < 32) return ' ';
  if (const ['░', '▒', '▓', '▀', '▌', '▐', '▄', '█'].contains(glyph)) {
    return ' ';
  }
  return glyph;
}
