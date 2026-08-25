# PT-469: Low creature level titles leak English in Portuguese

- Severity: Medium (P2 localization regression)
- Type: Creature level-title translation
- Status: Fixed in isolated verifier branch; independent natural low-level screen replay remains pending
- Source snapshot: `5f5e52d37823a922f69abc4158c35e089a8a8df9`
- Source: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober2-20250825-r1/worktree/lib/creature/level.dart:38-73`
- Pre-fix probe: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober2-20250825-r1/pre-fix-level-title-probe.log`
- Isolated post-fix test: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober2-20250825-r1/level-translation-test.log`

## Reproduction

1. Initialize the game in `pt_BR`.
2. Render `levelTitle` for levels `-2`, `-1`, or `0` for any alignment, or render moderate level `6`.
3. Inspect the resulting title.

`levelTitle` selects the alignment title list and passes the title through `LcsI18n.tr`. Before this fix, the four keys were absent from both locale catalogs, so the fallback returned raw English:

- level -2: `In Crisis`
- level -1: `Unstable`
- level 0: `Struggling`
- moderate level 6: `Peacemaker`

The pre-fix Flutter probe exercised all three alignments for the negative levels and the moderate peacemaker path. This is a deterministic runtime-visible leak, not a static untranslated-string report. PT-467 (Eminent Scientist) is a separate finding and is not included here.

## Fix

The isolated branch adds the same source keys to the English catalog and Portuguese values to the corresponding hash shards:

- `In Crisis` -> `Em Crise`
- `Unstable` -> `Instável`
- `Struggling` -> `Em Dificuldades`
- `Peacemaker` -> `Pacificador`

`test/creature/level_translation_test.dart` now covers every alignment, all three negative levels, moderate `Peacemaker`, English preservation, and `strLenX` <= `CONSOLE_WIDTH`.

## Verification

- Isolated `flutter test test/creature/level_translation_test.dart`: 4 passed.
- `dart run scripts/maintain_arb_catalogs.dart --check --locale=en_US --locale=pt_BR`: canonical; zero errors.
- Isolated release web build: passed. Log: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober2-20250825-r1/build-web-postfix.log`.
- Fresh strict-headless `pt_BR` smoke session `prober2-level-fix` / `lcs-new-age-prober2-level-fix` used isolated server `127.0.0.1:14681`; setup and base screens were Portuguese and <=80 columns. The route did not naturally reach a low-level profile before the bounded check ended, so no false natural-screen closure is claimed.
