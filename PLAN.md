# Portuguese Translation Completion Plan

## Goal String

`Complete pt_BR localization for lcs-new-age: reach 100% Portuguese coverage for live source keys, eliminate or explicitly classify all translatable string-interpolation debt across lib/, add static and dynamic i18n smoke tests, and validate with catalog checks plus focused/full Flutter tests.`

## Current Baseline

- Current branch: `feature/localization`, clean against `origin/feature/localization`.
- Current `pt_BR` status: `5609` source keys, `5156` translated, `447` untranslated, `6` missing, `95` extra, `91.92%` coverage.
- Current catalog validation: `dart run scripts/maintain_arb_catalogs.dart --check` passes.
- Current placeholder parity: `0` source/Portuguese placeholder mismatches.
- Current interpolation audit: `939` total interpolated literals, `93` wrapper-context hits, `3` direct wrapper-argument hits.
- Existing focused tests pass, but they do not prove completion.

## Implementation Plan

1. Add an auditable i18n static gate.
   - Add a static coverage test or script that parses `lib/l10n/app_en_US_part*.arb` and `lib/l10n/app_pt_BR_part*.arb`.
   - Fail on missing target keys, empty values, Portuguese values equal to source keys, placeholder mismatches, malformed JSON, duplicate keys, non-canonical shard layout, and raw `$...` interpolation in catalog values.
   - Acceptance target: `untranslatedAgainstSource == 0`, `missingInTarget == 0`, `emptyInTarget == 0`, `coveragePercent == 100.0`.

2. Make interpolation readiness measurable.
   - Extend `scripts/interpolation_status.dart` or add a companion checker so it can emit every wrapper-context match, not just samples.
   - Add a tracked allowlist only for genuinely non-translatable output formatting: box drawing, color-control strings, debug-only strings, pure numbers, technical file/key names, and already translated dynamic fragments.
   - Each allowlist entry must include file, stable text/context, and a short reason.
   - Acceptance target: `0` unclassified wrapper-context interpolations and `0` direct wrapper-argument hits that are translatable English.

3. Sweep source files by directory.
   - Review every non-generated `lib/**/*.dart` file with wrapper-context interpolation hits.
   - Convert translatable `$...` string composition to placeholder templates with `params`.
   - Translate inserted dynamic words or phrases at the call site with `LcsI18n.tr(...)` when they are user-facing.
   - Mark visual/layout-only wrapper output with `noTranslate: true` only when it is not human language.
   - Treat fragment keys like `"'s wounds."`, `"'s body."`, `"Squad: "`, and `"Taking Undercover Action:   What will "` as defects unless proven live and intentionally rendered.

4. Complete the Portuguese catalog.
   - Run `dart run scripts/find_translatable_strings.dart` after source fixes.
   - Remove proven-dead source fragment keys from source/target catalogs only after confirming they are absent from live code or replaced by complete templates.
   - Translate remaining `pt_BR` entries by worst-coverage parts first: start with `part02`, `part05`, `part07`, `part12`, `part15`, `part19`, `part01`, `part06`, `part10`.
   - Preserve all placeholders exactly and keep CLI text concise enough for existing layout.
   - Do not hide unresolved proper nouns behind same-as-source values; either translate/adapt them or make the source explicitly non-translatable.

5. Add dynamic smoke coverage.
   - Add a runtime catalog smoke test that initializes `pt_BR`, iterates every English source key, synthesizes placeholder values, calls `LcsI18n.processString`, and fails on exceptions, fallback/missing logs, unreplaced placeholders, or same-as-source output.
   - Add console-wrapper smoke cases for `addstr`, `mvaddstr`, `addOptionText`, `addparagraph`, colorized placeholders, and translated dynamic inserted values.
   - Keep existing i18n and console tests, but make the new tests the proof of full Portuguese runtime coverage.

## Validation Commands

Run these before considering the goal complete:

```bash
dart run scripts/maintain_arb_catalogs.dart --check
dart run scripts/interpolation_status.dart --json
dart run scripts/translation_status.dart --json
flutter test test/i18n_static_coverage_test.dart test/pt_br_runtime_catalog_smoke_test.dart
flutter test test/i18n_test.dart test/console_wrapper_test.dart test/smoke_test.dart test/portuguese_plural_test.dart test/untranslated_logger_test.dart test/utils/interface_options_test.dart
flutter test
```

Completion requires the static status JSON to prove: `translatedAgainstSource == sourceKeys`, `untranslatedAgainstSource == 0`, `missingInTarget == 0`, `emptyInTarget == 0`, and placeholder mismatches remain `0`.

## Assumptions

- `pt_BR` is the only target locale for this goal.
- Generated `.g.dart` files are out of scope for interpolation review.
- Existing game satire and tone stay intact; translations should be idiomatic Brazilian Portuguese without sanitizing content.
- Stale extra keys should be cleaned when safely proven dead, but the hard completion gate is source-key coverage and runtime behavior.
- Commit and push after implementation and validation, following the repo’s current `feature/localization` branch workflow.
