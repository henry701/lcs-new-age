final _whitespaceSplitPattern = RegExp(r'\s+');
final _urlPattern = RegExp(r'^(?:https?|file)://');
final _windowsPathPattern = RegExp(r'^[A-Za-z]:[\\/]');
final _uncPathPattern = RegExp(r'^\\\\');
final _relativeOrUnixPathPattern = RegExp(
  r'^(?:\.{1,2}[\\/]|/)[^/\s]+(?:[\\/][^/\s]+)+$',
);
final _hexLikePattern = RegExp(
  r'^(?:0[xX])?(?=[0-9a-fA-F]{4,}$)(?=.*\d)[0-9a-fA-F]+$',
);
final _numericPattern = RegExp(r'^[\d.]+$');
final _whitespaceOnlyPattern = RegExp(r'^[\s\t\r\n]+$');
final _singlePlaceholderPattern = RegExp(r'^\{[^{}]+\}$');
final _symbolOnlyPattern = RegExp(r'^[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]+$');
final _colorCodePattern = RegExp(r'^&[a-zA-Z]$');
final _techPattern = RegExp(r'^[a-zA-Z0-9_./\\$@#%&*+\-=\[\]{}()|;:<>?,!\"]+$');
final _asciiLetterPattern = RegExp(r'[a-zA-Z]');

bool shouldIgnoreUntranslatedString(String englishText) {
  final trimmed = englishText.trim();

  // Empty or whitespace only
  if (trimmed.isEmpty) return true;

  // Generated prose bodies are too large and volatile to be useful translation keys.
  final wordCount = trimmed
      .split(_whitespaceSplitPattern)
      .where((word) => word.isNotEmpty)
      .length;
  if (trimmed.contains('\n') || trimmed.length > 160 || wordCount > 24) {
    return true;
  }

  // Strings that look like file paths or URLs
  if (_urlPattern.hasMatch(trimmed)) return true;
  if (_windowsPathPattern.hasMatch(trimmed)) return true;
  if (_uncPathPattern.hasMatch(trimmed)) return true;
  if (_relativeOrUnixPathPattern.hasMatch(trimmed)) {
    return true;
  }

  // Strings that look like hex codes or IDs
  if (_hexLikePattern.hasMatch(englishText)) return true;

  // Strings that look like numeric values
  if (_numericPattern.hasMatch(englishText)) return true;

  // Common internal/debug strings
  if (englishText.toUpperCase().startsWith('DEBUG')) return true;
  if (englishText.toUpperCase().startsWith('TODO')) return true;
  if (englishText.toUpperCase().startsWith('FIXME')) return true;

  // Spacing-only patterns (multiple spaces, tabs, newlines)
  if (_whitespaceOnlyPattern.hasMatch(englishText)) return true;

  // One-parameter-only patterns (like "{param}" or just placeholders)
  // Note: This allows strings with multiple parameters and context
  if (_singlePlaceholderPattern.hasMatch(englishText)) return true;

  // Single character patterns (punctuation, symbols)
  if (_symbolOnlyPattern.hasMatch(englishText)) {
    return true;
  }

  // Color codes or formatting patterns
  if (_colorCodePattern.hasMatch(englishText)) return true;

  // Strings that are purely technical characters
  if (_techPattern.hasMatch(englishText)) {
    return false; // Keep technical strings that might have meaningful content
  }

  // Include if it contains at least one letter (allows short strings like "OK", "Go", "No")
  final hasLetters = _asciiLetterPattern.hasMatch(englishText);

  return !hasLetters;
}
