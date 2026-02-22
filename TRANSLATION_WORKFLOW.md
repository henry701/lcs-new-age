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

## Harness Batch Metadata (Optional)

When running translation workers through the harness, these workspace files may be produced:

- `translation_workspace/harness_batches.txt`: harness-provided batch file paths to prioritize.
- `translation_workspace/local_batch_candidates.txt`: locally discovered fallback candidate batches.
- `translation_workspace/selected_batches.txt`: batches selected in-order for the current run.
- `translation_workspace/translation_status_pt_BR.before.json` and `translation_workspace/translation_status_pt_BR.after.json`: run-bound status snapshots.
- `translation_workspace/agent_scratchpad.md`: concise run log with batches translated, blockers, and next recommended part.

If the default `untranslated_pt_BR.arb` extraction is empty, do not assume completion. Check status (`untranslatedAgainstSource`, `missingInTarget`, `emptyInTarget`) and continue with per-part extraction for the lowest-coverage part.

## Runtime Untranslated String Logging

The game includes a runtime logging system that captures untranslated strings encountered during gameplay.

### How it Works

When enabled (via title screen settings), untranslated strings are logged to:
`translation_workspace/untranslated_strings_*.json`

These files are organized into 64 deterministic shards based on string hash.

### Using Runtime Logs

1. **Enable logging**: In the title screen, enable "Log Untranslated Strings"
2. **Play the game**: Untranslated strings will be captured as you encounter them
3. **Extract for translation**:
   ```bash
   # Convert runtime logs to ARB format for translation
   dart run scripts/get_untranslated_strings.dart \
     --locale=pt_BR \
     --include-runtime-logs \
     --output=translation_workspace/untranslated_pt_BR.arb
   ```

4. **Translate and merge** as normal

### Common Anti-Patterns

**❌ WRONG: Inserting translatable words via parameters**

Never insert translatable adjectives, adverbs, or other words as parameter values:

```dart
// WRONG - "beautiful" won't be translated
String quality = power > 3 ? " beautiful" : "";
addstr("{name} has completed a{quality} mural about {issue}.", 
       params: {"name": name, "quality": quality, "issue": issue});
```

**✅ CORRECT: Use separate complete strings**

When the only variable is translatable vocabulary, create separate strings:

```dart
// CORRECT - Both strings will be fully translated
if (power > 3) {
  addstr("{name} has completed a beautiful mural about {issue}.",
         params: {"name": name, "issue": issue});
} else {
  addstr("{name} has completed a mural about {issue}.",
         params: {"name": name, "issue": issue});
}
```

**Why this matters:**
- Word order varies across languages (e.g., "mural bonito" in Portuguese, not "bonito mural")
- Adjectives may need agreement with gender/number in some languages
- Translators can't see inline parameter values in ARB files

### Notes for Translators

- Preserve JSON keys exactly.
- Preserve placeholders exactly.
- Prefer concise wording if literal translation would frequently wrap/overflow in terminal UI.
- Runtime logs are supplemental diagnostics and should not be committed to the repository.
