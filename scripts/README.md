# Localization Scripts

Canonical ARB layout rules:
- Keys are split by deterministic key hash (not by file size).
- JSON objects are recursively sorted by key.
- All locale files must be duplicate-free across files.
- Canonical filenames are only `app_<locale>_part01.arb` ... `app_<locale>_part32.arb` (no unlabeled file).

Primary commands:

```bash
# Validate canonical layout (used by CI + pre-commit)
dart run scripts/maintain_arb_catalogs.dart --check

# Fix layout drift (re-shard + re-sort + remove obsolete files)
dart run scripts/maintain_arb_catalogs.dart --fix
```

## find_translatable_strings.dart

Extracts user-facing strings from `lib/` and syncs missing keys into locale catalogs.

```bash
# Add missing keys and rewrite locales in canonical hash-sharded layout
dart run scripts/find_translatable_strings.dart

# Extraction only (no writes)
dart run scripts/find_translatable_strings.dart --print-only

# Control shard count explicitly
dart run scripts/find_translatable_strings.dart --hash-shards=32
```

Notes:
- Additive sync only: existing translated values are preserved.
- Detects wrapper literals plus random-list literals (`.random`, `[lcsRandom(...)]`).

## merge_arb_entries.dart

Merges translated batch files back into locale catalogs and writes canonical layout.

```bash
dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=translation_workspace/untranslated_pt_BR.arb
```

Notes:
- `--target` is deprecated/ignored.
- Keys are always routed by hash shard.

## get_untranslated_strings.dart

Builds a translation batch from all locale files.

```bash
dart run scripts/get_untranslated_strings.dart --locale=pt_BR --limit=50 --output=translation_workspace/untranslated_pt_BR.arb
```

## translation_status.dart

Reports source/target coverage and keyset drift.
Supports per-part (`part01`...`part32`) metrics for agent-friendly prioritization.

```bash
dart run scripts/translation_status.dart
dart run scripts/translation_status.dart --json
dart run scripts/translation_status.dart --per-part
dart run scripts/translation_status.dart --locale=pt_BR --part=part07
```

## interpolation_status.dart

Reports remaining string interpolation usage in `lib/`, including a high-confidence subset in console wrapper string arguments.

```bash
dart run scripts/interpolation_status.dart --limit=40
dart run scripts/interpolation_status.dart --json
```

Notes:
- Use this before translator batches to identify strings that still rely on `$...` interpolation.
- Extraction intentionally skips `$...` literals; convert to placeholder templates where practical (`{name}`, `{value}`, etc.).

## clean_untranslated.dart

Extracts untranslated strings from ARB files and writes them to a staging file.

Untranslated strings are those where value equals key or is empty. This script
can also remove untranslated entries from the canonical ARB files (destructive operation).

```bash
# Extract untranslated strings to default workspace location
dart run scripts/clean_untranslated.dart --locale=pt_BR

# Extract to custom output path
dart run scripts/clean_untranslated.dart --locale=de --output=staging/de_pending.arb

# Preview only (dry run)
dart run scripts/clean_untranslated.dart --locale=pt_BR --dry-run

# Extract without removing from ARB files (safer)
dart run scripts/clean_untranslated.dart --locale=pt_BR --no-remove
```

**Note:** Prefer `get_untranslated_strings.dart` for non-destructive extraction.
Use this script only when you need to clean/remove untranslated entries from ARB files.

## maintain_translations.dart

Legacy comprehensive translation maintenance script.

Provides operations for maintaining ARB catalogs including:
- Deduplication across locale files
- Splitting merged files by hash shard
- Extracting untranslated strings to separate files

```bash
# Full maintenance with untranslated extraction
dart run scripts/maintain_translations.dart --locale=pt_BR --extract-untranslated

# Only extract untranslated strings
dart run scripts/maintain_translations.dart --locale=pt_BR --operation=extract-untranslated

# Dry run to preview changes
dart run scripts/maintain_translations.dart --locale=pt_BR --dry-run
```

**Note:** This is a legacy script. Prefer `maintain_arb_catalogs.dart` for validation
and `get_untranslated_strings.dart` for extraction in new workflows.

## validate.dart

Pre-commit validator.

Runs:
1. `dart run dart_pre_commit`
2. `dart run scripts/maintain_arb_catalogs.dart --check`

```bash
dart run scripts/validate.dart
```

## Recommended Loop

```bash
# 1) Refresh catalogs from code (additive)
dart run scripts/find_translatable_strings.dart

# 2) Extract a translation batch
dart run scripts/get_untranslated_strings.dart --locale=pt_BR --limit=50 --output=translation_workspace/untranslated_pt_BR.arb

# 3) Translate the batch file

# 4) Merge translated entries
dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=translation_workspace/untranslated_pt_BR.arb

# 5) Validate canonical layout
dart run scripts/maintain_arb_catalogs.dart --check
```
