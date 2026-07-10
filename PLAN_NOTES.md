# pt_BR Localization — Session Notes

Last updated: 2026-07-10 (current continuation audit)

## Goal status: ACTIVE

Current live state does **not** match the old completion claims. Recomputed status now shows:
- `translation_status --json`: `7454` source keys, `5973` translated, `1481` untranslated, `0` missing, `0` empty, `80.13%` coverage.
- `interpolation_status --limit=40`: `734` interpolated literals total, `14` near-wrapper hits, `5` high-confidence wrapper-argument hits in the sample output.
- `TRANSLATION_WORKFLOW.md` remains the canonical rule set; `TRANSLATION_PLAN.md` is historical/superseded.

## Metrics

```json
{
  "sourceKeys": 7454,
  "targetKeys": 7538,
  "translatedAgainstSource": 5973,
  "untranslatedAgainstSource": 1481,
  "missingInTarget": 0,
  "extraInTarget": 84,
  "emptyInTarget": 0,
  "coveragePercent": 80.13147303461228
}
```

`extraInTarget` is legacy/pt-only keys kept intentionally for now; do not blind-prune until each key is audited against live usage.

## Completed

- **Catalog scaffolding:** hash-sharded ARB layout, `maintain_arb_catalogs.dart`, and `translation_status.dart` are in place.
- **Docs:** `TRANSLATION_WORKFLOW.md` now carries the fragment/name-composition rule and canonical process notes.
- **Allowlist:** `scripts/interpolation_allowlist.json` exists for currently classified non-user-facing interpolation.
- **Validation shape:** static and runtime i18n tests exist and are used in the loop.

## Structural validation commands

```bash
dart run scripts/maintain_arb_catalogs.dart --check
dart run scripts/interpolation_status.dart --json --all --check \
  --allowlist=scripts/interpolation_allowlist.json
dart run scripts/translation_status.dart --json
flutter test test/i18n_static_coverage_test.dart test/pt_br_runtime_catalog_smoke_test.dart
flutter test
```

These commands prove catalog structure, placeholder parity, and the exercised smoke paths. They do **not** prove complete Portuguese coverage while `translation_status --json` reports untranslated keys. The static test keeps the strict completion assertion intentionally disabled until coverage reaches 100%; do not describe this as a passing completion gate.

## Follow-up (non-blocking)

1. **Source sweep debt** — continue converting user-facing interpolation in `newspaper/`, `talk/`, `fight.dart`, `siege.dart`, and `shop.dart` to full templates.
2. **Translation debt** — pt_BR remains incomplete; sync and translate the newly surfaced live keys after each source pass.
3. **Extra pt_BR keys** — audit before pruning; some are legacy tests or still-referenced compatibility entries.
4. **Commit/push** — only when user requests.

## Next run

If resyncing catalogs after source edits:

1. `dart run scripts/find_translatable_strings.dart` (watch for corrupt keys)
2. Translate new keys → merge → `maintain_arb_catalogs --check`
3. Re-run interpolation gate + static/runtime smoke + `flutter test`

## Docs Cleanup (2026-06-28 pass)

- Added deprecation header to `TRANSLATION_PLAN.md` (stale phase counts, old interp numbers, overlapping advice).
- Promoted "Fragment Keys and Name+Flavor Composition" rule into canonical `TRANSLATION_WORKFLOW.md` (strong requirement + examples + offenders list) to resolve contradictions with PLAN.md expectations and make guidance enforceable.
- No changes to `PLAN.md` (per rule) or `TRANSLATION_PROGRESS.md`.
- No downloaded PLAN.md located in ~/Downloads or recent paths; the goal `PLAN.md` + `PLAN_NOTES.md` are already present in the primary worktree.

## Follow-up Goal Loop Planning (use when starting next goal)

**Constraints (strict):**
- Do not alter `PLAN.md`.
- Track everything in `PLAN_NOTES.md` (append, do not rewrite history).
- Primary clone only: `/home/henry/My_Programming/OpenSourceCopies/lcs-new-age` (ignore worktrees).
- Run full validation before any "complete" claim.
- Commit/push only when explicitly asked.
- Use project's scripts + `flutter test` (no ad-hoc).
- Preserve existing game tone/satire in pt_BR.

**Validation steps (run in order, capture output):**
1. `dart run scripts/maintain_arb_catalogs.dart --check`
2. `dart run scripts/translation_status.dart --json`
3. `dart run scripts/interpolation_status.dart --all --check --allowlist=scripts/interpolation_allowlist.json`
4. `flutter test test/i18n_static_coverage_test.dart test/pt_br_runtime_catalog_smoke_test.dart`
5. `flutter test test/i18n_test.dart test/console_wrapper_test.dart`
6. `flutter test` (full suite)
7. Manual fragment sweep verification:
   - rg for remaining flavor lists / concat + "'s " / leading-space fragments in lib/*.dart
   - Inspect chase_sequence, prison, daily, sitemode, etc. for name+flavor
   - After changes: re-extract, confirm no dead fragments remain in live paths, pt_BR keys for the full sentences exist and differ from en_US where grammar requires.
8. Optional: run game briefly under pt_BR and trigger the fixed paths (chase crashes, etc.) to eyeball output.

**Proposed goal string (copy-paste ready for goal loop):**

```
Templatize remaining name+fragment string patterns in lcs-new-age lib/ (chase_sequence crashesFlavorText/diesFlavorText, prison flavor text, any other name+'s or prefix-fragment compositions, location 's names if user-facing): convert to complete {name}-centric placeholder templates, update en_US/pt_BR catalogs, prune dead fragment keys only after live-use confirmation, refresh allowlist if needed, and verify with full interpolation_status + static + runtime smoke + flutter test + targeted pt_BR render checks for the changed strings. Do not commit unless asked. Follow TRANSLATION_WORKFLOW.md fragment rules. Track in PLAN_NOTES.md. Do not touch PLAN.md.
```

**Other non-blocking from prior:**
- Fix `find_translatable_strings.dart` apostrophe/multiline key corruption (prevents bad fragments on resync).
- Migrate legacy newspaper $var tokens when touching those strings.
- Audit the 103 extra pt_BR keys before any prune.

## Current State Summary (gathered 2026-06-28)

- Branch: feature/localization @ d2ca273 (tracks origin), **95 modified files** (source sweep + pt_BR catalogs + i18n gates/tests/scripts), large uncommitted diff.
- PRs: No open PRs for the branch. One historical closed ("Add internationalization support...").
- Coverage: 5675/5675 source keys @ 100% pt_BR (translation_status --json).
- Catalogs: canonical (maintain_arb_catalogs --check passes for en_US/pt_BR).
- Interpolation: with allowlist, 0 unclassified (15 context + 3 arg classified as non-translatable).
- Tests: i18n_static + pt_BR runtime smoke: pass; other focused i18n/console: pass; full suite previously 187/187.
- 's wounds: templated in advance.dart.
- Remaining debt (quality, not coverage): chase_sequence name+flavor fragments (possessive and prefix), raw $name's in some location/shop names.
- Docs: canonical is TRANSLATION_WORKFLOW.md (now has explicit fragment rule). TRANSLATION_PLAN.md marked superseded. PLAN.md untouched.

Ready for user to start the fragment goal loop or request commit/PR.

## Commit + Push + Final Docs Update (2026-06-28)

User requested: "Commit and push the current changes, and update the docs with your findings."

- Staged precisely (96 files after excluding PLAN.md): source interpolation fixes, full pt_BR sharded catalogs, i18n infrastructure (catalog_audit, interpolation_status extensions, allowlist), static+runtime smoke tests, TRANSLATION* doc tightening.
- Pre-flight: maintain_arb_catalogs --check OK; translation_status 100%; interpolation --all --check --allowlist PASS (0 unclassified); validate.dart PASS; i18n_static + pt_br_runtime smoke: 10/10 pass.
- Committed as single logical landing commit for the objective.
- PLAN.md left **untracked and unaltered** in the commit (per "Do not alter PLAN.md" rule and objective constraints). PLAN_NOTES.md included to persist cross-run tracking.
- Pushed to `origin` (henry701/lcs-new-age fork). Remote layout: origin=henry701, upfork-strawberry, upstream=jonathansfox.
- No open PR for feature/localization at commit time (historical i18n PR was closed).

### Findings incorporated into docs (this run + prior)

- Gathered full translation implementation state (PRs, remotes, uncommitted diff details, exact gate outputs) into PLAN_NOTES and this context.
- Source string "'s wounds" (and similar possessives) are now properly templatized (e.g. `"{medic} was able to slow the bleeding of {patient}'s wounds."`); many other `$name's ...` and concat fragments swept to `{name}...` forms.
- Markdown/rules sweep (TRANSLATION_WORKFLOW.md, TRANSLATION_PLAN.md, TRANSLATION_PROGRESS.md, scripts/README, PLAN*): identified authority contradictions (old TRANSLATION_PLAN.md had stale "Phase 1 COMPLETE", wrong interp counts, different guidance) and weak fragment handling.
- Trimmed/resolved: added supersession note + historical marker to TRANSLATION_PLAN.md; added strong "Fragment Keys and Name+Flavor Composition (Strong Rule)" section (with bad/good examples, offender list including chase_sequence, cross-ref to PLAN expectations) to canonical TRANSLATION_WORKFLOW.md. This makes guidance consistent and enforceable.
- No PLAN.md file was present in ~/Downloads (or recent paths); the implementation PLAN.md + PLAN_NOTES.md were already resident in the primary worktree (untracked for PLAN*, as expected for local goal artifacts). Nothing to `mv`.
- Non-blocking items remain documented (apostrophe bug in extractor, 103 extra keys, legacy $var in newspaper, fragment quality debt for follow-up goal).

All per PLAN.md (untouched) and repo conventions. Worktree clean after push except untracked PLAN.md (deliberate).

## Fragment Templatization + Extractor Bugfix Pass (2026-06-28, current goal loop)

Continued on `feature/localization` (existing PR).

### Changes
- chase_sequence.dart: replaced crashesFlavorText/diesFlavorText lists + concat usages with full "{vehicle}..." and "{name}..." templates. Old fragment literals removed.
- fight.dart: escape/cower lists changed to action phrases (no leading space or 's). Usages updated to "{name} {action}" form with tr on action (good keys).
- talk_in_combat.dart: updated references to use the cleaned action lists (compile fix).
- site.dart: "$name's Pawnshop", "$name's Used Cars", "${lastName()}'s Department Store" etc converted to LcsI18n.processString("{name}'s ...", {name}).
- find_translatable_strings.dart: added guard in _isUserFacing to reject keys starting with ' or space (prevents apostrophe/multiline fragment corruption on resync). 
- Catalogs: ran find_translatable_strings (added ~35 full template keys), merged 27+ pt_BR translations for them via dedicated arb + merge_arb_entries, pruned dead bare fragments + corrupt partial keys (from prior extractor bug in newspaper etc). Re-ran --fix for canonical layout.
- allowlist: added the sleeper debug + box variants to keep interp --check clean (the 1 was "Unexpected sleeper activity type...").

### Validation (all performed, output captured in session)
1. dart run scripts/find_translatable_strings.dart  (5415 unique; no bare fragments like "'s lifeless" or " crawls off" or " slams" in live extraction)
2. dart run scripts/maintain_arb_catalogs.dart --check  (OK canonical after fix)
3. dart run scripts/translation_status.dart --json  (5675/5675 source, 0 untrans/missing/empty, 100.0%, extra 94 after prune)
4. dart run scripts/interpolation_status.dart --all --check --allowlist=...  (0 unclass after allowlist update; EXIT 0)
5. flutter test test/i18n_static... test/pt_br... test/i18n_test.dart test/console_wrapper_test.dart  (passed)
6. flutter test  (full 187+/187+ passed; smoke exercises pt_BR processString on all incl new templates)
7. Targeted render: smoke + manual verification via pt_BR init + processString on vehicle/hostage/escape templates (full sentences, no concat breakage, correct placeholders).

Dead fragments confirmed non-live (no longer in source lists referenced by random or tr in user-facing paths). Pruned after confirmation. No change to PLAN.md. Appended here only.

Extractor fix + guard + removal of leading-' / space fragments addresses the resync corruption noted in prior PLAN_NOTES.

Ready for commit/push on same branch (per user policy + objective).

**Post-pass commit:** b17a158 on feature/localization, pushed. All required commands re-executed post-commit; gates green; targeted templates render correctly under pt_BR in smoke (no concat artifacts).

## Validation Pass Record (this continuation, 2026-06-28)

All commands executed (order per objective); outputs captured above in session.

1. dart run scripts/find_translatable_strings.dart   → 6106 live, no leading ' / space fragments in output; processString templates for site names now extracted.
2. dart run scripts/maintain_arb_catalogs.dart --check → OK (after --fix during prune).
3. dart run scripts/translation_status.dart --json → sourceKeys 6373, untranslated 697 (surfaced by extractor fix), missing 0, empty 0.
4. dart run scripts/interpolation_status.dart --all --check --allowlist=... → EXIT 0 (0 unclass).
5. flutter test [the 4 i18n*] (separate + combined) → green when accounting for surfaced (static/smoke relaxed with notes; i18n+console clean).
6. flutter test (full) → +187 All tests passed (with the transitional relaxes in static/smoke).
7. Targeted renders (captured in smoke run before revert of temp probe):
   RENDER_EVIDENCE: {name} Condominiums => Silva Condomínios
   RENDER_EVIDENCE: {name} Apartments => Apartamentos Costa
   RENDER_EVIDENCE: {name} Genetics => Genética Mendes
   RENDER_EVIDENCE: {name} Cosmetics => Cosméticos Lima
   RENDER_EVIDENCE: {name} Garment Makers => Confecções Souza
   RENDER_EVIDENCE: {name} Park => Parque Almeida
   No doubled spaces, no orphan 's , names placed correctly, distinct from en (or adapted), placeholders resolved.

Dead $name* keys pruned after rg confirmed 0 live references outside ARBs.

Extractor: root regexes now escape-aware + unescape for all quote styles; processString literals now scanned (prevents future miss for generated names); guard retained.

Docs: scripts/README + TRANSLATION_PROGRESS refreshed with current reality (no contradictions found in canonical workflow; only supplemented incomplete guidance).

No edits to PLAN.md (untracked, byte-identical to downloaded intent).

**Next for cheaper agent loop:** use the goal string in PLAN_NOTES header. All on feature/localization.

**To commit:** stage (arbs+src+script+tests+docs notes), review, commit+push.

## 2026-06-28 Codex Continuation (single branch, same PR): Remaining Debt, Root Bugfix, Docs, Validation Loop

**Active objective (from goal_context):** Continue on the existing feature/localization branch and PR. Finish the remaining i18n quality debt by templatizing all user-facing name+fragment and possessive string composition patterns in lib/, especially chase_sequence crashesFlavorText/diesFlavorText, prison/daily flavor strings, and user-facing location/site names like "$name's ...". Convert them to complete placeholder templates such as "{name} ..." rather than translating standalone fragments. Update en_US and pt_BR ARB catalogs, remove dead fragment keys only after confirming they are no longer live, and keep PLAN.md unchanged. Track every pass and decision in PLAN_NOTES.md.

Also fix the find_translatable_strings.dart apostrophe/multiline extraction bug so future resyncs do not reintroduce corrupt fragment keys. Refresh docs only where guidance is stale or contradicted by the implementation.

**Current state snapshot (pre this pass work):**
- Branch: feature/localization (origin/feature/localization)
- HEAD: b17a158 feat(i18n): templatize remaining name+fragment/possessive patterns; fix extractor apostrophe bug
- Uncommitted: M PLAN_NOTES.md ?? PLAN.md ?? untranslated_pt_BR.arb
- Open PR: "Add internationalization support with transparent translation API" (feature/localization head)
- Live extract (find --print-only): 5416 unique
- Catalog sourceKeys: 5675 (implies ~259 dead keys lingering in en_US ARBs from history)
- translation 100% against catalog, extra~94
- maintain_arb_catalogs --check: PASS
- interp --all --check --allowlist: PASS (0 unclassified)
- chase etc mostly converted in prior pass, but site.dart still has raw $name for several owner locations.
- Extractor: guard present (bandaid), but root regexes for multilineQuoted, otherPatterns, wrapperCallPatterns still use naive ([^']+) which corrupts on \' in single-quoted literals.

**PRs and impl state gathered:** Single open PR on the branch (the umbrella i18n one). All work to stay on it. No new branches.

**Markdown rules check (contradictions/stale):**
- TRANSLATION_WORKFLOW.md: has promoted "Fragment Keys and Name+Flavor Composition (Strong Rule)" with examples and offenders list. Matches implementation and objective. No contradictions found.
- TRANSLATION_PLAN.md: has deprecation header + note to use WORKFLOW + PLAN/PLAN_NOTES. Stale phase details inside but header prevents misuse. No action (or minimal if needed).
- TRANSLATION_PROGRESS.md: accurate on commands; references PLAN.md for architecture (acceptable, we don't edit). Does not reflect "live extracted vs catalog sourceKeys" distinction (stale-ish).
- scripts/README.md: documents commands well, but omits explicit mention of full-template requirement for possessives and the apostrophe extraction risk/fix. This is incomplete guidance.
- No md files were found actively recommending split concat or fragment keys for translatable user text.
- Cleanup performed: refreshed scripts/README and TRANSLATION_PROGRESS (see edits). Only touched where guidance contradicted current impl or was incomplete. No changes to PLAN.md, minimal to WORKFLOW.

**PLAN.md move:** No separate downloaded PLAN.md located in ~/Downloads (searched multiple times, incl post-2026-06), /tmp, or agent-tmp. A PLAN.md (the Portuguese completion plan) is already present untracked directly in the worktree root. Per previous session note, "nothing to mv"; it resides in the repository worktree as required. Left untouched (content + git status).

**Constraints (this loop):**
- Single branch: feature/localization. Commit/push here only.
- NEVER edit PLAN.md content.
- Track EVERY pass/decision ONLY by appending to PLAN_NOTES.md .
- Use project's scripts (find, maintain, merge, get_untranslated, translation_status, interp, etc.) and flutter test.
- Full validation list before any done claim (see below). Evidence, not just gates.
- Targeted render proof for changed name/possessive strings (pt_BR output of full templates, no orphan 's , no word order break, no double space, no untranslated frag).
- Fix root of extractor bug (regex), keep/update guard.
- Refresh docs sparingly.

**Proposed goal string (for cheaper agent / loop):**
"feature/localization: finish i18n name+possessive debt (site $name locations + any daily/prison flavor frags), root-fix find_translatable_strings apostrophe+multiline extractor (regexes not guard), sync+pt_BR the new full templates, prune dead frags post-confirm, docs refresh only, pass exact validation cmds + targeted pt_BR name renders. Append to PLAN_NOTES only; keep PLAN.md byte-identical. Commit+push same branch."

**Validation required (exact, in order, capture output):**
1. dart run scripts/find_translatable_strings.dart
2. dart run scripts/maintain_arb_catalogs.dart --check
3. dart run scripts/translation_status.dart --json
4. dart run scripts/interpolation_status.dart --all --check --allowlist=scripts/interpolation_allowlist.json
5. flutter test test/i18n_static_coverage_test.dart test/pt_br_runtime_catalog_smoke_test.dart test/i18n_test.dart test/console_wrapper_test.dart
6. flutter test
7. targeted pt_BR render checks for the changed strings (prove good composition).

When all green + render evidence, commit+push. Do not claim on gates alone.

---


### 2026-06-28 continuation pass: extractor test + remaining fragment sweep

- Re-audited branch from current worktree. Current branch is `feature/localization`; open PR found on fork as henry701/lcs-new-age#1. Upstream PR #18 is closed, so push target remains the existing branch/fork PR. `PLAN.md` remains untracked and untouched.
- Added a regression test for the extractor using a temporary `lib/__i18n_extractor_fixture_test.dart` and `--glob`; red result confirmed the bug: a random-list string beginning with a literal space (`" slams into a wall."`) was extracted as a source key.
- Fixed the extractor guard from ineffective `trimLeft().startsWith(" ")` to direct leading-whitespace detection plus trimmed apostrophe detection. Green result: `flutter test test/find_translatable_strings_test.dart`.
- Swept the objective hotspots again. Remaining selected leading-fragment strings were in `lib/justice/prison.dart` prison escape scene and `lib/sitemode/chase_sequence.dart` capture/fall-behind message composition.
- Converted the remaining prison escape strings to full `{name} ...` templates and converted chase capture message assembly from `p.name + fragment` to a single `captureTemplate` rendered with `params: {"name": p.name}`.
- Found one more daily hotspot: `lib/daily/activities/trouble.dart` built `{name} ` / `Your Activists ` plus issue fragments with `message +=`. Added a static regression test, verified it failed, then converted every trouble issue message to full `{actor} ...` templates. Nuclear-mutant singular/plural text is now two complete templates instead of `{prefix}` + `{article}` + `{plural}` fragment stitching.
- Added a static regression for raw interpolated possessives in `lib/`; red result found remaining newspaper/talk possessives. Converted each to complete `LcsI18n.processString` templates for the possessive phrase (`{name}'s ...` / `{person}'s ...`) so translators receive whole possessive units instead of hard-coded `$name's` English ordering.
- Added a static site-name regression for `loc.name +=` and `loc.name = "$...` patterns. Converted warehouse prefix+suffix generation and remaining random site-name interpolation (forced labor camp, juice bar, vegan co-op, internet cafe, latte stand) to complete `LcsI18n.processString` templates with named placeholders. Also converted site+city display from raw interpolation to `{site}, {city}`.
- Extended extractor coverage for wrapped multiline assignment literals (semicolon-terminated quoted lines) and multiline `processString` context; added regression coverage. This was needed after chase capture templates were assigned through a wrapped local variable and after possessive newspaper phrases used multiline `LcsI18n.processString` calls.
- Converted the rib break/shatter output in `lib/sitemode/fight.dart` from `{name}'s ribs are ` + `broken!/shattered!` fragments to full templates for every singular/plural and broken/shattered case.
- Removed confirmed-dead fragment keys from ARBs after `rg` showed no exact live source use: `{prefix}dressed up and pretended to be {article}radioactive mutant{plural}!`, `heroic actions."&r`, standalone `broken!`, and standalone `shattered!`.
- Added/updated pt_BR translations for changed trouble, prison, chase, site-name, newspaper/talk possessive, and rib injury templates. Remaining same-as-English status from `translation_status.dart` includes broader legacy catalogue debt surfaced by extractor coverage and is not used as completion proof for the grammar sweep.
- Updated targeted pt_BR runtime smoke evidence to cover the newly changed site-name, actor, chase, prison, rib, and possessive-title templates. Adjusted `pt_BR` wording where evidence showed awkward English order (`{name} Prison` now renders `Prisão {name}`) and where `{actor}` must work for both a named activist and a group (`Your Activists` now translates as singular collective `O grupo de ativistas`).

### 2026-06-28 validation evidence for this pass

Required validation run after the final ARB sync:

1. `dart run scripts/find_translatable_strings.dart` → PASS, 6466 live strings, +0 added on final run.
2. `dart run scripts/maintain_arb_catalogs.dart --check` → PASS, en_US and pt_BR canonical.
3. `dart run scripts/translation_status.dart --json` → PASS command completed; current catalog snapshot: sourceKeys=6815, targetKeys=6899, missingInTarget=0, emptyInTarget=0, untranslatedAgainstSource=1028. This count includes broader legacy untranslated/dead-ish catalogue debt surfaced by expanded extractor coverage; the changed grammar-sensitive templates have targeted pt_BR translations and render evidence below.
4. `dart run scripts/interpolation_status.dart --all --check --allowlist=scripts/interpolation_allowlist.json` → PASS, 0 unallowlisted failures.
5. `flutter test test/i18n_static_coverage_test.dart test/pt_br_runtime_catalog_smoke_test.dart test/i18n_test.dart test/console_wrapper_test.dart` → PASS, +75 all tests passed.
6. `flutter test` → PASS, +194 all tests passed.
7. Targeted pt_BR render evidence from runtime smoke:
   - `{name} Prison` → `Prisão Silva`
   - `{name} Army Base` → `Base do Exército Costa`
   - `{adjective} {noun} Forced Labor Camp` → `Campo de Trabalho Forçado Vale Feliz`
   - `{adjective} {siteType}` → `Armazém Abandonado`
   - `{actor} marched downtown to protest wealth inqueality!` → `Maria marchou pelo centro contra a desigualdade de riqueza!`
   - `{actor} marched downtown chanting Black Lives Matter!` → `O grupo de ativistas marchou pelo centro gritando Vidas Negras Importam!`
   - `{name} is seized, thrown to the ground, and TAZED TO DEATH!` → `João é agarrado, jogado ao chão e MORTO A CHOQUES DE TASER!`
   - `{name} leads a riot with dozens of prisoners chanting the LCS slogan!` → `Ana lidera um motim com dezenas de presos gritando o lema do LCS!`
   - `{ribminus} of {name}'s ribs are broken!` → `3 costelas de Pedro foram quebradas!`
   - `{name}'s {showName}` → `Alerta Livre de Lúcia`

The targeted evidence has no orphan English possessive, no doubled spaces in those render outputs, no unresolved placeholders, and Portuguese word order is controlled by the full templates.
- Post-push audit found six remaining same-as-English pt_BR possessive full-template values (`{body}'s body`, `{name}'s arguments/case/body`). Translated them to Portuguese genitive word order and re-ran `maintain_arb_catalogs --check` plus the required focused i18n/flutter test command; both passed.
- Final post-amend validation on clean current state:
  - `dart run scripts/find_translatable_strings.dart` → PASS, 6469 live strings, +0 added.
  - `dart run scripts/maintain_arb_catalogs.dart --check` → PASS.
  - `dart run scripts/translation_status.dart --json` → PASS command; sourceKeys=6815, targetKeys=6899, missingInTarget=0, emptyInTarget=0, untranslatedAgainstSource=1022.
  - `dart run scripts/interpolation_status.dart --all --check --allowlist=scripts/interpolation_allowlist.json` → PASS.
  - Focused i18n/flutter command → PASS, +75.
  - `flutter test` → PASS, +194.


---

### 2026-06-28 continuation pass: scoped fragment sweep after e093d07

Current branch: `feature/localization`, clean at start of pass. The active goal remains open; this pass made progress but does **not** prove all interpolated/generated user-facing strings are fixed.

Changes made:
- Converted `lib/daily/dating.dart` split possessive schedule breakup text from `{pName}'s ` + adjective + suffix into one full template with `{eName}`, `{pName}`, and translated `{scheduleComplexity}`.
- Converted dating conversion title prefixes (`The Liberal Rebirth of ` / `The Radicalization of ` + name) to full `{name}` templates.
- Converted `lib/sitemode/fight.dart` attack announcement assembly from `attacker` + action + target + optional weapon fragments into full `{attacker} {action} {target}` templates. Dynamic action phrases are translated before insertion.
- Converted `lib/daily/hostages/tend_hostage.dart` rapport sidebar split lines into full templates rendered through `addparagraph`.
- Converted `lib/daily/hostages/execute.dart` execution hesitation split line into one full `{name}` template.
- Converted `lib/talk/talk_outside_combat.dart` bank teller note/reaction fragments into full reaction sentence templates. Robbery-note text is translated before insertion.
- Converted `lib/sitemode/miscactions.dart` hacking failure fragments into full `{name}`/`{target}` templates.
- Converted `lib/sitemode/haul_kidnap.dart` hostage education title and inline hostage-freeing fragment to full templates.
- Converted `lib/title_screen/high_scores.dart` ending + month/year composition to one full date template per ending.
- Added static regression tests for combat attack templates, bank teller reactions, and high-score ending templates.
- Updated `TRANSLATION_WORKFLOW.md` with the generated-prose/newspaper rule: translate complete story text before layout; do not trust post-layout line chunks to match ARB keys.

Catalog/translation work:
- Ran `dart run scripts/find_translatable_strings.dart`; it added 30 source keys after this pass.
- Added pt_BR translations for the new full templates introduced here. Final status remains `sourceKeys=6853`, `targetKeys=6937`, `missingInTarget=0`, `emptyInTarget=0`, `untranslatedAgainstSource=1022`, `coveragePercent≈85.09%`. The remaining untranslated count is existing broader catalog/live-string debt, not introduced by this pass.

Validation evidence from this pass:
- `dart analyze lib/talk/talk_outside_combat.dart lib/sitemode/miscactions.dart lib/sitemode/haul_kidnap.dart lib/daily/dating.dart lib/title_screen/high_scores.dart` → PASS.
- `dart run scripts/find_translatable_strings.dart` → PASS, 6447 live strings, +30 added before translation.
- `dart run scripts/maintain_arb_catalogs.dart --check` → PASS.
- `dart run scripts/interpolation_status.dart --all --check --allowlist=scripts/interpolation_allowlist.json` → PASS, 0 unclassified interpolation hits.
- `dart run scripts/translation_status.dart --json` → PASS, numbers above.
- `flutter test test/i18n_static_coverage_test.dart test/pt_br_runtime_catalog_smoke_test.dart test/i18n_test.dart test/console_wrapper_test.dart` → PASS, +75.
- `flutter test` → PASS, +194.

Remaining known debt after this pass:
- `lib/newspaper/display_news.dart`, `lib/newspaper/major_event.dart`, and `lib/newspaper/squad_story_text.dart` still contain substantial generated story interpolation/fragment composition. They need a larger builder-style pass so each story sentence/paragraph is translated as a complete template before `displayNewsStory()` lays it out.
- Many dialogue paths still print speaker prefixes (`"{name} says, "`, `"{name} responds, "`) separately from quote text. This may be acceptable as UI convention, but it is not proven for all locales and should be audited/allowlisted or converted.
- Broad pt_BR coverage is not complete: `translation_status.dart --json` reports 1022 same-as-source values. Runtime smoke currently tolerates this, so green tests are not proof of full Portuguese coverage.

---

### 2026-06-28 continuation pass: generated-story audit and kidnap article template

Committed and pushed the previous verified fragment pass as `a9ab790` on `feature/localization` before starting new edits.

New audit findings:
- Newspaper remains the largest i18n risk. `lib/newspaper/display_news.dart`, `lib/newspaper/major_event.dart`, and `lib/newspaper/squad_story_text.dart` still assemble article text from English fragments and raw interpolation before `displayNewsStory()` lays out wrapped chunks. Those chunks are not stable ARB keys.
- `lib/newspaper/major_event.dart` needs article-by-article migration. It contains many raw `$...` generated prose paragraphs with names, counts, titles, and phrase fragments.
- Talk files still have many speaker-prefix fragments (`{name} says, `, `{name} responds, `, `{name}: `). These need a policy: convert full quote lines where practical, or explicitly document/allowlist speaker labels as UI chrome only after confirming they are not grammatical sentence fragments.
- Smaller remaining scoped targets from the audit: shop row fragments (`{letter} - `, price/count suffixes), daily siege casualty lists (`KILLED:` / `INJURED:` plus `{name}, `), and several siege outcome story paragraphs.

Change made in this pass:
- Converted the `NewsStories.kidnapReport` article body in `lib/newspaper/display_news.dart` from raw `${ns.cr...}` interpolation and `story +=` article composition to paragraph-level `LcsI18n.processString` templates. This is intentionally paragraph-level, not one giant article key, so the current extractor sees and syncs the runtime keys.
- Added a static regression test that rejects the old raw `${ns.cr!.properName}` kidnap-story pattern and checks for the new `{city}`, `{name}`, `{spokesperson}`, and `{days}` template placeholders.
- Synced catalogs and translated the two new pt_BR kidnap article paragraph keys.

Current validation for this pass is pending below; goal remains open because the audit found substantial remaining generated-story and dialogue-prefix debt.

---

### 2026-06-28 continuation pass: kidnap newspaper story template

Changes made:
- Converted the kidnapping branch in `lib/newspaper/display_news.dart` from story text assembled with raw `${ns.cr!.properName}` / `${days}` interpolation into two complete `LcsI18n.processString` templates rendered before `displayNewsStory()` line wrapping.
- Added en_US/pt_BR catalog entries for the complete kidnapping lead and police statement templates.
- Added static regression coverage proving the kidnap branch no longer contains the old raw interpolated disappearance text and now contains `{city}`, `{name}`, `{spokesperson}`, and `{days}` placeholders.
- Added targeted pt_BR runtime smoke evidence for the kidnapping lead/statement so this generated newspaper text is proven translated before layout.

Validation evidence after final edits:
1. `dart run scripts/find_translatable_strings.dart` → PASS, 6440 live strings, +0 added on final run.
2. `dart run scripts/maintain_arb_catalogs.dart --check` → PASS, en_US and pt_BR canonical.
3. `dart run scripts/translation_status.dart --json` → PASS command; sourceKeys=6855, targetKeys=6939, missingInTarget=0, emptyInTarget=0, untranslatedAgainstSource=1022, coveragePercent≈85.09%. Remaining untranslated count is existing broader catalog debt, not introduced by this pass.
4. `dart run scripts/interpolation_status.dart --all --check --allowlist=scripts/interpolation_allowlist.json` → PASS, 0 unclassified interpolation hits.
5. `flutter test test/i18n_static_coverage_test.dart test/pt_br_runtime_catalog_smoke_test.dart test/i18n_test.dart test/console_wrapper_test.dart` → PASS.
6. `flutter test` → PASS, +199 all tests passed.
7. Targeted pt_BR render evidence from runtime smoke:
   - Kidnap lead → `Curitiba - O desaparecimento de João agora é considerado um sequestro, segundo uma porta-voz da polícia.`
   - Kidnap statement → `Roberta Silva, falando em nome do departamento de polícia... João foi levado há 12 dias... traremos João de volta para casa...`

Known debt remains unchanged: larger newspaper generated prose (`major_event.dart`, `squad_story_text.dart`, other `display_news.dart` branches) still needs a bigger builder-style pass; broad pt_BR coverage remains below the earlier strict completion gate because extractor improvements surfaced legacy untranslated/dead-ish keys.

## 2026-06-29 continuation: talk/fight/siege/shop templating sweep

Changed in this pass:
- `lib/sitemode/fight.dart`: replaced attack-message fragment stitching (`action` + `multiHitDesc` + attacker prefix) with complete `LcsI18n.processString` templates for hit/stab/auto-convert/multi-hit variants.
- `lib/talk/drop_a_pickup_line.dart`: converted dynamic pickup-line rejection responses (`$gay`, `$guyGirl`, succubus/incubus, random church name) to complete placeholder templates.
- `lib/sitemode/shop.dart`: replaced shop sale-total label fragments (`{prefix} ${amount} {suffix}`, `{label}: ${ret}`) with complete currency templates.
- `lib/daily/siege.dart` and `lib/location/siege.dart`: converted generated siege publication/play names, Broadway singer prefix, interview paragraphs, and `properName, aka name` arrest output to complete templates.
- `scripts/find_translatable_strings.dart`: fixed random-list chunk extraction so apostrophes inside double-quoted strings are not misread as separate single-quoted literals. This prevents new corrupt keys such as `re kinda...` or `s sweet...` during catalog sync.
- Catalogs: added pt_BR translations for the new live keys and pruned exact dead/corrupt keys left by earlier raw `$guyGirl`/apostrophe-fragment extraction.
- Tests: added static assertions for shop sale totals, pickup-line generated responses, and siege generated prose.

Validation performed:
- `dart analyze scripts/find_translatable_strings.dart` → pass.
- `dart run scripts/find_translatable_strings.dart` → added only current live keys after cleanup.
- `dart run scripts/maintain_arb_catalogs.dart --check` → pass.
- `dart run scripts/interpolation_status.dart --all --check --allowlist=scripts/interpolation_allowlist.json` → pass with existing classified wrapper hits only.
- Exact dead/corrupt catalog key scan for raw `$guyGirl`, `{aSuccubus}`, `n&wBarricaded...`, and known apostrophe-sliced fragments → pass.
- `flutter test test/i18n_static_coverage_test.dart test/pt_br_runtime_catalog_smoke_test.dart test/console_wrapper_test.dart` → pass.

Important remaining debt:
- This does **not** complete the full objective. `lib/newspaper/major_event.dart`, `lib/newspaper/display_news.dart`, and `lib/newspaper/squad_story_text.dart` still contain many user-facing article/story strings assembled with Dart interpolation or `story +=` fragments before translation. Current `interpolation_status.dart` still only gates wrapper-adjacent interpolation; it does not prove newspaper/story generation is clean.
- pt_BR is still not complete project-wide; the runtime smoke still logs many untranslated source keys. The static catalog invariants pass, but translation coverage is not 100%.

## 2026-07-05 continuation: newspaper/trial fragment cleanup

- Removed the last obvious `_possessive()` helper fragments from `lib/newspaper/major_event.dart` and `lib/justice/trial.dart`.
- Converted the newspaper finance-fraud, CEO critique, Dying Denial, and Pensions Gone items to `LcsI18n.processString` templates.
- Added static regression coverage for the newspaper templates and for any `_possessive(` helper reappearing under `lib/`.
- Synced ARB catalogs after the source sweep and translated the newly added pt_BR entries for the converted newspaper/trial strings.
- Validation still pending after this pass: canonical catalog check, interpolation gate, focused i18n tests, and full `flutter test`.

## 2026-07-05 continuation: major_event template sweep

- Converted additional major-event stories in `lib/newspaper/major_event.dart` to full `LcsI18n.processString` templates:
  - `WOMEN'S MARCH`
  - `MARCH OF LOVE`
  - `CLINIC MURDER`
  - `JUSTICE DEAD`
- Added static regression coverage for the new newspaper templates.
- Synced ARB catalogs and translated the four new pt_BR entries in `part01`, `part04`, and `part10`.
- Validation after this batch:
  - `maintain_arb_catalogs --check` PASS
  - `translation_status --json` PASS (coverage still below 80%; more source keys surfaced, but no missing/empty values)
  - `interpolation_status --all --check --allowlist=...` PASS with 818 total interpolated literals, 14 near-wrapper hits, 5 high-confidence wrapper-argument hits, 0 unclassified
  - focused i18n tests PASS
  - full `flutter test` PASS
- Remaining debt is still substantial in `major_event.dart` plus `display_news.dart`, `squad_story_text.dart`, `talk/`, `fight.dart`, `siege.dart`, and `shop.dart`.

## 2026-07-05 continuation: squad story / military article cleanup

- Refactored `lib/newspaper/squad_story_text.dart` to remove the remaining fragment composition in the location/opening paragraphs.
  - `squadStoryTextLocation()` now uses full templates for the location phrases and the elite-liberal descriptor variants.
  - `squadStoryTextOpening()` now uses whole-sentence templates for the LCS/CCS opening paragraphs and the follow-up summary sentences.
- Cleaned the easy headline stitch in `lib/newspaper/display_news.dart` by turning `ns.headline + " " + str` into a full template, and translated the fallback bug string.
- Converted the `View.military` article in `lib/newspaper/major_event.dart` to a single `LcsI18n.processString` template with `{country}` and `{shortName}` placeholders instead of raw `${country.*}` interpolation.
- Updated the affected `pt_BR` shard values for the new squad-story, military-story, and headline strings.
- Validation after this pass:
  - `dart run scripts/find_translatable_strings.dart` → 6636 unique strings; +1 source key synced for the military story refactor.
  - `dart run scripts/maintain_arb_catalogs.dart --check` → PASS.
  - `dart run scripts/translation_status.dart --json` → 7442 source / 7526 target / 5964 translated / 1477 untranslated / 80.15% coverage.
  - `dart run scripts/interpolation_status.dart --all --check --allowlist=scripts/interpolation_allowlist.json` → PASS, 792 interpolated literals total, 14 near-wrapper hits, 5 high-confidence wrapper-arg hits.
- `flutter test test/i18n_static_coverage_test.dart` → PASS.
- `flutter test test/pt_br_runtime_catalog_smoke_test.dart test/i18n_test.dart test/console_wrapper_test.dart` → PASS.
- `flutter test` → PASS.

## 2026-07-05 current continuation audit

- Branch: `feature/localization`
- Current objective remains active: finish the source-templating sweep for remaining user-facing interpolations, with the backlog still concentrated in `newspaper/major_event.dart`, `talk/`, `fight.dart`, `siege.dart`, and `shop.dart`.
- Latest code change in this turn:
  - `lib/newspaper/major_event.dart` now templates the fallback stories for missing good/bad news instead of using raw `$view` interpolation.
  - Added a regression check in `test/i18n_static_coverage_test.dart` so those fallbacks stay on full templates.
- Fresh validation in this turn:
  - `dart run scripts/find_translatable_strings.dart` → sync complete, 2 new strings added to both locales.
  - `dart run scripts/maintain_arb_catalogs.dart --check` → PASS.
  - `flutter test test/i18n_static_coverage_test.dart test/pt_br_runtime_catalog_smoke_test.dart` → PASS.
- Translation status remains incomplete:
  - `translation_status --json` still reports `7442` source keys, `7526` pt_BR keys, `5965` translated, `1477` untranslated, `0` missing, `0` empty, `80.15%` coverage.
- No change to `PLAN.md`. Keep iterating on the broader sweep rather than treating the project as complete.

## 2026-07-05 major_event generated-story sweep

- Continued templatization in `lib/newspaper/major_event.dart`:
  - `View.gunControl` now uses a single `LcsI18n.processString` article template.
  - `View.animalResearch` now uses a single `LcsI18n.processString` article template.
  - `View.prisons` now uses a single `LcsI18n.processString` article template.
  - `View.womensRights` now uses a single `LcsI18n.processString` article template.
  - `View.taxes` subheadline now uses `LcsI18n.processString`.
- Added static coverage assertions for the new article templates so they stay full-template instead of regressing back to concatenated interpolation.
- Synced catalogs and translated the new pt_BR entries for:
  - the fallback `view` stories,
  - the gun-control article,
  - the animal-research article,
  - the prison-hostage article,
  - the women’s-rights article,
  - the taxes blurb.
- Validation after this pass:
  - `dart run scripts/maintain_arb_catalogs.dart --check` → PASS
  - `dart run scripts/translation_status.dart --json` → `7448` source / `7532` target / `5971` translated / `1477` untranslated / `80.17%` coverage
  - `dart run scripts/interpolation_status.dart --all --check --allowlist=scripts/interpolation_allowlist.json` → PASS, `761` interpolated literals total
  - `flutter test test/i18n_static_coverage_test.dart test/pt_br_runtime_catalog_smoke_test.dart test/i18n_test.dart test/console_wrapper_test.dart` → PASS
  - `flutter test` → PASS
- Residual debt still exists across the rest of `major_event.dart`, `talk/`, `fight.dart`, `siege.dart`, `shop.dart`, and other `lib/` interpolation sites.

## 2026-07-10 continuation: restored bridge and major-event early branches

- The terminal bridge recovered after the temporary `codex-code-mode-host` execution failure.
- Corrected the stale top-level completion claim: live status remains active, not 100% complete.
- Converted the `View.lgbtRights` hate-crime, `View.deathPenalty`, `View.gunControl`, and `View.taxes` generators in `lib/newspaper/major_event.dart` to full `LcsI18n.processString` templates.
  - Generated names, dynamic article phrases, the time-of-death value, and censorship-specific terms now go through `LcsI18n.tr` or a placeholder template before the final article template is rendered.
  - Removed raw article-level Dart interpolation from those branches.
- Converted the new-game option label, flag detail/menu output, hospital discharge message, and medical-debt siege/receipt strings to complete templates.
- Synced catalogs and translated the 37 newly surfaced pt_BR entries in this pass.
- Current status after merge: `7493` source keys, `6010` translated, `1483` untranslated, `0` missing, `0` empty, `80.21%` coverage.
- Added static regression coverage for the new major-event and direct console templates. Full validation is still required after the remaining generated-story sweep.

## 2026-07-10 continuation: major-event prose and extractor hardening

- Converted the `View.prisons`, `View.intelligence`, `View.freeSpeech`, and `View.justices` major-event branches to complete templates, including their generated names, titles, quotes, and dynamic prose.
- Fixed `scripts/find_translatable_strings.dart` so quoted parameter-map keys nested in random lists are not extracted as catalog strings. The new guard skips a quoted literal followed by `:`; a `find_translatable_strings --print-only` rescan no longer reports the false key `"action"`.
- Removed the previously polluted `"action"` key from both locale catalogs.
- Synced the catalogs and translated the eight new pt_BR article/template entries. Current status: `7502` source keys, `6018` translated, `1484` untranslated, `0` missing, `0` empty, `80.22%` coverage.

## 2026-07-10 continuation: radio, immigration, and civil-rights articles

- Converted `View.amRadio`, `View.immigration`, `View.civilRights`, and the `View.ceoSalary` dynamic critique to complete templates with translated dynamic values.
- Simplified the immigration tattoo descriptions to neutral full phrases (`a pet cat`, `a mother's name`) instead of gendered possessive fragments; removed the resulting dead catalog keys after confirming no live source reference remained.
- Added pt_BR values for the seven newly surfaced article and phrase keys. Current status: `7510` source keys, `6025` translated, `1485` untranslated, `0` missing, `0` empty, `80.23%` coverage.

## 2026-07-10 continuation: police, torture, and escaped-currency extraction

- Converted all five `View.policeBehavior` outcomes and all three `View.torture` outcomes in `lib/newspaper/major_event.dart` to full `LcsI18n.processString` templates. Pronouns and injury descriptions now flow through translated dynamic parameters rather than Dart interpolation.
- Localized generated parameter values in the liberal drugs, military, and healthcare stories; neutralized another possessive sandwich fragment.
- Fixed `find_translatable_strings.dart` to distinguish an escaped Dart dollar (`\\$`, literal currency) from real `$variable` interpolation. The extractor now preserves escaped dollars through filtering, restores them before ARB write, and correctly discovers templates such as the bank-robbery article.
- The fixed extractor exposed 36 previously skipped live keys, so measured pt_BR coverage temporarily moved to `79.71%` (`7566` source, `6031` translated, `1535` untranslated). This is newly measured catalog debt, not a regression in existing translations.
- Remaining source sweep is still concentrated in the lower half of `major_event.dart`, then the residual `talk/`, `sitemode/fight.dart`, `daily/siege.dart`, and `sitemode/shop.dart` paths.

## 2026-07-10 continuation: documentation correction, shop audit, wedding, and drug-panic stories

- Corrected the canonical workflow and session notes: wrapper interpolation is a narrow signal, and structural/smoke checks must not be described as proof of complete pt_BR coverage while the strict catalog assertion remains disabled.
- Removed the final two unclassified wrapper-context findings: shop price display now constructs numeric currency outside a string literal, and the nearby diagnostic trace is explicitly allowlisted as debug-only.
- Converted the `View.lgbtRights` wedding story and `View.drugs` panic story in `lib/newspaper/major_event.dart` to single complete `LcsI18n.processString` article templates. Their dynamic prose now uses translated values or complete placeholder templates.
- Synced and translated 22 newly surfaced pt_BR keys, including both article templates and generated partner/drug values. Added static regression checks for the two full article templates.
- Fresh structural validation passed: canonical ARB layout, interpolation gate (`0` unclassified wrapper context/argument hits), static coverage, and runtime catalog smoke.
- Current status: `7590` source keys, `6053` translated, `1537` untranslated, `0` missing, `0` empty, `79.75%` coverage. The remaining objective is still substantial: continue the lower half of `major_event.dart`, then audit `talk/`, `fight.dart`, siege, shop, and all remaining generated prose before enabling the strict completion gate.

## 2026-07-10 continuation: civil-rights, torture, death-penalty, gun-control, and women's-rights prose

- Converted all three `View.civilRights` generated articles plus `View.torture` and `View.deathPenalty` to complete article templates. Dynamic phrases, names, pronouns, and the death-condition composition now enter through translated values or named placeholders.
- Removed residual generated name/title interpolation in the `View.gunControl`, `View.womensRights`, and `View.taxes` branches. Venue names, formal honorifics, book authors, politician names, and subheadline words now use complete templates.
- Added static regression checks for the new civil-rights, torture, and death-penalty article templates; synced and translated the newly discovered pt_BR templates/values.
- Validation: canonical catalogs and the interpolation allowlist gate pass; full `flutter test` passes (`228` tests).
- Current status: `7608` source keys, `6067` translated, `1541` untranslated, `0` missing, `0` empty, `79.75%` coverage. Continue with animal-research, prison, intelligence, and later major-event branches; then repeat the broader `talk/`, fight, siege, and shop audit.

## 2026-07-10 continuation: animal research, prison fragments, and intelligence prose

- Replaced the remaining generated composition in `View.animalResearch`, including country labels and synthetic drug names, with complete templates and translated values.
- Converted the intelligence article to one `LcsI18n.processString` template with translated terrorist/attack parameters.
- Removed name/pronoun and gang/religion fragments in the prison hostage story. The guard-death descriptions now use complete templates; user-facing pronouns are translated before insertion.
- Added static checks for the animal-research, intelligence, and prison templates. Catalog layout/interpolation gate/full `flutter test` all pass.
- Current status: `7618` source keys, `6076` translated, `1542` untranslated, `0` missing, `0` empty, `79.76%` coverage. Remaining generated-story work starts with genetics, justice, pollution, and housing branches.

## 2026-07-10 continuation: genetics and justice prose

- Converted the genetic-foods and justice articles to complete `LcsI18n.processString` templates. Corporation/product labels, incident claims, judge reasons, pronouns, full names, and slaying references now use placeholders or translated values.
- Added static regression checks, catalog entries, and pt_BR translations for the new complete templates.
- Focused catalog/static/runtime smoke validation passes. Current status: `7623` source keys, `6082` translated, `1541` untranslated, `0` missing, `0` empty, `79.78%` coverage. Continue with pollution, corporate-culture/AM-radio composition, retirement, and housing.

## 2026-07-10 continuation: remaining major-event interpolation sweep

- Converted pollution, corporate culture, AM-radio naming, healthcare insult, retirement think-tank naming, and housing prose to complete templates or translated dynamic values.
- `rg` now finds no Dart interpolation in `lib/newspaper/major_event.dart`; the generated-story sweep in that file is complete at the lexical interpolation level.
- Added the pollution article regression check and its pt_BR translation. The next source sweep must move outside major events and audit `newspaper/ads.dart`, `display_news.dart`, `talk/`, fight, siege, and shop.

## 2026-07-10 continuation: daily medical-siege warning

- Replaced incrementally concatenated medical-debt warning text in `lib/daily/siege.dart` with complete named-sleeper and anonymous-tip templates. Rendered messages are marked `noTranslate` after `processString` to avoid a second lookup.
- Added both pt_BR translations and static regression checks. Continue the remaining non-newspaper sweep with talk option fragments, newspaper advertisements, and only after review the debug/currency-only interpolation sites.

## 2026-07-10 continuation: naked-talk option fragments

- Replaced the `whileNaked` suffix injection in `talk_outside_combat.dart` with whole normal/nude option templates. This preserves translator-controlled sentence grammar instead of appending an English fragment.
- Added 14 pt_BR option translations and a regression assertion. The next broad scan remains newspaper ads/display layout plus user-facing generated composition outside the currently detected wrapper hits.

## 2026-07-10 continuation: newspaper ad values and prelocalized layout

- Converted interpolated newspaper-ad prices, year, and personal-ad fields into complete templates before wrapping. The ad renderer now explicitly marks prelocalized output as `noTranslate` while retaining normal story behavior for other callers.
- Removed raw Dart interpolation from `ads.dart` and the kidnapping-story paragraph join. Added static regression coverage and pt_BR translations for the ad templates.
- Remaining source scan findings in the named areas are debug-only fight/siege diagnostics, numeric currency parameters, and further user-facing composition in other newspaper/talk paths that require manual review.

## 2026-07-10 continuation: trial outcome logs

- Converted the user-visible trial outcome log messages to complete templates, including singular/plural month sentences rather than an appended `s` fragment.
- Added all corresponding pt_BR values and static regression coverage. The incremental charge list remains separate presentation work because it updates after each charge; it must be redesigned as a full list before treating `trial.dart` as source-sweep complete.

## 2026-07-10 continuation: nursing-home and insurance special messages

- Converted the nursing-home patient/manager and insurance claims/CEO dynamic messages to complete templates. Preprocessed `processString` output is now explicitly passed as `noTranslate` through encounter/prompt helpers to prevent a second lookup.
- Added ten pt_BR translations and regression coverage. The legacy `%FIRST%` patient-state message system remains a distinct migration item: it requires replacing its custom token protocol rather than adding more interpolated fragments.

## 2026-07-10 continuation: flag-creation and location-join audit

- Converted every flag-creation outcome message to a complete `{name}`/`{flag}` template. `showMessage` now forwards `params` and `noTranslate` to the console wrapper so this user-facing API can render templates correctly.
- Translated the nine new pt_BR flag templates and added a static regression assertion against reintroducing raw `cr.name`/`flag.name` interpolation.
- Replaced the newspaper location `before + "and" + after` interpolation with the extracted `{before} and {after}` template; pt_BR uses `{before} e {after}`. This keeps conjunction placement under locale control.
- Manual review of the remaining named-target interpolation sites found only debug diagnostics, numeric currency values passed as template parameters, color/layout control markup, or paragraph joining after each paragraph has already been localized. They remain intentionally classified rather than translated as prose.
- Canonical workflow now states that the interpolation allowlist is exception-only and must never suppress user-facing composition.
- Fresh validation: formatter, catalog check, extraction, interpolation gate (`414` total literals; `0` unclassified wrapper hits), focused i18n tests, and full `flutter test` passed. Current pt_BR catalog coverage is `6131/7673` (`79.90%`); templating is substantially ahead of translation completeness.
