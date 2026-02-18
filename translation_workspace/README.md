# Translation Workspace

This directory is the staging area for translation batches and focused translation passes.

## Files

- `untranslated_pt_BR.arb`: default extracted batch for Portuguese translation work
- `untranslated_pt_BR_partNN.arb`: focused part batch when default extraction is empty
- `batch_*.arb`: curated batch files used for focused translation passes
- `title_screen_pt_BR.arb`: focused batch for title-screen copy
- `check.arb`: optional scratch file for validation/ad-hoc checks
- `harness_batches.txt`: optional newline-delimited list of batch files provided by harness tooling
- `local_batch_candidates.txt`: optional list of discovered local fallback batches
- `selected_batches.txt`: optional record of batch files selected in the current harness run
- `translation_status_pt_BR.before.json` / `translation_status_pt_BR.after.json`: run-scoped coverage snapshots
- `translation_status_pt_BR.json`: latest status snapshot used for local triage
- `agent_scratchpad.md`: concise per-run translator notes (batches processed, blockers, next target)
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

## Empty Batch Recovery

If `untranslated_pt_BR.arb` is empty but translation status still shows untranslated keys:

1. If `harness_batches.txt` contains candidate files, evaluate those first.
2. Generate per-part status:
   `dart run scripts/translation_status.dart --locale=pt_BR --per-part --json > translation_workspace/translation_status_pt_BR.json`
3. Pick the worst non-complete part (`part01..part32`) from that JSON.
4. Extract untranslated keys directly from `lib/l10n/app_pt_BR_<part>.arb` into a focused batch file (e.g. `translation_workspace/untranslated_pt_BR_part09.arb`).
5. Translate/merge/validate normally.

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
- Batch files in this folder may be committed when intentionally used for translation handoff/review.
- Legacy `untranslated_strings_*.json` files are optional diagnostics and are not part of the canonical merge loop.
