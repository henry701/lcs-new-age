# Translation Workspace

This directory is the staging area for translation batches and focused translation passes.

## Files

- `untranslated_pt_BR.arb`: default extracted batch for Portuguese translation work
- `batch_*.arb`: curated batch files used by harness/manual translation passes
- `title_screen_pt_BR.arb`: focused batch for title-screen copy
- `check.arb`: optional scratch file for validation/ad-hoc checks
- `untranslated_strings_*.json`: legacy runtime logs from untranslated-string logging mode

## Typical Workflow

1. Sync source keys into locale catalogs:
   `dart run scripts/find_translatable_strings.dart`
2. Extract a translation batch:
   `dart run scripts/get_untranslated_strings.dart --locale=pt_BR --limit=50 --output=translation_workspace/untranslated_pt_BR.arb`
3. Translate values in one or more `.arb` batch files in this directory.
4. Merge each translated batch into canonical catalogs:
   `dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=<batch-file>`
5. Validate canonical catalog layout:
   `dart run scripts/maintain_arb_catalogs.dart --check`

## Translation Rules

- Keep JSON keys unchanged.
- Keep all `@...` metadata entries unchanged.
- Preserve placeholders exactly (`{name}`, `{count}`, etc.).
- Do not add inline color tags in translations (`{name:red}`, `{name:white}`, etc.).

## Notes

- Canonical catalogs live under `lib/l10n/app_<locale>_part01.arb` ... `app_<locale>_part32.arb`.
- Batch files in this folder may be committed when intentionally used for translation handoff/review.
- Legacy `untranslated_strings_*.json` files are optional diagnostics and are not part of the canonical merge loop.
