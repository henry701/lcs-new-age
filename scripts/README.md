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
2. Finds string literals passed to wrapper functions, including:
   - Display wrappers: `addstr`, `mvaddstr`, `addstrc`, `mvaddstrc`, `addstrx`, `mvaddstrx`, `addstrcx`, `mvaddstrcx`
   - Option wrappers: `addOptionText`, `addInlineOptionText`, `addCenteredOptionText`
   - Layout wrappers: `mvaddstrRight`, `mvaddstrCenter`, `addparagraph`
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
- Running without `--no-modify` is additive-only for catalog sync: it adds missing keys and preserves existing values

## translation_status.dart

Reports current translation coverage and keyset consistency between locales.

### Usage

```bash
# Default: en_US -> pt_BR
dart run scripts/translation_status.dart

# JSON output for automation
dart run scripts/translation_status.dart --json

# Compare a different target locale
dart run scripts/translation_status.dart --locale=de
```

### What It Reports

- Source and target key counts
- Translated/untranslated counts against source keys
- Missing keys in target locale
- Extra keys in target locale
- Coverage percentage

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

## maintain_translations.dart

**Unified ARB maintenance script** - combines deduplication, splitting, and extraction in a single deterministic operation.

### Usage

```bash
dart run scripts/maintain_translations.dart --locale=LOCALE [options]
```

### Operations

| Operation | Description |
|-----------|-------------|
| `maintain` | Full maintenance: dedupe + split + optional extraction (default) |
| `dedupe` | Only deduplicate entries within/across files |
| `split` | Only split ARB files into smaller chunks |
| `extract-untranslated` | Only extract untranslated strings to separate file |

### Options

| Option | Description |
|--------|-------------|
| `--locale=LOCALE` | Locale code (required) |
| `--operation=MODE` | Which operation to perform |
| `--max-entries=N` | Max entries per ARB file (default: 400) |
| `--dry-run` | Preview changes without writing files |
| `--extract-untranslated` | Extract untranslated strings to separate file |
| `--untranslated-output=PATH` | Output path for untranslated strings |

### Examples

```bash
# Full maintenance with untranslated extraction
dart run scripts/maintain_translations.dart --locale=pt_BR --extract-untranslated

# Dry run to see what would change
dart run scripts/maintain_translations.dart --locale=de --dry-run

# Only deduplicate (no splitting)
dart run scripts/maintain_translations.dart --locale=pt_BR --operation=dedupe

# Only split into smaller files
dart run scripts/maintain_translations.dart --locale=pt_BR --operation=split --max-entries=200
```

### What It Does

1. **Loads all ARB files** for the specified locale
2. **Validates no duplicates** across any files
3. **Extracts untranslated strings** if `--extract-untranslated` is set
4. **Splits into deterministic chunks** - same input always produces same output
5. **Writes clean ARB files** with only properly translated strings

### Deterministic Splitting

Strings are sorted alphabetically and distributed evenly across files. This ensures:
- **CI/CD safe**: Same input produces same output
- **Reproducible**: Running multiple times yields identical results
- **Merge friendly**: Clean diffs when merging changes

### Output Files

- `app_<locale>.arb` - Primary ARB file (always kept)
- `app_<locale>_part<N>.arb` - Additional split files if needed
- `untranslated_<locale>.arb` - Untranslated strings (if `--extract-untranslated`)

---

## clean_untranslated.dart

Extracts untranslated strings from ARB files and writes them to a staging file. ARB files are then cleaned to contain only properly translated strings.

### Usage

```bash
dart run scripts/clean_untranslated.dart --locale=LOCALE [options]
```

### Options

| Option | Description |
|--------|-------------|
| `--locale=LOCALE` | Locale code (required) |
| `--output=PATH` | Output file (default: `translation_workspace/untranslated_<locale>.arb`) |
| `--dry-run` | Preview changes without writing files |
| `--no-metadata` | Don't include metadata in output |

### Examples

```bash
# Extract untranslated strings from Portuguese ARB
dart run scripts/clean_untranslated.dart --locale=pt_BR

# Preview what would be extracted from German
dart run scripts/clean_untranslated.dart --locale=de --dry-run

# Custom output location
dart run scripts/clean_untranslated.dart --locale=pt_BR --output=staging/pending.arb
```

### What It Does

1. **Scans all ARB files** for the locale
2. **Identifies untranslated strings** (where value equals key or is empty)
3. **Extracts them to a staging file** for translation
4. **Removes them from ARB files** - ARB now contains only translated strings
5. **Preserves metadata** by default (use `--no-metadata` to disable)

### Untranslated Definition

A string is considered untranslated if:
- **Value equals key**: `"Hello": "Hello"` (placeholder)
- **Value is empty**: `"Hello": ""`

### Workflow

```bash
# Step 1: Extract untranslated strings
dart run scripts/clean_untranslated.dart --locale=pt_BR

# Step 2: Translate the extracted strings
# Edit translation_workspace/untranslated_pt_BR.arb

# Step 3: Merge back translated strings
dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=translation_workspace/untranslated_pt_BR.arb

# Step 4: Validate
dart run scripts/clean_arb_duplicates.dart
```

### Benefits

- **Clean ARB files**: Only contains properly translated strings
- **Clear separation**: Untranslated strings are staged separately
- **Progress tracking**: Easily see how many strings remain untranslated
- **CI/CD integration**: Safe to run in automated pipelines

---

## Translation Workflow Scripts

These scripts work together in the translation workflow:

```bash
# 1. Extract untranslated strings from ARB files
dart run scripts/clean_untranslated.dart --locale=pt_BR

# 2. Translate the strings (edit the output file)
#    translation_workspace/untranslated_pt_BR.arb

# 3. Merge translated strings back
dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=translation_workspace/untranslated_pt_BR.arb

# 4. Periodically maintain/clean ARB files
dart run scripts/maintain_translations.dart --locale=pt_BR --extract-untranslated

# 5. Validate no duplicates
dart run scripts/clean_arb_duplicates.dart

# 6. Test translations
flutter test test/i18n_test.dart
```

---

## validate_translations.dart

Pre-commit validation script. Runs all checks that must pass before committing.

### Usage

```bash
# Run pre-commit validation
dart run scripts/validate_translations.dart

# Verbose output
dart run scripts/validate_translations.dart --verbose

# Dry run (only check, don't fail)
dart run scripts/validate_translations.dart --dry-run
```

### What It Does

1. **Runs dart_pre_commit** - analyze + test
2. **Validates ARB files are clean** - no untranslated strings
3. **Checks for duplicates** - no duplicate keys across files

### Pre-Commit Hook Integration

Install the hook once:
```bash
dart run tool/setup_git_hooks.dart
```

The hook is minimal and just calls this script. No shell logic in the hook itself.

### Exit Codes

- `0` - All validations passed
- `1` - Validation failed (see output for details)

### Example Output

```
=== Pre-commit Translation Validation ===

Running dart_pre_commit...
  OK: dart_pre_commit passed

Validating ARB files...
  OK: ARB files are clean

Checking for duplicates...
  OK: No duplicates

✓ All validations passed
```
