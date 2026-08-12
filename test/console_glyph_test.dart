import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/console_char.dart';

void main() {
  test('control-code console glyphs become spaces in text surfaces', () {
    expect(displayableConsoleGlyph('\u0000'), ' ');
    expect(displayableConsoleGlyph('\u001f'), ' ');
    expect(displayableConsoleGlyph('A'), 'A');
    expect(displayableConsoleGlyph('░'), ' ');
    expect(displayableConsoleGlyph('▀'), ' ');
  });
}
