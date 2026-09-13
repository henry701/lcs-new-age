# Translation Workspace

This directory is the staging area for translation batches and focused translation passes.

## Files

Files in this workspace are temporary working copies—do not commit them:

- `untranslated_<locale>.arb`: default extracted batch for translation work
- `untranslated_<locale>_partNN.arb`: focused part batch when default extraction is empty
- `batch_*.arb`: curated batch files for focused translation passes

## Typical Workflow

1. Sync source keys into locale catalogs:
   `dart run scripts/find_translatable_strings.dart`
2. Extract a translation batch:
   `dart run scripts/get_untranslated_strings.dart --locale=pt_BR --limit=50 --output=translation_workspace/untranslated_pt_BR.arb`
3. Translate values in the `.arb` batch file.
4. Merge translated batch into canonical catalogs:
   `dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=translation_workspace/untranslated_pt_BR.arb`
5. Validate canonical catalog layout:
   `dart run scripts/maintain_arb_catalogs.dart --check`

## Empty Batch Recovery

If default extraction is empty but translation status shows untranslated keys:

1. Generate per-part status:
   `dart run scripts/translation_status.dart --locale=pt_BR --per-part --json`
2. Pick the worst non-complete part (`part01..part32`).
3. Build a focused batch manually from `lib/l10n/app_pt_BR_<part>.arb`.
   There is currently no first-class per-part extractor script.
4. Translate/merge/validate normally.

Do not treat an empty default batch as completion unless global status confirms:
- `untranslatedAgainstSource == 0`
- `missingInTarget == 0`
- `emptyInTarget == 0`

## Translation Rules

- Keep JSON keys unchanged.
- Keep all `@...` metadata entries unchanged.
- Preserve placeholders exactly (`{name}`, `{count}`, etc.).
- Do not add inline color tags in translations (`{name:red}`, `{name:white}`, etc.).

## Notes

- Canonical catalogs live under `lib/l10n/app_<locale>_part01.arb` ... `app_<locale>_part32.arb`.
- Runtime untranslated logs are diagnostics only; they are not imported automatically into batch ARB files.
- Do not commit files from this workspace.
