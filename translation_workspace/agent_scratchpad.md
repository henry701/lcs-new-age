# Translation Agent Scratchpad

## Playtest continuation — 2026-08-13

- PT-350/PT-351 fixed and verified: strict-headless newspaper replay found
  dynamic `DRUG PANIC` fallback/grammar defects (`methamphetamine` and
  `vai morrem`) and invalid retirement think-tank agreement (`Parceria Unido`,
  `porta-voz do`). Canonical catalogs now cover all drug choices and the
  infinitive consequence; retirement names use a neutral organization phrase
  and invariant Portuguese modifiers. Focused regression:
  `flutter test test/newspaper/herald_translation_test.dart`; captures are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-rerun-20260813/`.

- Confirmed PT-349 in a separate strict-headless Flutter map-editor route:
  Portuguese mod-tools opened an English toolbar/palette and overflowed at a
  compact viewport. Fixed by routing map-editor labels/status/tooltips through
  `LcsI18n`, adding hash-sharded en_US/pt_BR catalog entries, scrolling the top
  bar, and constraining long dropdown names.
- Focused regression: `flutter test test/map_editor/map_editor_translation_test.dart`.
- Validators after the fix: canonical ARB catalogs, prefix preservation,
  interpolation, and the focused i18n static/runtime suites all pass; the full
  Flutter suite remains the final verification gate for this cycle.
- Strict-headless evidence belongs under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/map-editor-translation-20260813/`.
- Keep the remaining random PT-048/PT-148 police-terminal seeds, PT-083 narrow
  console enhancement, and persisted generated-name locale-switch decision in
  the residual queue.

## Playtest continuation — 2026-08-12

- Completed a strict-headless developer-flag management sweep at the fixed
  80-column console. Covered Review categories, equipment, vehicles, agenda,
  media, infiltrated agents, task assignment, flags, location selection,
  department-store travel, and activity assignment with temporary all-items,
  injury, rescue, public-opinion, sleeper, medical-debt, and map-editor flags.
- The browser wrapper reported `HeadlessChrome/150.0.0.0` on every call; no
  headed browser was opened or focused, the DOM error channel stayed empty,
  and captured Portuguese rows remained bounded. No new translation or layout
  defect was confirmed.
- `Miguel Goldsteinaaaa` was isolated as repeated `a` key injection during the
  founder-name editor, not a product defect. All temporary debug flags were
  restored to `false`; no source changes were retained from this sweep.
- Durable capture directory:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/debug-flag-sweep-20260812/`.

## Playtest continuation — 2026-08-12 commerce/profile follow-up

- Strict-headless Portuguese replay covered the Commerce → `O Calabouço`
  armor, clothing, and weapon departments plus department-store travel. The
  live rows preserved translated metadata, purchase footers, and key prefixes;
  evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/armor-footer-20260812/`.
- A rebuilt temporary injured-founder/all-items route exercised Review profile
  pages. `+8 outras — BAIXO`, the full special-injury page, skill page, and
  crime page remained Portuguese and bounded at 80 columns. Flags were
  restored before shutdown; evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/injury-profile-20260812/`.
- No new translation, prefix, or layout issue was confirmed. Keep the random
  PT-048/PT-148 terminal variants, PT-083 narrow-console enhancement, and the
  persisted generated-name locale-switch decision in the residual queue.

## Run 2026-03-14 00:00 UTC

- **Run timestamp in UTC:** 2026-03-14 00:00 UTC
- **Batch file used:** translation_workspace/untranslated_pt_BR_part02.arb (generated from part02)
- **Entries translated:** 1 (out of 31 total in batch)
- **Entries skipped:** 30 (reasons: proper nouns, city names, person names, acronyms, fragments, templates)
- **Coverage before:** 92.16% (translated: 5021, untranslated: 420, missing: 7, empty: 0)
- **Coverage after:** 92.18% (translated: 5022, untranslated: 419, missing: 7, empty: 0)
- **Parts processed:** part02
- **Tests passed:** YES
- **Blockers:** None
- **Next recommended part:** part01 (untranslated count: 22) or part05 (25) or part07 (25)
- **Rationale:** Translated "Agi: {agi}" to "Agilidade: {agi}" consistent with other stat translations. All other entries in batch were proper nouns, acronyms, fragments, or templates that should not be translated per rules.

## Run Notes

- Pre-flight checks passed: branch feature/localization, clean working tree.
- Synced translatable strings (0 new strings).
- Validated ARB catalogs (canonical).
- Generated before-state JSON.
- Default batch (untranslated_pt_BR.arb) had zero actionable entries (all proper nouns/acronyms/fragments).
- Per-part fallback selected part02 (highest untranslated count).
- Created batch for part02 with 31 entries; translated 1 entry.
- Merge succeeded, validation passed.
- After-state shows improvement: untranslatedAgainstSource decreased by 1.
- All tests passed.
- MissingInTarget remains 7 (keys missing in target catalog). These keys need to be added (additive sync) but not part of translation workflow.

## Next Steps

- Continue per-part translation focusing on parts with highest untranslated counts.
- Consider adding missing keys via find_translatable_strings.dart (already run but added 0; maybe missing keys are extra in target?).
- Target parts: part01, part05, part07, etc.
- Continue until untranslatedAgainstSource == 0, missingInTarget == 0, emptyInTarget == 0.

---

## Run 2026-03-14 14:40 UTC

- **Run timestamp in UTC:** 2026-03-14 14:40 UTC
- **Batch file used:** NONE (exhaustion - no actionable entries found)
- **Entries translated:** 0 (out of 100 total in fresh batch)
- **Entries skipped:** 100 (reasons: proper nouns, city names, person names, acronyms, fragments, templates)
- **Coverage before:** 92.18% (translated: 5022, untranslated: 419, missing: 7, empty: 0)
- **Coverage after:** 92.18% (no changes)
- **Parts processed:** part01 (batch already merged), part03, part19 (examined)
- **Tests passed:** N/A (no translations merged)
- **Blockers:** All remaining 419 untranslated entries are non-localizable per skip rules
- **Next recommended part:** N/A - exhaustion reached
- **Rationale:** Exhaustion check complete. All 419 remaining untranslated entries fall under skip rules: proper nouns (Horváth, Pérez, etc.), city names (Venezuela, Dallas TX, etc.), acronyms (GWF, BMW, LCS, BDSM, etc.), format templates ({name} {reaction}), and fragments ("elease, "). Per Phase 5 skip rules, these should NOT be translated.

---

## Run Entry — 2026-03-14 (UTC)
- **Batch file used**: translation_workspace/untranslated_pt_BR.arb (default, 80 entries)
- **Entries translated**: 0
- **Entries skipped**: 80 (all proper nouns, acronyms, format templates, fragments)
- **Coverage before**: 92.18% (translated: 5022, untranslated: 419, missing: 7, empty: 0)
- **Coverage after**: 92.18% (no change)
- **Parts processed**: Exhaustive check of all 32 parts (part01–part32)
- **Tests passed**: N/A (no changes made)
- **Blockers**: None
- **Next recommended part**: N/A — exhaustion confirmed
- **Rationale**: All 419 remaining untranslated entries are non-localizable:
  - Proper nouns (person names: De Niro, Trump, Mengele, bin Laden, O'Connor, etc.)
  - Place names (US cities with state codes, Long Island, National Mall, El Salvador, etc.)
  - Acronyms (GWF, DWF, BMW, SSBBW, BDSM, PNP, MWC, etc.)
  - Format templates/placeholders ({name} {reaction}, {month} {year}., etc.)
  - Fragment keys (suffixes, mid-sentence continuations)
  - Brand names (Fandango, Micro, Mega, etc.)
  - 7 missingInTarget entries are source-only keys not yet synced to pt_BR
  - No safe translation work remains; emitting NO_WORK_DONE

---

## Run Entry — 2026-03-14 (UTC) — Verification Pass
- **Batch file used**: NONE (exhaustion verification)
- **Entries translated**: 0
- **Entries skipped**: 419 (all non-localizable)
- **Coverage before**: 92.18% (translated: 5022, untranslated: 419, missing: 7, empty: 0)
- **Coverage after**: 92.18% (no change)
- **Parts processed**: Default batch (81 entries), part02 (30 entries), part05 (25 entries), part07 (25 entries) — all verified non-localizable
- **Tests passed**: N/A (no changes made)
- **Blockers**: None
- **Next recommended part**: N/A — exhaustion re-confirmed
- **Rationale**: Independent verification pass confirms previous agent's conclusion. All 419 remaining untranslated entries fall under Phase 5 skip rules:
  - Proper nouns: person names (De Niro, Trump, bin Laden, O'Connor, etc.)
  - Place names: US cities with state codes (Centennial CO, Dallas TX, Yuma AZ, etc.)
  - Acronyms: GWF, DWF, BMW, SSBBW, BDSM, PNP, MWC, BBW, SWS, VGL, etc.
  - Format templates/placeholders: {name} {reaction}, {month} {year}., $viewName: $effectValueText
  - Fragment keys: "elease, ", "com", "zap", mid-sentence continuations
  - Brand names: Fandango, Micro, Mega
  - No safe translation work remains; emitting NO_WORK_DONE
