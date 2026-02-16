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

```bash
dart run scripts/translation_status.dart
dart run scripts/translation_status.dart --json
```

## validate_translations.dart

Pre-commit validator.

Runs:
1. `dart run dart_pre_commit`
2. `dart run scripts/maintain_arb_catalogs.dart --check`

```bash
dart run scripts/validate_translations.dart
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
