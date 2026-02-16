# Translation Workflow Guide

This is the canonical localization workflow.

Status tracking lives only in `TRANSLATION_PROGRESS.md`.

```bash
dart run scripts/translation_status.dart
dart run scripts/translation_status.dart --per-part
dart run scripts/translation_status.dart --locale=pt_BR --part=part07
```

## Catalog Rules (Canonical)

- ARB keys are partitioned by deterministic hash of the source key.
- Locale catalogs are stored in:
  - `app_<locale>_part01.arb` ... `app_<locale>_part32.arb`
  - Unlabeled `app_<locale>.arb` is legacy and must not be read.
- All JSON objects are recursively sorted by key.
- Keys must be unique across all files of a locale.
- Catalog sync is additive only: existing translations are never overwritten by extraction.

Validate/fix:

```bash
# Check only (CI + pre-commit)
dart run scripts/maintain_arb_catalogs.dart --check

# Fix layout drift (reshard + sort + cleanup obsolete files)
dart run scripts/maintain_arb_catalogs.dart --fix
```

## Translation API Notes

- Use `LcsI18n.processString(template, params?)` through console wrappers.
- Translate dynamic values at call site when needed (`LcsI18n.tr(...)`).
- Keep placeholders intact (`{name}`, `{target}`, etc.).
- Do not add inline color specs in translations (`:white`, `:red`, etc.).
- Keep translated sentences roughly the same visual length as English when practical (CLI layout width is sensitive).
- Avoid `$variable` interpolation in translatable templates. Prefer placeholder-based templates (`{value}`) with `params`.

## Interpolation Audit

Run this before large translation batches to identify remaining interpolated literals:

```bash
dart run scripts/interpolation_status.dart --limit=40
```

The extraction script intentionally skips literals containing `$...`, so unresolved interpolated templates should be converted to placeholder-based strings before expecting catalog extraction.

## End-to-End Loop

```bash
# 0) Optional but recommended: audit unresolved interpolation
dart run scripts/interpolation_status.dart --limit=40

# 1) Sync catalogs from source code (add missing keys only)
dart run scripts/find_translatable_strings.dart

# 2) Extract untranslated batch
dart run scripts/get_untranslated_strings.dart \
  --locale=pt_BR \
  --limit=50 \
  --output=translation_workspace/untranslated_pt_BR.arb

# 2b) If extracted batch is empty but status still has untranslated keys:
#     - Run per-part status JSON
#     - pick a non-complete part and extract a focused per-part batch
#     - continue with translate/merge/validate

# 3) Translate values in translation_workspace/untranslated_pt_BR.arb

# 4) Merge translations back (hash-routed + canonical write)
dart run scripts/merge_arb_entries.dart \
  --locale=pt_BR \
  --source=translation_workspace/untranslated_pt_BR.arb

# 5) Validate canonical layout
dart run scripts/maintain_arb_catalogs.dart --check
```

## Notes for Translators

- Preserve JSON keys exactly.
- Preserve placeholders exactly.
- Prefer concise wording if literal translation would frequently wrap/overflow in terminal UI.
