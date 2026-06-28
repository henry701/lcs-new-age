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
- Catalog sync does not prune dead source keys. Stale `en_US` keys can remain after source refactors until they are cleaned up separately.

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

## Source Sweep Before Translation

Do this before treating untranslated coverage as real translator work:

1. Run `dart run scripts/interpolation_status.dart --limit=40`.
2. Fix wrapper-adjacent `$...` interpolation by converting it to placeholder templates.
3. Re-run `dart run scripts/find_translatable_strings.dart`.

Important limitations:

- `find_translatable_strings.dart` is additive-only. It does not remove dead source keys from catalogs.
- `find_translatable_strings.dart` is not a full semantic extractor. It can miss some strings that are assigned to locals and only rendered later through wrappers.
- `interpolation_status.dart` has two signal levels:
  - direct wrapper-argument hits: high-confidence
  - wrapper-context hits: broader, useful for multiline calls and manual sweep work

Treat the scripts as good assistants, not proof that source-string cleanup is complete.

## Fragment Keys and Name+Flavor Composition (Strong Rule)

Fragment keys (e.g. `"'s wounds."`, `"'s lifeless body smashes through the windshield."`, `" slams into a building!"`, leading-space or trailing phrases) and name+fragment concatenation are defects for i18n.

They produce grammatically broken or unorderable output in pt_BR (and other languages) because:

- Word order and possessives differ.
- The fragment cannot be translated in isolation with correct article/gender/case.

**Required pattern:**

```dart
// Good: full template with placeholder
addstr("{medic} was able to slow the bleeding of {patient}'s wounds.",
       params: {"medic": medic.name, "patient": patient.name});

// For random flavor attached to name:
mvaddstrc(11, 0, red, "{name}{flavor}", params: {
  "name": p.name,
  "flavor": LcsI18n.tr(" is crushed inside the car."),
});
```

**Never:**

```dart
addstr(name);
addstr("'s wounds.");
addstr(crashesFlavorText.random); // if it starts with space or 's
```

Existing offenders (non-exhaustive; re-sweep before claiming quality-complete):

- chase_sequence.dart: crashesFlavorText, diesFlavorText (some start with "'s " or space)
- Similar lists in prison, daily, etc.
- Raw Dart interp for display names: "$name's Pawnshop" (review whether these need i18n or should be generated from translated base + owner)

Before marking any i18n goal "done for runtime", convert these to full templates, add the complete keys to catalogs, remove the dead fragment keys (after confirming no live use), and re-validate.

See also the completion PLAN.md (do not edit) for gate expectations around fragments.

## Interpolation Audit

Run this before large translation batches to identify remaining interpolated literals:

```bash
dart run scripts/interpolation_status.dart --limit=40
```

The extraction script intentionally skips literals containing `$...`, so unresolved interpolated templates should be converted to placeholder-based strings before expecting catalog extraction.

## End-to-End Loop

```bash
# 0) Audit unresolved interpolation / source sweep debt
dart run scripts/interpolation_status.dart --limit=40

# 1) Sync catalogs from source code (add missing keys only)
dart run scripts/find_translatable_strings.dart

# 2) Check overall status before assuming remaining work is translation-only
dart run scripts/translation_status.dart

# 3) Extract untranslated batch
dart run scripts/get_untranslated_strings.dart \
  --locale=pt_BR \
  --limit=50 \
  --output=translation_workspace/untranslated_pt_BR.arb

# 3b) If extracted batch is empty but status still has untranslated keys:
#     - run per-part status JSON
#     - pick a non-complete part
#     - build a focused batch manually from that shard file
#     - continue with translate/merge/validate
#     - there is currently no first-class per-part extractor

# 4) Translate values in translation_workspace/untranslated_pt_BR.arb

# 5) Merge translations back (hash-routed + canonical write)
dart run scripts/merge_arb_entries.dart \
  --locale=pt_BR \
  --source=translation_workspace/untranslated_pt_BR.arb

# 6) Validate canonical layout
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
These logs are diagnostics, not a first-class batch source.

### How it Works

When enabled (via title screen settings), untranslated strings are logged to:
`translation_workspace/untranslated_strings_*.json`

These files are organized into 64 deterministic shards based on string hash.

### Using Runtime Logs

1. **Enable logging**: In the title screen, enable "Log Untranslated Strings"
2. **Play the game**: Untranslated strings will be captured as you encounter them
3. **Use the logs to find missing live strings**:
   - compare them against `translation_status.dart`
   - fix source templating/interpolation if needed
   - add missing source keys with `find_translatable_strings.dart`
4. **Translate and merge through the normal ARB workflow**

There is currently no supported `get_untranslated_strings.dart --include-runtime-logs` importer.

### Common Anti-Patterns

**❌ WRONG: Inserting hardcoded words via parameters**

Never insert hardcoded English words as parameter values—they won't be translated:

```dart
// WRONG - "beautiful" is hardcoded English and won't be translated
String quality = power > 3 ? " beautiful" : "";
addstr("{name} has completed a{quality} mural about {issue}.", 
       params: {"name": name, "quality": quality, "issue": issue});
```

**✅ CORRECT: Use `LcsI18n.tr()` for dynamic words**

Use `LcsI18n.tr()` to translate individual words that need to be inserted dynamically:

```dart
// CORRECT - "beautiful" is extracted and translated via LcsI18n.tr()
String quality = power > 3 ? " ${LcsI18n.tr("beautiful")}" : "";
addstr("{name} has completed a{quality} mural about {issue}.",
       params: {"name": name, "quality": quality, "issue": issue});
```

**Important notes:**
- `LcsI18n.tr("word")` extracts "word" as a standalone translatable string
- This preserves the original code style while ensuring translations
- Use this for single-word variations that need dynamic insertion
- For longer phrases, prefer separate complete strings to maintain context for translators

**When to use each approach:**
- **Single words**: Use `LcsI18n.tr()` (e.g., "beautiful", "quickly", "strong")
- **Phrases/sentences**: Use separate complete strings with full context

### Notes for Translators

- Preserve JSON keys exactly.
- Preserve placeholders exactly.
- Prefer concise wording if literal translation would frequently wrap/overflow in terminal UI.
- Runtime logs are supplemental diagnostics and should not be committed to the repository.
