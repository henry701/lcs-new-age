# Translation Workflow Guide

This document explains the iterative translation process using the helper scripts created for LCS New Age i18n.

## Overview

The translation process consists of:
1. Extracting a batch of untranslated strings
2. Translating those strings
3. Merging the translated strings back into the ARB file(s)
4. Repeating until all strings are translated

## Translation API

The i18n system provides three main functions:

### `LcsI18n.translate(template, noTranslate: false)`
Translate a template string (with placeholders intact). Use for static text.

```dart
LcsI18n.translate("Game Over") // → "Fim de Jogo" (Portuguese)
LcsI18n.translate("Loading...") // → "Carregando..." (Portuguese)
```

### `LcsI18n.format(template, params?)`
Replace placeholders with values. Does NOT translate. Use for simple substitution.

```dart
LcsI18n.format("Hello {name}!", {"name": "Jane"})
// → "Hello Jane!"
```

### `LcsI18n.processString(template, params?, noTranslate: false)`
**Primary wrapper for console output.** Translate template, then replace placeholders.

```dart
// Console wrapper pattern (engine.dart):
void addstr(String s, {Map<String, dynamic>? params, bool noTranslate = false}) {
  final result = LcsI18n.processString(s, params, noTranslate: noTranslate);
  console.addstr(result, noTranslate: noTranslate);
}

// Usage in game code:
addstr("You hit the {target}!", params: {"target": "Conservative"})
// → Translate → "Você acertou o {target}!" → "Você acertou o Conservative!"
```

### Translating Dynamic Values at Call Site

For values that need translation (alignment names, item types, etc.), translate them at the call site:

```dart
// For dynamic values that need translation:
final target = LcsI18n.tr(creature.type.name);  // "Conservative" → "Conservador"
addstr("You hit the {target}!", params: {"target": target});
// → Portuguese: "Você acertou o Conservador!"

// For numbers/code that should NOT be translated:
addstr("{name} has {health} health.", params: {
  "name": creature.name,
  "health": creature.health
}, noTranslate: true);
// → "Jane has 100 health." (no translation attempted)
```

## Multi-File ARB Support

As of the latest update, each locale can have multiple ARB files to prevent any single file from becoming too large:

**File Naming Convention:**
- Primary file: `app_<locale>.arb` (e.g., app_pt_BR.arb)
- Additional files: `app_<locale>_part<N>.arb` (e.g., app_pt_BR_part1.arb)

**Key Requirements:**
- All files for a locale must have unique keys (no duplicates)
- Scripts validate uniqueness across all files for a locale
- Files are loaded in any order, merged into a single translation map at runtime
- File splitting can be done by module, batch size, or manually

**When to Split:**
- When a single ARB file exceeds ~500 entries (recommended)
- When organizing by module or feature (manual)
- When multiple translators work on the same locale

## Helper Scripts

### 1. `get_untranslated_strings.dart`

**Purpose:** Extract untranslated strings from all ARB files for a locale.

**Usage:**

```bash
# Extract 10 untranslated strings from Portuguese (scans all pt_BR files)
dart run scripts/get_untranslated_strings.dart --locale=pt_BR --limit=10

# Extract 50 strings from German
dart run scripts/get_untranslated_strings.dart --locale=de --limit=50

# Extract custom output file
dart run scripts/get_untranslated_strings.dart --locale=pt_BR --output=my_batch.arb --limit=50
```

**Options:**
- `--locale=LOCALE` (required): Locale code (e.g., pt_BR, de)
- `--limit=N` (default: 100): Maximum number of strings to extract
- `--output=PATH` (default: untranslated_<locale>.arb): Path for output file
- `--arb-dir=PATH` (default: lib/l10n/): ARB directory path

**What it does:**
1. Scans all ARB files matching the locale pattern (app_<locale>*.arb)
2. Merges entries from all files
3. Finds entries where value equals key OR value is empty string
4. Warns about duplicate keys across files
5. Saves the first N strings to output file with their metadata
6. Creates properly formatted JSON with indentation

**Untranslated strings are:**
- Value equals key (the default placeholder)
- Value is an empty string `""`
- Metadata is preserved (both `@` entries and `placeholders` objects)

---

### 2. `merge_arb_entries.dart`

**Purpose:** Merge partial ARB JSON file into ARB file(s) for a locale.

**Usage:**

```bash
# Merge translated strings back into Portuguese primary ARB
dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=untranslated_pt_BR.arb

# Merge into specific Portuguese part file
dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=my_translations.arb --target=lib/l10n/app_pt_BR_part1.arb

# Merge into German primary ARB
dart run scripts/merge_arb_entries.dart --locale=de --source=partial.arb
```

**Options:**
- `--locale=LOCALE` (required): Locale code (e.g., pt_BR, de)
- `--source=PATH` (required): Path to partial ARB JSON file
- `--target=PATH` (optional): Target ARB file (defaults to primary file app_<locale>.arb)
- `--arb-dir=PATH` (default: lib/l10n/): ARB directory path
- `--help, -h`: Show this help message

**What it does:**
1. Finds all ARB files for the locale
2. Merges source entries into target file
3. Checks for duplicates across all locale files (prevents merge if duplicates found)
4. Updates existing entries, adds new entries
5. Sorts all keys alphabetically for clean diffs
6. Returns summary (merged, skipped, total)

**Features:**
- Auto-selects target file if not specified (defaults to primary)
- Validates no duplicates across all files before merging
- Preserves existing entries (doesn't overwrite unless value differs)
- Adds new entries automatically
- Handles metadata entries correctly
- Maintains JSON formatting

---

## Workflow Example Translation Session

### Portuguese Translation (pt_BR) - Single File

```bash
# Step 1: Extract batch of 20 strings
dart run scripts/get_untranslated_strings.dart --locale=pt_BR --limit=20 --output=pt_BR_batch_01.arb

# Step 2: Open pt_BR_batch_01.arb in editor (VS Code)
# Translate the value fields (keeping keys intact)
# Save file

# Step 3: Merge back into primary ARB
dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=pt_BR_batch_01.arb

# Step 4: Validate no duplicates
dart run scripts/clean_arb_duplicates.dart

# Repeat steps 1-4 until all strings are translated
```

### German Translation (de) - Multi-File

```bash
# Extract batch (scans all de files)
dart run scripts/get_untranslated_strings.dart --locale=de --limit=30 --output=de_batch_01.arb

# Translate strings...

# Merge back into primary ARB (auto-selected)
dart run scripts/merge_arb_entries.dart --locale=de --source=de_batch_01.arb

# If primary file is full (>500 entries), split into multiple files:
dart run scripts/find_translatable_strings.dart --locale=de --split-strategy=split-evenly --max-file-size=400
```

### Creating New Translation Files for Large Locales

When a locale has many translations, you can split into multiple files:

```bash
# Option 1: Auto-split by size (recommended)
dart run scripts/find_translatable_strings.dart --locale=pt_BR --split-strategy=split-evenly --max-file-size=400

# Option 2: Manual split (for module-based organization)
# Create new file manually:
touch lib/l10n/app_pt_BASMODE.arb
# Add translations manually, then merge into that file:
dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=basemode_translations.arb --target=lib/l10n/app_pt_BASMODE.arb
```

---

## Iterative Translation Loop

```bash
# Full automation script example

#!/bin/bash
set -e

locale="pt_BR"
target="lib/l10n/app_$locale.arb"
batch_size=20
batch_counter=1

while [ "$(dart run scripts/get_untranslated_strings.dart --arb=$target --limit=$batch_size)" != "" ]; do
    batch_file="translation_${locale}_batch_$(printf '%02d' $batch_counter).arb"

    echo "=== Translating batch $batch_counter ==="
    echo "Open $batch_file and translate values"
    echo "Run: dart run scripts/merge_arb_entries.dart --target=$target --source=$batch_file"

    batch_counter=$((batch_counter + 1))
done
```

---

## Best Practices

1. **Always work on a backup**
   ```bash
   cp lib/l10n/app_pt_BR.arb lib/l10n/app_pt_BR.arb.bak
   dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=untranslated_pt_BR.arb
   ```

2. **Commit frequently**
   Each batch is a complete translation unit

3. **Test after each merge**
   ```bash
   flutter test test/i18n_test.dart
   ```

4. **Validate no duplicates regularly**
   ```bash
   dart run scripts/clean_arb_duplicates.dart
   ```

5. **Keep source key intact**
   Never change the JSON keys in the partial ARB file

6. **Preserve metadata**
   The `@` entries must remain in the translation file

7. **Handle context carefully**
   Some strings contain `{name}`, `{target}` placeholders - these must be preserved

8. **Review regularly**
   Run the get_untranslated_strings.dart script periodically to check progress

9. **Monitor file sizes**
   When an ARB file exceeds 500 entries, consider splitting:
   ```bash
   dart run scripts/find_translatable_strings.dart --locale=pt_BR --split-strategy=split-evenly --max-file-size=400
   ```

10. **Ensure unique keys across files**
    Keys must be unique across all files for a locale. The clean_arb_duplicates.dart script validates this and will fail if duplicates exist.

---

## Troubleshooting

### Script fails to run
- Make sure Dart is in your PATH
- Run `dart --version` to check installation
- Check file permissions

### Merge script doesn't update file
- Check that target file path is correct
- Look for "Skipped (identical)" in the output

### Too many strings found
- Increase `--limit` value to process in smaller batches
- Sort extracted file by key length before translation

### Formatting issues
- The merge script sorts output alphabetically
- Ensure your editor uses 2-space indentation

### Duplicate keys across files
- Run `dart run scripts/clean_arb_duplicates.dart` to identify duplicates
- Manually remove duplicates (keep the version you want to keep)
- Keys must exist in only ONE file per locale
- Validation prevents merging if duplicates exist in other files

### Files not loading in game
- Verify file naming follows convention: `app_<locale>.arb` or `app_<locale>_part<N>.arb`
- Check that files are in `lib/l10n/` directory
- Ensure AssetManifest.json is regenerated (run `flutter clean && flutter pub get`)

---

## Completion

When `get_untranslated_strings.dart` reports "No untranslated strings found!", translation is complete for that locale.

Verify with:
```bash
# Count remaining untranslated
dart run scripts/get_untranslated_strings.dart --arb=lib/l10n/app_pt_BR.arb --limit=1

# If 0 found, run full i18n test suite
flutter test test test/i18n_test.dart
```

## Technical Notes

### Untranslated Definition

The script identifies three types of untranslated strings:

1. **Placeholder**: Value equals key (default from generation script)
2. **Empty**: Value is empty string `""`
3. **Missing**: Key exists in ARB but not in en_US (should not happen)

The script preserves:
- Metadata (`@key` entries)
- Placeholders (`"{}"` with `{"placeholders": {"...`)
- Complex values (numbers, booleans, arrays)

### Merge Logic

The merge script handles:
- **New keys**: Add to target
- **Modified values**: Update target (only if changed)
- **Identical values**: Skip (efficiency)
- **Metadata entries**: Always include if present

Sorting order: alphabetical by key for clean version control

---

## Enhanced Translation Workflow (Recommended)

The new tooling provides a streamlined workflow that keeps ARB files clean and organized.

### Core Principles

1. **ARB files should only contain translated strings** - Untranslated strings (where value == key) are noise
2. **Deterministic operations** - Same input always produces same output (CI/CD safe)
3. **Single entry point** - Use `maintain_translations.dart` for most maintenance tasks
4. **Clean separation** - Untranslated strings live in a staging area until translated

### Quick Start

```bash
# Extract untranslated strings and clean ARB files
dart run scripts/maintain_translations.dart --locale=pt_BR --extract-untranslated

# Translate the extracted strings (edit the output file)
edit translation_workspace/untranslated_pt_BR.arb

# Merge translated strings back
dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=translation_workspace/untranslated_pt_BR.arb

# Validate
dart run scripts/clean_arb_duplicates.dart
flutter test test/i18n_test.dart
```

---

## Script Reference

### maintain_translations.dart

**Unified ARB maintenance** - The primary script for ARB file management.

```bash
# Full maintenance (dedupe + split + extract untranslated)
dart run scripts/maintain_translations.dart --locale=pt_BR --extract-untranslated

# Dry run to preview changes
dart run scripts/maintain_translations.dart --locale=pt_BR --dry-run

# Only deduplicate
dart run scripts/maintain_translations.dart --locale=pt_BR --operation=dedupe

# Only split into smaller files
dart run scripts/maintain_translations.dart --locale=pt_BR --operation=split --max-entries=200
```

**Options:**
- `--locale=LOCALE` (required): Locale code
- `--operation=MODE`: `maintain` (default), `dedupe`, `split`, `extract-untranslated`
- `--max-entries=N`: Max entries per file (default: 400)
- `--extract-untranslated`: Extract untranslated strings to separate file
- `--dry-run`: Preview without writing

### clean_untranslated.dart

**Extract untranslated strings** - Remove untranslated entries from ARB files.

```bash
# Extract and clean
dart run scripts/clean_untranslated.dart --locale=pt_BR

# Preview only
dart run scripts/clean_untranslated.dart --locale=de --dry-run

# Custom output location
dart run scripts/clean_untranslated.dart --locale=pt_BR --output=staging/pending.arb
```

**Options:**
- `--locale=LOCALE` (required): Locale code
- `--output=PATH`: Output file (default: `translation_workspace/untranslated_<locale>.arb`)
- `--dry-run`: Preview without modifying files
- `--no-metadata`: Don't include metadata entries

---

## Troubleshooting

### "Translation validation failed" in CI

This means the ARB files need maintenance. Run locally:

```bash
dart run scripts/maintain_translations.dart --locale=pt_BR --extract-untranslated
```

Then commit the fixes in your PR.

---

## ARB File Organization

### File Naming Convention

- **Primary file**: `app_<locale>.arb` (e.g., `app_pt_BR.arb`)
- **Additional files**: `app_<locale>_part<N>.arb` (e.g., `app_pt_BR_part2.arb`)
- **Staging file**: `translation_workspace/untranslated_<locale>.arb`

### Deterministic Splitting

The `maintain_translations.dart` script splits ARB files deterministically:

1. All strings are sorted alphabetically
2. Distributed evenly across files (round-robin)
3. Same input always produces same output

This means:
- ✅ **Safe for CI/CD**: No unexpected changes from reordering
- ✅ **Clean diffs**: Only actual content changes appear in diffs
- ✅ **Reproducible**: Multiple runs yield identical results

### Pre-Commit Hook

Install the hook once:
```bash
dart run tool/setup_git_hooks.dart
```

The hook (`.git/hooks/pre-commit`) is minimal and just calls:
```bash
dart run scripts/validate_translations.dart
```

This Dart script validates:
1. `dart_pre_commit` passes (analyze + test)
2. ARB files are clean (no untranslated strings)
3. No duplicate keys exist

If validation fails, fix and retry:
```bash
dart run scripts/maintain_translations.dart --locale=pt_BR --extract-untranslated
```

### When to Split

Consider splitting when:
- A single ARB file exceeds **500 entries**
- Multiple translators work on the same locale
- Organizing by module or feature

```bash
# Split into 400-entry chunks
dart run scripts/maintain_translations.dart --locale=pt_BR --operation=split --max-entries=400
```

---

## Troubleshooting

### "Duplicate key found across files"

This means the same translation key exists in multiple ARB files for the same locale. Keys must be unique across all files.

```bash
# Find duplicates
dart run scripts/clean_arb_duplicates.dart

# Fix: Remove duplicate from one of the files
# Then run maintain to reorganize
dart run scripts/maintain_translations.dart --locale=pt_BR
```

### ARB file contains untranslated strings

Strings where `value == key` are cluttering your ARB files.

```bash
# Extract and clean
dart run scripts/clean_untranslated.dart --locale=pt_BR

# Translate the extracted file
edit translation_workspace/untranslated_pt_BR.arb

# Merge back
dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=translation_workspace/untranslated_pt_BR.arb
```

### Tests failing after translation

```bash
# Validate ARB files
dart run scripts/clean_arb_duplicates.dart

# Run tests
flutter test test/i18n_test.dart

# If tests still fail, check for:
# - Missing placeholders ({name}, {count}, etc.)
# - Incorrect JSON syntax
# - Missing metadata entries (@key)
```
