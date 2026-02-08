# Translation Progress - Portuguese (pt_BR)

## Current Status (Updated: 2026-02-07)

| Metric | Count | Percentage |
|--------|-------|------------|
| **Total strings (en_US)** | 4,697 | 100% |
| **Translated to pt_BR** | 547 | 11.6% |
| **Remaining in ARB files** | 4,249 | 90.5% |
| **In untranslated file** | 4,285 | - |
| **Portuguese ARB files** | 13 | - |

### Quick Stats

```
English source:     4,697 strings  [████████████████████] 100%
Portuguese done:      547 strings  [██░░░░░░░░░░░░░░░░░░] 12%
Remaining:          4,249 strings  [████████████████░░░░] 90%
```

## Cleanup Complete

Removed **~3,000 malformed entries** from ARB files:
- Entries with `$variable` interpolation (not properly templated)
- Invalid `@` metadata with placeholder names containing dots/parentheses
- UI markers now marked with `noTranslate: true` in code

## Script Fixes Applied

Fixed `scripts/find_translatable_strings.dart`:
- ✅ Skip strings with `$variable` interpolation (not ready for translation)
- ✅ No longer generates `@` metadata entries
- ✅ Extraction now produces clean ARB-compatible entries only

## File Distribution
- `app_pt_BR.arb` - 372 entries (primary)
- `app_pt_BR_part2.arb` through `app_pt_BR_part13.arb` - ~4,424 entries (distributed)
- `untranslated_pt_BR.arb` - pending cleanup

## Translation Reality Check

After cleaning:
- Only **547 strings** are actually translated (value ≠ key)
- **4,249 strings** in ARB files still have English values
- Need to regenerate `untranslated_pt_BR.arb` from current state

## Next Steps

1. **Translate**: Edit `untranslated_pt_BR.arb` with Portuguese translations
2. **Merge**: `dart run scripts/merge_arb_entries.dart --locale=pt_BR --source=untranslated_pt_BR.arb`
3. **Validate**: `dart run scripts/clean_arb_duplicates.dart`
4. **Test**: `flutter test test/i18n_test.dart`

## Workflow

See [TRANSLATION_WORKFLOW.md](TRANSLATION_WORKFLOW.md) for detailed translation instructions.

## Legacy Tracking (Pre-Extraction)

The following file-by-file tracking is from earlier translation sessions and is now superseded by the comprehensive extraction above:

### HIGH PRIORITY (User Interface Core) - Complete
- [x] lib/common_display/common_display.dart
- [x] lib/common_display/print_creature_info.dart
- [x] lib/common_display/print_party.dart
- [x] lib/title_screen/title_screen.dart
- [x] lib/basemode/base_mode.dart
- [x] lib/common_actions/equipment.dart
- [x] lib/common_actions/common_actions.dart

### MEDIUM PRIORITY (Common Actions) - Complete
- [x] lib/creature/sort_creatures.dart
- [x] lib/basemode/review_mode.dart
- [x] lib/basemode/plan_site_visit.dart

### DAILY ACTIVITIES - Complete
- [x] lib/daily/advance_day.dart
- [x] lib/daily/activities/recruiting.dart
- [x] lib/daily/activities/fundraising.dart
- [x] lib/daily/activities/car_theft.dart
- [x] lib/daily/activities/trouble.dart
- [x] lib/daily/activities/hacking.dart
- [x] lib/daily/activities/clothing_creation.dart
- [x] lib/daily/shopsnstuff.dart
- [x] lib/basemode/activate_sleepers.dart

---

## Full Extraction - 2026-02-07

The above file-by-file tracking has been superseded by comprehensive extraction.
All strings (5,008 unique) have been extracted from the entire codebase using:

```bash
dart run scripts/find_translatable_strings.dart
dart run scripts/maintain_translations.dart --locale=pt_BR --extract-untranslated
```

### Current Status Summary
- **Phase 1 (Templating)**: ✅ Complete
- **Phase 2 (Translation)**: 🔄 In Progress (47% complete)
- **Total strings**: 6,265
- **Translated**: 5,154 (47%)
- **Remaining**: 5,724 (53%)

See [TRANSLATION_WORKFLOW.md](TRANSLATION_WORKFLOW.md) for translation instructions.

## Session Log

2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
2026-02-08 | Batch: untranslated_pt_BR.arb | 0 strings translated | Merge target: lib/l10n/app_pt_BR.arb | Issues: $variable interpolation in batch (translation stopped)
