bool shouldIgnoreUntranslatedString(String englishText) {
  // Empty or whitespace only
  if (englishText.trim().isEmpty) return true;

  // Strings that look like file paths or URLs
  if (englishText.contains('/') || englishText.contains('\\')) return true;

  // Strings that look like hex codes or IDs
  if (RegExp(r'^[0-9a-fA-FxX]+$').hasMatch(englishText)) return true;

  // Strings that look like numeric values
  if (RegExp(r'^[\d.]+$').hasMatch(englishText)) return true;

  // Common internal/debug strings
  if (englishText.toUpperCase().startsWith('DEBUG')) return true;
  if (englishText.toUpperCase().startsWith('TODO')) return true;
  if (englishText.toUpperCase().startsWith('FIXME')) return true;

  // Spacing-only patterns (multiple spaces, tabs, newlines)
  if (RegExp(r'^[\s\t\r\n]+$').hasMatch(englishText)) return true;

  // One-parameter-only patterns (like "{param}" or just placeholders)
  // Note: This allows strings with multiple parameters and context
  if (RegExp(r'^\{[^{}]+\}$').hasMatch(englishText)) return true;

  // Single character patterns (punctuation, symbols)
  if (RegExp(
    r'^[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]+$',
  ).hasMatch(englishText)) {
    return true;
  }

  // Color codes or formatting patterns
  if (RegExp(r'^&[a-zA-Z]$').hasMatch(englishText)) return true;

  // Strings that are purely technical characters
  final techPattern = RegExp(
    r'^[a-zA-Z0-9_./\\$@#%&*+\-=\[\]{}()|;:<>?,!\"]+$',
  );
  if (techPattern.hasMatch(englishText)) {
    return false; // Keep technical strings that might have meaningful content
  }

  // Include if it contains at least one letter (allows short strings like "OK", "Go", "No")
  final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(englishText);

  return !hasLetters;
}
