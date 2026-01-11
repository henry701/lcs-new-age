# Localization Helper Scripts

This directory contains scripts to help with internationalization (i18n) of LCS New Age.

## find_translatable_strings.dart

Finds all user-facing strings in the codebase that should be translated.

### Usage

Run from the project root:

```bash
dart run scripts/find_translatable_strings.dart
```

### What It Does

1. Scans all `.dart` files in the `lib/` directory
2. Finds string literals passed to console wrapper functions (addstr, mvaddstr, addstrx, mvaddstrx)
3. Finds string literals in variable assignments and returns that are likely user-facing
4. Filters out technical strings, paths, IDs, and other non-user-facing content
5. Deduplicates and counts occurrences
6. Outputs a sorted list with file locations

### Output Format

```
"STRING_LITERAL" (count: N)
  path/to/file.dart:line (function)
  path/to/other_file.dart:line (function)
```

### Filtering

The script automatically excludes:
- Very short strings (< 4 chars)
- Strings that look like file paths or URLs
- Hex codes, IDs, or numeric values
- Technical strings (DEBUG, TODO, FIXME)
- Strings with only technical characters
- Empty or whitespace-only strings

### Use Cases

1. **Find new strings to translate**: Run the script and compare output to current ARB files
2. **Track translation coverage**: Monitor unique string count over time
3. **Identify frequently used strings**: High-count strings are priority for translation
4. **Audit codebase**: Find hardcoded user-facing text that should use the params API

### Example Workflow

```bash
# Find all translatable strings
dart run scripts/find_translatable_strings.dart > translatable_strings.txt

# Search for specific pattern
dart run scripts/find_translatable_strings.dart | grep "rescue"

# Count total unique strings
dart run scripts/find_translatable_strings.dart | grep "Total:" | awk '{print $2}'
```

### Notes

- This is a heuristic tool - some false positives/negatives may occur
- Manual review of results is recommended
- Focus on high-count strings first for translation priority
- Console wrapper calls are the primary target for translation

## clean_arb_duplicates.dart

Removes duplicate entries from ARB (Application Resource Bundle) JSON files, keeping the last occurrence of each key.

**Multi-File Support:** As of the latest update, this script validates uniqueness across ALL files for each locale.

### Usage

Run from the scripts directory:

```bash
dart clean_arb_duplicates.dart
```

### What It Does

1. Scans all `.arb` files in the `../lib/l10n/` directory
2. Groups files by locale (e.g., app_pt_BR.arb, app_pt_BR_part1.arb, etc.)
3. For each locale:
   - Checks for duplicate keys across all files for that locale
   - Removes duplicates within each file (keeps last occurrence)
   - Validates no duplicates exist across files
   - Sorts keys alphabetically for clean diffs
   - Writes back the cleaned JSON
4. Reports statistics on files processed and duplicates removed

### Why This Matters

ARB files can accumulate duplicate entries during development, especially when:
- Multiple developers work on translations
- Automated scripts add entries
- Manual editing creates conflicts
- Multiple ARB files exist per locale

Duplicates can cause:
- Inconsistent translations
- Confusion during translation updates
- Runtime warnings (duplicate keys logged by i18n system)

### Output Example

```
=== Processing locale: pt_BR (2 file(s)) ===
Processed app_pt_BR.arb: removed 5 duplicates
Processed app_pt_BR_part1.arb: no duplicates
Processed app_de.arb: removed 3 duplicates
Processed app_fr.arb: removed 2 duplicates
Processed app_en_US.arb: no duplicates

=== Summary ===
Files processed: 5
Total duplicates removed (within files): 10
Cross-file validation: OK (no duplicates found)
```

### Cross-File Validation

If duplicates are found across files for a locale:
```
=== Processing locale: pt_BR (2 file(s)) ===
ERROR: Found 3 duplicate keys across files:
  - "Press any key" found in: app_pt_BR.arb, app_pt_BR_part1.arb
  - "Game Over" found in: app_pt_BR.arb, app_pt_BR_part1.arb
  - "Continue" found in: app_pt_BR.arb, app_pt_BR_part1.arb

Please resolve duplicates manually before continuing.
Duplicated keys must exist in only one file per locale.

=== Summary ===
Files processed: 2
Total duplicates removed (within files): 5
ERROR: 3 duplicate keys found across files
These must be resolved manually (duplicates can only exist in one file per locale)
```

### Safety

- **Non-destructive**: Only removes exact duplicate keys, preserving all unique translations
- **Last-wins strategy**: Keeps the most recent/most likely correct translation
- **Cross-file validation**: Prevents silent duplicate keys across multiple files
- **Alphabetical sorting**: Maintains clean, readable JSON structure
- **Backup recommended**: Consider committing before running, though operation is safe

### Integration

Run this script regularly during development to keep ARB files clean:

```bash
# After translation work or automated updates
dart scripts/clean_arb_duplicates.dart

# Check git diff to see what was cleaned up
git diff lib/l10n/
```
