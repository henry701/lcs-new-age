# Portuguese Play Log

## 2026-08-21 — stock warehouse strategy 19 stopped on PT-410 (fixed)

- Fresh strict-headless session `playtester-strategy19-warehouse-20260819`
  used the repository wrapper on Flutter web-server port 10138 after 10128
  never came up. Locale was `Português` via `A` then `P`. User-Agent
  `HeadlessChrome/150.0.0.0`. No cheats, debug flags, fixtures, headed
  browser, or CDP attach.
- Seattle founder Elsie Hewson (Int 13, Cha 8, college / computers / law
  biography) moved from `SEA — Sem-teto` to the already-owned `SEA — Armazém`.
  Questionnaire option E produced lawyer sleeper Cooper Escobar at
  `SEA — Fórum`. CCS stayed `Céu Azul e Límpido`; combat stayed `Poder para o
  povo`.
- Ordinary journalist recruiting on 3 January 2023 opened a politics talk.
  The refusal line rendered `"No." <se vira>`. Ticket PT-410. The campaign
  was stopped there; no `O Triunfo da Agenda Liberal` and no game-over. The
  refusal was subsequently fixed and independently verified as `"Não." <se vira>`.
- 75 DOM captures, all 25×80, `maxRow: 80`, zero over-wide rows, empty
  bridge-error channel. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy19-warehouse-20260819/`.

## 2026-08-15 — independent PT-399/PT-400 disband verifier pass

- A fresh strict-headless Portuguese replay selected `Português` through the
  normal `a` → `p` language path, opened Liberal Agenda → Dissolver e Esperar,
  and rendered all targeted confirmation text within the 80-column console.
- The four formerly clipped paragraph endings remained complete (`membros`,
  `observar`, `necessário`, and `campanha.`), and the randomly selected issue
  phrase was localized as `Cláusula de Separação` rather than raw English.
- Typing the localized phrase, including its accented characters, advanced to
  the post-disband screen. Focused deterministic coverage also exercised all
  22 issue keys and the English fallback. No bridge errors or new findings.
  Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt400-20260815/`.

## 2026-08-14 — independent PT-384 verifier pass

- A fresh release build of the fixer source was served from a disposable copy
  on port 9312 and driven through the strict `agent-browser-headless.sh`
  wrapper in session `verify-pt384-static-20260814` (`HeadlessChrome/150.0.0.0`).
  The disposable fixture seeded one liberal `Estudante Universitário` sleeper
  at Seattle (`SEA`) with 50% infiltration and `Promovendo o Liberalismo`.
- The single table now fits the profession to x24–41 (`Estudante Univer…`),
  leaves x41 blank, and preserves `SEA` at x42. The bulk table fits the
  profession to x20–33 (`Estudante Uni…`), leaves x34 blank, preserves `50%`
  at x35, leaves x39 blank, and fits the current activity to x40–56. Both
  tables measured 25×80 with no over-wide rows, no bridge errors, and no
  `UniversiSEAio`/`Unive23%` corruption.
- Focused `flutter test test/basemode/pt_br_core_layout_test.dart` passed all
  31 tests. PT-384 is closed as fixed and independently verified. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt384-20260814/`.

## 2026-08-14 — stock high-charisma sleeper route reached PT-384

- Fresh strict-headless session `stock-victory-sleeper2-pt-20260814` used the
  repository wrapper on Flutter web-server port 9304. It selected Português
  through the normal language menu before starting a stock-cheatless game; no
  debug flags, fixtures, source edits, headed browser, or CDP attach were used.
- The route chose a high-charisma biography, built US$50 through ordinary
  donations, attempted an attorney recruit, then recruited a university
  student through repeated political conversations and the normal materials
  option. The student joined on 17 January 2023 and was placed as a Seattle
  sleeper. Single and bulk sleeper-management screens plus the ordinary
  sleeper activity screen were captured.
- The single sleeper table reproduced PT-384 as
  `Estudante UniversiSEAio`: the unbounded Portuguese profession at column 24
  overwrote the `SEA` site cell beginning at column 42. The bulk table showed
  the same cell-budget defect as `Estudante Unive23%táMantendo Discriç…`.
  PT-384 was filed in `findings-doc/findings.md`; no source fix was attempted.
- The ordinary sleeper action header remained clean and retained the complete
  funds label, so PT-376 did not recur. The 181 captures were all 25×80 with
  `maxRow: 80`, zero over-wide rows, and an empty bridge-error channel. No
  victory or game-over terminal was reached.
- Evidence, route, summary, and metrics:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-sleeper2-pt-20260814/`.

## 2026-08-14 — stock constitution-focused route blocked at recruitment threshold

- Fresh session `stock-constitution-9297` used the strict headless wrapper and
  Portuguese `?playtest=1` DOM bridge on port 9297. No debug flags, fixtures,
  headed/CDP browser, or source edits were used.
- The route selected the normal climate with CCS disabled, built a
  persuasion-oriented founder, recruited university candidates, verified the
  questionnaire-created lawyer sleeper at the Seattle courthouse, and ran
  legal donations plus politics meetings. Persuasion reached 26.26 and funds
  rose from US$7 to US$11.
- It stopped on 3 January 2023 at a Desirée Swain meeting: the US$50 materials
  option was unavailable and the candidate was not yet eligible to join. No
  victory/game-over terminal or new translation/layout issue was found. The 95
  captures stayed within 25×80 with no over-wide rows or bridge errors.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-victory-constitution-20260814/`.

## 2026-08-13 — stock constitution-focused route bootstrap blocker

- Fresh session `stock-constitution-9296` used the strict headless wrapper and
  Portuguese `?playtest=1` DOM bridge on port 9296 with stock flags unchanged.
- Delayed Flutter bootstrap produced one empty bridge capture; a retry reached
  the normal 25×80 Portuguese title screen with no browser/bridge errors. The
  bounded route stopped before constitutional gameplay, so no victory or
  game-over terminal was captured and no issue ticket was filed.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-victory-constitution-20260813/`.

## 2026-08-12 — PT-374 hostage-composition regression verification

- Static/runtime-focused Portuguese checks reproduced the safehouse hostage
  composition bug: an outer recruitment paragraph was English when its source
  was assembled from two catalog fragments, and one-pass formatting left inner
  pronoun/activity placeholders unresolved.
- The new `processComposedString` path now translates adjacent fragments before
  formatting. Recruitment, love-bombing, and release call sites render inner
  reaction/activity values first; siege responder labels use their standalone
  Portuguese entries.
- `flutter test test/daily/hostages_translation_test.dart` passes five focused
  cases, including no-orphan-placeholder assertions; the focused suite now
  also covers release sleeper and psychology fragments. A future fixture replay
  should force a hostage encounter to capture the visible UI route.

## 2026-08-12 — strict-headless crafting-fix verification (PT-371–PT-373)

- Replayed `Atribuir Tarefas → Recrutamento e Aquisição → Fazer Roupas`
  and `Fazer uma Bandeira` against a disposable Flutter `web-server` on
  port 8930. The repository wrapper forced `AGENT_BROWSER_HEADED=0`,
  `--headless=new`, `--ozone-platform=headless`,
  `--disable-dev-shm-usage`, and `--disable-cache`; the runtime UA was
  `HeadlessChrome/150.0.0.0`. No headed window, desktop input, or `:9222`
  target was used.
- Before: the prior replay under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/crafting-clothing-20260813/`
  captured `Extremamente DifícUS$ 2.100`, clipped flag costs (`US$ 1` /
  `US$ 2`), and a stale page-5 tank footer after returning to clothing page 4.
- After: clothing page 3 keeps long `Extremamente Difícil` labels within the
  measured difficulty column, while page 4 renders
  `Armadura tática da SWAT ... Impossível        US$ 2.100` with a visible
  separator and the complete four-digit cost. The focused Portuguese layout
  regression passed (`pt_br_core_layout_test.dart`, 1 test).
- After: flag pages 1–2 and the selected-item preview retain complete
  `US$ 10`, `US$ 15`, and `US$ 20` values with a separator before cost;
  no `US$ 1`/`US$ 2` clipping remains. Selecting page-5 clothing `G` and
  paging back to page 4 now clears the off-page tank detail footer.
- Normal, 320×240, and 480×320 captures stayed at 25 rows × 80 columns,
  matched document width to the viewport, and reported no bridge/runtime
  errors. High-signal DOM captures are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/crafting-fixes-20260813/`.

## 2026-08-12 — strict-headless broad Portuguese regression replay

- Replayed a fresh Portuguese campaign against a disposable Flutter
  `web-server` on port 8920. The only browser was the repository
  `agent-browser` session `pt-fresh-8920`, launched with
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, `--ozone-platform=headless`,
  `--disable-dev-shm-usage`, and `--disable-cache`; the runtime UA was
  `HeadlessChrome/150.0.0.0`. No headed window, desktop input, or `:9222`
  target was used. The session and server were closed after capture.
- Covered title/language selection, all nine founder questions, the
  conservative-era intro, founder name/slogan, base mode, Review Assets,
  Assign Tasks, Liberal Agenda, Media Overview plus a generated article,
  flag purchase, investment, district/site changes, and a short wait/newspaper
  cycle. Visible controls retained their key prefixes (`A -`, `P -`, `Entre -`)
  and the intro retained `extrema-direita Arqui Conservadora` capitalization.
- Repeated base, agenda, media, and article observations at 320×240. Every
  bridge capture remained 25 rows by 80 columns, the document width equaled
  the viewport, and `#lcs-playtest-errors` stayed empty. Narrow-screen
  ellipses are the existing PT-083 fixed-console behavior; no new translation,
  prefix, or layout defect was confirmed.
- DOM-only captures and metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fresh-broad-20260813/`.

## 2026-08-13 — strict-headless travel, courthouse, and hospital replay

- Replayed a fresh Portuguese founder through the title/language flow, Seattle
  district travel, the courthouse destination, the University Hospital route,
  and the site-mode map/action legend. The browser was launched only with the
  repository headless settings (`AGENT_BROWSER_HEADED=0`,
  `--headless=new`, `--ozone-platform=headless`,
  `--disable-dev-shm-usage`, `--disable-cache`) and reported
  `HeadlessChrome/150.0.7871.115`; no headed browser or `:9222` CDP target was
  used.
- The route covered normal 1280px and narrow 320×240 viewports. The travel
  lists showed localized districts and destinations; the courthouse and
  hospital labels/actions remained Portuguese. The hospital action rendered
  `Entrar e tratar os ferimentos dos Conservadores`, and the site map legend
  remained localized.
- The previously known daily mismatch wording appeared in its current neutral
  form (`em vez de cumprir a atividade…`) and was not refiled as PT-123. The
  visible ellipsis at 320px is the existing fixed-console fitting behavior, not
  a new untranslated string.
- Normal and narrow captures each measured 25 rows, `maxRow=80`, zero rows
  over 80 columns, document width equal to the viewport, and an empty
  `#lcs-playtest-errors` channel. No new translation, key-prefix, or layout
  defect was confirmed. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sites-20260813/`.

## 2026-08-13 — strict-headless clothing and flag-crafting replay (PT-371–PT-373)

- Replayed a fresh Portuguese founder through `Atribuir Tarefas →
  Recrutamento e Aquisição → Fazer Roupas` and walked all five clothing pages,
  then opened both pages of `Fazer uma Bandeira`. The browser used the
  repository wrapper with `AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`, `--disable-dev-shm-usage`, and `--disable-cache`;
  its UA was `HeadlessChrome/150.0.7871.115`. No headed browser was opened or
  focused.
- Clothing page 4 row G (`Armadura tática da SWAT`, US$ 2.100) renders
  `Extremamente DifícUS$ 2.100`: the localized difficulty string runs into the
  right-aligned four-digit cost. The same collision is not visible for shorter
  costs. This is PT-371.
- Flag-crafting rows right-align Portuguese currency at column 75, leaving
  only five cells. Every `US$ 10` price appears as `US$ 1`, and `US$ 20`
  appears as `US$ 2`, while the selected item's footer correctly shows the full
  amount. Page 2 also joins a full-width difficulty with the cost as
  `Abaixo da Mé…US$ 2`. These are PT-372 fixed-column clipping/separator
  defects.
- Pressing `]` to page from clothing page 4 to page 5, selecting `G`, then
  pressing `[` leaves the page-5 `Traje de tanque humano` detail footer below
  page 4, even though that item is no longer visible. This stale off-page
  selection is PT-373.
- All captured buffers stayed at 25 rows and max width 80; `#lcs-playtest-errors`
  was empty and document width equaled the viewport. Evidence (including
  page-by-page DOM captures and a headless screenshot) is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/crafting-clothing-20260813/`.

## 2026-08-13 — PT-366 localized-value boundary replay

- Replayed a fresh Portuguese founder through the profile, base roster, Assign
  Tasks screen, and activity picker using only the repository strict-headless
  wrapper. The browser reported `HeadlessChrome/150.0.0.0`; no headed browser
  was opened or focused.
- The first run exposed false missing-key logs for already-localized `Nenhuma`,
  `Daishō`, and `SEA — Sem-teto`. Source tracing showed a profile weapon value
  and task-table location value being translated twice. The fix marks those
  rendered values `noTranslate` while preserving translation for raw fallback
  labels.
- The rebuilt route retained Portuguese labels, emitted no missing/fallback
  warnings or runtime errors, and stayed at 25 rows × 80 columns with no
  document overflow or bridge errors. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/double-translation-20260813/`.

## 2026-08-12 — strict-headless funded equipment follow-up

- Replayed a fresh Portuguese campaign with temporary `debugAllItems` and
  `debugAMilli` fixtures using only the repository's strict-headless wrapper
  (`AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`, `--disable-dev-shm-usage`, and
  `--disable-cache`). The runtime UA was `HeadlessChrome/150.0.0.0`; no
  headed browser was opened or focused.
- Covered the full 14-page equipment pager, medieval clothing/armor/weapons,
  the department-store route, and a compact 320×240 base screen. Every
  captured buffer had 25 rows and maximum width 80; document overflow was
  false and `#lcs-playtest-errors` was empty.
- The only English-looking equipment terms were `Fursuit` and `Tie-dye`.
  Both are intentional Brazilian Portuguese loanwords retained by the
  translation exceptions and prior playtest findings, so no defect was
  promoted. The temporary debug flags were restored before handoff.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/
  funded-all-items-20260812/`.

No new translation, key-prefix, or layout issue was confirmed. The residual
queue remains random PT-048/PT-148 police-terminal variants, optional PT-083
fixed-width readability work, and the persisted generated-name locale-switch
decision.

## 2026-08-13 — PT-355 strict-headless commerce/car-choice verification

- A fresh Portuguese commerce replay used only the repository headless wrapper
  (`AGENT_BROWSER_HEADED=0`, `--headless=new`, `--ozone-platform=headless`) and
  reported `HeadlessChrome/150.0.0.0`; no headed browser was opened or focused.
- At a compact 480×320 viewport, the department store, pawn shop, and used-car
  dealer stayed within the fixed 80-column console. The vehicle picker exposed
  the context defect `Pressione uma letra para selecionar Veículo`: the generic
  English article template was being combined with a Portuguese title-case
  noun.
- PT-355 adds contextual vehicle/color prompt keys and routes the dealership
  through them. The clean restarted bundle now renders
  `Pressione uma letra para selecionar um veículo`; the dealership regression
  also verifies `Pressione uma letra para selecionar uma cor`. The bridge-error
  channel stayed empty.
- The remaining playtest queue is PT-048/PT-148 random police-terminal
  variants, PT-083 narrow-console readability, and the persisted generated-name
  locale-switch decision.

## 2026-08-13 — strict-headless police-siege fight/victory verification

- Rebuilt the deterministic Portuguese police-siege fixture with the repository
  wrapper only (`AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`). The browser reported
  `HeadlessChrome/150.0.0.0`; no headed window was opened or focused.
- Covered the siege warning, loudspeaker surrender notice, safehouse
  `F - Lutar/Fugir` briefing, SWAT roster, live combat turns, fleeing-unit
  styling, victory terminal, and return to the defended safehouse.
- The route stayed Portuguese and within the 80-column console. The lowercase
  `policial da SWAT` row is intentional flee-state styling from the shared
  conservative-role renderer; it preserves the `SWAT` acronym. The DOM error
  channel remained empty and no new translation or layout defect was confirmed.
- Temporary siege/all-items/combat/funds flags were restored to their original
  disabled state after the replay. Keep PT-048/PT-148 random terminal seeds and
  PT-083 narrow-console readability as the remaining playtest follow-ups.

## 2026-08-13 — strict-headless police-terminal flee/narrow-layout verification

- Replayed a fresh deterministic Portuguese police siege through the repository
  wrapper only (`AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`); the browser reported
  `HeadlessChrome/150.0.0.0`, with no headed window opened or focused.
- Covered the SWAT chase's `ainda está no seu encalço` and
  `não consegue acompanhar` branches, then returned to the safehouse. The
  roster, weapon labels, combat message (`...com Escopeta pump!`), and siege
  status remained Portuguese. The lowercase fleeing `Policial da SWAT` styling
  is intentional shared encounter rendering, not a localization defect.
- Repeated the active chase at 320×240 and 240×160. The DOM bridge still
  exposed a 25×80 console (`maxRow=80`, zero rows over 80 columns) and the
  narrow screenshots showed no horizontal clipping. The bridge error channel
  remained empty; no new translation or layout issue was confirmed.
- Temporary siege/funds debug flags were restored to `false`. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-rerun-20260813/`.
- Residual queue remains: random PT-048/PT-148 terminal variants, PT-083
  fixed-width-console usability work, and the persisted generated-name
  locale-switch product decision.

## 2026-08-13 — PT-356 strict-headless sleeper/newspaper buffer verification

- The president-sleeper developer fixture exercised Portuguese sleeper
  activation, espionage/embezzlement assignment, a February newspaper cycle,
  legislative vote screens, and the funding report at 480×320. Dynamic labels
  such as `Presidente`, `Casa Branca`, `Espionagem`, and `Desviando Fundos`
  stayed localized and bounded.
- The newspaper's CPC art exposed a bridge-only defect: raw U+0000 control
  glyphs were published into `#lcs-playtest-buffer` even though the canvas
  correctly rendered those cells as blank. The pre-fix capture contained 950
  NULs and made text/OCR automation unreliable.
- PT-356 centralizes text-surface glyph sanitization in
  `displayableConsoleGlyph`, reuses it in the Flutter text renderer and the
  headless bridge, and adds `test/console_glyph_test.dart`. A clean rebuilt
  replay now reports `nul: 0`, a 25×80 buffer with `maxRow: 80`, and an empty
  bridge-error channel; the post-fix screenshot remains visually unchanged.
- The temporary president-sleeper flag was restored to `false`. Evidence is
  under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/president-sleeper-20260813/`.
- Residual gameplay queue remains PT-048/PT-148 random terminal variation,
  PT-083 fixed-width-console usability, and the generated-name locale-switch
  product decision.

## 2026-08-13 — PT-357 strict-headless police-terminal/article follow-up

- A fresh `debugSiege=true` Portuguese campaign used only the strict-headless
  wrapper (`HeadlessChrome/150.0.0.0`) at 480×320, then 320×240. It covered the
  police alarm, loudspeaker, safehouse return, multiple daily waits, the
  newspaper, and the `FM OBSCENITY` article. The bridge stayed at 25×80 with
  no document overflow or playtest errors.
- The article exposed `O polêmico radialista de rádio FM ...`; `radialista`
  already means a radio presenter, so the repeated `rádio` is an unnatural
  contextual calque. PT-357 changes it to `O polêmico radialista de uma rádio
  FM ...`. The generated-story regression now rejects the old wording.
- The temporary siege flag was restored to `false`; the headless browser and
  disposable web server were closed. Captures are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-next-20260813/`.
- Remaining queue: additional random PT-048/PT-148 terminal outcomes, PT-083
  fixed-width-console usability, and the generated-name locale-switch product
  decision.

## Environment

- Local URL: `http://127.0.0.1:7357`
- Flutter: 3.35.4
- Dart: 3.9.2
- Browser (historical initial pass): isolated headed Chrome-for-Testing session;
  all current verification replays use the strict-headless CLI session below
- Repository branch: `feature/localization`
- Starting commit: `03e2ca594771276f6a809ba6be941dd49521aed7`
- Viewport captured at 1527 × 1293

## 2026-08-13 — PT-349 strict-headless map-editor replay

- Entry: Portuguese mod-tools → `E - Editor de Mapas`.
- Before: the separate Flutter route exposed English toolbar, palette, and
  tooltip labels; its top bar overflowed at a compact viewport and long site
  names could clip in the dropdown.
- Fix: route visible labels and validation/status text through `LcsI18n`, add
  the en_US/pt_BR catalog entries, make the top bar horizontally scrollable,
  and ellipsize long dropdown names.
- After: the direct route loaded under the strict-headless
  `HeadlessChrome/150.0.0.0` session without a headed window or bridge error;
  the Portuguese widget replay found `Editor de mapas`, `Desfazer`, and
  `Validar mapa` and no longer found `Pencil (P)`.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/map-editor-translation-20260813/`.

## 2026-08-13 — PT-350/PT-351 strict-headless newspaper replay

- The fresh Portuguese replay used only the repository wrapper with
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; the browser UA was
  `HeadlessChrome/150.0.0.0`. No headed window was opened or focused.
- The pre-fix randomized `DRUG PANIC` capture selected English
  `methamphetamine` and rendered `vai morrem instantaneamente`. The canonical
  catalog now supplies `metanfetamina`, `cocaína`, `heroína`, and `fentanil`,
  and translates `instantly die` as `morrer instantaneamente`.
- The same newspaper sweep exposed a retirement `INSECURITY` composition such
  as `porta-voz do Parceria Unido da Liberdade`. PT-351 now uses
  `porta-voz da organização ...` and a Portuguese generated-name construction
  with invariant modifiers, avoiding noun gender/article failures.
- The rebuilt browser loaded the updated Portuguese catalogs and completed a
  bounded newspaper cycle without bridge errors or new English control chrome.
  The exact drug-panic event did not recur after rebuild; deterministic
  regressions sample the dynamic drug/consequence choices and 200 retirement
  stories. Pre-fix and post-rebuild captures are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-rerun-20260813/`.

## 2026-08-13 — PT-352/PT-353 strict-headless siege/media-context replay

- The fresh route used only `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agent-browser-headless.sh`; the UA was `HeadlessChrome/150.0.0.0`, with no headed browser opened or focused. The route selected Portuguese, created a founder, entered a generated industrial site, and advanced through a police siege and newspaper cycle using the DOM buffer.
- PT-352: the elite-journalist siege event composed `do revista de notícias` because the fixed Portuguese article did not agree with the runtime outlet type. The catalog now uses the neutral `da publicação {publication} ({newsType})` construction, adds the previously missing `website`/`newspaper` dynamic vocabulary, and tests all five runtime outlet types.
- PT-353: the WOKE HIRE article composed `uma pessoa negra (homem/mulher)`, leaking the English-era parenthetical structure into Portuguese. The catalog now renders `uma pessoa negra que é homem/mulher`; the generated-story regression rejects both English and Portuguese parenthetical leaks.
- Focused siege and newspaper regressions pass. The canonical pre-fix route capture is under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-variants-20260813/`; the post-fix replay was verified through the same DOM bridge and the focused regressions.

## 2026-08-13 — PT-354 strict-headless founder profile replay

- The fresh Portuguese route used only the strict wrapper and reported
  `HeadlessChrome/150.0.0.0`; no headed browser was opened or focused.
- The founder profile rendered the translated creature type as
  `Profissional do Roubo`. That wording is understandable but unnatural in
  Brazilian Portuguese for the occupation `Professional Thief`; the direct
  noun phrase is `Ladrão Profissional`.
- PT-354 changes the canonical catalog value and extends the existing profile
  regression to reject the old wording. The rebuilt headless route reached the
  Portuguese founder/task screens without bridge errors; the focused profile
  test verifies the corrected label. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-founder-20260813/`.
- The 320×240 capture still shows the known PT-083 fixed-width console scaling;
  it has no horizontal DOM overflow and is retained as a layout follow-up,
  not a new regression.

## Explored paths

### Title and language selection

1. Opened the local build.
2. Focused the game surface.
3. Opened `A - Language Selection`.
4. Selected `P - Português`.
5. Returned to the Portuguese title screen.

Evidence:

- [`screenshots/00-initial.png`](screenshots/00-initial.png)
- [`screenshots/01-language-menu.png`](screenshots/01-language-menu.png)
- [`screenshots/02-portuguese-selected.png`](screenshots/02-portuguese-selected.png)

Observed:

- Portuguese applied immediately.
- The Portuguese title screen exposed title duplication, proper-name
  translation, capitalization, and clipping issues.

### New-game configuration and character creation

1. Started a new game.
2. Reviewed the political-climate, combat, and difficulty settings.
3. Chose manual character creation.
4. Advanced through birth, childhood, elementary-school, high-school, and
   later-life questions.
5. Accepted the generated identity and entered the campaign.

Evidence:

- [`screenshots/03-new-game-intro.png`](screenshots/03-new-game-intro.png)
- [`screenshots/05-origin-story.png`](screenshots/05-origin-story.png)
- [`screenshots/06-childhood-choice.png`](screenshots/06-childhood-choice.png)
- [`screenshots/07-elementary-school.png`](screenshots/07-elementary-school.png)
- [`screenshots/08-later-life-choice.png`](screenshots/08-later-life-choice.png)
- [`screenshots/09-later-life.png`](screenshots/09-later-life.png)

Observed:

- Configuration labels and much of the biography prose remained English.
- Equipment and skill labels repeatedly remained English.
- Several translated answers exceeded their available width.
- One answer began with the untranslated English pronoun `She`.

### Base management and character screens

1. Reviewed the initial base screen.
2. Opened the slogan prompt.
3. Reviewed assets and the active Liberal list.
4. Opened the founder's detailed status.
5. Opened task assignment and the activity menu.
6. Waited multiple turns, advancing from 1 January to 10 January 2023.

Evidence:

- [`screenshots/10-story-intro.png`](screenshots/10-story-intro.png)
- [`screenshots/12-review-assets.png`](screenshots/12-review-assets.png)
- [`screenshots/13-active-liberal.png`](screenshots/13-active-liberal.png)
- [`screenshots/14-character-status.png`](screenshots/14-character-status.png)
- [`screenshots/16-assign-task.png`](screenshots/16-assign-task.png)
- [`screenshots/17-activity-menu.png`](screenshots/17-activity-menu.png)

Observed:

- English headers, statuses, equipment, and activity names remained throughout
  core management screens.
- Longer Portuguese actions collided with adjacent keys, columns, and options.
- The character screen rendered the duplicated prefix
  `QQualquer outra tecla`.

### Options, changelog, and saves

1. Returned to the title screen.
2. Reviewed gameplay, interface, and content options.
3. Opened the changelog.
4. Opened save management and inspected the generated save row.

Evidence:

- [`screenshots/21-gameplay-options.png`](screenshots/21-gameplay-options.png)
- [`screenshots/22-interface-options.png`](screenshots/22-interface-options.png)
- [`screenshots/24-content-options.png`](screenshots/24-content-options.png)
- [`screenshots/25-changelog.png`](screenshots/25-changelog.png)
- [`screenshots/26-save-management.png`](screenshots/26-save-management.png)

Observed:

- Gameplay-option labels were largely localized.
- Interface/content labels were Portuguese while their explanatory text
  remained English.
- The changelog was wholly English.
- Save management mixed both languages, duplicated back navigation, clipped
  the Portuguese prompt, and merged adjacent row columns.

### Travel, shopping, and site action

1. Sent the squad to `Shopping`.
2. Entered `Towne Peão e Arma`.
3. Reviewed the main store menu, firearms, Liberal tools, and equipment.
4. Returned to base and selected Downtown Seattle.
5. Reviewed downtown destinations.
6. Travelled to `Police Station`.
7. Entered a level-one site action and moved inside the map.

Evidence:

- [`screenshots/27-go-forth.png`](screenshots/27-go-forth.png)
- [`screenshots/28-shopping.png`](screenshots/28-shopping.png)
- [`screenshots/31-pawn-shop-buy.png`](screenshots/31-pawn-shop-buy.png)
- [`screenshots/32-pawn-shop-guns.png`](screenshots/32-pawn-shop-guns.png)
- [`screenshots/33-pawn-shop-tools.png`](screenshots/33-pawn-shop-tools.png)
- [`screenshots/36-downtown.png`](screenshots/36-downtown.png)
- [`screenshots/37-police-station-arrival.png`](screenshots/37-police-station-arrival.png)
- [`screenshots/39-police-station-action.png`](screenshots/39-police-station-action.png)

Observed:

- Generic destination names and store inventory remained English.
- Generated business names exposed word-by-word translation failures.
- The purchase flow was almost entirely English.
- The site-action controls were translated, but their legend overflowed the
  console and the surrounding status headers remained English.

### Follow-up pass: introduction, newspaper, and month end

1. Launched a detached clean worktree at commit
   `672e5c760a75416a5c4ba00b2fc4450473fa2f35`.
2. Generated required JSON serialization files and verified the baseline with
   the full Flutter test suite (317 tests passed).
3. Started a fresh Portuguese campaign and completed all ten founder questions
   with individually paced key input.
4. Reviewed the conservative-era introduction.
5. Waited through January, reviewed a daily newspaper, and advanced into the
   month-end Congress and finance sequence.

Evidence:

- [`screenshots/40-conservative-era-overflow.png`](screenshots/40-conservative-era-overflow.png)
- [`screenshots/41-newspaper-mixed-language.png`](screenshots/41-newspaper-mixed-language.png)
- [`screenshots/42-month-end-congress.png`](screenshots/42-month-end-congress.png)
- [`screenshots/43-legislative-results-mixed.png`](screenshots/43-legislative-results-mixed.png)
- [`screenshots/44-monthly-finance-mixed-language.png`](screenshots/44-monthly-finance-mixed-language.png)

Observed:

- Long Portuguese introduction lines were clipped, and
  `extrema-direita Arqui Conservadora` did not preserve the requested
  capitalization/form.
- The newspaper combined a Portuguese headline with an English subheadline,
  masthead, and subscription copy; its top navigation also clipped.
- Month-end legislative notices and institutional headers remained English.
- The monthly finance report localized its frame but not its asset categories.

### Replay pass: settled shared localization tree

This pass intentionally tested the live shared working tree rather than a
clean commit.

- Initial server checkpoint: 2026-07-19 15:29:38 -03:00
- Rebuilt after the other localization agents settled: approximately
  2026-07-19 15:54 -03:00
- Exact source checkpoint recorded: 2026-07-19 16:01:23 -03:00
- Branch: `feature/localization`
- HEAD: `672e5c760a75416a5c4ba00b2fc4450473fa2f35`
- Dirty source state excluding `findings-doc/**`: 94 tracked paths and 12
  untracked paths
- Tracked source diff SHA-256:
  `47a5dc9e0cff433b2d3d26aba61208bdb74fcbc0fe6e912041f046b1ce383043`
- Untracked source-path SHA-256:
  `276b3e3b900bba5eac26a7948f2c2645605289bdcbac52b78a3200f070e02a4d`
- Non-findings `git status --short` SHA-256:
  `3f0e1d2e4a87c393fa1814bdfff91641b8d90f3209414058e2238fb6a02bc8e7`
- Browser: isolated agent-browser Chrome-for-Testing session
- Viewport: 1527 × 1293

Explored:

1. Replayed the Portuguese title, gameplay/interface/content settings, new-game
   configuration, founder biography, and conservative-era introduction.
2. Created an autosave and opened the real save-management table.
3. Continued the campaign through base and squad equipment.
4. Travelled to shopping, entered the pawn shop, and reviewed firearms, tools,
   and equipment after rebuilding the server from the settled tree.
5. Waited through 5 January and opened the media overview.
6. Attempted to render the next major-event newspaper.

Resolved by replay:

- PT-001, PT-002, and PT-003 on the Portuguese title.
- PT-005 on the replayed base/equipment vocabulary surfaces.
- PT-007 with an actual save row.
- PT-008 across all three settings groups.
- PT-010 across the pawn-shop transaction paths.
- PT-014 with the exact phrase
  `extrema-direita Arqui Conservadora`.

Open at the initial capture (before the fixes below):

- PT-004 was open at capture: `Clothes` and clipped founder answers persisted.
- PT-015 could not be cleared because the newspaper path crashes.
- PT-018: `Mais difícil` clips beyond the new-game console border.
- PT-019: transport metadata renders the malformed `(Sportção)`.
- PT-020: a pawn-shop status action clips at the right edge.
- PT-021: the media overview retains English chrome.
- PT-022: the major-event newspaper crashes with a negative index.

All PT-001 through PT-024 findings are resolved in the current tree; the list
above is retained as the historical pre-fix replay record.

## Post-fix verification pass

The crash and layout findings were then converted into regression tests and
minimal fixes on the shared tree:

- PT-004: biography options now wrap within the 80-column console; clothing
  metadata and transport names use locale-aware rendering. Fresh replay
  confirms the long answers remain visible.
- PT-006: base controls and management tables now use explicit fitted cells,
  keeping Portuguese actions, health, location, and activity columns apart.
- PT-011: continuation prompts use the localized option renderer and wrapped
  action legends, so key prefixes are not duplicated or clipped.
- PT-018: difficulty legend placement is bounded by the fixed console width.
- PT-019: XML vehicle short name `Sport` now renders as `Esportivo` instead of
  the malformed `Sportção`.
- PT-020: pawn-shop status actions occupy separate full-width rows.
- PT-021: media-overview title, headers, footer, and guidance are covered by
  Portuguese catalog entries.
- PT-015: Herald masthead, navigation, subscription copy, and the pollution
  subheadline are covered by the Portuguese newspaper regression suite.
- PT-022: newspaper glyph drawing is bounds-safe, chooses a compact font, and
  clips any remaining over-wide translated headline before centering; the
  former negative-index failure is covered by direct, full major-event, and
  very-long-headline tests.
- PT-023: the gun-control story now translates `mass shooting`, `university`,
  and the shooter pronoun (`ele` rather than raw `he`).
- PT-024: the squad table now fits long founder names to the fixed name column;
  screenshot 82 captures the pre-fix collision and the regression test protects
  the skill column.
- PT-009: generated commerce names now use Portuguese phrase-level templates;
  the pawn-shop descriptor is `Casa de penhores e armas`, while the insurance
  and latte-stand templates preserve Portuguese word order.
- PT-012: title and identity prompts use Brazilian Portuguese sentence case and
  idiomatic wording.
- PT-013: the changelog overlay localizes its chrome and labels historical
  English-only notes explicitly; it also fits the available viewport.

Fresh replay evidence also confirms the character-creation spacing and wrapping
fixes in screenshots 78–80.

Focused localization/layout/newspaper tests and the full Flutter suite pass.
Catalog canonicalization, prefix validation, strict interpolation auditing,
the extractor, analyzer, and whitespace checks also pass.

Evidence:

- [`screenshots/46-title-portuguese-replay.png`](screenshots/46-title-portuguese-replay.png)
- [`screenshots/47-save-management-replay.png`](screenshots/47-save-management-replay.png)
- [`screenshots/48-gameplay-options-replay.png`](screenshots/48-gameplay-options-replay.png)
- [`screenshots/49-interface-options-replay.png`](screenshots/49-interface-options-replay.png)
- [`screenshots/50-content-options-replay.png`](screenshots/50-content-options-replay.png)
- [`screenshots/51-new-game-config-replay.png`](screenshots/51-new-game-config-replay.png)
- [`screenshots/52-conservative-era-fixed.png`](screenshots/52-conservative-era-fixed.png)
- [`screenshots/58-base-post-rebuild.png`](screenshots/58-base-post-rebuild.png)
- [`screenshots/59-equipment-post-rebuild.png`](screenshots/59-equipment-post-rebuild.png)
- [`screenshots/60-shop-post-rebuild.png`](screenshots/60-shop-post-rebuild.png)
- [`screenshots/61-shop-firearms-post-rebuild.png`](screenshots/61-shop-firearms-post-rebuild.png)
- [`screenshots/62-shop-tools-post-rebuild.png`](screenshots/62-shop-tools-post-rebuild.png)
- [`screenshots/65-media-overview-mixed.png`](screenshots/65-media-overview-mixed.png)
- [`screenshots/66-newspaper-range-error.png`](screenshots/66-newspaper-range-error.png)
- [`screenshots/67-founder-biography-clipping-replay.png`](screenshots/67-founder-biography-clipping-replay.png)

## Residual verification pass: 2026-07-26 (superseded snapshot)

This follow-up replay used the Portuguese locale after the PT-001–PT-024 fixes
were applied. It verified the title, new-game flow, founder biography, base,
roster, character profile, legislative agenda, vote tally, president, finance,
and month-rollover screens. No code was changed during this pass.

At capture time, the following residual issues were recorded:

- PT-025: date headers use English month abbreviations (`Jan`, `Feb`).
- PT-026: the default squad name remains English and clips in roster/profile
  views.
- PT-027: the character profile retains English profession, education, and
  body-part labels.
- PT-028: the roster footer clips the final `o` from `esquadrão`.
- PT-029: one long founder-option continuation line starts at column zero
  instead of following the option indentation.
- PT-030: a long founder name makes the title-screen continue option collide
  with the save-management column.
- PT-031: activate-regulars submenus expose English sub-action labels across
  activism, fundraising, education, recruitment, teaching, and health.
- PT-032: long activity descriptions clip at the fixed console edge.

The later headless follow-up in this log resolved PT-025–PT-035. The major-event
newspaper was not reached in either replay, so its previously verified renderer
and translation fixes still need a future runtime pass.

## Not covered

- Combat with an encountered enemy
- Recruitment dialogue through successful completion
- Save import/export
- Other cities and viewport sizes

These remain useful targets for a follow-up runtime pass.

## Headless buffer verification — 2026-07-26

- Launched the web build at `/?playtest=1` and read the live 80×25 console from
  `#lcs-playtest-buffer`; no OCR or screenshot was needed for text checks.
- Replayed language selection, new-game biography, founder entry, and the first
  Portuguese base-mode screen.
- Confirmed the activity-menu fixes are rendered in the live build.
- Replayed the base and review screens after the follow-up fixes. The live
  buffer now shows `SEA — Sem-teto, 1 de jan de 2023`, a readable flag action,
  a separated/fitted squad-name cell, and the complete squadless-base footer.
- PT-033's fifteen siege/election/car-theft strings are covered by Portuguese
  catalog entries and context regression tests. PT-025–PT-035 are now resolved;
  the remaining not-covered routes are listed below for future playtesting.

## Headless recruitment replay — 2026-07-26

The follow-up run used the CLI `agent-browser` session `lcs-pt-headless` against
the opt-in `/?playtest=1` bridge. No headed browser was used. The DOM buffer
provided deterministic 80×25 text capture while injected key events drove the
turn-based route.

Observed and fixed during this run:

- PT-036: the profession selector's English type names are now Portuguese and
  retain the original key and difficulty columns.
- PT-037: candidate rows, profile headings, conversation headers, and the
  `Enter/Escape` footer are localized without translating generated proper names.
- PT-038: a long Portuguese issue quote previously ended mid-word; the prompt
  now wraps inside the console.

The replay reached the candidate list, profile, political conversation, and
translated `"O quê?"` response. The recruitment activity description also now
renders as two complete Portuguese lines without the former grammatical error
or edge ellipsis.

## Headless interface and education sweep — 2026-07-26

This replay used only the CLI `agent-browser` session `lcs-pt-sweep` against the
local `web-server` at `http://127.0.0.1:7361/?playtest=1`. The browser remained
headless; the DOM-backed `#lcs-playtest-buffer` text was captured directly.

Coverage and outcomes:

- Title → language → Portuguese → new game: interface-option help now reads as
  grammatical Portuguese; no clipped fragments remained in the 80-column view.
- Founder screen: all A/B/C/D/E hints were visible, including the shortened
  tragic-origin hint. The biography route showed corrected `Disfarce` and
  `Armas de Fogo, AK-102` rewards.
- Base → Atribuir Tarefas → Educação → Praticar: the header, long skill label,
  values, and `Primeiros Socorros` description all fit and stayed Portuguese.
- Base → Atribuir Tarefas → Educação → Fazer Aulas Pagas: the replay initially
  exposed English class descriptions; after catalog completion and a server
  restart, all eighteen descriptions rendered in Portuguese and within the
  description column.

The route was intentionally replayed after each catalog/source change so the
fixes were checked in a fresh runtime rather than inferred from static catalogs.

## Headless high-risk route sweep — 2026-07-26

This pass used only CLI `agent-browser` session `lcs-pt-broad` against the local
web server. The founder shortcut was enabled temporarily to reach management
routes quickly, then reverted before source validation.

Before the fixes, the replay found clipped vehicle notes, four English travel
descriptors, clipped seeded high-score labels/year, and English `L - Load Game`.
The changelog overlay was visible and explicitly documented its English-only
release notes. Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/high-scores-pt.png`
and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/changelog-pt-final.png`.

The fixes are now covered by catalog, source, and fixed-column regression tests.
A fresh server restart and replay of these exact routes remains the final
verification step; combat injury/car-chase branches also need a future replay.

Fresh-server verification completed for the vehicle selector and travel-city
list: all three guidance lines are complete, and Seattle, New York, Los Angeles,
and Washington descriptors are now Portuguese and visible within their columns.
The temporary founder shortcut was reverted and the server hot-restarted again.

## Headless site/save/combat residual sweep — 2026-07-26

This pass used only CLI `agent-browser` sessions against local Flutter
`web-server` instances. No headed browser or desktop automation was used.

The fresh Portuguese site route confirmed that generic destination names and
arrival parameters now render as `Delegacia de Polícia`, `Fórum`, `Primeiro
Banco Americano`, and `Estação de Rádio AM`. The same route exposed a stale
trailing fragment when a shorter arrival line overwrote a longer previous line;
this is a redraw/layout follow-up rather than a locale fallback.

The save/high-score route was exercised with isolated seeded browser data. It
found clipped universal flag counts, long outdated-save warnings, a broken-save
fallback that skipped translation, and mixed delete terminology. These were
shortened or unified in the catalogs and source; focused context/layout tests
pass. Evidence retained in `agent-tmp/lcs-new-age/` includes the high-score,
outdated-save, and crash-report captures.

The combat route found English police/wardrobe assets, raw kidnapping pronouns,
two untranslated hostage fragments, and an unarmed-founder `RangeError` before
the martial-arts branch. Catalog entries, pronoun translation, and the empty
attack-description guard are now in place. The follow-up forced replay caught
the generated-name helper gap; the explicit-catalog lookup and focused helper
regression now close that path, while the unarmed route remains verified.

The same static combat pass identified an open plural-composition gap in the
multi-tooth injury prefix. It needs plural-aware suffix selection, not just a
literal catalog entry, and is tracked as PT-054.

The focused Portuguese suite then exposed two additional player-facing data
fallbacks (`Club Security` and `Naked`). Both now have catalog entries and
regression assertions; the helper regression now covers generated encounter
names alongside the fresh runtime evidence for PT-052–PT-054.

Fresh hot-restarted combat replay verified the complete follow-up: arrival text
no longer retains a stale trailing character; the unarmed founder reaches the
site without a `RangeError`; target names and `flails at` are Portuguese; armor
hit descriptions include the article; and encounter rows translate and fit
within their fixed name/clothing/weapon columns using ellipses where needed.
Seeded save replay likewise verified the revised corrupted-save title and all
save/high-score edge flows.

The same forced combat replay reached the plural tooth branch and caught a
newly introduced composition bug (`foram arrancados!arrancado!`). The shared
singular suffix is now gated to one-tooth cases only, and the focused context
suite covers every complete plural template. The follow-up source fix also
made generated encounter-name translation explicit and reduced the name cell
by one column so every roster row retains a separator before clothing.

## Headless mega-founder management sweep — 2026-07-28

This pass used only CLI `agent-browser` against a local Flutter `web-server`
with `/?playtest=1`. The existing mega-founder, elite-public-opinion, and
all-items developer flags were enabled only in the disposable local build;
they were not intended for commit.

Confirmed findings:

- The base roster row renders `744/30Nenhuma` when cheat-expanded health and
  skill values are present. The health cell fills into the weapon column, so
  `Nenhuma` loses its separator (PT-057).
- Review → Liberais Ativos and the profile screen remain readable, but the
  profile exposes `Veículo roubado: Esportivo Beige`; `Beige` is a generated
  vehicle color passed through the catalog without a Portuguese entry
  (PT-059).
- Review → Revisar e Mover Equipamento renders rows such as
  `Canhão de 120 mm (iteSEA — Sem-teto`, with the item cell running into the
  current-location column. The Portuguese template also adds the literal
  English suffix `(item)` to every row (PT-058). Destination names are
  truncated at their fixed right column, but the item/current-location merge
  is not intentional.

## Headless shops/travel sweep — 2026-07-28

This fresh route used only the CLI `agent-browser` session `shops-travel-pt`
against `http://127.0.0.1:7381/?playtest=1`; no headed browser or desktop
automation was used. It selected Português, created a founder, visited the
department store and Townsend pawn shop, opened clothing, equipment,
firearms, and tools, and opened the city-travel selector.

Confirmed residuals:

- The vehicle selector, travel destination, department-store, clothing,
  equipment, and pawn-shop screens still show the English control prefix
  `Enter -` (for example `Enter - Concluído`, `Enter - Voltar um passo`, and
  `Enter - Voltar`) instead of the Portuguese `Entre -` (PT-060).
- The pawn-shop half-screen still draws `0 - Mostrar o status Liberal do
  esquadr# - Verificar o status de um Liberal do`, merging the two status
  controls at the 80-column boundary (PT-061). This reproduces the area
  described as fixed by PT-020, so that finding's status needs revalidation.
- The pawn-shop base header renders the raw short site name `Pawnshop`, and
  the visiting header truncates `Townsend — Casa de penhores e armas` to
  `Visitando Townsend — Casa de penhores e` (PT-062).
- Long pawn-shop catalog names collide with metadata columns: tools show
  `Taco de beisebolN/D` and firearms show `Águia do Deserto(7)` without a
  separator (PT-063).

The city-travel list itself was readable and Portuguese (`Berço da LCS`,
`Wall Street e a Grande Mídia`, `Hollywood e Comércio`, `A Capital da Nação`).

## Headless recruitment/profile follow-up — 2026-07-28

This fresh route used only the CLI `agent-browser` session
`lcs-pt-recruit` against `http://127.0.0.1:7382/?playtest=1`. The browser was
headless; the DOM-backed `#lcs-playtest-buffer` supplied the 80×25 console
text. No production code or developer flags were changed.

Recruitment reached the profession selector, candidate list, political
conversation, and a follow-up recruitment meeting. The selector and candidate
rows were Portuguese, but the meeting path exposed these residuals:

- The generated candidate name falls back to the English type name in
  conversation responses: `College Student responde, "Oh sério?"`, followed by
  `Após mais conversa, College Student concorda...`. The candidate list and
  profile heading use `Estudante Universitário`, so this is a generated-name
  lookup inconsistency rather than an intentional proper name.
- The meeting title is overwritten by the money header instead of being fitted
  or cleared: `Reunião com Christina Stassen, Estudante Universitário, Motel
  (hoteDinheiro: $7` and later `... Motel (hotel) EsqDinheiro: $7`.
- A political discussion renders `Liliana ... explica as visões de ela sobre
  Tax Structure`; `Tax Structure` is raw English and `de ela` should contract
  to `dela` in this Portuguese sentence.
- The meeting option repeatedly uses masculine `pronto` for female-looking
  candidates (`Vanessa Guo ainda não está pronto...`); the gender agreement
  needs a deliberate neutral/feminine treatment.

The founder profile and its detail pages were then inspected. The main profile
showed `Nascido em ... (Feminino, Cisgênero)` (gender agreement should be
`Nascida`), a raw generated vehicle color (`Veículo roubado: Esportivo Beige`),
and a column merge (`Esquiva: 30.00 39Reuniões Agendadas: 1`). The skills detail
page has several Portuguese labels colliding with values (`Primeiros Soco31.0`,
`Esperteza de R32.1`, `Artes Marciais34.0`) and leaves `LEFT / RIGHT` and
`UP / DOWN` in English in its footer.

The profile crime page is still substantially untranslated and overflows its
two 40-column tables. It shows `treason`, `terrorism`, `bank robbery`,
`unlawful speech`, and other English labels; long rows overwrite counts, for
example `desecration of the national fl00`, `illegal entry into the United
00ates`, and `breaching national security sy00ems`. This route calls the
translation helper, so missing crime catalog entries and a width-aware row
renderer both need follow-up.

The travel/site route also exposed raw location names: the destination list
contains `Manhattan Island`, `The Bronx`, `Corporate HQ`, `Cable News Station`,
and `Intelligence HQ`; the base activity header says `Visitando Police Station`
even after selecting `Delegacia de Polícia`. On the next day, the activity
message used the English default squad name (`agiu com The Liberal Crime Squad
em vez de...`). The police-site roster itself localized the officer and
uniform, but the site action legend remains compressed and needs a separate
combat/surrender replay.

The same disposable mega-founder build then entered a police site and forced
an alarmed-conservatives branch. The initial attack sentence was correctly
localized (`Bree Rawls salta com um chute giratório contra Unidade Policial!`),
but the alarm roster introduced raw `Chief of Police` beside the translated
officer rows. The action footer also merged the stealth/fight controls with a
stale previous message: `V:Esgueirar-se F:Lutar ... R:Libertar ?Saque no chão!`.
This confirms a redraw/translation follow-up for the alarm branch; surrender
and arrest were not reached in this pass.

## Headless Portuguese management follow-up — 2026-07-28

This continuation used only the CLI `agent-browser` session `rootbroad` against
the local Flutter `web-server` at `http://127.0.0.1:7380/?playtest=1`. The
browser process was Chrome `--headless=new`; no headed browser or desktop
automation was used. The existing disposable mega-founder state was used to
reach management screens quickly. No production code or developer flags were
changed during this pass.

### PT-067 — Elite promotion screen still has English labels/legend

Base → Review Liberals → `U - Promover Liberais` rendered:

```
————NOME DE CÓDIGO—————————CURRENT CONTACT————————————CONTACT AFTER PROMOTION———
Recruited/Seduced/Enlightened   [Arrested] [Na Cadeia] [Escondido] [Sleeper]
```

The title and explanatory sentences are Portuguese, but the two column headers
and four legend entries remain English. Source: `lib/basemode/review_mode.dart`
`promoteliberals()` around lines 1325–1390 (`addHeader`, `addstrc` calls). The
existing catalog has `Press a letter to promote...` and `In Hiding`, but no
entries for these direct labels. This is a player-facing translation gap and
should be localized with context-appropriate Portuguese labels while preserving
the fixed columns.

### PT-068 — Squad assembly profession text overwrites location

Base → Review Liberals → `Z - Montar um Novo Esquadrão` rendered the only row as:

```
● A – Jordan Villanuevaa   744    730/730+30  Profissional do RSEA — Sem-teto
```

`Profissional do Roubo` is written at x=46 and the location begins at x=63,
so the Portuguese profession is clipped to `Profissional do R` without an
ellipsis and the location starts immediately after the `R`. Source:
`lib/basemode/review_mode.dart` `assembleSquad()` around lines 899–980: the
profession uses `mvaddstrc(y, 46, ...)` and location uses x=63 without fitting.
This needs a width-aware profession cell/separator (and likely a fitted
location) for translated labels.

### PT-069 — Activity help overlays are English in Portuguese mode

Base → `A - Atribuir Tarefas` → select a liberal → press `?` showed:

```
=== Recruit ===
Recruiting is a safe way to meet people of a specific job. Not all jobs are
available in the recruiting interface, but many valuable, important, or just
iconic jobs are.
```

The default `Laying Low` help likewise showed `=== Laying Low ===` and an
English paragraph. Only `Pressione qualquer tecla para continuar.` was
Portuguese. Source: `lib/basemode/help_system.dart` around lines 266 and 300;
these help payloads are direct English strings rather than catalog lookups.
The help route needs localized payloads (or an explicit, tested fallback policy)
for every activity help page.

### PT-070 — Activity preview remains stale after category change

In the same assignment screen, the initial preview said
`Jordan Villanuevaa vai fazer grafite.`. Pressing `D` to switch from Liberal
Activism to `Recrutamento e Aquisição` changed the option list but left the old
preview until a sub-option was selected. The next `1` correctly changed it to
`... vai recrutar novos membros.`. This is a redraw/state issue, not a missing
translation: `lib/basemode/activate_regulars.dart` renders the preview from the
currently selected activity while category switches can leave the prior
activity selected. Clear or reset the selection when changing categories.

### PT-071 — Profile footer loses the slash separator in Portuguese

Profile → full skill page rendered the footer as:

```
... CIMA BAIXO - Mais Info
```

The source intends `UP / DOWN - More Info` (`lib/common_display/print_creature_info.dart`
around lines 394–396): `UP` is written at x=52, then `" / "`, and `DOWN - More
Info` starts at x=57. Portuguese `CIMA` is wider than English `UP`, so the second
option overwrites the slash and resulting text has no visible separator. Fit or
place the two controls based on rendered width.

The site-map help key (`?`) opens another residual: the `Direct Action` help
overlay is entirely English (`You are taking direct action against the
Conservative Menace...`, including its multi-paragraph guidance) while only
the closing prompt is Portuguese. This is a player-facing help route and is
separate from the combat action strings.

## Headless Portuguese combat/help follow-up — 2026-07-28

This pass used only CLI `agent-browser` sessions against local Flutter
`web-server` builds (`lcs-pt-combat2` at `7382`; a disposable `7383` build
was used for the injury-branch attempt). Chrome ran with `--headless=new`; no
headed browser or desktop automation was used. Temporary injury-cheat changes
were reverted before handoff and no production code was intentionally edited.

Confirmed combat translation gap:

- **PT-072 — Police firearm attack verb is raw English.** In a Portuguese
  police-site alarm encounter, the combat message rendered
  `Unidade Policial shoots at Bree Rawls with a Pistola 9 mm!`. The following
  hit/dodge line was Portuguese (`Bree Rawls faz a esquiva Matrix!`), so this
  is specifically the attack-description fragment rather than a locale
  fallback. `FIRE_GUN` seeds `shoots at` in
  `lib/items/weapon_type_xml.dart` (around line 96), and
  `lib/sitemode/fight.dart` translates the fragment at attack construction
  (around lines 503–506). There is no `shoots at` entry in the Portuguese
  catalog; `swings at` is missing too and should be audited with the other XML
  attack descriptions. A suitable PT-BR rendering is context-dependent
  (`atira em`/`dispara contra`), because the surrounding template already
  supplies the target and weapon.

Rechecks/clarifications:

- The alarm footer's `Saque no chão!` is not stale English or an accidental
  legend tail: it is the intended translated ground-loot indicator drawn by
  `lib/sitemode/site_display.dart` at row 24, column 57. In the fresh alarm
  replay the action controls and this indicator were separated cleanly; do not
  remove the indicator when fixing action-row redraws.
- A raw `Chief of Police` was seen in an earlier alarm snapshot, but this
  route's generated encounter is random. The catalog now contains
  `Chief of Police` → `Chefe de Polícia`; a fresh replay after the current
  source/catalog restart is still needed to verify the generated encounter
  actually passes through the translation helper.
- The police subdue/arrest branch was not reached. A disposable build with
  `debugBadlyInjured` enabled killed the founder during site entry (roster
  showed `24/0`), so that cheat is unsuitable for validating arrest text. The
  developer flag was restored to `false` and the disposable server stopped.
- `?` showed the all-English `=== Direct Action ===` help overlay in the
  running `7382` build, which had been compiled before the latest catalog
  additions. The static English payloads in
  `lib/basemode/help_system.dart` are passed through the engine's translating
  `mvaddstrc`/`addparagraph` calls, so catalog coverage is sufficient here.
  The current focused `test/basemode/help_translation_test.dart` now passes
  for the Direct Action title/guidance and the `shoots at`/`swings at` combat
  phrases; a fresh web-server replay is still needed before closing the
  runtime finding.

## Headless verification follow-up — 2026-07-29

A fresh `flutter run -d web-server` build was exercised through the CLI-only
headless `agent-browser` session `rootverify`:

- Activity help now renders Portuguese title and body text for Laying Low:
  `=== Mantendo Discrição ===` and `Não fazer nada é uma forma segura...`.
- Travel headers and district composites use localized city/district names.
- Profile navigation retains the slash separator at the 80-column boundary.
- Combat preset verbs `shoots at` and `swings at` have Portuguese catalog
  entries with focused regression tests.

Remaining follow-up routes are the long activity-help bodies, Promote Elite
Liberals/Assemble Squad layouts, the profile crime-table width audit, and a
fresh alarm surrender/arrest replay.

## Headless recruitment context pass — 2026-07-29

This pass used only CLI `agent-browser` sessions (`recruitnext`, `recruitfix`,
and `recruitfresh`) against local Flutter `web-server` builds on ports 7383,
7384, and 7391. Chrome ran with `--headless=new`; no headed browser or desktop
automation was used.

Confirmed and fixed in the working tree:

- Generated recruit type names were localized in candidate lists and meeting
  headers, but `talk_about_issues` passed the raw type name after a response
  (`College Student responde` / `... College Student concorda`). All response
  and follow-up branches now use the localized creature-name helper.
- Recruitment issue discussions could expose raw Law labels such as `Election
  Reform` and `Tax Structure`. Every `Law.label` now has canonical English and
  context-appropriate Portuguese catalog coverage.
- The meeting status `is ready to fight for the Liberal Cause` used masculine
  `pronto`; Portuguese now uses the gender-neutral `está a postos...`.
- The meeting option `Just casually chat with them...` used `com eles` for a
  singular candidate. It now says `discuta política com essa pessoa`.
- A long Portuguese follow-up sentence was clipped at the 80-column boundary;
  the response/follow-up renderer now wraps with `addparagraph`. Focused tests
  assert that `à noite.` remains visible.

Focused translation/layout tests pass. A fresh runtime replay after the name
fix showed `Estudante Universitário responde` and the localized follow-up;
catalog, analyzer, and prefix checks also pass. The latest wrapping change is
covered by a deterministic console regression test; a full fresh runtime
replay of that final build remains useful in the next pass.

## Headless Portuguese management verification — 2026-07-28

This pass used only CLI `agent-browser` sessions (`mgmt7384` on a fresh
Flutter `web-server` build at port 7384, plus the existing disposable save on
7380). Chrome was launched with `--headless=new`; no headed browser or desktop
automation was used.

Confirmed and fixed:

- **PT-067:** Promote Elite Liberals now translates `CURRENT CONTACT`,
  `CONTACT AFTER PROMOTION`, and the recruited/seduced/enlightened status
  legend. The compact `Infiltrado` label keeps the full legend within 80
  columns.
- **PT-068:** Assemble Squad now fits the translated profession cell and
  leaves a one-column separator before the location cell. `Profissional do
  Ro…` no longer overwrites `SEA — Sem-teto`.
- **PT-073:** Profile crime tables now translate the `DELITO`/`Nº` headers and
  fit long Portuguese charges with ellipses while preserving the count cells.
  The full crime list was replayed headlessly and showed no raw English charge
  labels.
- The promotion instructions were also shortened in Portuguese so both
  explanatory footer lines remain complete within the fixed 80-column console;
  the earlier `... Liberais es`/`... seu ama` clipping is gone.

Regression coverage was added to
`test/basemode/pt_br_core_vocabulary_test.dart` for promotion labels, squad
assembly column boundaries, and long crime rows. Existing profile skill,
vehicle-color, and profile-navigation tests continue to pass. The profile
footer separator remains covered by the existing regression test; a stale
pre-fix server snapshot can still show `CIMA BAIXO`, so verification must use a
fresh web-server build.

## Headless combat/site-route follow-up — 2026-07-28

This pass stayed CLI-only with `agent-browser` in headless Chrome. I started a
fresh Portuguese game, travelled to the Seattle police station, entered the
site route, and exercised the alarm/combat and equipment screens. No headed
browser or desktop automation was used.

- **Fixed:** A police-site alarm snapshot still rendered the XML clothing short
  name `Cheer Jacket` in the Portuguese party roster. The new catalog entry
  renders it as the compact `Jaqueta Torcida`, which fits the 15-column armor
  cell without overwriting health/transport. The full `Cheer Squad Jacket` key
  was added alongside it for detail views.
- **Verified:** The alarm header and action footer were Portuguese, including
  `CONSERVADORES ALARMADOS`, `F - Lutar`, `T - Falar`, `R - Libertar`, and the
  `Saque no chão!` loot indicator. The indicator is intentional, not stale
  footer text.
- **Not reached:** A generated `Chief of Police` encounter and the surrender,
  police-subdue/arrest, and injury/body-part combat branches. The fresh route
  spawned ordinary police units and the founder had no firearm, so the combat
  ended before those branches could be selected. The existing catalog still
  maps `Chief of Police` to `Chefe de Polícia`; runtime verification remains
  open.

## Headless shop and narrow-viewport verification — 2026-07-28

This replay used only the CLI `agent-browser` session `shopfresh2` against a
fresh Flutter `web-server` build on port 7393. Chromium ran with
`--headless=new --ozone-platform=headless`; no headed browser or desktop
automation was used. The shared `megaFounderCheat` source flag remained
`false`.

The route selected Português, created a founder, travelled to the Seattle
commercial district, and opened the Krasow department store and Storms pawn
shop. Clothing (masculine and feminine), equipment, firearms, and tools were
reviewed. The previously reported English `Enter -` prefixes and item-column
collisions are fixed: controls consistently show `Entre -`, all visible item
names/descriptions are Portuguese, and long rows use ellipses/separators without
overwriting price or damage columns.

Confirmed and fixed during this pass:

- The shared header activity cell wrote long Portuguese visit descriptions past
  its 39-column right-hand cell (`Visitando Storms — Casa de penhores e a`).
  `printSquadActivityDescription` now fits text to the remaining console width;
  `test/localized_layout_regression_test.dart` covers a long pawn-shop visit
  phrase.

Narrow viewport check (480×320) still shows the fixed 80-column console clipped
horizontally by the browser viewport. The shop text remains internally bounded,
but the right side of the roster/header is off-screen. This is a responsive
layout enhancement for a future pass, not a translation defect.

## Headless police-station/profile replay — 2026-07-28

I repeated the route from a fresh Portuguese game in CLI `agent-browser`
headless Chrome: Seattle → Centro de Seattle → Delegacia de Polícia → site
entry, then returned to base and opened squad management/profile views. A
disposable local all-items flag was used only during setup and restored to
`false` before handoff. The
police-station arrival message, site header (`Delegacia de Polícia, Nível 1`),
movement/combat footer, squad table, and profile screen were all Portuguese;
the body-part labels (`Cabeça`, `Tronco`, `Perna esq…`, etc.) and crime table
contained no raw English strings. Long profile labels were ellipsized inside
their fixed columns and did not overwrite adjacent values.

Residual coverage gap: this deterministic route still did not produce a Chief
of Police encounter or the surrender, police-subdue/arrest, and injury combat
branches. These branches need a repeatable fixture/playtest hook before their
Portuguese strings and layout can be verified reliably; no new player-visible
translation defect was confirmed in this replay.

## Headless police-siege/combat fixture replay — 2026-07-28

For a deterministic follow-up I used the local `debugSiege=true` fixture in a
fresh Flutter web-server build (`7396`) and drove it only through headless
`agent-browser` DOM-buffer reads. The fixture was restored to `debugSiege=false`
after the replay; no source fix was made in this pass.

Confirmed Portuguese defects (exact buffer evidence):

- The siege safehouse header and action are raw English: `Safehouse Under Siege`
  and `F - Fight/Escape` (base-mode siege renderer, `lib/basemode/base_mode.dart`).
- Giving up to the police renders the dynamic placeholder untranslated:
  `Os police confiscam tudo, incluindo as armas do Esquadrão.` The catalog
  translates the sentence shell but the `{raiders}` value is still the English
  `police` (`lib/location/siege.dart`).
- The sally-forth briefing ends with a raw split fragment: `encounter.` after
  otherwise Portuguese lines. The source splits `...survive this` and
  `encounter.` into separate calls, so the existing full-sentence catalog entry
  cannot match (`lib/daily/siege.dart`).
- The police assault roster is heavily mixed-language:
  `D - Tentar despistá-los, Fight, Equip, Order, Desistir`, with every enemy
  shown as `SWAT Officer` / `SWAT Armor`. Combat log text also reads
  `Bilal Meléndez atira em SWAT Officer with a Rifle M7!`.
- After winning the assault, the victory screen still shows the full English
  paragraph `The authorities have been driven back—for now. While they are
  regrouping, you might consider abandoning this safe house for a safer
  location.`
- The post-combat Liberal profile exposes the generated profession as raw
  English: `Nome: Bilal Meléndez, Liberal de Elite (Agent)`.

The same replay did show localized body-part labels (`Cabeça`, `Tronco`, and
the leg/arm labels) and the surrender result itself was otherwise Portuguese.
It still did not generate a `Chief of Police` unit or the police-subdue/arrest
message; those remain open after this fixture run.

## Headless title/save/month replay — 2026-07-28

This replay used only CLI `agent-browser` with Chrome `--headless=new
--ozone-platform=headless` against the Portuguese Flutter web-server. No
headed browser or desktop automation was used. A normal founder game was
created with cheats disabled, autosaved, exported from the save manager, loaded
again, and reloaded after leaving the game. The save list showed localized
headers (`DATA NO JOGO`, `LÍDER DO LCS`, `ÚLTIMO ACESSO`, `VERSÃO`), compact
Portuguese dates, and complete `Entre -` back prompts.

The replay advanced into January/February and exercised newspapers, a major
event, legislative voting, and the finance report. Date lines (`5 de jan de
2023`, `1 de fev de 2023`), finance labels, voting headers, and event copy fit
the console; no raw English or column overwrite was confirmed. The changelog
overlay intentionally keeps release notes in English and clearly labels that
state in Portuguese.

To reach otherwise disabled title overlays, a disposable synthetic high-score
fixture was injected into the headless browser's local storage (not source and
not shared state). The high-score screen rendered Portuguese endings, dates,
stats, and universal totals. **PT-074 fixed:** on the title frame, `Vitória
mais rápida: Fevereiro/2023` reached the two-character right border because
the translated label starts at column 44. The score column now starts at 43;
the regression test asserts both the complete text and untouched border cells.
The synthetic local-storage fixture was removed after verification; source
cheat flags remain `false`.

The high-score fixture also exposed context-poor compact labels: `Compradas`,
`Queimadas`, `$ Tributado`, and `$ Gasto` did not identify what was counted and
were not idiomatic Portuguese. **PT-075 fixed:** these now render as
`Bandeiras compr.`, `Bandeiras queim.`, `Impostos: $`, and `Gastos: $` with
their values, all bounded to the fixed 20-column stat cells. The focused
Portuguese context/layout suites pass with the updated catalog values.

## Headless residual help/combat/layout replay — 2026-07-28

This pass used a fresh Flutter `web-server` build on port 7410 and only the
CLI `agent-browser` session `pt-residual`; Chromium was confirmed to run with
`--headless=new --ozone-platform=headless`. No headed browser or desktop
automation was used. A normal Portuguese founder game was created with all
cheat flags disabled.

Confirmed residual issues for future resolution:

- **PT-076 — activity help body is still English.** From `A - Atribuir
  Tarefas`, selecting a Liberal, `A - Ativismo Liberal`, `1 - Serviço
  Comunitário`, then `?` rendered the Portuguese heading `=== Serviço
  Comunitário ===` and footer `Pressione qualquer tecla para continuar.`, but
  the entire explanatory body began `Community service is a safe way to
  improve public opinion of the LCS...` and continued in English. The same
  `helpOnActivity` implementation supplies long English bodies for the other
  activity help pages; catalog entries or a translation wrapper are needed.

- **PT-077 — chase/combat action words are untranslated.** At a police siege
  combat screen the Portuguese action line read `D - Tentar despistá-los,
  Fight, Equip, Order, Desistir`. The source emits the bare `Fight`, `Equip`,
  and `Order` labels in `printChaseOptions`; existing catalog entries only
  cover the separate prefixed strings (`F - Fight, `, `E - Equip, `, and
  `O - Order, `), so the visible combat controls remain English.

- **PT-078 — 480×320 remains non-usable for the fixed 80-column console.** A
  narrow headless viewport showed the combat roster and controls reduced to
  tiny text with the right side clipped (`TRANSP...`), while the top-right
  debug ribbon overlaps the frame. This is a responsive layout enhancement,
  not a translation regression; the same clipping was observed in the shop
  replay.

Verified without new defects: Promote Elite Liberals, Assemble Squad, the
profile skills page, and the profile crime table all rendered Portuguese
labels with bounded columns and count cells. The direct-action (`?` in the
site map) help page was not reached in this run because the generated route
entered a shop and then a police siege; it remains a coverage gap for a future
deterministic site fixture.

## Headless direct-action help replay — 2026-07-28

This follow-up used a fresh Flutter `web-server` build on port 7411 and only
the CLI `agent-browser` session `pt-direct`; Chromium was confirmed to run
with `--headless=new --ozone-platform=headless`. A normal Portuguese game was
created with cheat flags disabled, then routed to `Desert Eagle Bar e Grill`.
No source edits, flag changes, staging, commits, or pushes were made.

- **Verified:** The site-map `?` help page is fully localized and bounded at
  the normal viewport. It rendered `=== Ação Direta ===`, all three Portuguese
  explanatory paragraphs, and `Pressione qualquer tecla para continuar.`;
  no English fallback or line overflow was visible.
- **PT-080 — narrow site-map footer clipping confirmed.** At 480×320 the
  fixed 80-column site map scaled down to tiny text; the right side of the
  roster/header was clipped (`TRANSP...`), the second footer row was cut by the
  viewport bottom, and the top-right `DEBUG` ribbon overlapped the frame. The
  narrow direct-action help body itself still fit inside the viewport, but was
  difficult to read at that scale. This confirms the existing responsive-layout
  enhancement gap (PT-078) on the direct-action route.

## Headless residual fixes — 2026-07-28

- PT-076 fixed: added the complete Portuguese community-service help body to
  the canonical catalogs and a regression test. The body now renders as
  `Serviço comunitário...` while retaining the translated heading and footer.
- PT-077 fixed: added `Fight`, `Equip`, and `Order` catalog entries so chase
  controls render `Lutar`, `Equipar`, and `Ordenar` in Portuguese; regression
  coverage now exercises the inline controls.
- A fresh founder replay exposed `Security Unif.` in the base roster; added
  `Unif. de Segurança` and a short-name regression test.
- Portuguese roster health/armor text could touch the transport column. The
  health cell now reserves a separator column; the long-name layout test
  asserts the gap.

Remaining known gap: the fixed 80-column console is clipped at 480×320, and
Chief of Police/arrest/injury combat branches plus deterministic direct-action
help still need fixture-driven coverage.

## Headless police-siege translation fixes — 2026-07-28

The targeted siege fixture then exposed additional concrete leaks, all fixed
and covered by catalog/static tests: `Safehouse Under Siege` and
`F - Fight/Escape`, `SWAT Officer`/`SWAT Armor`, the generated `(Agent)`
profession, the mixed combat attack template, the split `encounter.` briefing
line, and the English victory paragraph. Police/soldier surrender output now
uses complete locale-specific templates instead of inserting a raw English
raider label.

Still open: deterministic Chief of Police, police-subdue/arrest, and injury
branches; the narrow 480×320 responsive layout; and the direct-action help route
fixture. These remain future playtest targets rather than confirmed fixed.

## Headless Liberal Agenda replay — 2026-07-28

- Route: launched the Portuguese build with the headless-only browser flags (`--headless=new --ozone-platform=headless`), started a fresh game, and opened the Liberal Agenda screen with `L`.
- Confirmed layout defects on the 80-column console: House/Senate summaries at rows 10/11 collided with court names rendered through row 10/11 (`Mick Sealockon`, `Jorge Fushimion`); the summary text also ran off the right edge.
- Confirmed localization defect: the alignment legend still displayed English `moderate`, `Conservative`, and `Arch-Conservative`.
- Confirmed law-cell truncation: long Portuguese labels were cut at the fixed 26-column cells (`Direitos dos Anima`, `Direito à Privacid`, `Liberdade de Expre`).
- Fix scope: move chamber summaries below the court roster, fit summary and law-cell text to their console columns, and translate the alignment legend. Recheck all five agenda pages after the fix.

## Headless replay verification and recruitment follow-up — 2026-07-28

- Restarted a clean Flutter web-server on port 7413 and replayed the agenda in a fresh Portuguese game with the headless-only browser flags. The first agenda page now keeps House/Senate text to the left of the court roster, shows all court names, adds ellipses inside long law cells instead of overwriting adjacent cells, and renders the complete Portuguese legend: `Liberal de Elite - Liberal (pol.) - moderado - Conservador - Arqui-Conservador`.
- The same route was stepped through the five-page agenda controls; no additional English alignment labels or row collisions were visible in the captured buffers.
- **PT-081 fixed:** a single-candidate recruitment meeting now passes `localizedCreatureName`, so a `Biker` candidate is shown as `Motociclista` consistently with the profile and follow-up dialogue.
- **PT-082 fixed:** the conservative discussion fallback `"Whatever."` now resolves through the Portuguese catalog as `"Tanto faz."`; added a runtime regression test.
- The earlier direct-action help coverage gap is closed by the separate headless replay logged as PT-080; its remaining issue is only the narrow 480×320 responsive layout.

## Headless recruitment/conservative conversation replay — 2026-07-28

This pass used only the CLI `agent-browser` session `lcs-recruit` against a
fresh Flutter `web-server` on port 7412, with Chromium launched headless
(`--headless=new --ozone-platform=headless`). A normal Portuguese founder game
was used; no source edits or debug flags were left enabled.

- **PT-081 — recruitment setup leaks the English creature name.** Recruiting
  a `Motociclista` (the type selector and target profile both use the
  Portuguese label) showed the single-candidate setup sentence as
  `Hazel Marsden conseguiu marcar um encontro com Biker, (50s, Masculino).`.
  The setup path inserts `encounter[0].name` directly, while the later profile
  and dialogue correctly use `Motociclista`.
- **PT-082 — conservative failure dialogue is still raw English.** The same
  target was explicitly shown as `Conservador Sem Noção`. After choosing
  `A - Puxe conversa sobre política`, the issue prompt was Portuguese, but the
  rejection response rendered exactly `"Whatever." <se vira>,` instead of a
  Portuguese response. This is the generic conservative fallback in the
  issue-conversation branch, not an intentional English changelog or title.
- **Verified Portuguese branches:** the recruitment type list, pronoun/gender
  labels (`Masculino`, `Feminino`, `Não binário`, `Trans`), target profile,
  “Quer ouvir algo perturbador?” prompt, and meeting controls all rendered in
  Portuguese. Earlier in the same run a successful non-conservative dialogue
  reached the follow-up meeting and displayed localized text. A deterministic
  conservative *success* conversion was not reached because the conservative
  target rejected the low-persuasion founder; that success branch remains a
  coverage gap rather than a claimed defect.

## Headless narrow profile/management replay — 2026-07-28

This pass used only CLI `agent-browser` session `narrow-profile` against the
Portuguese Flutter web-server on port 7421. Chromium was launched with
`--headless=new --ozone-platform=headless`; viewport was set to 480×320. No
source files, cheats, or git state were changed.

- **PT-083 — fixed-width console clips management/profile content at narrow
  viewport.** The base screen screenshot (`/home/henry/tmp/agent-tmp/lcs-new-age/narrow-base.png`)
  cuts off `Dinheiro: $7`, the `TRANSPORTE` column, and the right side of the
  planning controls; the red `DEBUG` ribbon also covers the top-right frame.
  Review-assets (`narrow-review-assets.png`) clips the squad-name/activity
  columns. The profile (`narrow-profile.png`) truncates body-part labels and
  right-side `Liberal+30` statuses; its footer/help line is only partially
  visible. These are layout/responsiveness gaps, not Portuguese translation
  errors.
- **PT-084 — newspaper header collides with date at narrow width.** After
  advancing with `W` to 7 Jan 2023, the top row rendered `DINHEIRO   MAI7 de
  jan de 2023`; the date starts immediately after the final tab and is visibly
  overlaid/cut in `narrow-newspaper.png`. The fixed 80-column layout and DEBUG
  ribbon remain visible.
- **PT-085 — random newspaper article retains English fragments.** The same
  article buffer contained `o condenado rapist Angel Schumer`, `se barricou
  himself com o guarda`, and awkward mixed-language grammar (`captor ela`,
  `havia arrancou`). The screenshot shows the exact Portuguese article with
  raw English `rapist` and `himself`; this is a translation/catalog quality
  issue in a month-end newspaper route and should be localized or retranslated.
- **Verified management labels:** profile headings (`Perfil de um Liberal`,
  `Nascimento`, `Masculino`, `Cisgênero`), finance report, promotion screen,
  and task assignment screen all rendered in Portuguese at normal buffer
  text. No additional raw English labels appeared on those routes.

## Headless recruitment and police-site replay — 2026-07-29

This pass used only CLI `agent-browser` session `lcs-combat` against a fresh
Portuguese Flutter web-server on port 7420. Chromium was launched with
`--headless=new --ozone-platform=headless`; no headed browser, source edits,
cheats, or git mutations were used. A three-member squad reached the Seattle
police station (`Delegacia de Polícia, Nível 1`) and returned normally; the
station did not spawn an alarm encounter, so surrender/arrest/injury combat
branches remain unverified.

PT-086 (initially suspected recruiter-name mismatch) is withdrawn: source
inspection and the replay order show the Felix meeting was the founder's own
session, not Ariana's, so no defect is confirmed.

- **PT-087 — stale activity text leaks into the base banner after travel.** On
  the visit route, executing plans rendered `László Hayashi agiu com O
  Esquadrão do Crime Liberal em vez de Recrutando.` and then
  `Ariana Dench agiu com O Esquadrão do Crime Liberal em vez de Recrutando.o.`
  before arrival. The second line retains the previous activity's tail (`.o.`),
  indicating an uncleared row or width-overwrite bug. The eventual arrival text
  (`O Esquadrão do Crime Liberal chegou a Delegacia de Polícia.`) was localized.
- **PT-088 — female recruit receives masculine acceptance agreement.** When
  Ariana Dench joined after the final meeting, the Portuguese line was
  `Ariana Dench aceita, e está ansioso para começar.` It should use feminine
  `ansiosa` for this female character (or a gender-neutral construction).
- **PT-089 — pickup-line response still inserts the English profession label.**
  In a conservative College Student pickup-line conversation, the response
  line rendered `College Student responde` while the profile and candidate
  list used Portuguese `Estudante Universitário`. This is a separate generic
  creature-name call site from the already-fixed Biker recruitment setup.

## Headless post-fix verification — 2026-07-29

This verification used only CLI `agent-browser` session `root-verify` against
port 7422, launched with `--headless=new --ozone-platform=headless`. The
Portuguese title, founder setup, base, task assignment, and activity-help
routes were replayed through the DOM playtest buffer; no headed browser was
opened.

- The base and task-assignment screens now show localized activity text without
  the stale `Recrutando.o.` suffix. The code-level stale-row regression test
  also passes.
- The activity-help route still exposes a confirmed residual: selecting
  `A - Ativismo Liberal`, then `5 - Escrever Artigos do Guardião Liberal`,
  followed by `?`, renders the full English body beginning `The Liberal Guardian
  is the LCS's media presence...`. The heading and footer are Portuguese, but
  the concatenated body fragments are not translated. This is logged for the
  next localization pass.
- The earlier newspaper, hostage-template, pickup-name, and recruitment
  agreement fixes are covered by focused tests; the newspaper date/header and
  hostage output require a month-end/event fixture for another end-to-end
  replay.

## Headless broad route replay — 2026-07-29

This pass used only CLI `agent-browser` session `broad-routes` against a fresh
Portuguese Flutter web-server on port 7423. Chromium was launched with
`--headless=new --ozone-platform=headless`; no headed browser or source edits
were made. The fixture had `$7`, so intercity travel's `$100` option was
correctly disabled; the Seattle city/district/site menus were still exercised.

- **PT-091 — newspaper major-event template leaves the `{hell}` substitution
  in English.** After eight `W` advances, the 2 Jan 2023 newspaper rendered
  the localized article line `"Mas é engraçado pra hell. Além disso, você
  deveria experimentar esses salgadinhos..."`. The Portuguese catalog keeps
  `{hell}` but `major_event.dart` calls `LcsI18n.tr("hell")`; no Portuguese
  `hell` key exists, so the fallback is visibly raw English. This is separate
  from the previously fixed `rapist`/`himself` article and should use a
  translated profanity/neutral phrase while preserving the interpolation.
- **Verified route coverage:** the city travel planner (`Para onde o
  Esquadrão vai?`, city/district names, `Viajar para outra cidade`), Lushington
  department store (clothing/equipment menus), Dawkins pawn shop (weapons,
  ammo, tools, sell/status controls), Seattle courthouse and AM radio direct
  action screens all showed Portuguese controls and site labels. Long shop
  names remain internally ellipsized to the 80-column console, with no new
  untranslated control text observed.

## Headless help/newspaper fix verification — 2026-07-29

- PT-090 fixed: activity-help rendering now translates composed paragraphs
  through the locale catalog, with complete Portuguese entries for the long
  Guardian writing/streaming bodies and the remaining uncovered activity text.
  Focused console tests confirm both Guardian help routes contain Portuguese
  prose and no English body prefix; a diagnostic sweep covered every activity
  enum without finding the previously leaked English markers.
- PT-091 fixed: added `hell` and `[heaven]` Portuguese interpolation values as
  `caramba`. The drug-panic newspaper template now resolves the runtime
  `LcsI18n.tr("hell")` lookup instead of displaying raw `hell`; a regression
  test asserts the composed sentence contains no English fallback.
- Temporary playtest cheats and fixture-placement changes were removed before
  validation; checked-in debug flags remain disabled.

## Strict-headless help/title/save verification — 2026-07-29

This follow-up used only CLI `agent-browser` session `lcs-help-verify2` against
a fresh Flutter web-server on port 7421. Chromium was verified running with
`--headless=new --ozone-platform=headless`; no headed browser or desktop input
was used. The earlier help-body fix was rebuilt before this pass.

- **PT-094 — composed help translation still has uncovered fragments.** The
  fixed Guardian-writing and Liberal-Disobedience routes were fully Portuguese,
  but other composed paragraphs still splice in English. `3 - Fazer e Vender
  Arte` rendered `Se a arte rebelde vai out of style, you can always just draw
  people's fursonas.`; `1 - Solicitar Doações` rendered `...doar para um
  extremista cause.` and `Eles donating to politicians or whatever instead.`;
  `1 - Vender Brownies de Maconha` rendered `...mas também são risks.` and
  `Se você preso`; and `2 - Prostituição` rendered `...mas também on Street
  Smarts and Business`, `...out to get you`, and `Street Smarts is essential
  to avoid this`. These are residual fragment/catalog gaps in `help_system.dart`,
  not the already-fixed complete paragraph keys.
- **PT-083 re-confirmed:** the changelog overlay is localized at normal size
  (`Histórico de versões — LCS: Nova Era`, Portuguese English-only notice,
  localized version/date metadata), but at 480×320 the red `DEBUG` ribbon
  overlaps its top-right corner and the header ellipsizes to
  `Histórico de versões — LCS: N...`.
- **Verified title/save routes:** a disposable high-score fixture rendered
  Portuguese title totals and `Vitória mais rápida: Fevereiro/2023`; the high
  score table contained Portuguese ending/date/stat rows with no clipping at
  80×25. Save management, JSON export, and re-import of that exact download
  rendered localized headers and `Salvamento importado com sucesso.`; the
  imported save loaded back to the Portuguese base screen.

## Headless police siege/combat replay — 2026-07-29

This pass used only CLI `agent-browser` session `lcs-police-fight` against a
fresh Portuguese Flutter web-server on port 7432, with Chromium launched as
`--headless=new --ozone-platform=headless`. A local-only siege fixture was
enabled for the replay and restored to its original `false` settings before
shutdown; no production code or cheats were left changed. The police siege,
surrender, fight, body-part hit, and victory-summary branches were exercised.

- **PT-092 — combat injury prose contains an English fragment.** During the
  fight branch the buffer rendered `Laura Clavin acerta capacete de Policial da
  SWAT, hitting 3 vezes.` (a second hit showed `... armadura de perna direita
  ..., hitting 3 v` before the fixed-width line clipped). The surrounding
  sentence is Portuguese, so `hitting` is an untranslated template fragment.
  Body-part labels such as `capacete`, `perna direita`, and `estômago` were
  otherwise localized.
- **PT-093 — police combat roster concatenates armor and weapon columns.** The
  enemy rows rendered values such as `Armadura da SWATSubmet. MP5210 +160`,
  `Armadura da SWATM4         180 +160`, and
  `Armadura da SWATEspingarda 270 +160`. The armor label runs directly into
  the weapon name, making the fixed-width roster hard to parse even though
  both words are Portuguese. This is a layout/column-width defect exposed by
  the longer localized labels.
- **Verified routes:** pressing `G` completed the surrender route with
  Portuguese prompts; pressing `F` produced localized attack/body-part text
  and ended with `* * * * * VITÓRIA * * * * *`, followed by
  `As autoridades foram repelidas — por enquanto.` and
  `Pressione C para Continuar Liberalmente.` No arrest summary appeared in
  this deterministic run, so arrest-specific copy remains unverified.

## Headless composed-help follow-up — 2026-07-29

- PT-094 fixed: a second headless help sweep found residual English fragments
  inside the Art sales, donation, brownie-selling, and prostitution paragraphs
  even after the first composed-help pass. Complete paragraph catalog entries
  now cover those bodies, preserving Portuguese grammar and avoiding fragment
  concatenation. The all-activity regression sweep asserts the original English
  prefixes and the reported residual sentences are absent.

## Targeted narrow/month-end replay — 2026-07-29

This follow-up used only CLI `agent-browser` against a fresh local Flutter
web-server on ports 7435 and 7436. Chromium was launched with
`--headless=new --ozone-platform=headless`; the viewport was explicitly set to
480×320. Temporary siege/funds fixture flags were used only while creating the
disposable founder and were restored to `false` before shutdown.

- **PT-083 partial fix verified:** fresh rebuild port 7436 confirmed that the
  narrow changelog screenshot no longer contains the red Flutter `DEBUG`
  ribbon, and the responsive title now fits fully as
  `Histórico de versões — LCS: Nova Era`. The modal body still extends below
  the 480×320 viewport (the lower content/footer is clipped), so the broader
  narrow-layout item remains open for responsive/modal sizing. The title
  screen also clips the version line at the bottom edge at this viewport.
- **PT-084 date/header replay:** the Portuguese base header rendered
  `SEA — Sem-teto, 7 de jan de 2023` and, after the month rollover,
  `SEA — Sem-teto, 1 de fev de 2023` without overlapping adjacent text. The
  media overview had no generated articles in this disposable run, so a
  populated newspaper page remains unverified end-to-end; the deterministic
  cable-news header regression test remains the stronger coverage for the
  two-digit-date collision.

## Strict-headless funded travel/arrest replay — 2026-07-29

This targeted replay used only CLI `agent-browser` session
`arrest-travel-20260729` against a local Flutter web-server on port 7440.
Chromium was launched with `--headless=new --ozone-platform=headless`; no
headed browser or desktop input was used. Temporary local fixtures supplied
funds and a wanted founder, and all debug flags/fixture edits were restored to
their original disabled state before shutdown.

- **Intercity travel verified:** the funded planner displayed all destinations
  (`Seattle, WA`, `New York, New York`, `Los Angeles, CA`, and `Washington, DC`)
  with Portuguese descriptions. New York, Los Angeles, and Washington district
  lists were opened successfully; district labels such as `Ilha de Manhattan`,
  `Grande Hollywood`, and `National Mall` were localized and no raw English
  control text appeared.
- **Arrest summary verified:** after entering the deterministic police siege
  and choosing surrender, the summary rendered `A polícia confisca tudo,
  incluindo armas do Esquadrão.`, `Prendem Teddy Toole.`, the localized funds
  confiscation line, and localized fortification/disarmament lines. No English
  fragments were observed.
- **PT-095 new residual:** the generated warehouse name `Old Church` was
  rendered as `Igreja Velho` in `A polícia cercou o Igreja Velho!` and
  `Igreja Velho` in the siege prompt. Portuguese requires feminine agreement
  (`Igreja Velha`), and the article should be `a`, not `o`; the generic
  adjective translation (`Old` → `Velho`) cannot preserve site-name gender.

## Strict-headless recruitment/profile conversation sweep — 2026-07-29

This fresh replay used only CLI `agent-browser` session
`recruit-sweep-20260729` against a local Flutter web-server on port 7451.
Chromium was launched with `--headless=new --ozone-platform=headless`; no
headed browser or desktop input was used.

- **Recruitment routes verified:** the profession selector, candidate list,
  female candidate profile, political response, and follow-up meeting all
  rendered Portuguese. Candidate rows showed `(20s, Feminino)` and the profile
  showed `Nascimento ... (Idade 18, Feminino, Cisgênero)`; the neutral meeting
  prose did not reproduce the earlier masculine `pronto`/`ansioso` issue.
- **Profile routes verified:** skill/body labels and the crime table were
  translated and width-ellipsized without raw English rows; `CIMA BAIXO - Mais
  Info` was localized.
- **PT-096 new residual:** a failed pickup-line response rendered
  `College Student: responds` followed by `"Você está errado."`. The same
  candidate is shown elsewhere as `Estudante Universitário`, so both the
  profession name and `responds` verb bypass localization.
- **PT-097 new residual:** the dating follow-up header rendered
  `Vendo Lorraine Symington, College Student, Seattle, WA`; the generated
  profession label must use the localized `Estudante Universitário` value.

## Strict-headless police post-arrest verification — 2026-07-29

A disposable police fixture was replayed in CLI `agent-browser` session
`police-postarrest-20260729` against port 7452 with Chromium
`--headless=new --ozone-platform=headless`. The fixture supplied funds and a
wanted founder, then was removed with all flags restored to `false`.

- The siege announcement used the corrected gender-neutral form
  `A polícia cercou este local: Frigorífico Abandonado!`.
- The surrender summary showed `A polícia confisca tudo, incluindo armas do
  Esquadrão.`, `Prendem Asher Tsui.`, localized funds confiscation, and
  localized fortification, trap, and anti-aircraft-gun teardown lines. No raw
  English text remained in the post-arrest screen.

## PT-095 fix — 2026-07-29

The generated-site naming path now prefers an exact full-name catalog entry,
so `Old Church` resolves to `Igreja Antiga` instead of composing a masculine
adjective with a feminine noun. The Portuguese police-surrounds template now
uses `A polícia cercou este local: {location}!`, avoiding an incorrect hardcoded
article for other generated site names. `test/location/site_translation_test.dart`
covers both regressions.

## Strict-headless media/month-end replay — 2026-07-29

This pass used only CLI `agent-browser` session `lcs-media-month2` against a
fresh Flutter web-server on port 7422. Chromium was verified with
`--headless=new --ozone-platform=headless`; no headed browser or source/debug
changes were used. A current Portuguese save was imported, then the media
overview, populated article detail, month-end legislative agenda/votes, finance
report, title screen, and changelog were exercised.

- **PT-097 addendum — populated CCS article has malformed Portuguese fragments.**
  The populated CCS newspaper article replay (3 Jan 2023) rendered the exact
  fragments `o CCS envolvido em homicídio...` (missing `se`),
  `o aumento posse de armas...` (missing `da`), and
  `saiu em um ataque suicida` (awkward construction). These are in the article
  body rather than the newspaper chrome and need a context-aware Portuguese
  rewrite.
- **PT-098 — The Daily article frame keeps English chrome and clips its right
  edge.** The 14 Jan 2023 populated article detail rendered the localized row
  `FRAUDE FINANCEIRA`, localized subheadline
  `Investidores perdem bilhões à medida que Unicard Participações desmorona.`,
  and localized footer, but the newspaper page still showed English
  navigation/masthead text (`USA`, `WORLD`, `BUSINESS`, `ARTS`, `LIFESTYLE`,
  `OPINION`, `THE DAILY`, `FOR JUST $1/WK`, `SUBSCRIBE TO`,
  `AMERICA'S NEWSROOM`). At the fixed 80-column page width the right-side
  masthead lines are clipped (`SALA DE NOTÍCIAS DA...`/equivalent text ends at
  the console boundary), making the article header visibly incomplete.
- **Month-end verification:** the legislative agenda, Câmara/Senado vote
  totals, president line, and monthly finance report all rendered in Portuguese
  without a new raw-English or clipping defect. The title/changelog routes also
  retained their existing localized notice/metadata behavior.

## Strict-headless narrow/normal layout sweep — 2026-07-29

This fresh sweep used only CLI `agent-browser` sessions against port 7438,
with Chromium launched as `--headless=new --ozone-platform=headless`. The
Portuguese routes were exercised at the default wide viewport and at 480×320;
no production code, debug flags, or fixtures were changed.

- **Title/changelog:** wide title and changelog were fully readable. At 480×320
  the title menu's right column extends past the viewport (`Carregar e
  gerenciar salvamentos` is clipped) and the version line is cut at the bottom.
  The changelog title itself remains fully visible after the LayoutBuilder fix.
  High scores and save-management screens were unavailable in this disposable
  run because there were no scores or saves; import was not invoked because it
  requires a file-picker fixture.
- **Base/review/profile:** the narrow base footer loses the final
  `B - Agentes Infiltrados` row; review and squad-formation headers truncate
  `O Esquadrão do Crime Liberal` to `O Esquadrão do Crime Lib...`. The profile
  repeats the known footer separator defect, rendering `CIMA BAIXO - Mais Info`
  without `/`; body-part/skill labels are ellipsized but no raw English text
  appears. These are the existing PT-071/PT-083 fixed-width layout residuals.
- **Department store:** wide controls were Portuguese. At 480×320 the visiting
  header/date is clipped (`Visitando Loja de Departamentos de Kim...`), and the
  status controls collide/truncate as `0 - Mostrar o status Liberal do esqua...`
  and `# - Verificar o status de um Liberal do...` (the PT-061/062 residuals).
- **Courthouse:** the wide direct-action map and help were localized. At
  480×320 the map and bottom movement/action legend are clipped by the viewport,
  but the visible controls remain Portuguese.
- **Media overview:** wide and narrow empty overviews showed Portuguese headers,
  controls, and impact copy without a new defect. No generated article was
  available, so populated newspaper rows remain a separate fixture gap.

Evidence screenshots are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/` with `sweep-*` names.

## Strict-headless fixes — 2026-07-29

The confirmed PT-084, PT-096, PT-097, PT-097 addendum, and PT-098 findings
were fixed and covered by focused tests. The media overview now reserves
separate columns for Portuguese two-digit dates and publication names; pickup
responses localize both generated profession labels and response verbs; dating
headers translate profession types; CCS article fragments compose as
`se envolveu em ...`, `o aumento da posse de armas ... de vez.`, and a natural
suicidal-rampage sentence; and The Daily's navigation, masthead, and
subscription copy use Portuguese catalog entries with right-aligned bounded
rendering. Catalog sharding and interpolation validation pass after the edits.

## Strict-headless month/combat replay — 2026-07-29

This replay used a separate Flutter web-server on port 7462 and only CLI
`agent-browser` session `month-combat`. The browser process was verified with
`--headless=new --ozone-platform=headless`; no production code or debug flags
were changed by the playtester. A fresh Portuguese game was advanced through
January and February month-end reports, populated media/article detail, and a
third-month article route.

- **PT-099 — filler city retains a raw red color marker in article body.** The
  drug-study article ended with the visible text `&RRichmond, California` in
  the body (`month-combat-article3.png`). `generateFiller()` emits the
  `{city:red}` marker, but `displayNewsStory()` writes wrapped lines through
  `addstr()` instead of the inline-color renderer, so the marker is not
  consumed. This is a display artifact independent of the article's
  translation and can occur on any article that reaches filler text.
- **PT-100 — drug-study article leaks English and has agreement errors.** The
  same article rendered `legalizing psilocybin` instead of a Portuguese verb,
  `o uso regular de psilocibina leva a redução de estresse e ansiedade`
  (missing the crasis in `leva à redução`), and
  `com alguns participantes chegando a relatar que aprendeu a se comunicar`
  (plural `participantes` with singular `aprendeu`). Evidence:
  `month-combat-article3.png`; source route is `View.drugs` in
  `lib/newspaper/major_event.dart`.
- **PT-101 — generated retirement think-tank name had English word order.**
  The retirement article rendered `Nacional Liberdade Associação`, produced
  from independently translated `National`, `Liberty`, and `Association`
  tokens. Idiomatic Brazilian Portuguese needs a composed template such as
  `Associação Nacional da Liberdade`. Evidence: `month-combat-after20.png`.
  The fixer began a dedicated generated-name template after this replay.
- **PT-102 — agenda intro still used the hyphenated form.** The origin-story
  red line rendered `agenda radical Arqui-Conservadora`, while the same screen
  and project terminology use `extrema-direita Arqui Conservadora`. Evidence:
  `month-combat-child-10.png`. The fixer corrected the catalog variants after
  this replay; retain a regression assertion for the exact spacing/case.

Month-end agenda, vote totals, finance report, media columns, and article
navigation otherwise rendered in Portuguese in this pass.

## Strict-headless recruitment/investment follow-up — 2026-07-29

- **PT-103:** the funded invest-in-location menu showed the W fortification
  action in English because the dynamic action parameter bypassed the catalog.
  The action variants now translate before insertion into the localized option
  template.
- **PT-104:** a failed female recruitment branch concatenated the translated
  rejection sentence directly after the preceding line (`...Direitos
  Trabalhistas.Raven Woods acha...`). Both rejection lines now render through
  explicit row/column coordinates, preserving the required line break.

## PT-099–PT-102 fixes — 2026-07-29

- PT-099 fixed: newspaper story rendering now consumes inline color markers
  such as `&R` while drawing wrapped article lines, so generated filler no
  longer exposes markup in the visible body. A console regression test covers
  the marker parser path.
- PT-100 fixed: the drug-study catalog now translates the dynamic
  `legalizing`/`decriminalizing`/`subsidizing` values, uses idiomatic
  `uma redução do estresse e da ansiedade`, and keeps participant outcomes
  plural (`aprenderam`, `descobriram`, and related branches).
- PT-101 fixed: retirement articles use a locale-aware generated think-tank
  template (`Associação Nacional da Liberdade`-style order) instead of joining
  independently translated tokens in English order.
- PT-102 fixed: both agenda-origin catalog variants now use the requested
  `Arqui Conservadora` capitalization and spacing.

## Strict-headless title/save/high-score replay — 2026-07-29

This pass used a fresh Flutter web-server on port 7461 and only the CLI
`agent-browser` session `save-routes`, launched with
`--headless=new --ozone-platform=headless`. No production code or debug flags
were changed. The game was selected in Portuguese, advanced to the base mode,
autosaved, and reloaded through the title-screen `C` route.

- Save management at the wide viewport and 480×320 rendered localized headers
  (`DATA NO JOGO`, `LÍDER DO LCS`, `ÚLTIMO ACESSO`, `VERSÃO`), row dates, export
  text, load/delete/export actions, delete confirmation, and return prompts.
  Export produced `lcsna_amy_2026_07_29-01_41_46-041.json` in the headless
  browser download directory. Reloading the save returned to a Portuguese base
  screen with Portuguese date and activity labels.
- A temporary score fixture was written only to this browser session's
  `localStorage`, then removed before shutdown. The high-score page rendered
  the localized ending, slogan, stat labels, and universal statistics at both
  480×320 and 400×300. At 400×300 the bottom return prompt is below the viewport;
  this is the existing narrow fixed-console residual (PT-083), not a new
  translation defect.
- The browser file-picker import route cannot be exercised end-to-end in strict
  headless Chromium because the Flutter file-picker opens a native picker and
  does not expose a DOM `<input type=file>`. Keep a real browser/file-fixture
  import replay on the follow-up list.

Evidence screenshots are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/save-routes/`.

## Strict-headless recruitment/investment continuation — 2026-07-29

The same isolated Portuguese replay continued through a factory compound,
task assignment, recruitment, and a female Estudante Universitário meeting.
Chromium remained CLI-only with `--headless=new --ozone-platform=headless`.

- **PT-103 — one compound-upgrade action still leaks English.** The disabled
  `Investir neste local` menu rendered
  `W - Fortify the compound for a siege (US$ 2.000)`, while all neighboring
  camera, trap, generator, solar, anti-aircraft, studio, hacker-den,
  business-front, and ration options were Portuguese. The static `W -
  {action}` wrapper is translated, but the `fortifyText` parameter is inserted
  without translation. Evidence: `month-combat-invest.png`; source
  `lib/basemode/invest_in_location.dart`.
- **PT-104 — failed recruitment branch concatenates sentences.** After the
  female candidate discussion failed, the screen displayed
  `Trish Yoo explica as visões dela sobre Direitos Trabalhistas.Raven Woods
  acha que Essa coisa toda foi um erro.`, with no whitespace or line break after
  the first period. Evidence: `month-combat-recruit-accept2.png`; source
  `lib/daily/recruitment.dart` writes the second sentence with `addstr()` at
  the current cursor instead of moving to the next row.

The recruitment profession list, pronoun/gender rows, candidate dialogue,
acceptance options, and month-end reports otherwise rendered Portuguese.

## Strict-headless second month/media replay — 2026-07-29

This pass used only CLI `agent-browser` session `month-media-next` against a
fresh Flutter web-server on port 7615, with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless`. No production source or
debug flags were changed. A fresh Portuguese game was advanced through the
January and February month-end legislative agenda/votes/finance reports, then
the populated media overview and article details were opened in March. All
evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/month-media-next/`.

- Month rollover was clean: `31 de jan de 2023` → `1 de fev de 2023`; agenda
  headings, resolution text, chamber/presidential vote labels, and finance
  categories were Portuguese and fit the 80-column page.
- The populated overview displayed five Portuguese headlines and Portuguese
  dates/impact values without row collisions. Article detail exposed four
  residuals promoted to PT-118–PT-121 in `findings.md`:
  `Gun Control`, `Death Penalty`, and `Housing` impact labels remained raw
  English; the death-penalty article contained `it will be seeking the death
  penalty`; the housing article rendered `casas.Scottsdale, AZ` with the
  filler city attached to the prior sentence; and the pollution article used
  `O Família Caridade Parceria publicou`, an English-order/gender-invalid
  generated organization name.
- Other observed article prose, publication chrome, month-end reports, and
  media rows were Portuguese. OCR accent substitutions are not findings; each
  listed defect is visible in the corresponding screenshots.

## Strict-headless month-end/agenda replay — 2026-07-29

This replay used a fresh Flutter web-server on port 8792 and only CLI
`agent-browser` session `lcs-month-media`, with `AGENT_BROWSER_HEADED=0` and
`--headless=new --ozone-platform=headless`. No production code or debug flags
were changed. A Portuguese game was started from scratch, advanced from 1 Jan
2023 through the end-of-month agenda processing to 1 Feb 2023, and the media,
agenda, polling, active-law, and financing screens were inspected. Evidence is
retained under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/month-media/`.

- **PT-113 — public-interest levels leak English.** Agenda `L` page 2 showed
  Portuguese issue labels and percentages, but each interest column displayed
  `Low` in English (with `None` already translated as `Nenhuma` in the same
  page). The source branch in `lib/basemode/liberal_agenda.dart` directly draws
  `Huge`, `High`, `Moderate`, `Low`, `Minimal`, and `None`; all six should be
  localized before insertion. Screenshot: `agenda-page2.png`.
- **PT-114 — long Portuguese agenda text clips at the console edge.** Polling
  page 3 and active-law pages 4–5 draw long translated sentences beyond the
  80-column console; their right-hand tails are visibly missing at 1024×768
  (for example the page-5 Social Security sentence and page-3 polling rows).
  This is a layout regression distinct from the known 480×320 PT-083 narrow
  viewport clipping: the normal-width console itself needs fitting/wrapping for
  long localized agenda descriptions. Screenshots: `agenda-page3.png`,
  `agenda-page4.png`, and `agenda-page5.png`.

The month-end resolution, finance report, February 1 date header, agenda
legend, and empty media overview were otherwise Portuguese. No populated
newspaper story was generated in this no-event run, so media-detail coverage
remains a deterministic follow-up.

## Fresh strict-headless title/save/corrupt-save replay — 2026-07-29

This replay used a new Flutter web-server on port 7463 and only CLI
`agent-browser` session `save-routes-fresh`, with
`AGENT_BROWSER_HEADED=0` and `--headless=new --ozone-platform=headless`.
No production code or debug flags were changed. Title, changelog, a seeded
high-score overlay, save-detail management, and 480×320/400×300 layouts were
rechecked after the latest fixes.

- Wide and narrow title/changelog/high-score/save screens showed Portuguese
  labels with no new English leaks or horizontal clipping. The high-score
  page's return prompt remains below a 400×300 viewport, matching the existing
  PT-083 fixed-console limitation.
- A valid-but-corrupt IndexedDB save (`saveData: {}`) exercised the broken-save
  row, detail menu, and crash-report route. The row showed `Erro` and
  `Erro - Falha esperada`, the detail title was
  `Gerenciar Salvamento Corrompido com Cautela`, and the crash report/prompt
  were localized; the technical Dart stack trace is intentionally retained for
  debugging. The temporary save, score fixture, browser session, and server
  were removed after capture.
- **PT-105 — crash-restart prompt is understandable but omits the object and
  sounds slightly unnatural.** The visible Portuguese line was
  `Pressione qualquer tecla para reiniciar após esta interrupção Conservadora.`
  The source says “restart the game,” so a context-complete wording such as
  `Pressione qualquer tecla para reiniciar o jogo após esta interrupção
  Conservadora.` should be considered for the next translation cleanup.

Evidence screenshots are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/save-routes-fresh/`.

## Fresh strict-headless recruitment conversion replay — 2026-07-29

This follow-up used the same CLI-only Chromium configuration (`AGENT_BROWSER_HEADED=0`,
`--headless=new --ozone-platform=headless`) against a fresh Portuguese web-server
session. Paid-course skill descriptions, the Sally profile, candidate discovery,
and multiple recruitment meetings were replayed after the latest fixes; no raw
English strings or new clipping appeared in those routes.

- **PT-106 — failed recruitment dialogue has feminine-agreement error.** A female
  `Estudante Universitário` candidate (Milena Straub) displayed
  `Milena Straub não está convencido que Sally ... realmente` after the casual
  politics option. The candidate is explicitly marked `Feminino` in the same
  session, so `convencido` should be `convencida` or replaced with a neutral
  phrasing. Evidence: `lcs-recruit-skill/meet-b1.png`; source string is the
  `"{recruit} isn't convinced {recruiter} really understands the problem."`
  branch in `lib/daily/recruitment.dart`.

The conversion option remained correctly disabled until eagerness reached the
required threshold; no additional conservative-branch leak was observed in
this replay.

## Strict-headless vehicle/travel replay — 2026-07-29

This pass used a fresh Flutter web-server on port 7471 and only the CLI
`agent-browser` session `vehicle-travel`, with `AGENT_BROWSER_HEADED=0` and
`--headless=new --ozone-platform=headless`. No production code or debug flags
were changed. A Portuguese game was started from scratch, the founder was
assigned to `Roubar um Carro`, a Pickup Truck was stolen, and the squad was
sent to a Plastic Factory.

- **PT-106 — car-theft break-in result is raw English.** After selecting
  `B - Quebrar a janela`, the result line was `Nate Yuaaaa smashes the window.`
  The surrounding menu, vehicle name, and prompts were Portuguese. Evidence:
  `vehicle-window.png`; source `lib/daily/activities/car_theft.dart`.
- **PT-107 — car-theft hotwire failure is raw English.** Selecting
  `A - Fazer ligação direta no carro` produced `Nate Yuaaaa digs around in the
  steering column, but the car doesn't start.` in English. Evidence:
  `vehicle-hotwire.png`; source `lib/daily/activities/car_theft.dart`.
- **PT-108 — key discovery keeps an English profanity in Portuguese mode.** A
  successful key search displayed `Holy Shit! Nate Yuaaaa encontrou as chaves
  in the glove compartment!`; only the location fragment was localized.
  Evidence: `vehicle-keys.png`; source `lib/daily/activities/car_theft.dart`.
- **PT-109 — vehicle assignment rows overlap.** `V - Veículos` rendered two
  stolen vehicles on one row as `A - Veículo roubado: EsporB - Veículo roubado:
  Pickup Azul`, with the first vehicle name cut/overwritten by the second
  option. Evidence: `vehicle-menu.png`; source `lib/basemode/base_actions.dart`
  (`printCars` uses two fixed 26-column cells without fitting the localized
  vehicle label).
- **PT-110 — site header leaks the English generated site name.** After
  travelling to `Fábrica de plástico`, the top status header read
  `Visitando Plastic Factory`, while the destination/menu and arrival message
  were Portuguese. Evidence: `vehicle-site-actions.png` and
  `vehicle-after-message.png`; source is the visit header path in the base/site
  visit display.

The vehicle-type picker, approach/break-in prompts, key location, city/district
selector, and arrival message otherwise rendered Portuguese. Intercity travel
was not reached because the fresh run had only US$7 versus the US$100 ticket.

## Vehicle/recruitment follow-up fixes — 2026-07-29

- PT-105 fixed: corrupt-save restart/continue prompts now name the game in
  Portuguese (`reiniciar/continuar o jogo`).
- PT-106 fixed: the female-candidate rejection branch now uses the neutral
  `não acredita que ... entenda` wording, removing the masculine `convencido`
  agreement error.
- PT-107/PT-108 fixed: car-theft break-in success variants and all selected
  hotwire-failure fragments are translated before insertion into the actor
  template.
- PT-109 fixed: key-search locations and expletives, including the profanity
  policy variants, now use catalog entries instead of raw English fragments.
- PT-110 fixed: `V - Veículos` now fits each localized vehicle option into a
  38-column cell and moves its footer below the 18-row vehicle page, avoiding
  adjacent-option overwrite and footer collision.
- PT-111 fixed: `Visiting {site}` translates known catalog site names while
  leaving custom/player-renamed sites untouched.
- The hostage-slaying article template also now keeps every placeholder while
  using more idiomatic Portuguese (`o {rapist} condenado ... trancando
  {perpPronounSelf} lá dentro`).
- PT-112 fixed: removing the English-sized `y2: 14` cap from the conservative-era
  intro lets the longer Portuguese paragraph finish before the next paragraph
  begins. The dedicated conservative-era regression test now passes.

Focused regression suites for these fixes pass in strict Portuguese mode;
the remaining open tracker items are the known narrow-console clipping and
headless file-picker import coverage gaps documented above.

## Fresh strict-headless combat/action replay — 2026-07-29

This pass used a fresh Flutter web-server on port 7485 and only CLI
`agent-browser` session `combat-actions`, launched with
`AGENT_BROWSER_HEADED=0` and `--headless=new --ozone-platform=headless`. No
production source or debug flags were changed. A Portuguese game was started,
the founder was sent through recruitment, a dating meeting, and a Plastic
Factory site visit. Evidence screenshots are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-actions/`.

- **PT-115 — pickup-line innuendo is literal/unnatural.** Selecting
  `B - Mande uma cantada` displayed `"Quer ver algo inchar?"` for the English
  source `"Do you want to see something swell?"`. The conversation context is
  a flirtatious sexual double meaning, but `inchar` reads as a literal bodily
  swelling. The same issue is present in the related `I'd love to see...` and
  `I'd rather feel/let you feel...` catalog entries. Evidence:
  `combat-actions/recruit-swell.png`; catalog entries are in
  `app_pt_BR_part09.arb`, `part25.arb`, and `part32.arb` (with the matching
  `part03.arb` variant).
- **PT-116 — activity fallback uses a gerund where Portuguese needs an
  infinitive.** After executing plans while the founder's activity was
  `Recrutando`, the daily result read `Rich Nevinson agiu com o Esquadrão do
  Crime Liberal em vez de Recrutando.`. This is a contextual interpolation of
  the `Recruiting` label into `{activity}`, so translating the standalone label
  alone cannot make the sentence grammatical; use `em vez de recrutar` or a
  dedicated contextual phrase. Evidence:
  `combat-actions/acted-instead-recruiting.png`; source path is
  `lib/daily/advance_day.dart` and the template catalog entry is
  `app_pt_BR_part27.arb`.

The route reached the site-mode map and exposed translated movement/action
legend text. A longer combat encounter (car chase/tooth injury/hostage siege)
was not deterministic in this normal-cost run; the browser session and the
Flutter server were closed after capture, with no source fixtures left behind.

## Fresh strict-headless title/import/narrow replay — 2026-07-29

This pass used a fresh Flutter web-server on port 7481 and only CLI
`agent-browser` session `import-narrow`, launched with `AGENT_BROWSER_HEADED=0`
and `--headless=new --ozone-platform=headless`. No production source or debug
flags were changed. Title, language selection, new-game setup, founder screen,
and narrow 480×320/400×300 layouts were inspected in Portuguese. Evidence is
retained under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/import-narrow/`.

- Title and language-selection routes remained Portuguese after a fresh
  browser session; the 400×300 title and new-game screens showed the same
  fixed-console edge/footer clipping already tracked as PT-083, with no new
  translation leak.
- Pressing `I - Importar um salvamento` reached the Flutter file-picker call,
  but strict-headless Chromium exposed no DOM `<input type=file>` and the
  native picker cannot be driven by `agent-browser`; the screenshot therefore
  remains on the title screen. This confirms the existing headless import
  coverage gap rather than a new product defect. A browser-supported fixture or
  real user-assisted picker run is still required to validate import success.
- Portuguese founder setup text and the initial event log rendered without a
  new English leak. No production fixtures or source flags were left changed.

## Strict-headless post-fix verification — 2026-07-29

The affected agenda route was replayed against a fresh Flutter web-server on
port 7591 using CLI-only Chromium with `AGENT_BROWSER_HEADED=0`,
`--headless=new`, and `--ozone-platform=headless`. Pages 2–5 now show
`Baixo`, `Nenhuma`, and other Portuguese public-interest labels; no raw
English intensity labels remain. Long polling and active-law rows are bounded
with visible ellipses while the interest column remains intact. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-verify/agenda-page{2,3,4,5}.{txt,png}`.

The pickup-line and recruiting fallback corrections are covered by the same
strict-headless route evidence from `combat-actions/` plus focused runtime
regression tests: the former now uses `uma coisa crescer`, and the latter now
renders `em vez de recrutar`. No new translation or layout issue was found in
this verification pass; PT-083 narrow-console clipping and the native file
picker limitation remain the documented residuals.

## Strict-headless recruitment-context replay — 2026-07-29

This pass used a fresh Flutter web-server on port 7604 and only CLI
`agent-browser` session `recruit-context-20260729`, with
`AGENT_BROWSER_HEADED=0` and `--headless=new --ozone-platform=headless`. No
production source or debug flags were changed. The Portuguese route selected
the `Estudante Universitário` profession, generated a candidate list, opened
a female candidate profile, and completed the political conversation branch.
Evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/recruitment-context/`.

- The profession selector, generated candidate rows, profile header, skill
  labels, political opener, and candidate response were all Portuguese. The
  meeting rendered `Hiro McCorkell diz, "Quer ouvir algo perturbador?"` and
  `Estudante Universitário responde, "O quê?"`; no raw `College Student`,
  `responds`, or other English interpolation leaked.
- The route did not reproduce PT-066. No new translation or layout issue was
  found in this recruitment-context branch.

## Strict-headless police-alarm/help replay — 2026-07-29

This replay used a disposable local Flutter web-server on port 7465 and only
CLI `agent-browser` session `police-help-20260729`, with
`AGENT_BROWSER_HEADED=0` and Chromium arguments
`--headless=new --ozone-platform=headless`. Temporary `debugSiege` and
`megaFounderCheat` flags created the deterministic police-siege fixture and
were restored to `false` before shutdown. Evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-help/`.

- **PT-065 verified fixed:** pressing `?` from the site map rendered
  `=== Ação Direta ===`, fully Portuguese guidance paragraphs, and
  `Pressione qualquer tecla para continuar.`. The buffer contained no
  `=== Direct Action ===` or English body text. Screenshot/evidence:
  `direct-action-help.png` and `help-buffer.txt`.
- **PT-064 alarm replay:** the deterministic route reached
  `A polícia cercou este local: Frigorífico Velho!`, the surrender warning,
  and the police-siege roster. The roster rendered `Policial da SWAT`,
  `Armadura da SWAT`, and Portuguese action controls; no raw English officer
  type or stale `Saque no chão!` legend tail appeared. The random
  `Chief of Police` unit did not spawn in this fixture, so its catalog-backed
  path remains worth keeping in future regression coverage. Evidence:
  `police-surrounded.png`, `siege-roster-buffer.txt`, and `siege-map.png`.

No new translation or layout defect was found in these two routes. The
browser session and only the disposable Flutter server were closed after the
capture; no source/debug fixture changes remain.

## Strict-headless profile/classes replay — 2026-07-29

This focused Portuguese replay used a fresh Flutter web-server on port 7603
and only CLI `agent-browser` session `profile-next`, with
`AGENT_BROWSER_HEADED=0` and `--headless=new --ozone-platform=headless`. The
shared debug flags remained `false`; no production source was changed.

- The active Liberal profile showed Portuguese body-part, wound/health,
  clothing, vehicle, task, crime, and skill vocabulary. Long body-part and
  crime labels were bounded with ellipses and did not collide with the value
  columns. Evidence: `profile-main.{txt,png}` and `profile-more.png` under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-classes-next/`.
- The paid-class selector listed all 18 skills with Portuguese descriptions
  (`Pintura, teoria das cores e mais.`, `Informática e programação.`,
  `Manutenção e uso seguro de armas de fogo.`, etc.). No raw English sentence
  or clipped description appeared. Evidence: `classes.{txt,png}` in the same
  directory.
- A deterministic Chief-of-Police encounter was not attempted with altered
  flags in this pass; the existing police fixture remains the regression path.
  Empty high scores correctly remained on the localized title screen.

No new translation or layout issue was found. The headless browser session and
the disposable Flutter server were closed after capture.

## Strict-headless high-score/context replay — 2026-07-29

This replay used a fresh Flutter web-server on port 7610 and only CLI
`agent-browser` session `save-highscore`, with `AGENT_BROWSER_HEADED=0` and
Chromium arguments `--headless=new --ozone-platform=headless`. The high-score
catalog was seeded through browser-local storage so the otherwise empty screen
could be exercised without changing production code. Evidence is retained
under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/save-highscore/`.

- The Portuguese title and high-score screens fit the 80-column console. Score
  labels, outcome sentences, and seeded January–April month names were
  Portuguese, with no raw English or column collision.
- A May score exposed PT-117: the long-form sentence rendered `em mai de 2024`,
  reusing the short-date abbreviation. The catalog now uses `Maio` for the
  `getMonth` context, while `getMonthShort` retains `mai`; the focused month
  regression test covers the distinction.
- No additional high-score translation or layout issue was reproduced. The
  browser session and disposable server were closed after capture.

## Strict-headless shops/travel/context replay — 2026-07-29

This pass used a fresh Flutter web-server on port 7620 and only CLI
`agent-browser` session `shops-travel-next2`, with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless`. No production source or
debug flags were changed. Evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/shops-travel-next2/`.

- The fresh Portuguese title, new-game choices, city/district travel lists,
  vehicle selector, Walden department-store clothing/equipment menus, and
  Yamada pawn-shop menu were localized and stayed within the 80-column
  console. The pawn-shop header showed `Casa de Penhores`; the longer visit
  header used an intentional ellipsis (`Visitando Yamada — Casa de penhores e …`)
  rather than a raw English site name, so PT-062 was not newly reproduced.
- Seeded high scores rendered one contextual residual, `A ELITE Liberal`, in
  the otherwise Portuguese high-score overlay (`high-scores-seeded.txt/png`).
  This is not an OCR artifact: the hidden console buffer contains the exact
  all-caps `ELITE` token. It is understandable and may intentionally preserve
  the source emphasis, but PT-131 tracks the open decision between `A ELITE
  Liberal` and the idiomatic `A Elite Liberal`. The changelog correctly
  displayed a Portuguese notice while retaining English-only release notes per
  product scope.
- The male founder route exposed a gender-agreement defect in the high-school
  choice: `e eu me tornei completamente gótica` (`high-school.txt`). The
  source phrase is gender-neutral, so this should avoid feminine agreement or
  select the founder's grammatical gender (`gótico` for the male replay).
- A generic daily activity fallback rendered `Hiro Németh agiu com O Esquadrão
  do Crime Liberal em vez de Causando Problemas.` (`walden-result1.txt`). The
  Portuguese gerund cannot follow `em vez de`; a contextual infinitive such as
  `em vez de causar problemas` is required. This is distinct from the already
  fixed recruiting-specific fallback (PT-116).

No pawn-shop raw English or column-overlap defect was confirmed in this route;
all temporary browser/server processes were closed after capture.

## Strict-headless fresh media replay — 2026-07-29

This verification used only CLI `agent-browser` sessions `fix-replay` and
`fix-replay2` against disposable Flutter web-servers on ports 7625 and 7626.
Both browser launches were forced with `AGENT_BROWSER_HEADED=0` and
`--headless=new --ozone-platform=headless`; no headed window was used. A
Portuguese campaign was created from scratch, advanced to 25 January, and its
populated media archive and article details were inspected through the DOM
buffer bridge. Evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/` as
`fixes-replay-*.json` and `fixes-replay2-media.json`.

- The fixed media overview rendered Portuguese headlines, dates, sources, and
  impact values. Article A had fully localized body prose.
- Before the final catalog additions in this pass, article B/C exposed raw
  `Taxes` and `Drugs` impact labels. Those entries are now present and covered
  by `test/newspaper/herald_translation_test.dart` as PT-124.
- The replay also re-exercised the previously tracked PT-100 drug-study
  composition path. Its generated fragments remain a useful sentinel for
  legalizing-verb, infinitive, crasis, and plural-agreement regressions; the
  current catalog now uses `a legalização de`, infinitive tax-use fragments,
  and a complete Portuguese article template.
- Article A exposed PT-125: generated military country names contained the
  English fragment `Islands` (`Islands de Korsazistan`). The follow-up replay
  added the missing generated-title catalogs and a regression, so the route now
  renders `Ilhas de Korsazistan`.
- A fresh article detail also exposed `Income Inequality: +10.1%`; this was
  fixed as PT-126 by adding the missing `Desigualdade de Renda` catalog entry.

The strict-headless sessions and disposable servers were closed after capture.

## Strict-headless month-end agenda replay — 2026-07-29

Using CLI `agent-browser` only with `AGENT_BROWSER_HEADED=0` and
`--headless=new --ozone-platform=headless`, a fresh Portuguese campaign was
advanced through the January month-end legislative screens into February.
Agenda pages 1–5 stayed within the 80-column console and were localized, but
Opinion Poll Parts 1–2 exposed PT-128 grammar defects: several rows retained
English-shaped infinitives or singular verbs after percentage values. The
phrase catalog was corrected and `test/localized_layout_regression_test.dart`
now asserts the finite plural forms.

## Generated-country follow-up — 2026-07-29

The military article replay identified `Islands` in generated country names;
the follow-up regression also exercised the dynamic capital word list and
confirmed that `Fort` and `Hill` had no Portuguese values. The catalogs now
use `Ilhas`, `Forte`, and `Colina` (plus the remaining generated country-title
forms), and the repeated military-story test rejects the English title token.

## Strict-headless teaching-footer replay — 2026-07-29

This verification used a fresh Flutter web-server on port 7636 and only CLI
`agent-browser` with `AGENT_BROWSER_HEADED=0` and
`--headless=new --ozone-platform=headless`. A new Portuguese founder was taken
through Assign Tasks → Ministrar Aulas → Ensinar Artes Liberais. The fixed
screen rendered:

```text
Treina: Escrita, Persuasão, Direito, Religião, Ciência,
       Negócios, Psicologia, Música e Arte
Aulas custam até $20/dia. Todas as pessoas liberais aptas participarão.
```

The previous raw `Classes cost up to` line and stale `nsinando Artes Liberai`
tail were absent. The browser session was closed after the replay; no headed
window was used. The route is covered by
`test/basemode/pt_br_core_vocabulary_test.dart`.

The same fresh founder-creation route also rechecked the biography sentence
and confirmed the idiomatic `Aprendi do jeito difícil a ter cuidado com armas`.

## Strict-headless save/high-score replay — 2026-07-29

The save/high-score route was replayed against a fresh Flutter web-server on
port 7633 using CLI `agent-browser` with `AGENT_BROWSER_HEADED=0` and
`--headless=new --ozone-platform=headless`. Save management rendered
`Sistema de Gerenciamento de Salvamentos Liberal`, compact dates, Portuguese
load/delete/export actions, and the correct return footer. Seeded one- and
five-score stress cases rendered `Vitória mais rápida: Maio/2026`, Portuguese
flag labels, and all statistics within the 80-column console. Evidence is
retained under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/save-scores-replay/`.

This replay reverified PT-046 and PT-047. It also reconfirmed the open PT-131
capitalization decision `A ELITE Liberal` in the high-score list.

## Strict-headless U-District hospital route — 2026-07-30

This fresh Portuguese route used only CLI `agent-browser` with
`AGENT_BROWSER_HEADED=0` and `--headless=new --ozone-platform=headless` against
disposable Flutter web servers. The route travelled through District
University to UW Medical and advanced the day; evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/additional-route/`.

- The arrival message exposed the shared-template defect as
  `O Esquadrão do Crime Liberal chegou a Centro Médico UW.`; the same route
  also observed the uncontracted forms for `Delegacia de Polícia`, `Fórum`,
  and `Primeiro Banco Americano`.
- The hospital header exposed `SEA — UW Médica`, while the full site name was
  already `Centro Médico UW`. The compact catalog value is now `Hospital UW`.
- The fixed route renders `O Esquadrão do Crime Liberal chegou ao destino:
  Centro Médico UW.` and `SEA — Hospital UW`; hospital actions remained
  Portuguese and within the 80-column console. The post-fix hospital buffer
  is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/arrival-hospital-fix/hospital-fixed-buffer.txt`.

## Strict-headless police chase replay — 2026-07-30

The deterministic police-alarm fixture was replayed in strict headless mode
with CLI `agent-browser` (`AGENT_BROWSER_HEADED=0`,
`--headless=new --ozone-platform=headless`). Evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-alarm-replay/debug-siege/`.

- The police-siege roster and surrender path remained Portuguese, including
  `Policial da SWAT` and `Armadura da SWAT`, with no stale action-legend tail.
- The chase branch exposed `SWAT Officer ainda está no seu encalço!` because
  the warning interpolated the raw creature name. The chase renderer now
  translates enemy names before interpolation; the catalog regression expects
  `Policial da SWAT ainda está no seu encalço!`. A post-fix deterministic chase
  replay remains a follow-up because the disposable debug fixture was closed.
- The random `Chief of Police` officer variant did not spawn, so PT-064 remains
  open only for that unverified generated branch.

## Strict-headless police stealth and hospital-activity replay — 2026-07-30

Fresh Portuguese police-route replay in strict headless mode exposed two
additional interpolation leaks. Evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-postfix-verify/`.

- Stealth detection rendered `Police Officer olha para o Esquadrão com
  suspeita.` even though the roster displayed `Oficial de Polícia` (PT-135).
- After fleeing the alarm, the base activity line rendered `... estará em UW
  Medical Center por 4 months.` (PT-136).

The stealth and hospital activity call sites now translate these dynamic
values. A fresh production strict-headless replay verified both fixes:
stealth suspicion stayed localized, and the hospital activity line rendered
`... estará em Centro Médico UW por 3 meses.`. Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-postfix-verify/hospital-after-w.txt`.
Focused catalog tests, analyzer, canonical ARB validation, and interpolation
checks also pass locally.

The same disposable strict-headless fixture was forced to spawn the random
`Chief of Police` branch. The roster rendered `Chefe de Polícia`, but opening
the `T` talk-target selector exposed `A – Chief of Police (40s, Masculino)`.
The target-list and refusal-message call sites now translate encounter names;
post-fix forced-chief replay remains queued. Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-postfix-verify/chief-fixture-talkprompt.txt`.

The post-fix suspicion replay also exposed a combat grammar defect: the dynamic
armor target was rendered as `o armadura de couro de Dale HayashiAAAA.`. The
catalog template now uses article-free `armadura de couro de {name}` wording;
the focused context test covers the corrected template. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-postfix-verify/postfix2-suspicion.txt`.
## Strict-headless founder and shop replay — 2026-07-30

The rebuilt Portuguese app was exercised through founder creation and the
Commerce shop routes using CLI `agent-browser` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The founder route rendered the default female founder as `Manuela Frank` and
confirmed PT-138: several biography choices still say `Eu era travesso`, `Eu
era obcecado`, `Fui pego hackeando minhas notas`, or `Fui pego ficando com outra
garota`. The route evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/root7645-q4.png` and
`root7645-q8.png`.

An independent strict-headless shop sweep covered clothing, armour, firearms,
tools, pawn-shop, and used-car screens, including a 480×640 viewport. It
confirmed PT-139 (`Pressione uma letra para comprar roupas` on the medieval
armour list) and PT-140 (used-car status actions overwrite and clip each other).
The route report and captures are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/justice-route-sweep/`.

## Strict-headless combat post-fix verification — 2026-07-30

The forced `Chief of Police` fixture was rebuilt and replayed in strict
headless mode. The roster and `T` talk-target selector both rendered
`Chefe de Polícia`; evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-postfix-verify/chief-postfix-talk.txt`.
The direct `evasiverun` chase screen was not reached before the disposable
fixture escaped, so PT-134 remains a source-confirmed but route-unverified
follow-up.

## Founder biography and shop fix replay — 2026-07-30

PT-138 was fixed after auditing every founder biography answer, rather than
only the four strings visible in the first female-founder replay. Portuguese
answers now avoid self-descriptive gender agreement (`travesso`, `obcecado`,
`punido`, `sozinho`, and similar forms) with natural rewrites such as `Eu
vivia aprontando`, `Me pegaram hackeando minhas notas`, and `por conta
própria`. The focused character-creation test asserts all rewritten catalog
entries; the suite passes and canonical ARB validation remains clean. A rebuilt
strict-headless replay traversed all nine founder questions and matched the
neutral catalog wording before reaching the Portuguese base screen. The same
rebuilt pass exposed PT-141 in the opening conservative-era prose: `Ricardo
Seay` was described with feminine agreement. The catalog now uses masculine
agreement and has a direct full-string regression assertion; the replayed intro
rendered `Seu ... aliado ... foi empossado`.

The shop fixes are covered by the rebuilt source and focused route tests: the
medieval armour footer says `comprar armadura`, and the used-car status cells
remain separate at 480×640. Evidence from the original strict-headless
reproductions remains under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/justice-route-sweep/`.

## High-score capitalization replay — 2026-07-30

The rebuilt Portuguese app was replayed strictly headless with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
After selecting `A` → `P`, a disposable seeded score enabled `H - Ver Recordes`.
The high-score screen displayed `A Elite Liberal`, confirming PT-131's
capitalization fix in the running UI. Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/high-scores-pt131/high-scores-fixed.txt`.

## Options and changelog replay — 2026-07-30

The same strict-headless Portuguese route opened `O - Opções de Jogo`, then
both interface and content/tone submenus. Their labels, toggles, explanatory
paragraphs, and return actions remained localized and inside the console frame.
`V - Ver registro de alterações` opened the modal changelog; its Portuguese
title and English-only notice were readable, and repeated ArrowDown input
advanced the scroll position without clipping the modal frame. Captures are
retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/options-route/`.

## Strict-headless layout and generated-site replay — 2026-08-01

This verification used only the CLI `agent-browser` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
No headed browser was used or left running. A disposable local debug build
seeded the equipment list and a warehouse visit so the high-risk rows could be
reached quickly; all debug flags and seed instrumentation were removed before
validation.

- The pre-fix equipment capture showed `A - Rifle M7 (munição: 20)B - ...`
  with the second key prefix overwritten. The fixed replay keeps the three
  columns separate and fits `M - Rifle M7 (munição: 20…` inside its cell:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/equipment-layout-pt142/equipment-long-item-fixed-final2.png`.
- The daily-message regression now constrains long interpolated Portuguese
  rows to 80 columns and adds an ellipsis; the focused test covers the exact
  dynamic message shape because the disposable route reaches the activity log
  before the generic daily-result branch.
- The warehouse route exposed `Visitando Siderúrgica Velho` and
  `... olha ao redor de Siderúrgica Velho`. The generated-site helper now
  renders `Siderúrgica Velha`; the pre-fix route capture is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/equipment-layout-pt142/daily-message-fixed-replay2.png`.

At that point, residual playtest follow-ups remained PT-048/PT-064 (combat
branches) and PT-134 (a source-fixed chase warning still needing a fresh
deterministic route capture). The direct replay below closes the PT-064/PT-134
follow-up; PT-048 remains open.

## Strict-headless direct chase replay and prefix/wrap verification — 2026-08-01

The chase branch was replayed again with the CLI `agent-browser` only, using
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
A disposable local debug hook seeded a one-member sports-car chase and forced
low agility so the direct evasive-warning path was reachable; the hook was
removed before validation. No headed browser was launched or left running.

The first rebuilt replay exposed two real rendering defects in the chase
legend: translated car actions lost their `D/F/B/P` key prefixes, and the full
Portuguese legend clipped the tail of `P - Pare e renda-se` at the 80-column
edge. The foot legend also dropped `F/E` prefixes and left a comma-only gap
when `Order` was unavailable. The fix now renders complete key-prefixed labels,
wraps each option as an intact unit, clears stale rows, and moves the vehicle
roster down one row when the car legend wraps. The Portuguese car roster now
uses the localized encounter-name helper as well.

Final captures show:

- Car chase: `D - Acelere para despistá-los, F - Lutar, B - Pular fora e correr,`
  followed on the next row by `P - Pare e renda-se`; the roster starts below
  the wrapped legend and contains `Unidade Policial`.
- Foot chase: `D - Tentar despistá-los, F - Lutar, E - Equipar, O - Ordenar,
  G - Desistir`; the disabled `O` remains visibly grey without leaving a
  comma-only gap, and all prefixes remain intact.
- Evasive warning: `Unidade Policial ainda está no seu encalço!`.

Evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/chase-direct/`, including
`car-screen-finalfix2.png`, `foot-screen-finalfix2.png`, and
`evasive-warning-finalfix.png`. PT-064 and PT-134 are now marked fixed and
verified; PT-048's broader deterministic combat/alarm sweep remains open.

## Strict-headless siege, roster, and high-pressure replay — 2026-08-01

The rebuilt local web app was replayed only through the CLI `agent-browser`
with `AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless`. No headed browser was launched or
left running.

The Portuguese new-game route reached the base roster, a four-digit-pressure
district list, the police alarm, the loudspeaker surrender announcement, and
the siege combat screen. The fixed roster now reads `HABIL.—ARMA` and keeps a
space between `796/…` and `M7`. The high-pressure list stayed separated as
`Pressão: 1000 Sigilo: 15`; the previous `Pressão: 9000Sigilo: 15` collision is
covered by the heat-9000 regression. The siege briefing rendered
`... acabar com o cerco ao seu esconderijo`, and the combat roster and hit /
injury messages used `Policial da SWAT` rather than `SWAT Officer`.

The seeded squad won before a randomized terminal death/final-words template
was selected. PT-048 therefore remains an explicit follow-up for deterministic
injury, surrender, arrest, post-fight, and death-variant coverage; the source
interpolation audit and catalog additions are tracked as PT-148.

## Strict-headless travel and flag replay after catalog fixes — 2026-08-01

This replay used only the CLI `agent-browser` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The local Flutter web-server was restarted before the final pass so changed
ARB assets were loaded; no headed browser was launched or left running.

The fresh Portuguese new-game route reached the base, selected the founder's
squad, and opened the travel selector. Dynamic options now retain their input
prefixes as `A - Comércio`, `B - Centro de Seattle`, and
`F - Viajar para outra cidade ($100)` rather than mixing an en dash with the
ASCII control separator.

Returning to base and opening `P - Orgulho: Hastear bandeira ($20)` rendered
localized buyable flag names, the Portuguese national-flag description, and
`Questão: Liberdade de Expressão` without the previous heat-column collision.
The detail footer rendered one `Custo: $20` line. Long issue labels are safely
ellipsized before the heat column (`Liberdade de Exp…0`), which is recorded as
residual PT-151. Craft-only XML coverage was still open at this checkpoint and
is closed by the dedicated replay below (PT-152).

## Strict-headless flag-crafting replay and follow-up fixes — 2026-08-01

This replay used only the CLI `agent-browser` session `pt-craft-20260801`,
with `AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless`. The Flutter web-server was
restarted after each renderer/catalog change; no headed browser was launched,
focused, or left running.

For route acceleration, the local build temporarily enabled the founder and
all-items debug flags. Those two flags were reverted before validation and are
not part of the committed change.

Route:

1. Portuguese title → new game → founder setup → base.
2. Assign Tasks → the first liberal → `D - Recrutamento e Aquisição`.
3. Confirm `4 - Fazer uma Bandeira` and inspect both craft pages.
4. Select the long `H - Bandeira do Orgulho Progressista I…` and
   `I - Bandeira Lésbica Labrys Alternativa` entries.
5. Return to the acquisition submenu and verify `5 - Arranjar uma cadeira de
   rodas`.

The initial craft replay found three defects. The submenu displayed the
wheelchair on key 4 even though the handler used key 4 for flag crafting;
craft-only XML names/descriptions and `Police Behavior` remained in English;
and long names/issues ran into the next fixed column. The preview also hid
the heat value and rendered the longer translated difficulty label as
`Dificuldade:Facílimo`.

The final DOM buffer showed:

- `4 - Fazer uma Bandeira` and `5 - Arranjar uma cadeira de rodas`;
- page 1 rows such as `A - Bandeira Negra ... Comportamento … 0`;
- page 2 `H - Bandeira do Orgulho Progressista I… Direitos LGBTQ+ 0` with a
  separator before the issue cell;
- preview metadata `Bandeira do Orgulho Progressista Inters…`, localized
  description text, `Questão: Direitos LGBTQ+`, and
  `Pressão: 0  Dificuldade: Facílimo`;
- localized footer `Escape - Cancelar confecção de bandeira`.

These observations close PT-152 and add the focused PT-153–PT-155 findings.
The remaining compact-table truncation in PT-151 is intentional and logged as
a future responsive-layout enhancement. The new-game opening was also
rechecked in the same Portuguese campaign; the full `far right` sentence now
uses `extrema-direita Arqui Conservadora` consistently (PT-156).

## Strict-headless agenda and recruitment replay after the latest fixes — 2026-08-01

This pass used only the CLI `agent-browser` with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless`. No headed browser was
launched or focused. The Portuguese base replay verified the agenda action as
`L - O status da agenda Liberal`, and the agenda footer now remains fully
visible as `Outra tecla - Sair` (PT-157/PT-158). The changelog `V` action also
opened its modal; its English-only release-note body remains the accepted
PT-049 limitation.

The recruitment replay reached a conservative gang-member conversation. The
previous English `D - Buy weapons.` response is now `D - Comprar armas.` in
the live buffer (PT-159), and the ordinary/naked catalog variants are covered
by the context test. A failed issue-talk branch then exposed residual PT-160:
`"Tanto faz." <se vira>nde,` leaves the tail of the overwritten `responde,`
label. This is a console-row bug to fix later, not a missing translation; the
capture is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/recruitment-malformed-dialogue.png`.

## Strict-headless siege combat and newspaper follow-up — 2026-08-01

The siege route was replayed in a fresh CLI `agent-browser` session with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
No headed browser was launched or focused. Portuguese screens covered the
police alarm, loudspeaker surrender announcement, siege briefing, combat
roster, firearm actions, armor-hit messages, and reinforcement display. The
combat text stayed Portuguese. The temporary debug fixture intentionally
combined ten roster entries and exposed a `9D -` overlap in the fixed-width
combat frame; this is recorded as PT-164 and the debug flags were reverted
before validation.

The same source audit and focused tests closed three newspaper gaps found in
the previous replay:

- PT-160 now advances the failed issue-talk response from `console.y`, removing
  the stale `nde,` suffix; `test/talk/talk_about_issues_layout_test.dart`
  reproduces the failure shape and verifies the clean row.
- PT-161 adds raw subject/object pronoun parameters to the translation allow-list,
  preventing `she`/`him` fragments from bypassing Portuguese stories.
- PT-162 corrects plural-feminine child-victim conditions to `esculpidas` and
  `mutiladas`.
- PT-163 adds the two runtime-selected seasonal fashion sentences to both
  canonical catalogs; newspaper tests cover each branch.

The focused i18n, newspaper, and talk-layout suites passed after these fixes.
The remaining open playtest items are PT-048/PT-148 (deterministic terminal
combat/death/surrender variants), PT-083 (narrow viewport), PT-151 (intentional
long issue-label ellipses), PT-164 (debug/import roster-cap guard), and the
accepted English-only changelog notice PT-049.

## Strict-headless equipment and media verification — 2026-08-01

This follow-up used a fresh local web-server build and the CLI
`agent-browser` session `pt-final-20260801` only. Every browser invocation set
`AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless`; no headed browser was launched,
focused, or left running. The temporary `megaFounderCheat` and
`debugAllItems` flags were enabled only for the route, then reverted before
validation.

The Portuguese campaign reached `Equipar a Equipe` and walked the long item
pages with injected/real key events. The live console showed translated
generic items, clothing, loot, memos, and flags, including `Roupa de trabalho`,
`Gasolina`, `Memorandos da Rádio AM`, `Memorandos das Notícias a Cabo`,
`Hábito`, `Traje de tanque`, `Camisa esportiva`, `Quimono`, `Fantasia de ninja`,
`Equipamento PMC`, and `Bandeira BLM`. This closes PT-165; unchanged
loanwords such as `Fursuit`, `Tie-dye`, and `Toga` are intentional.

After advancing the game, the media overview displayed a generated story as
`Rádio AM` in the source column. Opening it rendered `Rádio AM - REFÉM MORTO`
and the translated dynamic footer `Prisões: -10.0%`. A later event prompt
displayed `Memorandos da Rádio AM` and `Memorandos das Notícias a Cabo`,
confirming PT-166/PT-167 in the live buffer. Focused tests also cover all nine
publication names and all 30 view labels; the source column now reserves 16
cells so long localized names cannot overwrite impact values.

No new translation or layout defect was confirmed. Residuals remain
PT-048/PT-148 (deterministic terminal combat/death/surrender variants), PT-083
(narrow viewport), PT-151 (intentional long-label ellipses), PT-164
(oversized debug/import roster), and accepted PT-049 (English changelog body).

## Strict-headless high-score, narrow-overlay, and party-roster replay — 2026-08-02

This pass used only the CLI `agent-browser` session `pt-next-20260802`, with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The local web server was hot-restarted after the renderer changes; no headed
browser was launched, focused, or left running.

The title route was seeded with two disposable high-score records through the
browser's Portuguese preferences. The high-score page rendered the localized
heading, endings, dates (`Maio de 2024` and `Novembro de 2023`), stats, and
currency labels. Before the fix, the browser console also reported false
missing translations for the already-localized month values `Maio` and
`Novembro`; after the hot restart and replay those events disappeared. The
400×300 capture is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/high-scores-400x300.png`.

The changelog overlay at 400×300 remains the known PT-083 fixed-console
limitation: the Portuguese title and English-only release-note notice are
visible, but the lower modal body extends below the viewport. The capture is
retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/changelog-400x300.png`; no new
translation defect was found.

A fresh Portuguese founder route selected the security-uniform biography
branch and reached base mode. Before the fix the roster row merged the
localized armor and health cells as `Unif. de Segura~ 130`. The live rebuilt
buffer now shows `Unif. de Segu… ~ 130`, with the fitted armor cell, separator,
health indicator, and value all readable. This closes PT-168. The focused
layout suite and full static interpolation gate passed after the change.

## Strict-headless siege/review replay after fixes — 2026-08-02

This follow-up stayed in the CLI `agent-browser` session
`pt-combat-20260802` with `AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless`; no headed browser was launched or
focused. The rebuilt review-assets screen was rechecked after the layout fix.
The long location remains inside its 19-cell budget, the activity starts after
the separator, and pager controls render as `Página Anterior`/`Próxima Página`
without a second translation pass. The capture is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/post-fix-current.png`.

The siege source route had exposed two copy issues: `sobreviver a isso
confronto` and `Você é procurado por interrogatório!`. The first now composes
as `sobreviver a este confronto`; the no-crime warning has a dedicated key and
renders `Você está sendo procurado para interrogatório!`. A focused siege
regression drives the real `stateBrokenLaws` renderer and verifies the latter.

The same replay's console output contained false missing-translation noise for
prelocalized pager strings, structural templates, unchanged model/proper-name
values, and signed numeric deltas. Pager call sites now use `noTranslate`, and
the logger ignores structural keys and signed numbers while retaining normal
human-readable missing-key reporting. Focused pager/logger tests pass. No new
translation or layout defect was confirmed; existing residuals remain
PT-048/PT-148, PT-083, PT-151, PT-164, and accepted PT-049.

## Strict-headless founder, flag, sorting, and agenda replay — 2026-08-02

This pass used only the CLI `agent-browser` session `pt-fix-20260802`, with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The web server was restarted after the catalog/source changes; no headed
browser was launched, focused, or left running.

The founder route walked the Portuguese biography questions and confirmed the
skill vocabulary fix: `+1 Computadores`, `+3 Computadores`, and both composite
reward lines now agree with the roster's canonical `Computadores` label. The
flag route then rendered the complete one-row footer `Poucas bandeiras podem
ser compradas. Muitas outras podem ser feitas pela LCS.`; the previous missing
`LCS.` tail is gone.

The Assign Tasks sorting prompt now renders `Escolha como ordenar a lista de
atividade Liberal.` instead of interpolating raw `Liberal activity`. The agenda
route's second page now shows `uma opinião favorável do Presidente Dino Dawkins`
and `estão preocupados com a violência armada`; page three remained Portuguese
through the remaining polling rows. These checks close PT-174–PT-177.

The future queue is unchanged: PT-048/PT-148 (deterministic terminal combat
variants), PT-083 (narrow viewport), PT-151 (intentional long-label ellipses),
PT-164 (oversized debug/import roster), and accepted PT-049 (English changelog
body).

## Strict-headless sleeper, justice, profile, and flag replay — 2026-08-02

This pass used only the CLI `agent-browser` session
`pt-debug-20260802e`, with `AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless`. The web server was rebuilt on a
fresh port after the source and catalog changes; no headed browser was
launched, focused, or left running.

The rebuilt Portuguese routes confirmed the following fixes in the live DOM
buffer:

- Activate Sleepers now renders `DC — Casa Bran…` and keeps `Mantendo
  Discrição` in its activity column (PT-178/PT-181).
- The justice list uses `SEA — Polícia` instead of `SEA — Police` (PT-178).
- Both the normal and review-mode profile footers preserve the separator and
  translate the right prefix: `ESQUERDA / DIREITA - Ver Outr…` (PT-180).
- The full skill sheet renders `ATUAL  MÁX.` without leaking `NOW`/`MAX` or
  overwriting the following `HABIL.` header (PT-179).
- Pride flag selection shows `Grátis` and fits the long Intersex row before
  the issue column; no raw `Free` or column collision remains (PT-182).

The same sweep rechecked the already-fixed media overview, Liberal Agenda,
task sorting, equipment, vehicles, travel, and industrial-district routes;
they remained Portuguese and within their fixed-width cells. Combat was not
reached in this pass, so PT-048/PT-148 remain open for deterministic terminal
death, surrender, arrest, and post-fight variants. Other residuals remain
PT-083 (narrow viewport), PT-151 (intentional issue-label ellipses), PT-164
(oversized debug/import roster), and accepted PT-049 (English changelog body).

## Strict-headless combat and compound-label replay — 2026-08-02

This replay used only the CLI `agent-browser` session
`pt-combat-20260802` with `AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless`. A temporary local debug fixture
created a police siege so the safehouse and combat routes could be reached
deterministically; the debug flags were not retained for the production build.

The siege briefing, combat roster, combat log, victory screen, and surrender
messages were all Portuguese. The first fresh bundle exposed `BOLLARDS` and
`GENERATOR` in the compound status row on both the siege and post-surrender
safehouse screens (PT-183). After adding the canonical `POSTES` and `GERADOR`
catalog entries, restarting the web server to refresh the asset manifest, and
replaying the route, the live buffer showed `POSTES` and `GERADOR`. No new
player-visible translation defect was found. Deterministic death/arrest and
save/import/narrow-viewport routes remain in the residual queue.

## Strict-headless project-config and narrow-layout replay — 2026-08-02

The repository-level `agent-browser.json` was exercised without shell
overrides. `agent-browser doctor --json` reported a valid project config, and
the live Chrome process included `--ozone-platform=headless`; the session was
closed after the replay. No headed browser or desktop focus was used.

At a 480×320 viewport, the Portuguese title and base screens remained
translated, but the fixed 80-column console was scaled to very small text and
the title's version/focus footer reached the viewport edge. The base buffer
itself remained complete, so this reconfirms the known PT-083 responsive
readability/clipping limitation rather than a new translation defect. Captures
are retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/title-narrow-config-20260802.png`
and `base-narrow-config-20260802.png`.

## Strict-headless injury-treatment redraw replay — 2026-08-02

This pass used only the CLI `agent-browser` session
`pt-injury-fix-20260802`, launched with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless`. The temporary local
all-pool injury fixture was used only to make the daily treatment branch
deterministic and was not retained in the production build.

After selecting Portuguese, starting a new founder, travelling to the
industrial district's homeless encampment, and executing the plan, the first
treatment prompt rendered as the clean single-row sentence
`Os ferimentos de Jared Toft exigem tratamento profissional.`. The previous
replay had appended stale `...-teto.` text from the safehouse location header;
the new `showAdvanceDayMessage` call clears and fits row 8. Repeated Enter
prompts drained the fixture and reached `2 de jan de 2023` with no stale tail.
Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/injury-message-2-20260802.png`
and `injury-drained-20260802.png`.

The strict-headless combat terminal death/arrest variants were not reproduced
in this pass and remain open under PT-048/PT-148. Other residuals remain
PT-083, PT-151, PT-164, and accepted PT-049.

## Strict-headless CIA raid translation and wrapping replay — 2026-08-02

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless`. The route temporarily enabled
`debugSiege=true`, `debugSiegeType="cia"`, and `megaFounderCheat=true` to make
the CIA safehouse branch reachable; all three local fixture changes were
restored before validation. A stale browser cache initially served the old
catalog, so the final replay used a fresh Flutter web-server origin and a new
headless session.

The first Portuguese squad-assembly route exposed PT-185: the right-aligned
header rendered `Esquadrão: O Esquadrão do Crime Lib`. The renderer now uses
the translated string's visible width, and the replay showed the complete
`Esquadrão: O Esquadrão do Crime Liberal` header. The pre-fix capture is
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-header-clipping-20260802.png`.

The CIA replay then exposed PT-186. The opening screen was English even though
the suspense lines below it were Portuguese:
`In the dead of the night, a column of unmarked black vans with tinted windows
surrounds the ...`. The source passed one full template to the translator,
while the catalog held only two fragments. Adding the complete `{location}`
entry fixed the lookup; the fresh-origin buffer showed
`No meio da noite, uma coluna de vans pretas sem identificação e com vidros
escuros cerca o ...`. Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-raid-english-arrival-20260802.png`
and `cia-raid-arrival-fixed-20260802.png`.

The same route exposed PT-187: long compound-suspense and darkness messages
were written with single-row calls and clipped at the fixed console edge. The
camera line ended at `...encarar diretamente os`, and the final darkness line
lost its period. The affected CIA messages now use paragraph wrapping; the
rebuilt DOM buffer showed the camera sentence split across two complete rows
and preserved `destrancam espontaneamente.`. The focused regression covers
both long templates. The route itself remained Portuguese through `A CIA
chegou.` and the under-attack base screen.

No new unresolved issue was confirmed after PT-185/PT-186/PT-187. Residual
follow-ups remain PT-048/PT-148 (deterministic combat terminal variants),
PT-083 (narrow fixed-console viewport), PT-151 (intentional long-label
ellipses), PT-164 (oversized debug/import roster), and accepted PT-049 (the
English changelog body).

## Strict-headless inventory/profile replay — 2026-08-08

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The Flutter web server ran on a fresh local origin (`127.0.0.1:7752`) so the
updated ARB asset manifest was loaded; no headed browser was launched or
focused.

The all-items founder fixture covered the Portuguese equipment pages, roster,
finance report, profile stats/skills/crimes, and task-assignment menus. The
profile route exposed PT-188: a transgender character rendered
`Não binário, Transgender` while the surrounding identity labels were already
localized. Adding the `Transgender` catalog entry and restarting the bundle
produced `Não binário, Transgênero`; evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-transgender-fixed-20260808.png`.

The same profile route confirmed PT-189 remains open: fixed 15-column cells
ellipsize long Portuguese attribute, skill, and crime labels, including
`Inteligência: …`, `Primeiros Soco…`, and `entrada ilegal nos Estados U…`.
The numeric columns remain separated, so this is a readability enhancement
rather than a collision. Captures are retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-truncation-stats-20260808.png`,
`profile-truncation-skills-20260808.png`, and
`profile-truncation-crimes-20260808.png`.

The Health and Support task help exposed PT-190: `Médicos capazes sempre
fornecerão ... ou outro` was a literal, grammatically awkward composition.
The revised fragments render as `Médicos capacitados sempre oferecem cuidados
médicos para si ou para outros no mesmo local. Isso não interfere com outras
tarefas.` across four readable rows. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-support-fixed-20260808.png`.

Equipment, finance, roster, assignment, and footer controls remained in
Portuguese. The broader residual queue is unchanged apart from PT-188/PT-190
being fixed and PT-189 being added: PT-048/PT-148 terminal combat variants,
PT-083 narrow viewport readability, PT-151 flag-label ellipses, PT-164
oversized debug/import roster, and accepted PT-049 English changelog body.

## Strict-headless injury and hospital replay — 2026-08-08

This pass used only the CLI `agent-browser` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The Flutter web server ran on `127.0.0.1:7753`; no headed browser was launched
or focused. A temporary `debugBadlyInjured` fixture made the severe-injury and
hospital branches deterministic and was restored to `false` before validation.

The profile route exposed PT-191. Before the catalog/code fix, every body part
showed raw `Sht,Brs,Cut,Trn,Brn` and the special-injury column showed English
labels including `Heart Punctured`, `R. Lung Collapsed`, and `Broken Neck`.
The rebuilt route now renders `Tir,Con,Cor,Ras,Que`, `Coração Perfurado`,
`Pulmão D. Colapsado`, and the remaining localized injury labels. Captures:
`injury-profile-stats-20260808.png` (before) and
`injury-profile-translated-20260808.png` (after).

The same fixture exposed PT-192 in the activity detail view: the translated
`Habilidades Principais` heading and long Portuguese body-part names overwrote
the status column. Fitting both cells and reserving separators produced the
readable `Habilidades Prin… Perna esque… Tir,Con,...` layout. Capture:
`activity-wounds-layout-fixed-20260808.png`.

The first hospital discharge replay exposed PT-193: the translated sentence
still interpolated raw `UW Medical Center` because the caller passed
`p.site!.name`. Passing `p.site!.getName()` fixed the screen; the live buffer
now says `Ivana Matheson está recebendo alta de Centro Médico UW.` and keeps
the unpaid-bill choices in Portuguese. Before/after evidence:
`injury-hospital-days-20260808.txt` and
`hospital-discharge-translated-20260808.png`.

The fixture also reconfirmed PT-194: more than 13 special injuries extend below
the 25-row console, so later kidney, stomach, spleen, and rib labels are not
visible. Keep this as an open pagination/detail-view enhancement. The broader
queue remains PT-048/PT-148 terminal combat variants, PT-083 narrow viewport,
PT-151 flag-label ellipses, PT-164 oversized debug/import roster, and accepted
PT-049 English changelog body.

## Strict-headless management, combat, and succession replay — 2026-08-08

This continuation used only the CLI `agent-browser` session
`pt-fix-replay-20260808`, with `AGENT_BROWSER_HEADED=0` and
`--headless=new --ozone-platform=headless`. I rebuilt the Flutter web server
on `127.0.0.1:7754` after the catalog/source changes; no headed browser was
launched or focused.

The fresh Portuguese bundle covered the base roster, vehicle assignment,
destination map, police site, site-mode map, siege briefing, siege combat
roster, equipment screen, and bulk/single sleeper management. The previously
reported table/layout fixes held: `M7 20/180` stayed separated from `Jaqueta
Punk`, sleeper names stopped before `PROFISSÃO`/`LOCAL`, bulk actions were
Portuguese and fitted, `Voz` replaced `Voice`, and equipment reassignment showed
`LOCALIZAÇÃO ATUAL`/`NOVO LOCAL`.

Two additional raw-English routes were reproduced and fixed in this cycle.
The site-mode roster now shows `Crít +Lev` and `Bem +Pes` instead of `Crit
+Lgt`, `OK`, and `+Hvy`. After the founder was killed by the deterministic
injury fixture, the successor screen now says `James Simon é o novo líder do
Esquadrão do Crime Liberal!` instead of falling back to the split English
template. Focused regressions cover both complete translation paths.

The siege branch reached `CERCO: FUGIR OU ENFRENTAR`, the Portuguese combat
roster, and live firing messages without a new raw-English or collision issue.
PT-194 remains open: the full special-injury list still needs pagination or a
scrollable detail panel. Other documented residuals remain PT-048/PT-148,
PT-083, PT-151, PT-164, and accepted PT-049.

## Strict-headless new-game, management, recruitment, and month-rollover replay — 2026-08-08

This pass used only `agent-browser` session `pt-cont-20260808` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The DOM command bridge drove keys through `#lcs-playtest-buffer`, so no headed
window was focused. The route covered Portuguese language selection, founder
creation (including `Intersexo`), all biography prompt layouts, save/load
management, media overview, asset review, profile, funding report, shops,
equipment, task assignment, recruitment profession/candidate selection,
political dialogue, newspaper rendering, the January-to-February rollover, and
the legislative agenda.

The replay confirmed the fixed-width profile ellipses tracked as PT-189/PT-151
remain readable but intentionally truncated (`Habilidades Prin…`, `Armas de
Fo…`, `Gola alta pre…`). It also reproduced two translation defects in a
generated newspaper article: `(man)` remained after `uma pessoa negra`, and
`He provavelmente` appeared at sentence start. PT-211 adds dynamic gender
vocabulary and capitalizes translated pronouns; the Herald regression now
generates WOKE HIRE articles repeatedly and rejects those English fragments.

The recruitment profession list also exposed the false-friend
`Evadido do Ensino Médio` for `Highschool Dropout`; PT-210 changes it to
`Desistente do Ensino Médio` and updates the profile/recruitment regressions.
The remaining queue is PT-048/PT-148 terminal combat variants, PT-083 narrow
viewport readability, PT-151/PT-189 long-label ellipses, PT-164 oversized
debug/import rosters, PT-194 wound-list pagination, and accepted PT-049 English
changelog body.

## Strict-headless bulk-task continuation — 2026-08-08

Session `pt-cont-20260808` stayed headless (`AGENT_BROWSER_HEADED=0`,
Chromium `--headless=new --ozone-platform=headless`) and used the DOM command
bridge. The bulk regular-task screen initially showed nine English labels and
the header `CURRENT ACTIVITY`; the long Portuguese credit-card option also
ended silently at `Fraude de Cartão de Crédi` in the 80-column console.

PT-212 adds catalog-backed labels and routes the `BulkActivity` names through
`LcsI18n`; PT-213 uses the fitted option renderer for the column; PT-214 adds
`ATIVIDADE ATUAL`. A fresh server restart and replay now show `Serviço
Comunitário`, `Ativismo Liberal`, `Guardião Liberal`, `Arrecadação Legal`,
`Vender Brownies`, `Prostituição`, `Fraude de Cartão de Créd…`, `Roubo de
Carros`, and `Recrutando`, with no English header leak or column overwrite.
Focused regressions cover label localization, header translation, and the
ellipsis boundary. The residual queue remains PT-194, PT-048/PT-148, PT-083,
PT-151/PT-189, PT-164, and accepted PT-049.

## Strict-headless narrow-viewport recheck — 2026-08-08

The same browser session was resized to 480×400 without leaving headless
Chromium. The title screen remains readable, but the two-column action rows
and right-aligned version/footer still run into the viewport edge; the
Portuguese `C - Continuar ...` row is visibly clipped in the screenshot:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/title-narrow-480x400.png`.
This reconfirms PT-083 as an open responsive-console enhancement, not a new
translation defect.

## Strict-headless under-attack briefing replay — 2026-08-08

This pass used only `agent-browser` session `pt-siege-route-20260808` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The Flutter web server ran on `127.0.0.1:7758`; the DOM-backed
`#lcs-playtest-buffer` supplied the live 80×25 console, with no headed browser
window launched or focused. A temporary local `debugSiege`/mega-founder fixture
created a Portuguese founder and advanced the police siege until the safehouse
was under attack; both flags were restored before validation.

The first live `F - Lutar` briefing reproduced PT-215. Its fixed rows clipped
the Portuguese body at the right edge and exposed malformed split-fragment
translations (`ele estar`, `um Liberais`, and `dar cobertura fogo`). The body is
now one complete catalog template, translated once, and wrapped from row 3
through row 21. The fresh replay renders the complete grammatical text,
`Suas câmeras...`/`Suas armadilhas...`, and the prompt
`Pressione qualquer tecla para Confrontar os Agressores Conservadores` without
overflow. Before/after buffers and the post-fix screenshot are retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/under-attack-briefing-20260808/`.

After dismissing the briefing, the same route rechecked the Portuguese help,
map, and equipment screens; all remained readable. The next combat pass should
still target the unresolved terminal death/arrest/surrender variants (PT-048/
PT-148), rather than treating this briefing as complete coverage of those
branches.

## Strict-headless siege surrender and wait-warning replay — 2026-08-09

This follow-up used only `agent-browser` session `pt-terminal-cops-20260809c`
with `AGENT_BROWSER_HEADED=0` and Chromium `--headless=new
--ozone-platform=headless`. A temporary local mega-founder/police-siege
fixture entered the safehouse branch immediately after founder creation; the
fixture was used only for the replay and was restored before validation.

The `G - Desistir` surrender path rendered the confiscation, funds, and
fortification messages in Portuguese and returned to the base without a raw
English leak. The same base screen reproduced PT-216: `Não Pode Esperar até
Cerco Resolvido` was an ungrammatical literal and sat beside the right-column
exit action. The catalog now renders `Não pode esperar até o cerco terminar`;
the fresh server restart shows it entirely in the left column while
`X - Sair para a Tela Inicial` remains separate. The post-fix buffer and
screenshot are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/siege-wait-warning-20260809/`.

Terminal death/arrest variants remain open as PT-048/PT-148; this replay did
not claim those branches covered.

## Strict-headless terminal arrest, high-score, and medical-receipt replay — 2026-08-09

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The DOM command bridge drove keys through `#lcs-playtest-buffer`; no headed
browser was launched or focused. Temporary terminal fixtures were kept in the
debug branch and restored after the replay.

The police terminal route with exactly one wanted Liberal reproduced PT-217:
`Prendem Antonio Balgos.`. The catalog fix now renders `A polícia deteve
Osama Cruise.` in the fresh live buffer. Before/after captures are retained
under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/single-arrest-20260809/`.

The CIA lethal-surrender route reached game over and reproduced PT-218: the
stored default slogan `Revolution never comes with a warning!` bypassed the
Portuguese catalog. High-score rendering now translates only built-in default
slogans while preserving custom text; the after capture shows a translated
default slogan. Captures are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-surrender-20260809/`.

The medical-industry surrender route reproduced PT-219. The receipt first
showed five English labels; after adding the catalog entries, the live replay
also exposed source-length dot leaders overwriting longer Portuguese labels.
The receipt now translates/fits labels before placing dots, and every amount
stays at column 50. The final buffer and screenshot are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-20260809/`.

The residual queue remains PT-194 (special-injury pagination), PT-048/PT-148
(other deterministic terminal combat variants), PT-083 (narrow viewport),
PT-151/PT-189 (intentional long-label ellipses), PT-164 (oversized
debug/import roster), and accepted PT-049 (English changelog body).

## Strict-headless non-police terminal branch sweep — 2026-08-10

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new
--ozone-platform=headless`. Each route ran on a fresh local Flutter web
server and used the opt-in `?playtest=1` DOM bridge; no headed browser was
launched or focused. A temporary debug-only fixture placed the generated
Liberals in the safehouse and selected one terminal siege type at a time. The
fixture was restored before repository validation.

The angry-mob, corporate-mercenary, and CCS `G - Desistir` routes all reached
the terminal `Todos em ... foram mortos.` screen and the corresponding
high-score ending. The localized endings were readable inside the 80-column
console: `foi linchado pela multidão`, `foi enxugado`, and `foi superado no
próprio jogo`. No raw English, interpolation leak, or column collision was
reproduced. Evidence is retained under:

- `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-rural-20260810/`
- `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-corp-20260810/`
- `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-ccs-20260810/`

The CCS route also rechecked the complete `SOB ATAQUE: FUGIR OU ENFRENTAR`
briefing and the opening site-mode roster. Both remained Portuguese and
within bounds. PT-048/PT-148 stay open for a future deterministic fixture
that reaches a live encounter's talk/surrender action and post-fight summary;
the terminal safehouse `G` branch alone is not sufficient coverage.

## Strict-headless injury-pagination replay — 2026-08-09

This replay used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The opt-in `?playtest=1` DOM bridge drove every key; no headed browser was
launched or focused. A temporary `debugBadlyInjured` fixture created the full
severe-injury state, then was restored to `false` before validation.

The pre-fix stats page stopped at the first ten or eleven right-column rows and
silently hid the kidneys, stomach, spleen, and ribs. The post-fix stats page
now shows the bounded `+7 outras — BAIXO` hint. Pressing `BAIXO` through the
profile pages reaches `Lesões Especiais (1 de 1)`, where all 17 localized
injuries fit across rows 5–21. The same page renderer and dynamic page count
are used by standalone profiles and review-mode profiles. No English title,
interpolation leak, footer overwrite, or column collision was reproduced.

Buffers and captures are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-pagination-20260808/`.
PT-194 is resolved; the residual queue is PT-048/PT-148 live encounter
talk/surrender coverage, PT-083 narrow viewport readability, PT-151/PT-189
intentional long-label ellipses, PT-164 oversized debug/import rosters, and
accepted PT-049 English changelog body.

## Strict-headless live encounter bluff replay — 2026-08-09

This pass used only CLI `agent-browser` session `live-bluff-fixed-20260809`
with `AGENT_BROWSER_HEADED=0` and Chromium `--headless=new
--ozone-platform=headless`. The opt-in `?playtest=1` DOM bridge drove the
Portuguese new-game route and the live site encounter; no headed browser was
launched or focused. A temporary local encounter fixture was used to make the
police target deterministic and was restored before repository validation.

The first replay reproduced PT-220: after `T - Falar` → `C - Blefar`, the
short result `"A situação está sob controle."` overwrote the prior
`...fala com ...:` header without clearing its tail, producing a visible
`...controle."e Willett:` suffix. The combat-talk branch now calls
`clearMessageArea()` before drawing bluff output. The fresh replay shows the
same Portuguese result on a clean row, and the talk menu remains fully
localized. Before/after buffers and screenshots are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/live-combat-20260809/`.

The replay plus the preceding surrender route cover the live talk menu,
bluff, and surrender branches. PT-048/PT-148 remain open only for the
unplayed terminal death/arrest and post-fight summary variants; other
residuals remain PT-083 (narrow viewport), PT-151/PT-189 (intentional
long-label ellipses), PT-164 (oversized debug/import roster), and accepted
PT-049 (English changelog body).

## Strict-headless monthly newspaper sweep — 2026-08-09

This pass used only the CLI `agent-browser` session `monthly-sweep-20260809`
with `AGENT_BROWSER_HEADED=0` and Chromium `--headless=new
--ozone-platform=headless`. The opt-in `?playtest=1` DOM bridge drove a fresh
Portuguese game through the month-end `W` route; no headed browser was
launched or focused.

At day 17 the route opened a `View.sweatshops` major-event picture story and
reproduced a real runtime failure. The localized caption was wider than the
80-column console, and `mvaddstrCenter` computed `x = -8`; `Console.addchar`
then raised `RangeError (index): Index out of range: index must not be
negative`. The failing buffer is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/monthly-sweep-20260809/day-17-0.txt`.

PT-221 fits localized picture captions to 78 visible columns before centering.
The exact Portuguese event now completes under
`test/newspaper/herald_translation_test.dart`, renders a visible ellipsis,
and keeps the 80-column buffer invariant. A fresh post-fix sweep continued to
13 Feb 2023, visiting January/February newspaper and agenda screens without a
second runtime failure. Residual coverage remains PT-048/PT-148 terminal combat variants, PT-083 narrow viewport readability,
PT-151/PT-189 intentional long-label ellipses, PT-164 oversized debug/import
rosters, and accepted PT-049 English changelog body.

## Strict-headless siege foot-chase surrender and narrow-viewport replay — 2026-08-09

This pass used only the CLI `agent-browser` session `siege-combat-20260809`
with `AGENT_BROWSER_HEADED=0` and Chromium `--headless=new
--ozone-platform=headless`. The opt-in `?playtest=1` DOM bridge supplied the
80×25 buffer and option list; no headed browser was launched or focused. A
temporary local police-siege fixture injured the generated squad and enabled
the foot-chase surrender control so the terminal path could be exercised;
all fixture changes were reverted before validation.

The Portuguese safehouse briefing, six-member roster, and opening SWAT
encounter remained inside the fixed-width console. The terminal chase route
rendered `G - Desistir`, then `Você para e é preso.`, followed by the Portuguese
court accusation and guilty-plea screens. No raw English, interpolation leak,
or stale-row collision appeared. The same combat screen was checked at
640×480 and 480×320 headless viewports; the table, controls, and enemy roster
remained within bounds (the smaller viewport is dense but not clipped).

Captures are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-live-20260809/`,
including `chase-open3.txt`, `chase-surrender3.txt`, and the narrow-viewport
screenshots. This closes only the deterministic foot-chase surrender coverage;
PT-048/PT-148 still need an ordinary live encounter's talk/surrender and
post-fight-summary variants, plus the remaining PT-083 responsive-console
enhancement.

## Strict-headless ordinary police encounter replay — 2026-08-09

This pass used only CLI `agent-browser` session `live-encounter-20260809` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The opt-in `?playtest=1` DOM bridge drove a Portuguese new game into the
Seattle industrial district's abandoned toy factory. A temporary deterministic
live-encounter fixture made the police alarm branch reliable; it was removed
before validation and was never committed.

The route required two visits (travel, then entry) and reached the ordinary
`POLÍCIA RESPONDENDO` encounter. The opening roster stayed inside the 80-column
console and showed `Policial da SWAT`. The live `T - Falar` frame then exposed
`SWAT Officer` in the target-name interpolation, while the party row showed
the clipped vehicle/driver text `Esportivo-`. The talk header now renders
`Les Rappaport fala com Policial da SWAT:`, and the party renderer reserves the
`-D` marker before fitting `Esportivo`.

The same route selected `D - Render-se às autoridades`, followed the arrest
screen, Portuguese newspaper result, and Portuguese courthouse guilty-plea
flow. The retained buffers are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/live-encounter-20260809/`;
`talk-header-fixed.txt` and `surrender-fixed.txt` are the post-fix frames,
while `ordinary-combat-open.txt` and `ordinary-combat-open-fixed.txt` preserve
the original layout evidence. Focused regressions now cover both the localized
generated target name and the transport marker boundary.

This closes the ordinary police talk/surrender runtime gap in PT-048/PT-148.
Keep those findings open only for broader alarm variants and a live combat
death/post-fight-summary branch, alongside PT-083 responsive-console
readability, PT-151/PT-189 intentional long-label ellipses, and PT-164's
oversized debug/import roster.

## Strict-headless profile, flag, and oversized-roster replay — 2026-08-09

This pass used only CLI `agent-browser` session `profile-pt-20260810` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The Flutter web server was restarted on a fresh port after catalog changes; no
headed browser was launched, focused, or left running. The opt-in
`?playtest=1` DOM bridge supplied the 80×25 console buffer and key events.

The Portuguese founder route reached Review Liberals → Liberais Ativos → the
full profile. The skill page now keeps `Primeiros Socorros`, `Armas Pesadas`,
and every other skill name readable in two 40-cell columns. The crime page
keeps `profanação da bandeira nacional`, `entrada ilegal nos Estados Unidos`,
and the compact `distribuição de drogas`, `terrorismo digital`, and
`vandalismo digital` labels inside dedicated numeric cells. The post-restart
buffers are retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-pt-20260810/page1-fixed3.txt`
and `page2-fixed3.txt`.

The same live campaign opened the flag menu. `Liberdade de Expressão`,
`Direitos LGBTQ+`, `Direitos das Mulheres`, and `Direitos Civis` remained
readable before heat and cost; the capture is
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-pt-20260810/flag-fixed.txt`.

PT-164 was reproduced as a focused renderer fixture with eight members. The
party table now renders five rows, a `+3…` overflow marker, and an untouched
row-8 delimiter, so debug/import rosters cannot overwrite the fixed combat
frame. The new regression lives in
`test/basemode/pt_br_core_layout_test.dart`.

These checks close PT-151, PT-164, and PT-189. The remaining queue is PT-048/
PT-148 terminal combat variants, PT-083 narrow-console readability, and the
accepted English-only changelog body PT-049.

## Strict-headless shop, activity, and newspaper replay — 2026-08-09

This pass used only the CLI `agent-browser` session `shop-sweep-20260809` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The opt-in `?playtest=1` DOM bridge supplied the fixed 80×25 console buffer and
key injection; no headed browser was launched or focused. Temporary all-items,
high-funds, and founder fixtures enabled a disposable sweep and were reverted
before validation.

The route covered equipment and vehicle pages, media, education, graffiti,
department-store shopping, and newspaper output. It reproduced three concrete
Portuguese defects. Graffiti pickup showed `Wally Rexford agarrou um Tinta spray
de Homeless Camp.`; the fix uses the translated safehouse name and a parameter
aware message (`pegou uma ... no Acampamento sem-teto`). The education picker
joined `Primeiros Socorros` to its numeric value; the value columns now leave a
separator. A Justice Amok article composed `com base em dele crença ...`; the
catalog now places the possessive in `na opinião dele/dela`.

After the source/catalog reload, the same headless session started a fresh
Portuguese game and reached the title, founder, agenda, roster, equipment, and
newspaper routes without a crash or English control leakage. Focused regressions
`test/daily/graffiti_translation_test.dart`,
`test/basemode/pt_br_core_vocabulary_test.dart`, and
`test/newspaper/herald_translation_test.dart` all pass and guard the exact
outputs. The extended random-day run also reached the Liberal Guardian secret
selection prompt without a new translation or layout defect.

Remaining work is coverage, not a new confirmed defect: PT-048/PT-148 still
need a live combat death/post-fight-summary branch, PT-083 remains the narrow
480×320 readability enhancement, and PT-049 intentionally retains the English
historical changelog body. Compact profile/shop labels that end in an ellipsis
remain bounded by their fixed cells and are tracked as accepted presentation.

## Strict-headless siege combat death-message replay — 2026-08-09

This replay used only the CLI `agent-browser` session
`pt-residual-20260809` with `AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless`. The opt-in `?playtest=1` DOM bridge
supplied the 80×25 console buffer and key injection; no headed browser was
launched or focused.

A fresh Portuguese campaign entered the debug police-siege warehouse and
reached the live `F - Lutar` combat route. The pre-fix final-words death line
was clipped at the fixed-width boundary:
`Policial da SWAT profere suas últimas palavras: "Melhor morrer do que ser liber`.
The post-fix replay kept the complete sentence by wrapping it across the two
message rows:
`Policial da SWAT profere suas últimas palavras: "Melhor morrer do que ser` /
`liberal...`.

The shared death renderer now uses the existing two-row message area and
`addparagraph`, with `noTranslate: true` after interpolation. The focused
`test/sitemode/fight_death_layout_test.dart` regression passed and verified that
every console row remains exactly 80 columns. Captures are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-death-20260809/`.

The same pass rechecked the siege victory screen and the title/save-manager
route at a 480×320 viewport. The fixed-width canvas remained usable, but the
title version line still runs into the right edge at that size; this is the
existing PT-083 responsive-console enhancement, not a new translation defect.
PT-048/PT-148 remain open for a non-siege live-combat death/post-fight-summary
variant, and PT-049 remains the intentional English changelog body.

## Strict-headless ordinary police combat replay — 2026-08-09

This follow-up used only the CLI `agent-browser` session
`pt-route2-20260809` with `AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless`; no headed browser was launched or
focused. The opt-in `?playtest=1` DOM bridge supplied the fixed 80×25 buffer and
key injection.

The fresh Portuguese campaign entered `Delegacia de Polícia`, walked the
ordinary site map, and stalled until two police officers appeared. Before the
fix, the roster overwrote the map preview with armor text (`Bem +Ext.d` and
`Bem   xt.`); the saved buffer is `overlap.txt`. After rebuilding, the same
route rendered bounded status (`Bem +…`) followed immediately by the intact
map border and tiles; `overlap-fixed.txt` records the result. The female death
branch was also reproduced before the fix as `o corpo ela`; the deterministic
focused regression now verifies `o corpo dela`.

Residual coverage remains PT-048/PT-148 terminal combat summaries, PT-083
narrow-console readability, and accepted PT-049 historical changelog English.

## Strict-headless education-picker replay — 2026-08-10

This pass used only the CLI `agent-browser` session `pt-next-20260810` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`
against the local web-server build on port 7806. The opt-in `?playtest=1` DOM
bridge supplied the fixed 80×25 console buffer and key injection; no headed
browser was launched or focused. Disposable founder/all-items/funds fixtures
were reverted before validation.

The fresh Portuguese campaign reached Base → Atribuir Tarefas → Educação e
Aprendizado → Praticar uma Habilidade. Before the fix, every skill row joined
the max value to its description, for example `38.00Crie obras visuais de
beleza.`; the captured buffer is
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/education-skill-layout-20260810/before.txt`.
After moving the description column one cell right and fitting its text, the
same route rendered `38.00 Crie obras visuais de beleza.` with a blank
separator at column 34 and all rows exactly 80 columns; the after-capture is
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/education-skill-layout-20260810/after.txt`.
PT-230 records the defect and `test/basemode/pt_br_core_layout_test.dart`
guards the fix.

The residual queue remains PT-048/PT-148 terminal combat summaries,
PT-083 narrow-console readability, and accepted PT-049 historical changelog
English.

## Strict-headless narrow-title replay — 2026-08-10

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The Portuguese title was rendered at a real 480×320 headless viewport; no
headed browser was launched or focused.

The pre-fix screenshot showed `Versão 1.5.5.HF.1-SNAPSHOT` overwriting the
title frame's right edge. The title renderer now leaves the two reserved
border columns blank. The post-fix screenshot keeps the complete version line
inside the frame, and the focused title regression asserts that columns 78 and
79 remain spaces. Captures are retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/title-narrow-pt-480x320-20260810.png`
and
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/title-narrow-pt-480x320-20260810-fixed2.png`.

The remaining open coverage is PT-048/PT-148 live combat death/post-fight
variants and PT-083's broader responsive-console audit; accepted PT-049
historical changelog English remains out of scope.

## Strict-headless save-manager sweep — 2026-08-10

This follow-up used the same CLI-only `agent-browser` setup with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
At a real 480×320 viewport, a fresh Portuguese campaign was auto-saved, opened
through `Carregar e gerenciar salvamentos`, and loaded again. The list header,
save row, action menu, and return prompt stayed within the 80-column buffer;
key prefixes such as `A -`, `L -`, `D -`, `E -`, and `Entre -` remained intact.

The retained capture is
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/save-manager-pt-480x320-20260810.png`.
No new translation or layout defect was confirmed. PT-048/PT-148 terminal
combat/post-fight coverage and the broader PT-083 responsive-console audit
remain open; accepted PT-049 historical changelog English remains out of scope.

The same viewport also visited `Opções de Jogo → Opções de Interface` and
`Conteúdo e Tom`. Their wrapped Portuguese paragraphs stayed inside the
80-column buffer with no text reaching column 79.

## Strict-headless live combat possessive replay — 2026-08-10

This pass used only the CLI `agent-browser` session
`pt-terminal-heart-fixed-20260810` with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless` against the local
web-server build on port 7815. The DOM bridge supplied the fixed 80×25 buffer;
no headed browser was launched or focused.

The Portuguese campaign entered a police siege, reached `CERCO: FUGIR OU
ENFRENTAR`, ran the live `F - Lutar` combat loop, and returned through the
Portuguese `VITÓRIA` screen to squad management. The earlier run exposed
`O coração de Policial da SWAT foi destruído!`; the heart templates now pass a
locale-aware possessive phrase so generated role labels render with `do`/`da`
while proper names retain `de`. The focused context regression passed for both
cases. The victory capture is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/heart-possessive-20260810/victory-fixed.png`.

No terminal-death or post-fight-summary branch was reached in this replay;
PT-048/PT-148 remain open alongside PT-083's broader narrow-console audit and
accepted PT-049 historical changelog English.

## Strict-headless management and site-map replay — 2026-08-10

This pass used only the CLI `agent-browser` session
`pt-prod-7822-20260810` with `AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless` against the local web-server build
on port 7822. No headed browser was launched or focused. The opt-in
`?playtest=1` bridge supplied the fixed 80×25 buffer and key injection.

The fresh Portuguese campaign visited the base task picker and reproduced the
Tailoring vocabulary mismatch (`T - Costura` versus `Alfaiataria` in the rest
of the UI). After the catalog fix, the live picker rendered `T - Alfaiataria`;
the focused activity-menu regression passed.

The same campaign visited Centro de Seattle and generated
`Quiosque de Latte Maravilha de Noite`; focused composition tests cover the
repaired `Leite`/`Espuma` fragments that previously produced
`Caneca de Leitoso`.

At a police-station site, `M - Mapa` previously left partial controls beneath
the full-map draw (`W,A,` and a truncated second row). The overlay now clears
the underlying roster and legend and shows the complete Portuguese dismissal
prompt in row 24. Before/after buffers and screenshots are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/site-controls-overflow-20260810/`.

The remaining queue is PT-048/PT-148 terminal combat/post-fight coverage,
PT-083's broader narrow-console audit, and accepted PT-049 historical
changelog English.

## Strict-headless vehicle/profile replay — 2026-08-09

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`
against a freshly restarted Flutter `web-server` build on port 7831. No headed
browser was launched or focused. The `?playtest=1` DOM bridge supplied the
fixed 80×25 console and key injection.

The fresh Portuguese campaign visited vehicle assignment. Before the restart,
the passenger prompt was English and the footer controls were written below
the visible console. After the catalog/layout fix, the driver prompt rendered
`Escolha um Liberal para dirigir.`, the passenger prompt rendered
`Escolha um Liberal para ser passageiro.`, the status legend was Portuguese,
and `Entre - Concluído` remained visible on row 24. Captures are retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fixed-route-20260809/vehicle-after-fresh-server.txt`,
`vehicle-passenger-after.txt`, and `vehicle-driver-after.txt`.

The same debug-assisted campaign opened review-mode Liberal details with a
severe injury list. The old `A - Atribuir uma TarefaO` collision is captured in
`review-profile-before.txt`; after reserving the footer row, the action and
`+8 outras — BAIXO` marker occupy separate rows in
`review-profile-after-decoded.txt`. Focused regressions cover both defects:
`test/basemode/pt_br_vehicle_layout_test.dart` and
`test/basemode/pt_br_profile_footer_layout_test.dart`.

Debug flags were restored to their committed all-false values after the replay.
The residual queue remains PT-048/PT-148 terminal combat summaries, PT-083
narrow-console readability, and accepted PT-049 historical changelog English.

## Strict-headless CIA siege and title-stat replay — 2026-08-09

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`
against freshly restarted Flutter `web-server` builds on ports 7841 and 7842.
No headed browser was launched or focused. The opt-in `?playtest=1` bridge
supplied the fixed 80×25 buffer and key injection.

The debug-assisted Portuguese campaign entered a CIA safehouse siege. The
before buffer reproduced `CÂMERAS DESLIGADARMADILHAS` and
`CANHÃO AAPOSTES`; after fitted status cells and a one-column separator, the
same row rendered `CÂMERAS DESLIGADAS   ARMADILHAS   CANHÃO AA POSTES` with
`LUZES APAGADAS` still inside the console. The durable buffers are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/siege-cia-20260809/`.

The title replay then switched to Portuguese and confirmed the universal
statistics now say `Total de Americanos Perdidos` and `Total de Americanos
Salvos`, replacing the misleading `Américas` wording. The capture is retained
at `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/title-stats-pt-20260809/title.txt`.

Focused base-layout and title-translation regressions passed. Debug flags were
restored to their committed all-false values. The next useful route remains a
deterministic non-police terminal death/post-fight summary for PT-048/PT-148,
followed by the broader PT-083 narrow-console audit; accepted PT-049 historical
changelog English remains out of scope.

## Strict-headless activity-category replay — 2026-08-11

This pass used the CLI `agent-browser` only, with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`
against a freshly restarted Flutter `web-server` build on port 7851. The
viewport was 480×320, and the opt-in `?playtest=1` DOM bridge supplied the
80×25 buffer. No headed browser was launched or focused.

The Portuguese campaign reached Base → `Atribuir Tarefas`, selected a Liberal,
and opened `D - Recrutamento e Aquisição`. The pre-fix buffer retained the
unrelated footer `vai assar e vender brownies de maconha.` after the category
changed; it is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/activity-sweep-20260811/acquisition-menu.txt`.
The fixed build clears rows 22–24 while the acquisition submenu is open, as
shown in
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/activity-sweep-after-20260811/07-acquisition-menu-postfix.txt`
and its screenshot. Selecting `1 - Recrutar` then restores the expected
Portuguese preview (`vai recrutar novos membros.`) in
`08-acquisition-recruiting-postfix.txt`.

PT-070 is fixed. Temporary siege/all-items/funds debug flags were restored to
their committed all-false values after the replay. The residual queue remains
PT-048/PT-148 terminal combat summaries, PT-083 narrow-console readability,
and accepted PT-049 historical changelog English.

## Strict-headless review-profile footer replay — 2026-08-11

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`
against a freshly rebuilt Flutter `web-server` on port 7862. The viewport was
480×320, and the opt-in `?playtest=1` DOM bridge supplied the fixed 80×25
buffer. No headed browser was launched or focused.

The debug-assisted Portuguese campaign opened Base → `R - Revisar Ativos e
Formar Equipes` → `1 - Liberais Ativos` → the founder profile. The pre-fix
footer capture showed `CIMA BAIXO - Mais Info`: the translated `CIMA` prefix
overlapped the literal separator before `BAIXO`.

The fixed build renders `CIMA / BAIXO - Mais Info` in the same route, with the
separator and both controls visible inside the narrow console. The corrected
buffer and screenshot are retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/route-sweep-after-20260811/25-profile-after-fix`
and
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/route-sweep-after-20260811/25-profile-after-fix.png`.
The focused `Portuguese review profile footer preserves the navigation
separator` regression passed. Temporary all-items, injury, and funds fixtures
were restored to their committed all-false values after the replay.

## Strict-headless hospital and investment-menu replay — 2026-08-09

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
No headed browser was launched or focused. The opt-in `?playtest=1` DOM bridge
supplied the fixed 80×25 buffer at a 480×320 viewport.

The debug-assisted hospital route reproduced the stale-tail defect: after a
long `estará em Centro Médico UW por 16 meses.` message, the next-day death
result retained the suffix (`...morreu de ferimentos.co UW por 16 meses.`).
After replacing the raw row write with the shared clearing message helper, a
fresh replay rendered only `Grace Redman morreu de ferimentos.`. The before and
after buffers and a screenshot are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/management-hospital-sweep-20260809/`
and
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/management-hospital-sweep-after-20260809/`.

The same fresh Portuguese campaign reached the LA warehouse investment menu.
Before the fix, the bollard option was clipped at `(US` and contained invisible
zero-width spaces; static and dynamic prices also used inconsistent currency
notation. The fixed menu fits every option to the remaining console width,
renders `B - Instale postes reforçados contra veículos (US$ 3.000)`, and uses
the same `US$`/thousands separator convention for dynamic costs. The after
buffer and screenshot are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/map-invest-after-20260809/`.

The route continued through a real pawn-shop visit (guns, ammunition, Liberal
tools, equipment, and sell screens). Those screens remained Portuguese and
inside the fixed console; no additional shop defect was confirmed. Temporary
all-items/funds fixtures were restored after the replay.

## Strict-headless live corporate-combat replay — 2026-08-09

This pass used only the CLI `agent-browser` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`
against a freshly restarted Flutter `web-server` on port 7891. The viewport
was 480×320 and the opt-in `?playtest=1` DOM bridge supplied the 80×25 console;
no headed browser was launched or focused. A temporary local-only siege
fixture placed one fragile founder against a corporate mercenary so the live
`F - Lutar` death branch could be replayed deterministically; the fixture was
removed before validation.

The before buffer showed `Private Military atira...` and a raw-English
`Private Military` roster row in an otherwise Portuguese encounter. After the
catalog fix, the same route rendered `Militar Privado atira...` and
`Militar Privado  Equipamento PMC ...` in
`06-live-encounter-after.txt`. The replay continued through the Portuguese
`C - Reflita sobre sua incompetência Conservadora` death reflection and the
high-score screen in `08-game-over-after.txt`; no additional live-combat
layout defect was confirmed. Durable captures are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-live-20260809/`.

PT-242 is fixed. This pass also closes the live death/post-fight runtime
coverage gap noted under PT-048/PT-148; broader random police-alarm variants,
PT-083 narrow-console readability, and accepted PT-049 historical changelog
English remain open.

## Strict-headless founder/status replay — 2026-08-09

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`
against a freshly rebuilt Flutter `web-server` on port 7895. The viewport was
480×320 and the opt-in `?playtest=1` DOM bridge supplied the 80×25 console; no
headed browser was launched or focused.

The Portuguese route selected a new founder in Washington, DC, traversed the
biography volunteer branch, completed the introduction/name screen, and
reached the base status header. The visible output remained Portuguese,
including `~130/130 +~30 (proteção)`, the volunteer biography answer, and
`DC — Sem-teto`.

The pre-fix warning capture reported false missing translations for those
already-rendered values. Compact health/armor values now translate only stable
catalog entries, already-localized biography options opt out of a second pass,
and city short codes bypass prose translation. The fresh after-fix warning
capture contains none of those false entries. Durable evidence is under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/dc-route-20260809/`, including
`07-console-warnings-after.txt`, `07-tragic-origin-volunteer-after.txt`,
`08-base-after-city-code.txt`, and `08-console-after-city-code.txt`.

No new visible translation or layout defect was confirmed on this route.

## Strict-headless headquarters and security-site replay — 2026-08-09

This pass used only CLI `agent-browser` with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless` against a freshly rebuilt
Flutter `web-server` on port 7904. The viewport was 480×320, and the opt-in
`?playtest=1` DOM bridge supplied the fixed 80×25 buffer. No headed browser was
launched or focused.

The Portuguese route reached `Leste de Washington` with the four destination
labels translated: `Prisão Rehnquist`, `Sede de Inteligência`, `Sede
Corporativa`, and `Base do Exército Adams`. Entering Corporate HQ rendered the
site header as `SEA — Sede Corporativa, Nível 1`; the fresh console contained
only map/resource logs and no targeted missing-translation warnings. The
before/after buffers are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809/` and
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809-final/`.

The same HQ fixture instantiated the security `Guard Dog` encounter path.
The Portuguese context regression now verifies `Cão de Guarda`, while the
runtime route stayed Portuguese and introduced no additional layout defect.
The temporary founder/item cheats were restored to their committed all-false
values, and the headless browser/server were closed after capture.

## Strict-headless narrow management and CIA-siege replay — 2026-08-09

This pass used only CLI `agent-browser` sessions with `AGENT_BROWSER_HEADED=0`
and Chromium `--headless=new --ozone-platform=headless`. The viewport was
480×320, and the opt-in `?playtest=1` DOM bridge supplied the fixed 80×25
buffer and key events. No headed browser was launched or focused.

The fresh Portuguese founder route traversed Review → Assemble Squad, media,
agenda, vehicles, travel, Corporate HQ, the site map/help overlay, and site
equipment. The new-squad header reproduced PT-248 before the fix: the fixed
column-71 placement cut `Novo Esquadrão` to `Novo Esqu`. After replacing that
placement with localized right alignment, the fresh replay shows the complete
header in `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-sweep-20260809/14-assemble-squad-fixed.txt`
and its screenshot. The other narrow routes stayed Portuguese and within the
80-column buffer; bounded ellipses in compact roster/profile cells remain the
accepted PT-083/long-label presentation queue.

A temporary CIA-siege fixture then reached the Portuguese safehouse briefing,
combat roster, and fixed-width site controls. The route confirmed the spaced
compound-status row and localized `SOB ATAQUE: FUGIR OU ENFRENTAR` briefing;
random movement did not reach a second live encounter in this pass. Evidence
is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-cia-20260809/`.
The debug flags were restored to their committed all-false values before
validation.

The residual queue is PT-048/PT-148 broader random combat/post-fight coverage,
PT-083 narrow-console readability, and accepted PT-049 historical changelog
English. The profile phrase `Qualquer outra tecla - continue a Luta` was
reviewed against the source key's capitalization and retained intentionally.

## Strict-headless police-station rescue and localized yes/no replay — 2026-08-09

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless`.
The viewport was 480×320, the opt-in `?playtest=1` DOM bridge supplied the
fixed 80×25 console, and no headed browser was launched or focused. A
temporary `debugPartyRescue` fixture populated the police-station justice
roster; the flag was restored to `false` before validation.

The route reached `Centro de Seattle` → `Delegacia de Polícia`, entered the
site map, and confirmed the 20 generated college-student Liberals appear in
`Liberais no Sistema Judiciário`. The locked-door prompt exposed PT-249: its
Portuguese text said `Tentar arrombar a fechadura? (Sim ou Não)`, but `S` did
nothing before the fix. A clean server restart after the input helper landed
accepted `S` and rendered `Wendell Sellers destranca a porta!`.

Durable before/after captures are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/party-rescue-20260809/` and
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/party-rescue-fixed-20260809/`.
The remaining route did not expose another confirmed translation or layout
defect; PT-048/PT-148 random combat variants, PT-083 narrow-console
readability, and accepted PT-049 changelog English remain in the queue.

## Strict-headless responsive-console and options replay — 2026-08-09

This pass used only CLI `agent-browser` with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless --disable-dev-shm-usage`.
The Flutter `web-server` ran on port 7913; no headed browser was launched or
focused. The viewport was first 320×240, then 200×150, while the opt-in
`?playtest=1` bridge supplied the complete 80×25 console buffer.

The Portuguese route covered the title and language menu, new-game settings,
all founder biography screens, the base, review/active roster, founder profile
and skill detail, game options, interface options, and content/tone options. A
font-size increase to 20 was also checked at 200×150. Long Portuguese labels
used their existing bounded ellipses, all fixed-width rows remained within the
80-column buffer, and no English labels or stale tails were observed. The
browser error channel was empty.

Durable captures are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow083-20260809/`, including
the 320×240 title/base/profile views and the 200×150 profile and font-size
title screenshots. No new translation or layout defect was confirmed. PT-083
remains a future responsive-readability enhancement, PT-048/PT-148 remain
broader random-combat coverage, and PT-049 remains the accepted historical
English changelog body.

## Strict-headless vegan bar label replay — 2026-08-09

This pass used only CLI `agent-browser` with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless --disable-dev-shm-usage`
against a freshly restarted Flutter `web-server` on port 7918. The viewport
was 480×320, and the opt-in `?playtest=1` DOM bridge supplied the 80×25
console; no headed browser was launched or focused.

The catalog audit identified `Vegan Bar` as `Barra Vegan`. A temporary
developer-only founder fixture forced a bar site into the normal campaign base
so the translated short name could be checked in context. The before capture
showed `SEA — Barra Vegan` in the campaign header and base panel. After the
catalog entry changed to `Bar Vegano`, a clean server restart rendered
`SEA — Bar Vegano` in both locations. The fixture was removed before code
validation and the debug flags were restored to their committed all-false
values. Durable before/after buffers and screenshots are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/vegan-bar-20260809/`.

No additional translation or layout defect was confirmed on this route. The
residual queue remains PT-048/PT-148 terminal combat/post-fight coverage,
PT-083 broader narrow-console readability, and accepted PT-049 historical
changelog English.

## Strict-headless Portuguese combat/footer replay — 2026-08-09

This pass used only CLI `agent-browser` with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless --disable-dev-shm-usage`
against a freshly reloaded Flutter `web-server` on port 7921. The viewport was
320×240 while the opt-in `?playtest=1` bridge supplied the fixed 80×25 console;
no headed browser was launched or focused.

The deterministic police-siege route reached the Portuguese
`SOB ATAQUE: FUGIR OU ENFRENTAR` briefing and live combat. Before the renderer
fix, the ground-loot label collided with the wrapped action legend:
`R:ReorganizaSaque no chão!` (capture:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-footer-loot-20260809/01-loot-footer-before.txt`).
The loot indicator now uses the free left side of row 22 and is drawn after
encounter clearing. The fresh combat buffer keeps the final row readable as
`R:Reorganizar ?`; `test/localized_layout_regression_test.dart` also asserts
the Portuguese `Saque no chão!` indicator and row-24 footer together.

The same route exposed an English fallback in the high-success interview event:
the code had concatenated two separately cataloged English keys before calling
the translator. The branch now translates each sentence independently and
`test/daily/siege_translation_test.dart` guards both Portuguese outputs.

Combat also produced the understandable but machine-like
`a língua de Policial da SWAT é explodida!`; this was logged as PT-253 and
resolved in the follow-up replay below. No other live translation or layout
defect was confirmed in this initial pass.

## Strict-headless Portuguese injury and safehouse replay — 2026-08-09

This verification pass used only CLI `agent-browser` with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new --ozone-platform=headless
--disable-dev-shm-usage` against a freshly restarted Flutter `web-server` on
port 7934. The opt-in `?playtest=1` DOM bridge supplied the fixed 80×25 console;
no headed browser was launched or focused.

The fresh base screen reproduced the long safehouse-name route. Before the
fitted renderer was rebuilt, `SEA — Fabricantes de brinquedos` overwrote the
security-box border and ran into `O - Reordenar`. The fixed fresh buffer now
keeps the frame visible, for example `┌SEA — Escola────┐            O -
Reordenar`; `test/basemode/pt_br_core_layout_test.dart` asserts the 16-cell
name budget and right border.

The same run entered the Portuguese siege combat roster and live hit-message
buffer. It showed the corrected injury vocabulary (`O nariz ... foi
destruído!`, `O pulmão direito ... foi destruído!`, and
`Os ossos do pescoço ... foram estilhaçados!`) with no English injury fallback.
The focused combat regression also confirms that a fleeing officer renders as
`policial da SWAT`, not `policial da swat`; the acronym-preserving helper is
covered by `test/sitemode/site_encounter_layout_test.dart` and
`test/pt_br_context_translation_test.dart`.

The route reached live combat after the `CERCO: FUGIR OU ENFRENTAR` briefing.
No additional translation or layout defect was confirmed in this fresh pass.

## Strict-headless corporate-siege and empty-squad replay — 2026-08-09

This pass used only CLI `agent-browser` sessions with
`AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless --disable-dev-shm-usage`. Fresh
Flutter `web-server` instances ran on local ports 7939–7942; no headed browser
was launched or focused. The opt-in `?playtest=1` bridge supplied the fixed
80×25 console.

A temporary local fixture forced a Portuguese corporate siege. The safehouse
briefing, four-enemy PMC roster, live attack and injury messages, loot footer,
map overlay, and action legend all stayed Portuguese and within the 80-column
console. The durable combat capture is
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/corporate-siege-20260809/combat-loot.png`.
`Equipamento PMC` is understandable in context; no translation or layout
defect was promoted from this stable replay.

The same route exposed residual PT-256: selecting the attacked safehouse with
no active squad, then choosing `F - Lutar/Fugir` and `X - Enfrentar`, changed
the live buffer to `RELATÓRIO DE FALHA` with `Bad state: No element`. The stack
identified `lib/sitemode/sitemode.dart:211`, where `_siteModeAux` reads
`squad.first` after checking only `activeSquad`. The crash is logged in
`findings.md` for a future runtime fix. All temporary siege/debug hooks were
restored before validation, and the repository returned to its pre-playtest
tracked diff.

## Strict-headless empty-defense fix replay — 2026-08-09

This follow-up used only the CLI `agent-browser` with
`AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless --disable-dev-shm-usage` against a
fresh Flutter `web-server` on port 7943. No headed browser was launched or
focused; the 480×320 viewport still used the opt-in `?playtest=1` DOM bridge
for the fixed 80×25 console.

The deterministic Portuguese fixture selected the attacked corporate
safehouse with no defenders. Pressing `F - Lutar/Fugir` after the fix rendered
`Não há Liberais disponíveis para defender este esconderijo.` and returned to
the base screen after one keypress. The browser error channel stayed empty and
the durable after capture is under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/empty-defense-20260809.txt`
with its screenshot at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/empty-defense-20260809.png`.
All temporary debug hooks were restored before validation.

PT-256 is fixed; continue the remaining PT-048/PT-148 random combat coverage,
PT-083 narrow-console readability sweep, and accepted PT-049 historical
changelog English review queue.

## Strict-headless terminal-combat layout follow-up — 2026-08-09

This pass used only the CLI `agent-browser` with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless --disable-dev-shm-usage`
against a freshly hot-restarted Flutter `web-server` on port 7944. The
480×320 viewport used the opt-in `?playtest=1` bridge for the fixed 80×25
console; no headed browser was launched or focused.

A temporary in-memory terminal police-siege fixture reached the Portuguese
encounter roster. The old capture showed every armored enemy as `+…` because
the translated `(proteção)` suffix consumed the six-cell health budget (PT-257).
The fixed replay now shows compact `+` markers (`170 +`, `140 +`) while the
wider party roster keeps numeric armor details. The same route produced a long
Portuguese hit sentence that previously ran into the column-80 boundary (PT-258).
The fixed attack renderer wraps it across rows 9–10; the captured message is
complete and the browser error channel is empty.

The death-reflection route also confirmed PT-259: a defeated enemy briefly
rendered a negative health value such as `-4 +24` (the fresh capture also
showed `-400 +`) before its row was removed. A focused regression now requires
dead encounter rows to remain blank, and the renderer skips them while the
death message is displayed.

A fresh server restart and strict-headless 480×320 replay then advanced 34
combat turns through multiple SWAT deaths. The live buffer retained only
living rows, reported 25 rows all exactly 80 cells wide, and had an empty
browser error channel. The fixed capture is
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-death-20260809/fixed-replay-7976.txt`
with screenshot `fixed-replay-7976.png`.

Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-combat-fixed-20260809.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-combat-fixed-20260809.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-death-20260809/replay-negative-7974.txt`, and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-death-20260809/fixed-replay-7976.txt`.

## Strict-headless Portuguese medical-debt replay — 2026-08-09

This pass used only CLI `agent-browser` with `AGENT_BROWSER_HEADED=0` and
Chromium `--headless=new --ozone-platform=headless --disable-dev-shm-usage`
against a freshly restarted Flutter `web-server` on port 7960. The opt-in
`?playtest=1` bridge supplied the fixed 80×25 console; no headed browser was
launched or focused. A deliberate pause after choosing Portuguese ensured the
locale catalog finished loading before the campaign route continued.

The medical-debt siege roster reproduced PT-260 and PT-261 before the fix:
`Actuary`, `Claims Adjuster`, and `cPA` appeared alongside Portuguese labels.
After adding the role entries, making generated-name matching case-insensitive,
using the idiomatic `Regulador de Sinistros`, and preserving leading acronyms,
the restarted server reported 7,912 loaded Portuguese translations and the
roster rendered `Regulador de Sin…` and
`CPA`. `Auditor` stayed unchanged as a valid Portuguese cognate. The fixed
capture is `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-fixed-server-restart-20260809.txt`
with a screenshot at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-fixed-server-restart-20260809.png`;
the browser error channel was empty.

At that point PT-262 was a low-priority readability enhancement: the fixed
17-cell column fit `Trabalhador de Escritório` as `Trabalhador de E…` without
column overlap. The later roster follow-up closes it with a compact cataloged
label. One playtester detail is worth retaining: after ARB edits, a Flutter
web-server hot restart can keep the old asset snapshot. Restart the web server
before judging catalog changes; the fresh process loaded the new catalog.

## Strict-headless Portuguese CIA-siege replay — 2026-08-09

This pass used only the CLI `agent-browser` session `cia-headless-7972` with
`AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless --disable-dev-shm-usage
--disable-cache` against a fresh Flutter `web-server` on port 7972. No headed
browser was launched or focused. The opt-in `?playtest=1` bridge exposed the
fixed 80×25 console; the replay also checked a 640×480 rendering.

A temporary CIA-siege fixture reached the Portuguese safehouse warning,
fortification status, siege briefing, and encounter roster. The opening
message exposed PT-263: `cerca o Estação Esquecida` used a masculine article
before the feminine generated site name. The catalog was then changed to the
neutral `cerca o local chamado {location}` template, and the focused regression
covered both masculine and feminine site names.

A fresh server restart and strict-headless replay rendered
`cerca o local chamado Frigorífico Abandonado.` at 640×480. All 25 bridge rows
remained exactly 80 cells wide and the browser error channel stayed empty.
The before/after buffer and screenshots are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-siege-20260809/`.
Movement and map inspection found no additional translation or layout defect
before the fixture was restored.

The temporary `debugSiege`/CIA changes were reverted before leaving the route;
`agent-browser.json` remains configured with `headed: false`.

## Strict-headless Portuguese corporate terminal-death sweep — 2026-08-09

This pass used a fresh Flutter `web-server` on port 7978 and the typed
`agent-browser` session `merc-pt-7978` with `headed=false` plus
`--headless=new --ozone-platform=headless --disable-dev-shm-usage
--disable-cache`. The `?playtest=1` bridge supplied the fixed 80×25 console;
the browser error channel stayed empty and no headed browser was launched or
focused.

A temporary local-only fixture placed the Portuguese squad at its generated
safehouse and seeded corporate mercenaries into the siege sally-forth roster.
The fixture was removed before validation. The live route reached
`CERCO: FUGIR OU ENFRENTAR`, rendered `Militar Privado`/`Equipamento PMC`, and
advanced 140 combat inputs. Randomized terminal text included
`Militar Privado profere suas últimas palavras: "Melhor morrer do que ser ..."`
and `O Policial da SWAT sussurra "Estou morto?"`; generated names and death
templates stayed Portuguese, with no raw `Private Military` or `SWAT Officer`
leak.

Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-merc-20260809/replay.txt`.
The remaining queue is broader police-alarm surrender/arrest variation under
PT-048/PT-148, PT-083 narrow-console readability, and accepted PT-049
historical changelog English.

## Strict-headless ultranarrow Portuguese options replay — 2026-08-09

This pass used only CLI `agent-browser` session `pt083-7980` with
`AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless --disable-dev-shm-usage
--disable-cache` against a fresh Flutter `web-server` on port 7980. The
viewport was checked at 320×240 and 240×160; no headed browser was launched or
focused. The opt-in `?playtest=1` bridge supplied the fixed 80×25 console.

The Portuguese route traversed the title language menu, `Opções de Jogo`,
`Opções de Interface`, and `Conteúdo e Tom`. The interface font was increased
from 16 to 24 at 240×160 before returning to the title screen. Portuguese
labels stayed localized, including `ESQUADRÃO DO CRIME LIBERAL: NOVA ERA`,
and the scan found no stale `English`, `Portuguese`, `Private Military`,
`SWAT Officer`, `Enter`, `Continue`, or `Options` tokens. All 25 bridge rows
remained exactly 80 cells wide; the 240×160 document had no horizontal or
vertical overflow, and the browser error channel stayed empty.

Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt083-narrow-20260809/replay.txt`
and the accompanying screenshots. No new translation or layout defect was
confirmed. PT-083 remains a responsive-readability enhancement because the
fixed console is necessarily tiny on very narrow viewports; the checked
routes did not clip, wrap incorrectly, or lose controls. The residual queue
remains broader police-alarm surrender/arrest coverage under PT-048/PT-148
and accepted PT-049 historical changelog English.

## Strict-headless police-siege surrender replay — 2026-08-09

This pass used only CLI `agent-browser` session `police-subdue-7981` with
`AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless --disable-dev-shm-usage
--disable-cache` against a fresh Flutter `web-server` on port 7981. No headed
browser was launched or focused. A temporary local-only `debugSiege` fixture
was restored before validation.

The Portuguese campaign reached `Siderúrgica Abandonada` under police siege,
selected `F - Lutar/Fugir`, and entered the foot chase. The live frame showed
the localized roster (`Policial da SWAT`, `Armadura da SWAT`) and the action
legend `D - Tentar despistá-los, F - Lutar, E - Equipar, O - Ordenar, G - Desistir`.
After the evasive sequence completed, `G - Desistir` remained visibly grey and
pressing `G` twice left the bridge buffer unchanged; no arrest result appeared.
This confirms PT-264, a residual police-siege control bug: the screen
advertises surrender but does not accept it in this foot-chase variant.

Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-siege-surrender-20260809/`.
No additional translation or fixed-width layout defect was found on this
screen. Continue PT-264 alongside the broader PT-048/PT-148 police-alarm
coverage, PT-083 responsive readability, and accepted PT-049 historical
changelog English.

## Strict-headless police-siege base surrender comparison — 2026-08-09

To isolate PT-264, a fresh strict-headless Portuguese replay selected the same
under-siege safehouse and used the base-mode `G - Desistir` action before
entering the foot chase. The action worked and produced localized results:
`A polícia confisca tudo, incluindo armas do Esquadrão.`,
`Felizmente, seus fundos permanecem intactos.`,
`As fortificações do complexo são desmontadas.`,
`As armadilhas são desarmadas e removidas.`, and
`A arma antiaérea é desmontada.`. After `Enter`, the base returned with
`Você não está sob cerco... ainda.` and no browser errors.

This comparison narrows PT-264 to the foot-chase surrender control; the base
give-up path is localized and functional. Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-siege-giveup-20260809/`.

## Strict-headless police-siege surrender fixed replay — 2026-08-09

The PT-264 fix was replayed in a fresh CLI `agent-browser` session
`police-fixed-7983` with `AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless --disable-dev-shm-usage
--disable-cache` against a new Flutter `web-server` on port 7983. No headed
browser was launched or focused. The temporary deterministic `debugSiege`
fixture was enabled only for this run and restored to false before validation.

The Portuguese campaign reached the besieged `Garagem de Ônibus Velha`,
entered `CERCO: FUGIR OU ENFRENTAR`, and opened the foot chase. The roster
showed ten localized `Policial da SWAT` pursuers and the action legend kept
`G - Desistir`. Pressing `G` now resolves to `Você para e é preso.`, proving
that the previously disabled surrender action is wired to the arrest result.

The fixed buffer had 25 rows, a maximum width of 80, no rows over the console
boundary, no English-control matches, no browser errors, and no pending
options. Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-siege-fixed-20260809/`.
PT-264 is closed; continue the broader PT-048/PT-148 alarm variants and the
remaining layout/readability residuals.

## Strict-headless medical-debt announcement replay — 2026-08-09

This follow-up used only CLI `agent-browser` session `medical-fixed-7985` with
`AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless --disable-dev-shm-usage
--disable-cache` against a fresh Flutter `web-server` on port 7985. No headed
browser was launched or focused. Temporary debt/funds fixtures plus a one-off
medical timer assignment were used to reach the route and restored before
cleanup.

The nightmare-law Portuguese campaign triggered the medical-industry raid at
the homeless encampment. The first announcement localized only the generated
location (`Acampamento sem-teto`); the following office-worker/finance speech
pages were raw English, including `A gangly accountant climbs up...` and
`Please, we don't wanna shoot anyone, we're from the finance department!`.
The final `Cobradores de dívidas hospitalares estão indo acertar contas com
Acampamento sem-teto.` line was localized. This confirms PT-265: the catalog
has source fragments, but the concatenated full `addparagraph` strings do not
match those fragment keys at runtime.

The same route surrendered to the medical collectors. The receipt labels and
dot leaders remained Portuguese and aligned, but its title read
`PARA HOMELESS CAMP:` while the rest of the UI used `Acampamento sem-teto`.
This confirms PT-266, a separate dynamic-name localization leak. The retained
receipt capture and route notes are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-residual-20260809/`.

## Strict-headless medical-debt fix replay — 2026-08-09

After replacing the fragment-only briefing calls with complete cataloged
templates and passing `loc.getName()` into the receipt title, a fresh
`medical-fix-7985` replay used only headless Chromium with
`AGENT_BROWSER_HEADED=0` and
`--headless=new --ozone-platform=headless --disable-dev-shm-usage
--disable-cache`. The temporary debt/funds fixture was restored before
cleanup; no headed browser was launched or focused.

All three announcement pages were Portuguese: the first rendered
`Uma pequena frota de ambulâncias...`, the second rendered
`Um contador desengonçado sobe...`, and the third rendered
`O contador ergue um AR-15...`. The final status now reads
`Cobradores de dívidas hospitalares estão indo acertar contas com o local
chamado Acampamento sem-teto.` The dynamic-site wording stays grammatical
without assuming a masculine or feminine site name. Long text wrapped within
the fixed 80-column buffer.

The `G - Desistir` receipt now renders `PARA ACAMPAMENTO SEM-TETO:`. The
labels and amounts remain aligned at column 50, and the browser error channel
is empty. Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-fixed-20260809/`.
PT-265 and PT-266 are closed; continue with the remaining exploratory route
queue.

## Strict-headless responsive/options follow-up — 2026-08-09

A fresh Portuguese session at a 480×320 viewport used only the headless CLI
browser. The title, game-options, interface-options, and content/tone screens
were captured through the DOM bridge and screenshots. Long explanatory copy
wrapped inside the fixed 80-column console; toggling `Tom mais claro` changed
only its state line and did not leave stale text. `Page Up/Down`, `Mouse`, and
`JSON` remain intentionally technical labels, as recorded in PT-008.

The version footer is still visually tight at this viewport, but it remains
bounded and is the accepted PT-083 responsive-readability enhancement. No new
translation, layout, or browser-error defect was confirmed. Evidence is under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/responsive-followup-20260809/`.

## Strict-headless medical-debt roster compact-label replay — 2026-08-09

This route used only CLI `agent-browser` session `medical-role-7990` with
`AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless --disable-dev-shm-usage
--disable-cache` against a fresh Flutter `web-server` on port 7990. No headed
browser was launched or focused. A temporary medical-siege fixture injected
six generated Office Worker enemies so the fixed-width encounter roster could
be inspected deterministically; the fixture and all debug flags were restored
before validation.

The first live buffer showed six `Trabalhador de E…` rows in Portuguese. The
fixed replay, after restarting Flutter so the new ARB shard entry was loaded,
shows two fleeing `funcionário` rows and four `Funcionário` rows. Every row
keeps its clothing, weapon, health, and map preview cells; all captured lines
are at most 80 cells and `agent-browser errors` is empty. The full role label
still renders as `Trabalhador de Escritório` in the context regression.

Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-role-7990/`.
PT-262 is closed. Continue the broader PT-048/PT-148 police-alarm variants
and PT-083 responsive-readability route; accepted PT-049 historical changelog
English remains out of the fix queue.

## Strict-headless police terminal-combat and responsive sweep — 2026-08-09

- A fresh Portuguese police-siege fixture on Flutter web-server port 7991 was
  replayed exclusively through an isolated `agent-browser` session with
  `AGENT_BROWSER_HEADED=0` and Chromium `--headless=new`,
  `--ozone-platform=headless`, `--disable-dev-shm-usage`, and
  `--disable-cache`. No headed browser was launched or focused.
- The route covered the siege briefing, direct foot-chase `F - Lutar`,
  randomized combat hit/death/final-word messages, and the post-fight victory
  page. The surrender comparison also covered confiscation and court pages;
  the Portuguese defense branches rendered cleanly. No English controls or
  untranslated combat strings appeared, every captured buffer line stayed at
  or below 80 cells, and `agent-browser errors` remained empty.
- The 480×320 title, game-options, interface-options, and content/tone pages
  were captured headlessly. The version footer remains visually tight but
  bounded, matching the accepted PT-083 responsive-readability enhancement;
  no new clipping or translation defect was confirmed.
- The temporary police-siege fixture and debug flags were restored before
  validation. Evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-7991/`.

## Strict-headless Liberal Agenda context sweep — 2026-08-09

- A fresh Flutter web-server on port 7993 was exercised only through CLI
  `agent-browser` session `agenda-fix-7993` with
  `AGENT_BROWSER_HEADED=0` and Chromium `--headless=new`,
  `--ozone-platform=headless`, `--disable-dev-shm-usage`, and
  `--disable-cache`. No headed browser was launched or focused.
- The Portuguese route covered the five-page Liberal Agenda overview. Page 2
  exposed `opinião favorável do Presidente`; page 5 exposed the literal
  `grande dinheiro`, and page 4 showed the missing article/comma in the
  nuclear-power and death-penalty lines. These became PT-267.
- The catalog fixes were replayed after a full Flutter restart. Page 2 now
  renders `opinião favorável sobre Presidente`, page 4 renders
  `com a energia nuclear` and `permitida, mas`, and page 5 renders
  `As eleições são justas, mas sofrem forte influência das grandes fortunas.`
  The complete sentence fits without the prior truncation; longer law rows
  still use bounded fixed-column ellipses. No browser errors were reported.
- Evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agenda-fix-7993/`.
  PT-267 is fixed; retain PT-048/PT-148 for broader police-alarm variants,
  PT-083 for the accepted responsive-readability enhancement, and PT-049 for
  accepted historical changelog English.

## Strict-headless Los Angeles generated-site follow-up — 2026-08-09

- A fresh Portuguese new-game route used only CLI `agent-browser` session
  `city-sites-7995` with `AGENT_BROWSER_HEADED=0` and Chromium
  `--headless=new --ozone-platform=headless --disable-dev-shm-usage
  --disable-cache` against Flutter web-server port 7995. No headed browser was
  launched or focused.
- The pre-fix LA Downtown menu reproduced `Concurso Reflexões Casa de
  Enfermagem`; the Grande Hollywood menu reproduced raw `Cable News Station`,
  raw `CEO Mansion`, and `Cooperativa Vegana Prado Aspargo`.
- The fix adds a phrase-level nursing-home renderer with Portuguese
  gender/number agreement, complete Cable News/CEO/nursing site keys, and the
  missing vegan-co-op preposition. The changed catalogs and helper are covered
  by `test/location/site_translation_test.dart`.
- After a Flutter asset-manifest restart, the replay rendered `Casa de repouso
  Jornada Carinhosa`, `Canal de Notícias a Cabo`, `Mansão do CEO`, and
  `Cooperativa Vegana Prado de Rabanete`. The downtown and Hollywood buffers
  were each at most 80 columns, the screenshot showed no row collisions, and
  `agent-browser errors` was empty. Evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/city-sites-7995/`.
- PT-268 is fixed. Keep PT-048/PT-148 broader police-alarm variants, PT-083
  responsive readability, and accepted PT-049 historical changelog English in
  the residual queue.

## Strict-headless New York Oubliette translation replay — 2026-08-09

The first New York city sweep used only an isolated CLI `agent-browser` session
with `AGENT_BROWSER_HEADED=0` and Chromium
`--headless=new --ozone-platform=headless --disable-dev-shm-usage
--disable-cache`. The commerce menu exposed `The Oubliette`; after selecting
the shop and waiting a day, the base rendered `Visitando The Oubliette` and the
arrival message repeated the raw English name. The compact active-site header
also showed `NYC — Oubliette`. These captures are retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ny-sites-7996/`.

After adding full and short Portuguese catalog entries, a fresh Flutter
asset-manifest restart and strict-headless replay on port 7998 rendered
`O Calabouço`, `Visitando O Calabouço`, `O Esquadrão do Crime Liberal chegou ao
destino: O Calabouço.`, and `NYC — Calabouço`. The Oubliette action menu stayed
localized, every buffer row was at most 80 cells, the headless check reported
`HeadlessChrome`, and `agent-browser errors` was empty. Evidence is retained
under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/oubliette-fixed-7998/`.

PT-269 is closed. Continue the residual PT-048/PT-148 police-alarm variants,
PT-083 responsive-readability enhancement, and accepted PT-049 historical
changelog English review queue.

## Strict-headless Seattle juice-bar translation replay — 2026-08-09

The new route used only an isolated CLI `agent-browser` session with
`AGENT_BROWSER_HEADED=0` and Chromium `--headless=new
--ozone-platform=headless --disable-dev-shm-usage --disable-cache`. A disposable
founder/all-items/funds fixture reached Seattle's University District menu. The
pre-fix buffer showed `Bar de Energia Novo Você Laranja` for the generated juice
bar entry; the phrase had changed the site type from juice to energy bar. The
capture is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/daily-sweep-8000/`.

After changing the short and full Portuguese catalog entries and adding the
phrase-level generated-name helper, a fresh Flutter asset-manifest restart on
port 8001 replayed the same route. It rendered `Bar de Sucos Laranja
Relaxante` and kept `Casa de repouso Cuidado Carinhoso`, `Cooperativa Vegana
Jardim de Berinjela`, and `Internet Café Unicórnio Tecno` readable. The focused
site translation test also checks `Bar de Sucos Laranja Novo Você` and
`Bar de Sucos Métodos Harmoniosos`; every captured row was at most 80 cells,
the browser identified itself as `HeadlessChrome`, and `agent-browser errors`
was empty. Fixed evidence is under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/juice-fixed-8001/`.

PT-270 is closed. Continue with dynamic site-name/news exploration and the
residual PT-048/PT-148, PT-083, and accepted PT-049 queue.

## Strict-headless Washington National Mall translation replay — 2026-08-09

The Portuguese Washington, DC route resumed from the existing disposable save
and opened the National Mall travel list through the DOM bridge. Before the
fix, the second option was `B - White House`; the compact `WhiteHouse` key was
already translated, so this was a missing full site-label entry rather than a
general locale failure. The pre-fix capture is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/dc-national-mall-8003/01-before.txt`.

After adding `White House` to the English and Portuguese hash-sharded catalogs
and restarting Flutter to reload the asset manifest, the same strict-headless
session rendered `B - Casa Branca`. The post-fix capture reports
`HeadlessChrome`, the options list stayed within the 80-column console, and no
new translation or layout issue appeared. Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/dc-national-mall-8003/02-after.txt`.

PT-271 is closed. Continue the residual PT-048/PT-148 police-alarm variants
and PT-083 responsive-readability enhancement; accepted PT-049 historical
changelog English remains out of the fix queue.

## Strict-headless White House action follow-up — 2026-08-09

A fresh Portuguese Washington, DC game was played through the DOM bridge with
an isolated Chromium `HeadlessChrome` session. The route selected National
Mall → `Casa Branca`, entered the site, rendered `DC — Casa Branca, Nível 2`,
opened the `Ação Direta` help page, and exited back to base. The direct-action
controls and explanatory copy stayed in Portuguese; the roster's compact
vehicle cell remained bounded by the existing 80-column layout. The browser
error channel was empty. The capture is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/whitehouse-8004.json`.

No new translation or layout issue was confirmed. Continue the residual
PT-048/PT-148 police-alarm variants and PT-083 responsive-readability
enhancement; accepted PT-049 historical changelog English remains out of the
fix queue.

## Strict-headless management and clothing-prompt replay — 2026-08-12

- Replayed a fresh Portuguese game with only the isolated CLI `agent-browser`
  session, `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; no headed window or screenshot was used.
- The clothing selector initially clipped the translated header after
  `... tiver tec` at the 80-column boundary. After shortening the canonical
  wording, the live row rendered in full as `O que Greg Craft fará? (Custo pela
  metade com tecido)`.
- The same route swept the activity categories, skill and paid-class pickers,
  travel destinations, vehicle assignment, and safehouse investment controls.
  Every captured row stayed at or below 80 columns, and the DOM error channel
  stayed empty. Evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/clothing-prompt-20260812/`.

The PT-285 catalog wording is now fixed and covered by a context regression.
The remaining queue is PT-048/PT-148 random police-alarm terminal coverage and
the PT-083 narrow-console readability enhancement.

## Strict-headless police-terminal replay — 2026-08-11

- A disposable siege fixture was replayed in the CLI-only headless browser with
  police alarms, the loudspeaker warning, siege combat, and surrender.
- The terminal exposed `Todos em Armazém Esquecido foram mortos.`. The dynamic
  site-name join is now `Todos os presentes em {location} foram mortos.` and is
  protected by the siege/context catalog regression.
- The pre-fix route stayed within 80 columns and reported no browser errors.
  A fresh server restart is still required for the final live verification;
  the temporary siege/wealth flags must not remain enabled.

## Strict-headless generated site-name replay — 2026-08-11

- The fresh Portuguese industrial-district menu rendered the corrected dynamic
  names `Motel Abandonado`, `Conjuntos habitacionais da Rua Abbey`, and
  `Casa de Drogas da Rua Keene` after a full Flutter web-server restart.
- Every captured row stayed at or below 80 columns and the DOM error channel was
  empty. The disposable siege, all-items, party-rescue, and funds flags were
  reverted immediately after the replay.

## Strict-headless monthly AM Radio replay — 2026-08-09

- Replayed a fresh Portuguese game through Los Angeles → Downtown and Grande
  Hollywood, advanced to February, and selected the AM Radio monthly leak.
- The pre-fix capture showed a mixed Portuguese/English story caused by
  adjacent source literals being looked up as one untranslated key.
- After splitting the monthly story fragments and correcting the context
  translations, the replay rendered `O Guardião Liberal publica uma matéria
  sobre planos de rádio AM para promover sistematicamente a hostilidade contra
  pessoas negras`, followed by fully Portuguese paragraphs.
- The route used `HeadlessChrome`, measured a maximum 80-column row, and had no
  browser errors. The next monthly prompt also stayed in Portuguese.
- No new translation or layout issue was confirmed. Keep PT-048/PT-148,
  PT-083, and accepted PT-049 in the residual queue.

## Strict-headless monthly context replay — 2026-08-10

- Used only the isolated CLI `agent-browser` session `monthly-after-8010f` with
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; no headed browser was launched or focused.
- Replayed a fresh Portuguese game through January, February, and March with
  all debug loot available. The AM Radio, Cable News, and CCS families were
  selected in successive monthly Guardian prompts.
- The pre-fix sweep exposed malformed AM/Cable joins and several CCS grammar
  fragments. After the catalog corrections, the live buffers rendered
  `destinados a forjar um escândalo falso`, the complete Cable/AM clauses, and
  a fluent CCS paragraph ending in `energia pública`; all rows remained within
  the fixed 80-column console.
- The bridge reported `HeadlessChrome/150.0.0.0` and an empty browser-error
  channel. Captures are retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/monthly-context-8010f/`.
- PT-273 is fixed. Continue PT-048/PT-148 police-alarm and PT-083 narrow-layout
  exploration; keep accepted PT-049 historical changelog English out of the
  fix queue.

## Strict-headless police alarm post-fix replay — 2026-08-10

- Replayed a fresh Portuguese game with a temporary `debugSiege` police fixture
  using only `agent-browser` session `police-after-8012a` and
  `AGENT_BROWSER_HEADED=0`; Chromium ran with `--headless=new` and
  `--ozone-platform=headless`, and no headed browser was launched or focused.
- The one-day alarm, loudspeaker warning, siege briefing, encounter roster,
  foot-chase `D - Tentar despistá-los`, and `G - Desistir` branch all rendered
  Portuguese. The result was `Você para e é preso.`, followed by the localized
  base state after arrest.
- The route reached the same broader PT-048/PT-148 police-alarm coverage that
  remained on the queue. No raw English combat/control text, over-wide buffer
  row, or browser error appeared. Evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-after-8012a/replay.txt`.
- No new translation issue was confirmed. Keep only the already-known random
  branch coverage and PT-083 responsive-readability enhancement open; accepted
  PT-049 historical changelog English remains out of the fix queue.

## Strict-headless First American Bank teller replay — 2026-08-10

- The Portuguese First American Bank route was replayed with the isolated
  `car-chase-8014e` CLI session. Stepping onto the teller tile first reproduced
  the raw English `A bank teller is available.` prompt.
- The English key was added to the canonical hash-sharded catalogs with the
  Portuguese value `Há um caixa do banco disponível.`. After a full Flutter
  web-server restart, the same route rendered the Portuguese prompt.
- The bridge reported `HeadlessChrome/150.0.0.0`, an empty browser-error
  channel, and a maximum 80-column row. No headed browser was launched or
  focused. Captures are retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/bank-teller-8014e-*.txt`.
- PT-274 is fixed. Continue the residual PT-048/PT-148 police-alarm variants
  and PT-083 narrow-layout sweep; accepted PT-049 historical changelog
  English remains out of the fix queue.

## Strict-headless police car-chase replay — 2026-08-10

- Used only isolated CLI `agent-browser` sessions with
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, and `--ozone-platform=headless`;
  no headed browser was launched or focused.
- A disposable car fixture reached the real `soloChaseSequence` intro. Before
  the fix, the Portuguese line ended at `porcos Conservad` because the
  single-line renderer clipped the final `ores!` at column 80.
- After replacing the intro with a bounded paragraph, the same route rendered
  `Ao se afastar do local, você percebe que está sendo seguido por porcos` and
  `Conservadores!` on two rows. The captured maximum row width was 80 and the
  browser-error channel was empty; evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/car-chase-802{2,3}/`.
- The replay continued through the car chase, obstacle, bail-out, evasive
  foot-chase, and fight-result branches. All visible controls and action
  messages remained Portuguese with no new English fallback.

PT-275 is fixed. Continue the residual PT-048/PT-148 random police-alarm
variants and PT-083 narrow-layout exploration; accepted PT-049 historical
changelog English remains out of the fix queue.

## Strict-headless clothing-crafting replay — 2026-08-10

- Replayed a fresh Portuguese game through `Atribuir Tarefas` → `A` → `D` →
  `3` using only the isolated CLI `agent-browser` session `clothfix0810c`.
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless` were enforced; no headed browser was launched
  or focused.
- The first capture confirmed the clothing selector and preview leaked XML
  clothing names, armor descriptions, dynamic traits, and the `Alarming`
  trait. The fix localizes and bounds those values and adds the missing armor
  description catalog entries.
- The fullest armor upgrade then exposed a separate collision where translated
  `Armadura` joined `Precisão`/`Complexidade`. Reserving the right stats at
  column 42 and fitting the left values removed the collision.
- Final capture rendered `Alarmante`, `Armadura  Precisão`, and
  `Armadura  Complexidade`; raw English and concatenated forms were absent.
  The DOM bridge reported `HeadlessChrome/150.0.0.0`, an empty browser-error
  channel, and a maximum rendered row width of 80. Evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/clothing-selector-20260810/`.

PT-276 and PT-277 are fixed and verified. Continue only the residual
PT-048/PT-148 random police-alarm variants and PT-083 narrow-layout
exploration; accepted PT-049 historical changelog English remains out of the
fix queue.

## Strict-headless siege/news/repair replay — 2026-08-11

- Used only isolated CLI `agent-browser` sessions with
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; no headed browser was launched or focused.
- Replayed a fresh Portuguese game on the rebuilt local web server through the
  police alarm, loudspeaker, siege fight, victory, and next-day base route.
- The pre-fix newspaper capture had singular `escapou`/`Lutou`-style fragments,
  a missing join space (`de acordoa`), and an incorrect `to ...` preposition.
  The fixed route rendered plural siege copy ending in `de acordo com um
  porta-voz da polícia.`.
- The same route verified the contextual alarm text `A polícia cercou o local:
  Fábrica de Brinquedos Assombrada!`, the upgrade wording `Este local não pode
  ser melhorado`, and the equipment label `Equipar o Esquadrão`.
- After advancing one day, clothing repair rendered `Sherlock Bump conserta a
  peça de roupa chamada Terno preto.`. The raw buffer contained no `Black Suit`.
- DOM probes reported `HeadlessChrome/150.0.0.0`, an 80-column maximum with no
  over-wide rows, and an empty playtest-error channel. Concise captures are
  retained under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/repair-20260811/`.

PT-278 through PT-281 are fixed. Keep only the residual PT-048/PT-148 random
police-alarm branch coverage and PT-083 narrow-layout exploration open;
accepted PT-049 historical changelog English remains out of the fix queue.

## Strict-headless all-items/mod-tools replay — 2026-08-11

- Enabled only temporary local debug fixtures for all-item inventory, rescue
  liberals, and Mod Tools, then replayed a fresh Portuguese game through the
  title, Mod Tools, equipment, assignment, review, rescue roster, and profile
  screens using `agent-browser` with `AGENT_BROWSER_HEADED=0` and
  `--headless=new --ozone-platform=headless`.
- The pre-fix Mod Tools paragraph displayed the English concatenated sentence
  `Create and edit custom maps for Liberal Crime Squad. This feature is
  currently under development.` even though both source fragments had
  Portuguese catalog entries.
- After changing the renderer to translate the fragments independently, the
  live replay rendered `Crie e edite mapas personalizados para o Esquadrão do
  Crime Liberal. Este recurso está atualmente em desenvolvimento.`.
- The all-item equipment pages, 20-person rescue roster, equipment-movement
  list, and Liberal profile showed no additional confirmed English fallback or
  layout defect. The bridge reported `HeadlessChrome/150.0.0.0`, maximum width
  80, no over-wide rows, and an empty error channel. Evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/mod-tools-20260811/`.

PT-282 is fixed. Temporary debug flags were restored before validation;
continue the remaining random PT-048/PT-148 combat variants and PT-083
narrow-console readability exploration.

## Strict-headless CIA siege replay — 2026-08-11

- Replayed a disposable Portuguese CIA fixture through the opening alarm,
  fortified safehouse status, flee-or-fight briefing, and live combat screen
  using only CLI `agent-browser` with `AGENT_BROWSER_HEADED=0`,
  `--headless=new`, and `--ozone-platform=headless`; no headed browser was
  launched or focused.
- The opening text rendered `No meio da noite, uma coluna de vans pretas sem
  identificação e com vidros escuros cerca o local chamado Motel (hotel)
  Esquecido.`, followed by the static-electricity and shipping-container
  suspense paragraphs in Portuguese.
- The siege status rendered `A CIA está invadindo este local!`,
  `CÂMERAS DESLIGADAS`, `LUZES APAGADAS`, `Refúgio Sob Ataque`, and the
  Portuguese controls `F - Lutar/Fugir`, `G - Desistir`, and `Não pode esperar
  até o cerco terminar`. The fight briefing and live combat controls were also
  localized.
- The bridge reported `HeadlessChrome/150.0.0.0`, maximum width 80, no
  over-wide rows, and an empty error channel. Evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-siege-20260811/`.

No new CIA translation or layout issue was confirmed. Keep only the random
PT-048/PT-148 alarm/terminal variants and the PT-083 narrow-console
readability enhancement in the residual queue.

## Strict-headless infiltrated-title and help-spacing replay — 2026-08-11

- Replayed the Portuguese management route with the isolated CLI
  `agent-browser` session, `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; no headed browser was launched or focused.
- The infiltrated-agent route had previously exposed
  `——Leila Hemingway, Revolutionary——` in an otherwise Portuguese action
  header. The missing title key is now present in both catalogs and the focused
  profile regression renders `Revolucionário` instead.
- The Hospital task help line previously retained an awkward double space in
  `no mesmo local.  Isso não`; the canonical Portuguese value now uses one
  space, protected by the context catalog regression.
- Catalog canonicalization, control-prefix validation, interpolation checks,
  and the focused Portuguese suites pass. Evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/infiltrated-title-20260811/`
  and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/hospital-help-spacing-20260811/`.

The two findings are fixed. Keep PT-048/PT-148 random alarm/terminal combat
variants and PT-083 narrow-console readability exploration open.

## Strict-headless live police-siege combat replay — 2026-08-11

- Rebuilt the local Flutter web-server with a temporary police-siege fixture
  and replayed a fresh Portuguese game using only CLI `agent-browser` with
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, `--ozone-platform=headless`,
  `--disable-dev-shm-usage`, and `--disable-cache`. The viewport was 480×320;
  no headed browser or screenshots were used.
- New-game copy preserved the requested capitalization `extrema-direita Arqui
  Conservadora`, and the dynamic continuation prefix rendered as
  `Entre - Continuar...`. The police alarm, loudspeaker warning, under-siege
  base, `F - Lutar/Fugir`, and `G - Desistir` controls were localized and
  remained enabled where expected.
- The base surrender branch rendered the Portuguese confiscation and
  fortification cleanup pages before returning to the roster. The sally-forth
  branch rendered a bounded briefing and a live `Policial da SWAT` roster with
  `Armadura da SWAT` and compact armor markers. The long hit sentence wrapped
  across rows 9–10 instead of clipping at column 80.
- The combat route advanced through multiple deaths, reached the localized
  victory screen, and produced a next-day Guardian article. One death
  reflection was understandable but stylistically awkward:
  `Policial da SWAT respira fortemente, tossindo sangue... então está quieto.`
  This is logged as PT-285 for a future catalog-only wording pass.
- Every captured DOM buffer stayed at or below 80 columns, the browser error
  channel remained empty, and the UA contained `HeadlessChrome/150.0.0.0`.
  Evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-siege-live-20260811/`.

PT-259 is confirmed fixed by the existing renderer regression and prior live
replay. The residual queue is now PT-285 wording, broader PT-048/PT-148
random alarm/terminal coverage, and the PT-083 narrow-console readability
enhancement; accepted PT-049 historical changelog English remains out of the
fix queue.

## Strict-headless generated apartment/commerce-name sweep — 2026-08-11

- Used a fresh isolated CLI `agent-browser` session with
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; no headed browser or screenshot was used.
- Portuguese route: new game → one-person squad → `F - Vá adiante para deter
  o mal` → `Centro de Seattle`, then `Distrito Universitário`.
- The pre-fix Seattle menu rendered `Russell Condomínios`; the catalog now
  renders `Condomínios {name}`, and a fresh restart rendered
  `Condomínios Piercey`.
- The pre-fix University menu rendered `Bar de Sucos Métodos Natural` and
  `Internet Café Panda (animal) Nano (escala)`. The first lacked plural
  agreement; the second exposed automated translator glosses on generated
  brand fragments. Focused composition tests now require `Métodos Naturais`
  and `Internet Café Panda Nano`.
- Fresh DOM probes reported `HeadlessChrome/150.0.0.0`, maximum width 80, and
  an empty playtest-error channel. Evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/condominiums-20260811/`.

PT-289 through PT-291 are fixed. Continue with the remaining police-terminal
variant and narrow-console exploration, and keep all browser sessions
strictly headless.

## Strict-headless generated-gloss and fixed-column follow-up — 2026-08-11

- Used only the CLI `agent-browser` with `AGENT_BROWSER_HEADED=0` and
  Chromium `--headless=new --ozone-platform=headless --disable-dev-shm-usage
  --disable-cache`. No headed browser, screenshot, or GUI focus was used.
- The bridge reported `HeadlessChrome/150.0.0.0`; all captured rows were at
  most 80 columns and the playtest-error channel was empty.
- A fresh Portuguese route to `Distrito Universitário` rendered
  `Cooperativa Vegana Jardim de Tofu (soja)`. `Tofu` is a generated name
  fragment, so the automated `(soja)` explanation is a confirmed PT-292
  context defect. The route also rendered the already-fixed `Internet Café
  Unicórnio Nano` without the former `Nano (escala)` gloss.
- A separate fresh world routed to `Distrito Industrial` and reproduced the
  fixed-column issue as `Fábrica de Brinquedos Assombrada (Possível
  EscondePressão: 0   Sigilo: 15`. The site/status text runs into the fixed
  pressure and secrecy columns; this is logged as PT-293 under the broader
  PT-083 readability queue.
- Durable capture: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/generated-gloss-layout-20260811/replay.md`.

PT-292 and PT-293 remain open for a later code/test pass. The browser harness
is configured to stay strict-headless for all subsequent playtests.

## Strict-headless post-fix generated-name/layout replay — 2026-08-11

- Reloaded the local Flutter web-server and replayed a fresh Portuguese route
  using only CLI `agent-browser` with `AGENT_BROWSER_HEADED=0` and Chromium
  `--headless=new --ozone-platform=headless --disable-dev-shm-usage
  --disable-cache`. The bridge reported `HeadlessChrome/150.0.0.0`; no headed
  browser, screenshot, or GUI focus was used.
- The new-game/title/base route stayed localized, every captured row remained
  at or below 80 columns, and `#lcs-playtest-errors` stayed empty. A 120-step
  location cycle did not happen to select the targeted random Internet Café,
  vegan-co-op, or long industrial LCS row again; deterministic Flutter screen
  regressions therefore cover those exact post-fix states.
- Focused regressions now verify `Cooperativa Vegana Jardim de Tofu`, the
  bounded `Pressão`/`Sigilo` destination row, natural Internet Café fragments,
  and proper `LSD`/`MDMA`/`Crips`/`Bloods` composition. The generated-name helper
  also prevents `Café latte` from becoming a duplicated `Internet Café Café`
  brand.
- Durable before/after evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/generated-gloss-layout-20260811/replay.md`.

PT-292 and PT-293 are fixed. PT-294 and PT-295 are fixed with focused
regressions. The residual playtest queue remains PT-048/PT-148 random
police-terminal variants and the broader PT-083 narrow-console sweep.

## Strict-headless parenthetical-context audit — 2026-08-11

- Reviewed the latest Portuguese catalog against its runtime call sites using
  the repository's static catalog tests and the strict-headless playtest
  harness; no headed browser, screenshot, or GUI focus was used.
- Confirmed five out-of-context glosses: `Emo (estilo)`, `Hippie (movimento)`,
  `Punk (estilo)`, `{items}, {item} (lista)`, and `{name} {cower} (reação)`.
  The first three are generated cultural labels/title fragments; the latter
  two are recursive/runtime sentence shells. All now render without the
  parenthetical translator notes and have focused regressions.
- The same audit found three gender-sensitive LGBT pickup-line templates
  (`Essa pessoa ({person})`, `outro(a) {person}`). They now use one
article-aware gender helper and compose as `Uma mulher está a fim de mim`, `com um homem`,
and `é uma mulher`; focused regressions cover masculine and feminine paths.

PT-296 and PT-297 are fixed. The residual queue is PT-048/PT-148
police-terminal variants and the broader PT-083 narrow-console sweep. The
strict-headless browser harness remains the only playtest path.

## Strict-headless police-terminal and narrow-console replay — 2026-08-11

- Replayed both police-siege branches with a temporary local-only debug
  fixture using isolated CLI `agent-browser` sessions. Every invocation used
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; no headed browser or desktop focus was used.
- The surrender route rendered the Portuguese alarm, loudspeaker warning,
  confiscation, fortification cleanup, trap cleanup, and anti-aircraft cleanup
  pages. The fight route rendered the confrontation briefing, SWAT roster,
  localized hit messages, victory screen, and the next-day news pages.
- The 480×320 sweep covered the title, base, gameplay-options,
  interface-options, and content/tone screens. The localized option rows,
  version/footer, and long descriptions stayed readable; newspaper `~` rows
  were confirmed as intentional `generateFiller` output rather than a
  translation leak.
- The bridge identified `HeadlessChrome/150.0.0.0`, every DOM buffer row was at
  most 80 columns, and `#lcs-playtest-errors` stayed empty. The temporary
  debug flag was restored to `false` afterward. Durable evidence is retained
  at `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-variants-20260811/`.

No new issue was confirmed. PT-285 is fixed and verified; keep PT-048/PT-148
random police-terminal variants and PT-083 narrow-console exploration open.

## Strict-headless founder/activity route audit — 2026-08-11

- Replayed a fresh Portuguese new-game route with only the CLI
  `agent-browser` harness: `AGENT_BROWSER_HEADED=0`, Chromium
  `--headless=new --ozone-platform=headless --disable-dev-shm-usage
  --disable-cache`. The bridge reported `HeadlessChrome/150.0.0.0`; no headed
  browser, screenshot, or desktop focus was used.
- Covered language selection, new-game configuration, founder setup, fate
  toggle, randomized biography questions, base roster, bulk activity
  assignment, and activity sorting. Every captured row stayed at or below 80
  columns and `#lcs-playtest-errors` remained empty.
- The route confirmed PT-298's complete bulk instruction,
  `Pressione uma letra para atribuir uma atividade; um número para selecioná-la.`,
  PT-300's `Pouco depois de eu nascer, em 2004...`, and PT-301's
  `lista de atividades Liberais`.
- A first post-change replay exposed a new layout defect in the otherwise
  natural `Deixar o destino decidir`: it overlapped the founder's fixed `(D
  para...)` hint. The final `O destino decide` value was rebuilt and verified
  in the same route with the hint intact (PT-299).
- Durable evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/queue-audit-20260811/replay.md`.

PT-298 through PT-301 are fixed and covered. Continue with PT-048/PT-148
random police-terminal variants and the PT-083 narrow-console sweep; keep all
future playtests strict-headless.

## Strict-headless narrow activity-header replay — 2026-08-11

- Replayed the Portuguese founder/activity route after the narrow-console
  sweep, using only CLI `agent-browser` with `AGENT_BROWSER_HEADED=0`,
  Chromium `--headless=new`, and `--ozone-platform=headless`; no headed
  browser or desktop focus was used.
- At 480×320, a long generated founder name first exposed the header merge
  `Entrando em Ação: O que Mercedes Kwokaaaaaaaaaaaaaaaaaaa fará hoje?Dinheiro: $0`.
  The title consumed the blank cell immediately before the right-aligned
  funds label (PT-302).
- The Portuguese title is now the compact `O que {name} fará hoje?`, and the
  activity renderer fits it against the funds label. A fresh live screen
  rendered `O que Sasha Inkinga fará hoje?                                     Dinheiro: $7`;
  rows stayed at or below 80 columns and `#lcs-playtest-errors` was empty.
- Durable evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-sweep-20260811/replay.md`.

PT-302 is fixed and covered. Continue the strict-headless narrow-console
  sweep through management, travel, media, agenda, and site/combat screens;
  keep PT-048/PT-148 random police-terminal variants open until exercised.

## Strict-headless profile date follow-up — 2026-08-11

- The 480×320 profile route then paged through the full Portuguese character
  sheet: profile stats, skills, crimes, and the return path all stayed within
  80 columns with an empty playtest-error channel.
- The birth line exposed `Nascimento: 30 de junho, 2004`; the comma was an
  English date separator and is incorrect in Brazilian Portuguese (PT-303).
- The catalog now renders `Nascimento: 30 de junho de 2004`, with a focused
  regression using a fixed 9 November 2004 birth date. The rebuilt server
  replayed the same profile route at 480×320; the corrected line stayed within
  80 columns and `#lcs-playtest-errors` remained empty.
- Durable evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-date-fix-20260811/route.md`.

## Strict-headless route-completion sweep — 2026-08-11

- After the two fixes, the rebuilt Portuguese 480×320 matrix covered the
  title/new-game path, base management, active-Liberal profiles and skills,
  crimes, finance, promotion, squad assembly, agenda, media/news, travel and
  location/site lists, pawn-shop and investment screens, activity/help/skill
  pickers, daily-message pages, and the police-terminal variants.
- Every captured DOM buffer stayed at or below 80 columns and
  `#lcs-playtest-errors` remained empty. No additional translation or layout
  defect was confirmed after PT-302 and PT-303.
- Evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/route-sweep-20260811/`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/route-sweep-after-20260811/`,
  and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-variants-20260811/replay.md`.

The remaining queue is future random-seed variation of already-covered
PT-048/PT-148 terminal branches plus PT-083's optional responsive-console
enhancement; neither produced a new defect in this sweep.

## Strict-headless agenda/CIA follow-up — 2026-08-11

- Replayed the agenda policy page on a rebuilt server at 480×320. The gun-
  control row now reads `Versões semiautomáticas de rifles militares estão
  amplamente disponíveis.`; it stays within 80 columns and the playtest-error
  channel is empty. This fixes PT-304.
- Replayed the temporary CIA siege fixture through the alarm, compound status,
  under-attack briefing, combat roster, and map view. All Portuguese rows were
  at most 80 columns and `#lcs-playtest-errors` remained empty.
- Every browser invocation used `AGENT_BROWSER_HEADED=0` with Chromium
  `--headless=new --ozone-platform=headless`; no headed browser or desktop
  focus was used. Durable evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/route-next-20260811/replay.md`.

PT-304 is fixed and covered. No additional translation or layout defect was
confirmed; keep only the future random-seed PT-048/PT-148 terminal variants
and optional PT-083 responsive-console enhancement open.

## Strict-headless media/security follow-up — 2026-08-11

- Replayed a fresh Portuguese route with CLI `agent-browser` only at 480×320;
  `AGENT_BROWSER_HEADED=0`, Chromium `--headless=new` and
  `--ozone-platform=headless`. The bridge reported `HeadlessChrome/150.0.0.0`.
- Entered the AM Radio site and captured a real encounter roster. The first
  render exposed `Security Guard` in the roster and suspicion message even
  though the rest of the route was Portuguese. The row-width invariant stayed
  at 80 and `#lcs-playtest-errors` was empty.
- Added the exact generated-role key `Security Guard → Segurança`; the lower-
  case `security guard → segurança` fragment remains unchanged for newspaper
  prose. Added a focused helper regression as PT-305.
- Audited the adjacent media quality ladder in `_mediaQualityDescriptionTemplate`.
  `The show was all right.` was translated as European `espectáculo` and as
  `bom`, collapsing the intended mid-tier distinction. It now reads
  `O espetáculo foi razoável.` and is asserted by the Portuguese context test
  (PT-306).
- Durable raw evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/media-security-20260811/`.

## Strict-headless contextual/layout replay — 2026-08-11

- Rebuilt a fresh debug bundle on port 8087 and used only the CLI
  `agent-browser` harness with `AGENT_BROWSER_HEADED=0`, Chromium
  `--headless=new`, and `--ozone-platform=headless`. The bridge reported an
  empty error channel; no headed browser or desktop focus was used.
- Replayed the founder flow and confirmed the repaired `Minha madrasta...`
  and `Passei a manipular pessoas...` choices. Replayed the base agenda page,
  vehicle picker, and sleeper-agent picker; PT-309 and PT-312–PT-316 are all
  visible in the fresh bundle.
- A new destination sweep exposed PT-317: the long `Loja de Departamentos de
  Buckman` arrival message silently lost its final character at the 80-column
  edge. The message now uses the fitted daily-result renderer and ends in an
  ellipsis; the fresh replay measured max row length 80 with no rows over the
  limit.
- Durable evidence and screenshots are retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-layout-20260811/`.

PT-307–PT-317 are fixed and covered. Keep future work limited to random-seed
variation of the already-covered police terminals and an optional responsive
console enhancement; continue strict-headless runs for any new Portuguese
content.

## 2026-08-11 — dealership and gendered-biography replay

- Replayed a fresh Portuguese route at 480×320 using only the CLI
  `agent-browser` bridge with `AGENT_BROWSER_HEADED=0` and Chromium
  `--headless=new --ozone-platform=headless`; no headed browser was focused.
- Reached Commerce → Carros Usados de Lance, advanced the day, and opened the
  vehicle picker. The pre-fix capture showed raw `Pickup Truck`, `Sportscar`,
  `Red`, `White`, `Vehicle`, `Color`, and the English exit label. The rebuilt
  picker now shows `Picape`, `Carro esportivo`, `Vermelho`, `Branco`, `Veículo`,
  `Cor`, and `Não precisamos de um carro Conservador`.
- The same founder route exercised the female candidate option. The catalog
  regression also invokes the runtime helper with a male candidate, confirming
  that the neutral noun no longer conflicts with `Ele`.
- Both raw and fixed DOM captures plus a fixed screenshot are retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/vehicle-picker-20260811/`.
- PT-318 and PT-319 are fixed. Continue the remaining random-seed terminal
  variation and optional responsive-console work with the same headless-only
  harness.

## 2026-08-11 — narrow and police-terminal verification replay

- Replayed the Portuguese title, founder, biography, base-management, vehicle,
  review, agenda, media, travel, direct-action help, and site-map routes at
  240×160 through 480×320 with CLI `agent-browser` only. Every buffer row stayed
  at or below 80 columns and `#lcs-playtest-errors` remained empty.
- Rebuilt a temporary local police-siege fixture and covered the warning,
  loudspeaker, `Esconderijo Sob Cerco`, surrender, confiscation/funds seizure,
  fortification/trap/anti-aircraft cleanup, fight briefing, SWAT roster,
  foot-chase attempt, and `Você para e é preso.` arrest result. All generated
  police labels and terminal messages were Portuguese; no new layout defect
  appeared.
- Every invocation used `AGENT_BROWSER_HEADED=0` with Chromium
  `--headless=new --ozone-platform=headless`; no headed browser or desktop
  focus was used. Temporary siege/debug edits were restored before handoff.
- Durable summaries and screenshots are retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-matrix-20260811/` and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-followup-20260811/`.

No new issue was confirmed. Keep only future random-seed PT-048/PT-148
terminal variation and the optional PT-083 responsive-console enhancement
open; accepted PT-049 historical changelog English remains out of scope.

## 2026-08-11 — site-map special-label layout follow-up

- Replayed the Portuguese founder → Seattle → police-station route against a
  fresh web-server build with CLI `agent-browser` only. The browser stayed
  strict-headless (`AGENT_BROWSER_HEADED=0`, Chromium `--headless=new` with the
  headless Ozone backend), reached the locked-door prompt, accepted the
  Portuguese `S` response, and showed Portuguese police labels with no bridge
  errors. The random police encounter ended the live route before the lockup
  tile could remain visible.
- A deterministic renderer regression then exercised the same police lockup
  special in both full and compact map overlays. `Sala de Detenção da Polícia`
  now fits the full 27-column row, while the compact 23-column row uses an
  ellipsis instead of dropping text at the console edge. This fixes PT-320.
- Two additional fresh games exercised different police-station rosters. They
  kept `Oficial de Polícia`, `Unidade Policial`, `Zelador`, `Uniforme Policial`,
  `Macacão`, `Pist. 9 mm`, and the locked-door prompt in Portuguese, with empty
  bridge-error channels and no rows over the fixed console width.
- Temporary debug flags and the disposable server/browser session were restored
  or closed. Residual work remains limited to random PT-048/PT-148 terminal
  variation and the optional PT-083 responsive-console enhancement.

## 2026-08-11 — founder-debt/sleeper month-end replay

- Started a fresh Portuguese game against `http://127.0.0.1:8107/?playtest=1`
  with the strict-headless CLI session `debt-sleeper-fixed-20260811`.
- Enabled only disposable founder-debt, sleeper-agent, elite-opinion, party,
  money, and all-items fixtures to reach otherwise slow month-end and roster
  states; all flags were restored to `false` afterward.
- Exercised review/profile, task assignment, agenda pages 1–5, media, pride
  flags, all equipment pages, vehicles, sleeper-agent assignment/sorting/mass
  assignment, daily waiting/newspaper, special-edition selection, Congress,
  constitutional amendment proposal, ratification, Senate and House results,
  court notices, and the February finance report.
- This replay confirmed PT-321 (the amendment fragment grammar) and PT-322
  (stale election prompt suffix). Both are fixed and rechecked in the rebuilt
  bundle; the fixed amendment lines and election prompts stayed Portuguese.
- Final fixed-route buffer at `6 de fev de 2023` had no bridge errors, no rows
  wider than 80 columns, and no stale election suffix. Evidence is retained in
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/debt-sleeper-20260811/replay.md`.
- The only remaining playtest ideas are future random-seed PT-048/PT-148
  terminal variation and the optional PT-083 responsive-console enhancement.

## 2026-08-11 — strict-headless trial/gender replay

- Used only an isolated CLI `agent-browser` session with `AGENT_BROWSER_HEADED=0`
  and Chromium `--headless=new`; no headed browser was opened or focused.
- Forced the hospital, month-end, sleeper, and court branches with temporary
  debug fixtures, then restored every debug flag to `false`.
- The female generated name `Roberta Westlake` reproduced the masculine
  courthouse notice `é levado`; the jury-selection screen also showed the
  literal `A seleção do júri é primeiro`. Both are fixed, along with the
  source-only standing-trial and acquittal-return notices that had the same
  gender-agreement risk.
- The route stayed within 80 columns and `#lcs-playtest-errors` stayed empty.
  Focused Portuguese-context tests passed after the fixes. Evidence is kept in
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/random-variants-20260811/replay.md`.
- Remaining playtest ideas are still random PT-048/PT-148 police-terminal
  variants and the optional PT-083 responsive-console enhancement.

## Strict-headless police combat variation — 2026-08-11

- Rebuilt a disposable police-siege bundle and replayed surrender plus a
  480×320 fight variation using isolated CLI `agent-browser` sessions only.
  Chromium ran with `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; the bridge reported `HeadlessChrome/150.0.0.0`.
- The surrender route covered the alarm, loudspeaker, safehouse selection,
  confiscation, funds seizure, fortification/trap cleanup, and anti-aircraft
  cleanup pages. The fight route covered the confrontation briefing, SWAT
  roster, Portuguese weapon/armor labels, and localized hit messages.
- One low-health SWAT row changed to `policial da SWAT`. Source inspection
  confirms this is intentional: the encounter renderer lowercases conservative
  targets whose `calculateWillRunAway()` state is true. It is a fleeing-state
  marker, not a translation or capitalization defect.
- Every captured row stayed at or below 80 columns and
  `#lcs-playtest-errors` remained empty. Temporary debug flags and the local
  server were restored/stopped. Evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-random-20260811/`.

No new issue was confirmed. Keep only future PT-048/PT-148 terminal-seed
variation and PT-083 responsive-console exploration open.

## Strict-headless save and city/site replay — 2026-08-11

- Used isolated CLI `agent-browser` sessions with `AGENT_BROWSER_HEADED=0`,
  Chromium `--headless=new`, and `--ozone-platform=headless`; the bridge
  reported `HeadlessChrome/150.0.0.0`. No headed browser was opened or focused.
- The Portuguese save-management route rendered its headers, save row, load,
  delete, export, and return actions within the fixed 80-column buffer. The
  manage-screen export path returned without a browser or bridge error.
- A fresh Seattle → Distrito Universitário → Cooperativa Vegana Fazenda de
  Tofu route exercised the site map, help overlay, full map, and exit-to-news
  path at the fixed console width. Every captured row stayed at or below 80
  columns and `#lcs-playtest-errors` remained empty.
- The generated newspaper exposed `San Bernadino, CA` in the city list. The
  source city table now uses `San Bernardino, CA` through a shared constant;
  the focused Portuguese-context test passes after the change. The raw
  pre-fix screenshot is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/city-sites-20260811/newspaper.png`.
- The same article's `depois de ele aparecer` wording was reviewed against the
  `{heShe}` placeholder. It is the grammatically valid explicit-subject form
  for `ele`/`ela`/`elu`, so no placeholder contract change was made.

PT-325 is fixed. Continue only the existing random PT-048/PT-148 police-terminal
variation and optional PT-083 responsive-console exploration.

## 2026-08-11 — strict-headless police arrest surrender follow-up

- Replayed a fresh Portuguese game with a disposable local siege fixture that
  marked the generated warehouse defenders wanted for resisting arrest. The
  browser was CLI-only and strict-headless (`AGENT_BROWSER_HEADED=0`, Chromium
  `--headless=new --ozone-platform=headless`) at 480×320; the bridge reported
  `HeadlessChrome/150.0.0.0`.
- The forced alarm and loudspeaker rendered `A polícia cercou o local` and
  `Você é procurado por resistir à prisão!`. Selecting `G - Desistir` reached
  the plural arrest terminal, `5 Liberais são presos.`, followed by localized
  funds, fortification, trap, and anti-aircraft cleanup lines.
- All captured rows stayed at or below 80 columns and
  `#lcs-playtest-errors` remained empty. The temporary fixture was restored
  before handoff. Durable route evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-arrest-20260811/replay.md`.

No new issue was confirmed. Keep only future random PT-048/PT-148 police
terminal seeds and unexercised singular-arrest/name-alias variants open, with
PT-083 responsive-console readability still optional.

## 2026-08-11 — strict-headless 240×160 title/founder follow-up

- Rebuilt from the restored clean source and exercised the Portuguese title,
  language selection, new-game options, and founder screen through CLI
  `agent-browser` at 240×160. Chromium remained strict-headless
  (`AGENT_BROWSER_HEADED=0`, `--headless=new --ozone-platform=headless`) and
  identified itself as `HeadlessChrome/150.0.0.0`.
- Every captured DOM buffer row stayed within the fixed 80-column console and
  `#lcs-playtest-errors` was empty. No new responsive or translation defect was
  reproduced. Durable evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-narrow-followup-20260811/replay.md`.

The residual queue remains random PT-048/PT-148 police terminal seeds and
singular-arrest/name-alias variants; PT-083 is still an optional readability
enhancement.

## 2026-08-11 — strict-headless singular police-alias surrender follow-up

- Replayed a fresh Portuguese police siege with a disposable fixture that put
  one converted-style `Police Officer` alias into the wanted pool. The browser
  was CLI-only and strict-headless (`AGENT_BROWSER_HEADED=0`, Chromium
  `--headless=new --ozone-platform=headless`) at 480×320; the bridge reported
  `HeadlessChrome/150.0.0.0`.
- The live terminal reproduced the defect as
  `Sergio Macy, vulgo Police Officer, é preso(a).`: the role name was English
  and the gender-parenthesis construction was awkward. The runtime now passes
  the localized creature-name helper, and the Portuguese catalog uses
  `As autoridades prendem {properName}, vulgo {name}.`.
- A rebuilt post-fix replay of the same fixture rendered `As autoridades
  prendem Adolf Meir, vulgo Oficial de Polícia.` with no English role name,
  no `preso(a)` marker, no row wider than 80 columns, and an empty
  `#lcs-playtest-errors` channel.
- The temporary fixture was restored. The focused context regression now
  asserts both the neutral template and `Oficial de Polícia` interpolation.
  Durable before/fix evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-alias-20260811/replay.md`.

PT-326 is fixed. The remaining playtest queue is random PT-048/PT-148 police
terminal seeds and optional PT-083 responsive-console readability.

## 2026-08-11 — strict-headless rescued-hostage terminal follow-up

- Replayed a fresh Portuguese police siege with a disposable fixture that put
  one missing, kidnapped `Police Officer` in the warehouse so the surrender
  flow reached its singular rescued-hostage terminal. The CLI browser was
  strict-headless (`AGENT_BROWSER_HEADED=0`, Chromium `--headless=new
  --ozone-platform=headless`) at 480×320; the bridge reported
  `HeadlessChrome/150.0.0.0`.
- Before the fix, the terminal rendered `Police Officer é levado para
  custódia e reabilitado.`. The role name bypassed localized creature-name
  rendering, and the masculine construction was not valid for an arbitrary
  rescued victim. PT-327 changed the call site to use the localized helper and
  replaced the catalog sentence with neutral custody prose.
- The rebuilt post-fix route rendered `As autoridades colocam Oficial de
  Polícia sob custódia para reabilitação.`. The final 25×80 buffer had no row
  wider than 80 columns and `#lcs-playtest-errors` was empty. Durable before /
  after evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-hostage-20260811/replay.md`.
- The temporary fixture, debug flags, browser session, and local servers were
  restored or closed. Singular arrested and rescued-hostage branches are now
  covered; only future random PT-048/PT-148 terminal seeds and optional PT-083
  responsive-console exploration remain open.

## 2026-08-11 — strict-headless unoccupied daily police-raid follow-up

- Replayed a fresh Portuguese game with a disposable fixture that moved the
  founder away from a renamed `Escola Velha` warehouse and left one
  conservative `Police Officer` there. The daily no-Liberal police-raid branch
  ran in a CLI-only strict-headless browser (`AGENT_BROWSER_HEADED=0`, Chromium
  `--headless=new --ozone-platform=headless`) at 480×320; the bridge reported
  `HeadlessChrome/150.0.0.0`.
- Before the fix, the opening line was `Os policiais invadiram o Escola
  Velha, um esconderijo desocupado.` and the cleanup line was `Conseguiram
  resgatar Police Officer.`. The opening row also lost its final period at the
  fixed console edge.
- PT-328 and PT-329 now localize both daily no-Liberal raid branches with
  `localizedCreatureName`, use `local chamado {location}` and the shorter
  `esconderijo vazio` wording, and render dynamic opening lines with the
  width-aware helpers. The rebuilt route showed `Os policiais invadiram o local
  chamado Escola Velha, um esconderijo vazio.` and `Conseguiram resgatar
  Oficial de Polícia.` with intact punctuation, no rows wider than 80 columns,
  and an empty `#lcs-playtest-errors` channel.
- The temporary fixture, debug flags, browser session, and local servers were
  restored or closed. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-unoccupied-20260811/replay.md`.

## 2026-08-11 — strict-headless PT-287 terminal replay after restart

- Rebuilt the app with a disposable CIA-siege fixture and replayed the
  Portuguese warehouse route in a fresh CLI-only `agent-browser` session.
  Chromium stayed headless (`AGENT_BROWSER_HEADED=0`, `--headless=new
  --ozone-platform=headless`) at 480×320; the runtime UA was
  `HeadlessChrome/150.0.0.0`.
- The `G - Desistir` terminal rendered
  `Todos os presentes em Estação Assombrada foram mortos.`. The row measured
  exactly 80 columns, retained its final period, contained no raw English
  terminal terms, and left `#lcs-playtest-errors` empty.
- This closes the previously pending post-restart replay for PT-287. No new
  translation or layout defect was confirmed. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/siege-terminal-replay-20260811/`.

The residual queue remains future random PT-048/PT-148 police-terminal seeds
and the optional PT-083 responsive-console readability enhancement.

## 2026-08-11 — strict-headless broad-funded route / PT-330 weapon label

- Replayed a fresh Portuguese new game after restarting the local web server.
  The CLI browser stayed strict-headless (`AGENT_BROWSER_HEADED=0`, Chromium
  `--headless=new --ozone-platform=headless`) at 480×320; the bridge reported
  `HeadlessChrome/150.0.0.0`.
- The broad all-items/funded route exposed `Nenhum` in the base roster's
  `ARMA` cell for an unequipped founder. The same shared label also appeared
  as `Arma: Nenhum` in the active-Liberal profile. This is a context defect:
  `arma` is feminine in Brazilian Portuguese.
- PT-330 now uses a dedicated `No weapon equipped` catalog key for the empty
  weapon sentinel. The rebuilt route rendered `Nenhuma` in both screens; the
  final bridge buffer stayed 25×80, the exact old token was absent, and
  `#lcs-playtest-errors` remained empty. The focused vocabulary regression
  covers the fixed roster cell. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/weapon-label-20260811/replay.md`.

The residual queue remains future random PT-048/PT-148 police-terminal seeds
and the optional PT-083 responsive-console readability enhancement.

## 2026-08-11 — strict-headless medical-debt receipt replay

- Rebuilt a disposable medical-industry siege fixture and replayed it through
  the CLI-only strict-headless browser at 480×320. Chromium ran with
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; the bridge reported
  `HeadlessChrome/150.0.0.0`.
- The fresh Portuguese world route reached a generated
  `Garagem de Ônibus Esquecida` safehouse with 50,000 in hospital debt and
  surrendered with `G - Desistir`. The receipt rendered `RECIBO DE COBRANÇA DE
  DÍVIDA MÉDICA`, the localized safehouse title, all Portuguese labels, and
  aligned amounts.
- The final buffer had 25 rows, a maximum width of 80, no over-wide rows, and
  an empty `#lcs-playtest-errors` channel. No new fresh-world translation or
  layout issue was confirmed. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-20260811/`.
- A separate exploratory run intentionally created the world in English and
  switched locale mid-game; its persisted generated warehouse name remained
  English in the Portuguese receipt. This is a future language-switch
  enhancement (generated names are materialized during `makeWorld()`), not a
  defect in a fresh Portuguese game. Keep it visible in the residual queue if
  the language-menu promise that all text changes immediately is broadened to
  persisted generated proper names.

The temporary fixture, browser session, and local server were restored or
closed before handoff. The remaining fresh-world queue is random PT-048/PT-148
police-terminal seeds plus the optional PT-083 responsive-console enhancement;
the language-switch generated-name edge case is separately noted for future
scope.

## 2026-08-11 — strict-headless police warehouse and narrow-console follow-up

- Replayed two fresh Portuguese games against the temporary warehouse-police
  fixture with CLI `agent-browser` only. Chromium stayed strict-headless
  (`AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`); the bridge reported `HeadlessChrome/150.0.0.0`.
- The first route exercised the alarm, loudspeaker, `G - Desistir`, and every
  police cleanup page. The second exercised `F - Lutar/Fugir`, the SWAT roster,
  repeated `D - Tentar despistá-los` escape turns, and a translated hit message.
  `Policial da SWAT`, `Armadura da SWAT`, `Espingarda`, and `Submet. MP5` all
  remained Portuguese; the only raw-English token was the intentional `SWAT`
  acronym.
- Buffers stayed at 25 rows with a maximum width of 80, and
  `#lcs-playtest-errors` stayed empty. At 320×240 and 240×160 the rendered
  console had no document overflow; the text is small at the latter size but
  no clipping defect was reproduced. Narrow screenshots and the full route
  transcript are retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-warehouse-followup-20260811/`.
- The existing `Escopeta pump` catalog term was reviewed in context and is an
  accepted Brazilian Portuguese rendering of pump shotgun; it was not promoted
  to a finding.

No new issue was confirmed. Keep the residual queue limited to random
PT-048/PT-148 police-terminal seeds, the optional PT-083 responsive-readability
enhancement, and the previously documented generated-name language-switch edge.

## 2026-08-11 — strict-headless funded Commerce shop follow-up

- Replayed a fresh Portuguese game with the temporary all-items/funded debug
  fixture through CLI `agent-browser` only. Chromium stayed strict-headless
  (`AGENT_BROWSER_HEADED=0`, `--headless=new`, `--ozone-platform=headless`) at
  480×320; the bridge reported `HeadlessChrome/150.0.0.0`. The DOM bridge
  supplied the fixed 80×25 buffer directly, so OCR was not needed.
- The dealership route reproduced the old `S - Vender o Veículo roubado:
  Esportivo Azul ($800)` label. After the fix, the rebuilt route rendered
  `S - Vender veículo roubado: Esportivo Azul ($800)`.
- The pawn-shop sale route reproduced the mixed bulk-action labels. After the
  fix, the rebuilt route rendered `Penhorar seletivamente`, `Penhorar todas as
  armas`, and `Penhorar todo o saque` in sentence case.
- Both final screens had 25 rows, maximum width 80, no over-wide rows, and an
  empty `#lcs-playtest-errors` channel. Fixed screenshots and JSON captures are
  under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/funded-shops-20260811/`.
- The temporary `debugAllItems`/`debugAMilli` flags were restored before
  validation. No additional translation or layout issue was confirmed in the
  department-store, dealership, pawn-shop, or oubliette surfaces.

PT-331 and PT-332 are fixed. Keep the existing random police-terminal seeds,
optional PT-083 narrow-console readability work, and the persisted generated-name
language-switch edge in the residual queue.

## 2026-08-11 — strict-headless management and agenda follow-up

- Replayed a fresh Portuguese game against a rebuilt local Flutter web-server
  at port 8791. The CLI `agent-browser` session stayed strict-headless
  (`AGENT_BROWSER_HEADED=0`, `--headless=new`, `--ozone-platform=headless`);
  the runtime UA was `HeadlessChrome/150.0.0.0`. The DOM bridge supplied the
  fixed 80×25 buffer directly, so no headed browser or OCR was used.
- Covered review/assets, squad assembly and profiles, promotion, all five
  agenda pages, media overview, ten equipment pages, task assignment and help,
  infiltrated-agent assignment, travel selection, and a squadless-location
  investment menu.
- The investment menu exposed mixed verb moods (`Coloque`/`Instale`/`Armazene`
  beside infinitives). PT-333 changed those catalog entries to consistent
  infinitives. The rebuilt menu now shows `Colocar câmeras`, `Colocar
  armadilhas`, `Instalar postes`, `Instalar um gerador`, `Instalar uma bateria`,
  and `Armazenar 20 rações`.
- Agenda page 2 exposed `opinião favorável sobre Presidente`; PT-334 adds the
  required Portuguese article. The rebuilt poll reads `0% têm uma opinião
  favorável sobre o Presidente Ezekiel Lipman.`.
- The location header's `Você não está sob cerco... ainda.` was reviewed as an
  unnatural word order. PT-335 now renders `Você ainda não está sob cerco...`.
- The investment and agenda buffers each measured 25 rows with maximum width
  80 and an empty `#lcs-playtest-errors` channel. Evidence and screenshots are
  under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/deep-sweep-20260811/`.

PT-333–PT-335 are fixed. No additional fresh-world translation or layout issue
was confirmed. Keep random PT-048/PT-148 police-terminal seed variation,
optional PT-083 narrow-console readability work, and the persisted generated
name language-switch edge in the residual queue.

## 2026-08-11 — strict-headless save and pawn confirmation replay

- Started a fresh local Flutter web-server on port 8803 and used the CLI
  `agent-browser` session `confirm_after_0811` exclusively with
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`. The runtime UA was
  `HeadlessChrome/150.0.0.0`; no headed browser window was used or focused.
- The DOM bridge supplied the 80×25 console directly, so OCR and screenshots
  were unnecessary for translation assertions. A normal Portuguese founder
  route selected the `$1000` background, bought two revolvers, and reached the
  pawn shop without debug fixtures.
- Before the fix, the captured pawn confirmation read
  `Vender realmente todos os weapons? (S)im para confirmar.` and pressing `S`
  did not sell. After the fix, the exact buffer row read
  `Vender todo o lote de armas? (S)im para confirmar.`; `S` sold the weapon,
  the funds receipt appeared, and the flow returned to the pawn menu.
- The same replay auto-saved, opened the Portuguese save manager, selected the
  save, and reached `Excluir Salvamento`. Pressing `S` returned to the title
  screen, proving the localized affirmative path now deletes the save. The
  prompt still preserves `Y - Sim` as required by the key-prefix invariant.
- The final bridge error channel was empty and all inspected buffers remained
  25 rows with a maximum width of 80. The browser and local server were closed
  after replay. Evidence and the prior prompt screenshot are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/save-shop-confirm-20260811/`.

PT-336 and PT-337 are fixed and verified. Keep the residual queue limited to
random PT-048/PT-148 police-terminal seeds, the optional PT-083 narrow-console
readability enhancement, and the persisted generated-name language-switch
edge.

## 2026-08-11 — strict-headless hospital/courthouse and locale-switch follow-up

- Replayed a fresh female-founder Portuguese world through the hospital and
  courthouse planner routes. `Centro Médico UW`, `Fórum`, their site footer,
  and the action-help overlay stayed Portuguese; no raw English control text,
  bridge error, or over-wide row appeared.
- The same world was switched to English and the Industrial District planner
  was opened. Generated names remained materialized in Portuguese inside the
  English screen (`Frigorífico Esquecido`, `Conjuntos habitacionais da Rua
  Reading`, `Confecções March`, and `Casa de Drogas da Rua Nakamura`). Switching
  back to Portuguese translated the surrounding labels while preserving those
  names. This confirms the existing locale-switch edge in both directions,
  not a fresh-world Portuguese defect.
- At 480×320 the final Portuguese planner buffer measured 25 rows with a
  maximum width of 80, no document overflow, and an empty
  `#lcs-playtest-errors` channel. Chromium remained strict-headless on every
  invocation (`AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`); the DOM bridge supplied the text directly.
- Durable route evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/locale-switch-generated-names-20260811/replay.md`.

No new translation or layout defect was confirmed. Keep random PT-048/PT-148
police-terminal seed variation, optional PT-083 narrow-console readability
work, and the bidirectional persisted generated-name locale edge in the
residual queue.

## 2026-08-11 — strict-headless random police-terminal variants

- Rebuilt a disposable local police-siege fixture with `debugSiege=true` only
  during setup, then restored the flag to `false` and stopped the server.
  Two fresh Portuguese worlds exercised different generated warehouse names:
  `Armazém Assombrado` and `Fábrica de Brinquedos Velha`.
- Variant A covered the alarm, loudspeaker, safehouse status, surrender,
  confiscation, fortification/trap/AA cleanup, and post-siege status. The
  generated-name article stayed correct in
  `A polícia cercou o local: Armazém Assombrado!`, and the status returned as
  `Você ainda não está sob cerco...`.
- Variant B covered the fight briefing, SWAT roster, foot-escape messages,
  and a localized combat sentence. `Policial da SWAT`, `Armadura da SWAT`,
  `Espingarda`, `M4`, and `Submet. MP5` stayed Portuguese; the chase messages
  `Policial da SWAT não consegue acompanhar!` and
  `Policial da SWAT ainda está no seu encalço!` were grammatically intact.
- Every invocation used the strict-headless profile (`AGENT_BROWSER_HEADED=0`,
  `--headless=new`, `--ozone-platform=headless`, `--disable-dev-shm-usage`,
  `--disable-cache`). The bridge reported `HeadlessChrome/150.0.0.0`.
  Inspected buffers stayed at 25 rows with maximum width 80 and an empty
  `#lcs-playtest-errors` channel.
- Durable route evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-random-20260811/replay.md`.

No new translation or layout defect was confirmed. Keep only additional
random PT-048/PT-148 terminal seeds and the optional PT-083 narrow-console
readability enhancement open.

## 2026-08-11 — strict-headless narrow/high-content follow-up

- Replayed a fresh Portuguese founder world against a rebuilt local Flutter
  web-server on port 8813. The CLI `agent-browser` session stayed strict-headless
  (`AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`) at both 240×160 and 480×320. The DOM bridge
  supplied the fixed 80×25 console directly; no headed browser or OCR was used.
- Covered base/travel, Commerce department store, pawn shop, dealership,
  review/assets, ten all-items equipment pages, all five agenda pages, media
  overview, and a department-store purchase followed by the finance report.
- The narrow console scaled inside the viewport with no document overflow. Every
  inspected buffer stayed at 25 rows with maximum width 80, and
  `#lcs-playtest-errors` remained empty. The 240×160 view is intentionally tiny
  but did not reproduce clipping; screenshots and the full route notes are in
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-content-20260811/`.
- The agenda summary exposed `Casa: ...` for the congressional House. PT-338
  changes the context-specific catalog entry to `Câmara: ...`; the rebuilt
  agenda showed the corrected row.
- The finance report exposed `Mudança Líquida Este Mês (Dia):`. PT-339 changes
  it to `Variação líquida neste mês (dia):`; the purchase-backed finance report
  showed the corrected sentence-case label.
- The all-items route also reviewed compact labels (`Metr. leve M250`,
  `Escopeta pump`). The M250 abbreviation is retained because the equipment
  transfer column is 24 cells wide and the full phrase truncates; the existing
  Brazilian Portuguese `Escopeta pump` loanword remains accepted.

PT-338 and PT-339 are fixed and verified. The temporary debug fixtures were
restored before validation. Keep the residual queue limited to future random
PT-048/PT-148 terminal seeds, the optional PT-083 responsive-readability work,
and the persisted generated-name locale-switch product decision.

## 2026-08-11 — strict-headless police-terminal seed 3

- A third fresh Portuguese warehouse route used the generated name
  `Armazém Assombrado` and covered the daily police alarm, loudspeaker,
  surrender prompt, confiscation, compound cleanup, and post-siege roster.
- The route stayed Portuguese: `A polícia cercou o local: Armazém Assombrado!`,
  `Você ouve uma voz alta em um alto-falante:`, `Rendam-se!`, and the
  fortification, trap, and anti-aircraft cleanup lines were all localized.
- The CLI `agent-browser` session remained strict-headless
  (`AGENT_BROWSER_HEADED=0`, `--headless=new`, `--ozone-platform=headless`,
  `--disable-dev-shm-usage`, `--disable-cache`) with UA
  `HeadlessChrome/150.0.0.0`; no headed window was opened or focused. The DOM
  bridge measured 25 rows, maximum width 80, no document overflow, an empty
  `#lcs-playtest-errors` channel, and no raw English control tokens.
- Evidence and screenshot: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/
  police-terminal-seed3-20260811/`.

No new translation, key-prefix, punctuation, or layout defect was reproduced.

## 2026-08-11 — strict-headless recruitment dialogue

- A fresh Portuguese route assigned `Recrutar`, selected `Estudante
  Universitário`, and traversed a nonbinary/trans candidate profile, political
  conversation, and follow-up recruitment meeting at 480×320.
- The live conversation exposed PT-340: the composed Torture discussion read
  `... permitindo que o governo torturar e abusar de seres humanos em nosso
  nome.`. The catalog fragment now reads `o governo torture e abuse de seres
  humanos em nosso nome.`; the focused context test was observed failing before
  the edit and passing after it.
- The rebuilt route kept 25 rows at a maximum width of 80, with an empty
  `#lcs-playtest-errors` channel and no raw English control text beyond the
  intentional `Enter/Escape` key name. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/recruitment-torture-20260811/`.

PT-340 is fixed. Continue with the remaining recruitment/date/profile route
ideas and random police-terminal seeds when future catalog changes justify
them; PT-083 responsive readability and persisted generated-name localization
remain product-level edges rather than confirmed regressions.

## 2026-08-11 — strict-headless activity-help resource terminology

- Replayed a fresh Portuguese founder world against a rebuilt local Flutter
  web-server on port 8818. The CLI `agent-browser` session used only the
  strict-headless profile (`AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`, `--disable-dev-shm-usage`, `--disable-cache`).
- Opened task assignment, selected `1 - Serviço Comunitário`, and opened the
  activity help overlay. The pre-fix body visibly called the resource `Ânimo`,
  unlike the in-game `Energia` label used elsewhere. PT-341 changes the full
  catalog translation to `aumentando gradualmente a Energia até o máximo de
  10.` and the focused regression covers the exact line.
- The rebuilt headless screen rendered the corrected `Energia` wording. The
  bridge reported 25 rows with maximum width 80, no document overflow, an
  empty `#lcs-playtest-errors` channel, and UA
  `HeadlessChrome/150.0.0.0`. No `.nn` newline artifacts or English prose were
  visible during the adjacent activity-help sweep.
- Durable buffer and metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/community-service-energy-20260811/`.

PT-341 is fixed and verified. Keep the activity-help sweep in the strict-
headless matrix when future resource terminology changes land.

## 2026-08-11 — strict-headless developer-flag media and newspaper sweep

- The reusable headless wrapper at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agent-browser-headless.sh`
  enforced `AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`, `--disable-dev-shm-usage`, and
  `--disable-cache` for every CLI browser command. The browser reported
  `HeadlessChrome/150.0.0.0`; no headed window was opened or focused.
- A temporary local fixture enabled all items, funds, rescued-party entries,
  public-opinion extremes, and founder medical debt. It was restored to all
  `false` values before the rebuild. The route covered the founder setup,
  review/profile pages, finance, equipment pages, all five agenda pages,
  media overview, and several daily newspaper cycles at the fixed 80×25
  bridge.
- The media overview rendered `GENIUS MUTANT` in English while the selected
  article title rendered `MUTANTE GÊNIO`; PT-342 fixes the overview's stored
  headline path. The pre-fix buffer is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/media-headline-20260811/`.
- A fresh rebuilt route then reached the Portuguese military article
  `FIM DA GUERRA`. Its body exposed the English sentence fragment
  `somehow managed to shoot every one of the hostages and none of the captors
  during a hostage rescue mission`; PT-343 now translates the two existing
  catalog fragments independently. The pre-fix article capture is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/military-article-20260811/`.
- Both focused regressions were red before their implementation changes and
  green afterward. The random post-fix browser route did not reselect the same
  military incident within 30 additional day steps, so the deterministic
  fragment test is the authoritative post-fix check for PT-343; future seeded
  newspaper cycles should retain this route.

## 2026-08-11 — strict-headless hospital context follow-up

- A fresh Portuguese founder route traveled to the University District and
  opened `Centro Médico UW`. The action row exposed `F - Entrar e tratar
  ferimentos Conservadores`, an ambiguous literal translation of the
  Conservative-faction wound action.
- PT-344 changes the catalog entry to `F - Entrar e tratar os ferimentos dos
  Conservadores`. The rebuilt strict-headless route rendered the corrected row
  at 80 columns with no bridge errors; captures and metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/hospital-wounds-context-20260811/`.

## 2026-08-12 — strict-headless compact profile residual

- A fresh Portuguese founder route used only the repository's strict-headless
  `agent-browser` wrapper (`AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`) and the DOM console bridge. It covered founder
  creation, commerce, police, hospital/university travel, equipment, squad
  assembly, and the Review → Liberal profile path.
- The compact profile remained Portuguese and structurally separated, but its
  fixed cells visibly ellipsized useful labels:
  `Perna esq…`, `Perna dir…`, `Braço esq…`, `Braço dir…`,
  `Esperteza de R…`, and `Carro: Veículo roubado: Espo…`. The fixed numeric and
  wound-status columns did not collide, so this is a low-severity readability
  residual rather than a data-loss or crash defect.
- The bridge reported `HeadlessChrome/150.0.0.0`, 25 console rows, no browser
  errors, and no document overflow. The canonical buffer is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/surface-sweep-20260812-current.txt`.

PT-348 was the only newly confirmed profile residual in that pass. The
full-profile PT-189 fix remains intact; the compact-label fix is recorded below.

## 2026-08-12 — strict-headless compact-profile fix verification

- Replayed the Portuguese founder → Review → Assemble Squad → Liberal profile
  route using only the repository's strict-headless `agent-browser` wrapper
  (`AGENT_BROWSER_HEADED=0`, `--headless=new`, `--ozone-platform=headless`).
- PT-348 now renders `Perna esq:`, `Braço dir:`, `Esp. de Rua:`, and
  `Carro: Roubado: Esportivo` without ellipses. The full skills page still
  renders `Esperteza de Rua`, confirming the compact key is context-specific.
- The DOM bridge reported `HeadlessChrome/150.0.0.0`, 25 rows, maximum width
  80, no document overflow, and an empty `#lcs-playtest-errors` channel. Durable
  post-fix capture and metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/compact-profile-fix-20260812/`.

PT-348 is fixed and verified. Continue with the remaining recruitment/date,
random police-terminal, and optional PT-083 responsive-console routes.

## 2026-08-12 — strict-headless mass-shooting and founder-context follow-up

- A fresh Portuguese founder route ran only through the repository's strict
  headless CLI browser (`AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`) at the fixed 80×25 console. The route reached
  hospital discharge, month-end news, courtroom notices, and a live Portuguese
  newspaper page without opening or focusing a headed window.
- The captured mass-shooting article exposed PT-345 (`já tinha matou`) and
  PT-346 (`em escola fundamental Spasov` / `entrou em escola fundamental`).
  The catalog/runtime now use the correct past participle and school-specific
  articles/name order. A deterministic regression generates 500 stories and
  observes all four school types, rejecting the old forms.
- The founder-origin capture also confirmed PT-347: `roubando de Corporações`
  is now `roubando das Corporações`, with original capitalization retained.
- Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/mass-shooting-context-20260812/`
  and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/founder-choices-20260812/`.
  The live post-fix route remained Portuguese and bounded; no DOM bridge errors
  or new translation defect were confirmed during the follow-up.

## 2026-08-12 — strict-headless developer-flag management sweep

- Replayed a fresh Portuguese founder world with temporary debug fixtures for
  all-items, injured-founder, rescued-party, public-opinion, sleeper-agent,
  medical-debt, and map-editor coverage. Every browser command used the
  repository wrapper with `AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`, and `--disable-cache`; the UA was
  `HeadlessChrome/150.0.0.0` and no headed window was opened or focused.
- Covered Review categories (active, hostages, hospital, justice, infiltrated,
  dead, absent, and equipment), equipment/vehicle menus, all agenda pages,
  media overview, infiltrated agents, task assignment, flagging, location
  selection, department-store travel, and activity assignment. Portuguese
  copy stayed bounded in the 80-column bridge and no browser errors were
  reported.
- The scripted founder-name capture showed `Miguel Goldsteinaaaa`; this was
  reproduced as repeated injected `a` keys arriving while the name editor was
  still active, so it is an input-harness timing artifact rather than a game
  or translation defect. A fresh title/menu capture after returning from the
  game was localized and stable.
- Temporary debug flags were restored to their original `false` values before
  stopping the server. No new translation or layout issue was confirmed.

Residual work remains limited to broader random PT-048/PT-148 police-terminal
variants, the optional PT-083 narrow-console readability enhancement, and the
product decision about translating persisted generated names after a locale
switch.

## 2026-08-12 — strict-headless commerce and injured-profile follow-up

- Replayed a fresh Portuguese campaign with the repository wrapper only:
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, `--ozone-platform=headless`,
  and `--disable-cache`. The browser UA was
  `HeadlessChrome/150.0.0.0`; no headed window was opened or focused.
- Covered the planned Commerce route through `O Calabouço`, including the
  medieval armor, Halloween clothing, and medieval weapon departments. Item
  names, traits, prices, `A -`/`C -`/`M -` prefixes, and purchase footers stayed
  Portuguese and within the 80-column DOM bridge. The route also reached the
  department-store and travel-plan screens without a bridge error.
- Rebuilt once with temporary all-items, funds, and badly-injured founder flags
  to exercise Review → Liberals → profile. The compact profile showed the
  translated wound overflow marker (`+8 outras — BAIXO`); the skills, crimes,
  and full special-injury page stayed Portuguese, bounded, and navigable. The
  temporary flags were restored to `false` before stopping the server.
- No new translation, prefix, or layout defect was confirmed. Durable captures
  are under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/armor-footer-20260812/`
  and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/injury-profile-20260812/`.

Residual work remains limited to broader random PT-048/PT-148 police-terminal
variants, the optional PT-083 narrow-console readability enhancement, and the
product decision about translating persisted generated names after a locale
switch.

## 2026-08-13 — strict-headless medical-debt replay

- Replayed a fresh Portuguese founder campaign with the repository wrapper only:
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, `--ozone-platform=headless`, and
  `--disable-cache`; UA was `HeadlessChrome/150.0.0.0` and no headed browser was
  opened or focused.
- Temporarily made the founder-debt fixture deterministic by supplying eligible
  funds, hostile healthcare law, and an immediate medical raid. Captured the
  ambulance briefing, collection speech, finance speech, status line, base
  under-attack state, and the `G - Desistir` receipt in Portuguese.
- At 320×240 the DOM bridge stayed 25 rows with `maxRow=80`, no document
  overflow, and an empty `#lcs-playtest-errors` channel. No translation,
  prefix-preservation, or layout defect was confirmed.
- Restored all temporary flags and fixture edits to their original values.
  Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-20260813/`.

## 2026-08-12 — strict-headless interface-options grammar follow-up (PT-359)

- A fresh Portuguese title-screen route opened `Opções de Jogo → Opções de
  Interface` using the persistent headless wrapper only. The encounter-warning
  help line exposed `passe acidentalmente por eles` after `pessoas`; this is a
  Portuguese gender-agreement error, not a browser or input artifact.
- PT-359 changes the catalog value to `passe acidentalmente por elas` and adds a
  focused regression that rejects the old form.
- The rebuilt strict-headless replay rendered the corrected line. The DOM
  bridge reported 25 rows, max width 80, no document overflow, an empty
  `#lcs-playtest-errors` channel, and UA `HeadlessChrome/150.0.0.0`.
- Temporary browser/server resources were closed after capture. No headed
  browser was opened or focused. Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/interface-options-pronoun-20260812/`.

## 2026-08-12 — strict-headless police-terminal variation (PT-360)

- Used a temporary `debugSiege=true` fixture for a fresh Portuguese police
  siege, then restored the flag to `false`. The persistent wrapper reported UA
  `HeadlessChrome/150.0.0.0`; no headed browser was opened or focused.
- Exercised warning, loudspeaker, surrender status, fight briefing, SWAT
  roster, foot escape, combat hit, fleeing-role styling, and post-siege return.
  The generated `Armazém Esquecido` route kept `Armadura da SWAT`, `Espingarda`,
  `Carabina M4`, `Rifle M7`, and `Submet. MP5` localized.
- All inspected buffers stayed at 25 rows and max width 80 with no document
  overflow and an empty `#lcs-playtest-errors` channel. The lowercase
  `policial da SWAT` marker is intentional flee-state styling. No new defect
  was confirmed. Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-next-20260812/`.

## 2026-08-12 — strict-headless courthouse map-footer replay (PT-361)

- The courthouse route exposed a real fixed-console defect: a localized
  `Vitrine` special label overwrote the row-23 Portuguese action legend and
  produced `L:CarregaVitrineenar` instead of `L:Carregar`.
- `printSiteMapSmall` now reserves the map's bottom border for special labels
  whenever the action legend occupies the old footer range. The focused map
  regression passes and rejects the merged command form.
- The focused regression captured `Vitrine` on the dedicated map footer and
  an intact `L:Carregar` command row. The accompanying live headless route
  measured 25 rows, max width 80, no document overflow, and no bridge errors.
  Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/site-map-command-overlap-20260812/`.
- The temporary `debugPartyRescue` fixture was restored to `false`; no headed
  browser was opened or focused.

## 2026-08-12 — strict-headless map-editor special-label replay (PT-362)

- Used the repository headless wrapper only (`AGENT_BROWSER_HEADED=0`,
  `--headless=new`, `--ozone-platform=headless`) at 640×480. The Portuguese
  map editor’s desktop and compact palettes, site dropdown, filter, brush
  status, and tooltips were exercised without a headed browser.
- Loading `Casa Branca` and switching to floor 2 exposed a real fallback bug:
  hovering the Oval Office tile showed `ovalOfficeNW [bloco 7, especial 39]`.
- `specialLabel` now covers loaded-but-not-paintable special states and routes
  them through the catalogs. The focused widget regression and catalog checks
  pass; the rebuilt headless replay keeps the same status bounded and user-facing.
- Temporary `debugShowMapEditor` and the temporary server were restored/stopped.
  Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/map-editor-followup-20260812/`.

## 2026-08-12 — strict-headless bank-vault catalog audit (PT-363)

- Replayed a fresh Portuguese First American Bank route with the repository
  wrapper only: `AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`, and `--disable-cache`; UA was
  `HeadlessChrome/150.0.0.0` and no headed browser was opened or focused.
- The live map traversal reached the Portuguese bank destination and teller
  prompt (`Há um caixa do banco disponível.`). A source/catalog audit of the
  adjacent vault branch found thirteen literals missing from both catalogs,
  including the yes/no prompt, lock continuations, manager/hostage outcomes,
  and empty-teller fallback. The existing computer-specialist fragment also
  incorrectly said `um computador` in Portuguese.
- Added the missing English/PT-BR shard entries and corrected the specialist
  continuation to `um especialista em informática`. The focused context test
  asserts all vault fragments and rejects the old noun reading. Canonical ARB,
  key-prefix, and full interpolation/static coverage validation all pass; the
  box-drawing footer interpolation is explicitly classified in the allowlist.
- A random live traversal did not reliably land on the vault tile, so this log
  intentionally does not claim a full vault UI screenshot. The bank route and
  teller captures are under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/additional-route/19-bank-arrival.txt`
  and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/bank-teller-8014e-after.txt`.

## 2026-08-12 — strict-headless rebuilt police-fixture replay (PT-364)

- Restarted the temporary 8899 web server after switching the disposable
  fixture to `debugSiegeType = "cops"`; the persistent 8872 server was left
  untouched. The browser wrapper forced `AGENT_BROWSER_HEADED=0`,
  `--headless=new`, and `--ozone-platform=headless`; UA was
  `HeadlessChrome/150.0.0.0`.
- A fresh Portuguese route rendered `A polícia cercou o local`, the
  loudspeaker `Rendam-se!` prompt, localized SWAT equipment, and the combat
  legend. The DOM bridge stayed at 25 rows/max width 80, with no document
  overflow and an empty `#lcs-playtest-errors` channel.
- No translation, prefix-preservation, punctuation, or layout defect was
  confirmed. The combat `_fightSubdued` arrest branch was not forced, so the
  broader PT-048 arrest/subdue queue remains open. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-cops-20260812/`.

## 2026-08-12 — strict-headless police combat follow-up (PT-365)

- Replayed the disposable Portuguese police fixture after moving the active
  squad placement to the end of character creation so it survived into the
  besieged warehouse. The repository wrapper remained strict headless only:
  `AGENT_BROWSER_HEADED=0`, `--headless=new`,
  `--ozone-platform=headless`, and `--disable-cache`; UA was
  `HeadlessChrome/150.0.0.0`. No headed browser was opened or focused.
- Covered the surround warning, `Rendam-se!` loudspeaker prompt, surrender
  status, combat briefing, SWAT equipment roster, localized weapons and armor,
  hit/injury messages, and repeated `F - Lutar` rounds. Buffers stayed at 25
  rows/max width 80 with no document overflow and no bridge errors.
- The normal `_fightSubdued` condition was not reached before combat state
  changed, so no arrest terminal was claimed. The residual PT-048
  arrest/subdue queue remains open. Temporary fixture/diagnostic edits were
  removed and the temporary browser/server were closed; persistent port 8872
  was untouched. Evidence directory:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-subdue-20260812/`.

## 2026-08-12 — strict-headless profile-boundary and armor follow-up (PT-366/PT-367)

- Rebuilt the disposable Flutter web server and replayed the Portuguese
  founder/profile route with the repository wrapper only:
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, `--ozone-platform=headless`, and
  `--disable-cache`. UA was `HeadlessChrome/150.0.0.0`; no headed browser was
  opened or focused.
- The fresh route reproduced false missing-translation telemetry for visible
  Portuguese values such as `Roupas`, `Daishō`, and `SEA — Sem-teto`. The
  affected display boundaries now use `noTranslate` after their values have
  already been localized; fallback labels still use the catalogs. Focused
  regressions cover profile clothing/weapon, Review locations, task locations,
  and equipment-transfer site names.
- The armored profile also exposed `Liberal+30` where body status and armor
  detail touched. `printWounds` now inserts a separator before fitting the
  armor suffix. The final DOM bridge measured 25 rows and max width 80, with no
  document overflow, no bridge errors, and no `Missing translation` warnings.
- Full suite result: 635 tests passed. Catalog canonicalization, key-prefix
  validation, interpolation audit, static validation, and `git diff --check`
  all passed. Screenshot evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-armor-fixed-8901.png`.

Residual work remains PT-048/PT-148 police arrest/subdue variants, PT-083
narrow-console readability, the persisted generated-name locale-switch
decision, and accepted PT-049 historical changelog English.

## 2026-08-12 — strict-headless CIA briefing telemetry replay (PT-368)

- Rebuilt a disposable Portuguese CIA-siege fixture and replayed the opening
  alarm through the raid briefing with the repository wrapper only:
  `AGENT_BROWSER_HEADED=0`, Chromium `--headless=new` and
  `--ozone-platform=headless`. The runtime UA was
  `HeadlessChrome/150.0.0.0`; no headed browser was opened or focused.
- The first pass exposed a false missing-translation warning for the already
  rendered sentence `No meio da noite, uma coluna de vans pretas sem
  identificação e com vidros escuros cerca o local chamado Armazém Velho.`.
  Source tracing found the same process-then-`addparagraph` pattern in the
  corporate and rural siege branches.
- `addparagraph` now receives `noTranslate: true` for those four pretranslated
  paragraphs. The focused siege regression and rebuilt replay render the same
  Portuguese text without the warning. The final bridge measured 25 rows,
  maximum width 80, no document overflow, and an empty error channel. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-briefing-fixed-8903.png`.

PT-368 is fixed. The residual queue remains random PT-048/PT-148
police-terminal arrest/subdue variants, optional PT-083 narrow-console
readability work, and the persisted generated-name locale-switch decision.

## 2026-08-12 — strict-headless forced police-subdue terminal replay

- Used a disposable-only debug fixture to route a fresh Portuguese police
  siege into `_fightSubdued` after the normal briefing; the product debug flags
  and source were restored before shutdown. Chromium ran only through the
  repository wrapper with `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; UA was `HeadlessChrome/150.0.0.0` and no headed
  browser was opened or focused.
- The terminal rendered `A polícia imobiliza e prende o esquadrão.`. No raw
  English role, missing-translation warning, or bridge error appeared. The
  bridge measured 25 rows, maximum width 80, and no document overflow.
- This closes the previously unverified PT-048 police subdue wording branch.
  PT-148's broader random police-alarm variants remain in the queue. The
  temporary server and browser session were closed; persistent ports 8872 and
  8898 were untouched.

## 2026-08-12 — strict-headless city proper-name telemetry follow-up (PT-369)

- The same rebuilt police fixture logged `San Antonio, TX` as missing after
  the subdue terminal. Source tracing showed `City.getName()` translated every
  generated city name, unlike the catalog-aware `Site.getName()` fallback.
- `City.getName()` now translates only explicit catalog entries and preserves
  uncatalogued proper names verbatim. A focused vocabulary regression passes;
  the city warning is no longer recorded on the replay path.

## 2026-08-12 — strict-headless police-behavior headline follow-up (PT-370)

- The fixed police-subdue replay also generated the `View.policeBehavior`
  major-event headline and logged missing key `BASTARDS`. Source tracing found
  the no-profanity alternative `[JERKS]` in the same player-facing headline
  generator; both values were absent from Portuguese catalogs.
- Added canonical shard entries `BASTARDS → CANALHAS` and
  `[JERKS] → [BABACAS]`, with a focused Herald regression. A fresh strict-headless
  browser session reported `HeadlessChrome/150.0.0.0`, 25 rows, maximum width 80,
  no document overflow, and an empty bridge-error channel after the fix.

## 2026-08-13 — independent strict-headless craft-navigation verification (PT-371–PT-373/PT-375)

- Replayed a fresh Portuguese founder through `Atribuir Tarefas →
  Recrutamento e Aquisição → Fazer Roupas` and `Fazer uma Bandeira` against a
  disposable Flutter `web-server` on port 8957. The only browser was the
  repository wrapper `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agent-browser-headless.sh`
  with session `verifier-crafting-20260813`, `AGENT_BROWSER_HEADED=0`,
  `--headless=new`, `--ozone-platform=headless`, `--disable-dev-shm-usage`,
  and `--disable-cache`; the UA was
  `HeadlessChrome/150.0.7871.115`. No headed window, desktop input, CDP
  attach, or other browser session was used.
- Clothing pages 3–5 stayed Portuguese and width-safe. Page 4 rendered
  `Armadura tática da SWAT ... Impossível        US$ 2.100` with a visible
  separator and complete cost; page 5 rendered the complete `US$ 5.000` for
  `Traje de tanque humano`. Selecting page-5 `G`, then pressing `[` to page 4,
  cleared the tank footer; page 4 showed no off-page preview. PT-371 and PT-373
  remain fixed in this independent replay.
- Flag pages 1–2 kept complete `US$ 10`, `US$ 15`, and `US$ 20` amounts with a
  separator before costs. Selecting page-2 `H - Bandeira do Orgulho
  Progressista Inters…`, then pressing `[` to page 1, left the page-2 preview
  footer visible below page 1: `Bandeira do Orgulho Progressista Inters…`,
  `Questão: Direitos LGBTQ+`, `Dificuldade: Acima da Média`, `US$ 20`, even
  though page 1 contains only `A`–`L` rows for different flags. This is a new
  reproducible sibling navigation defect, tracked as PT-375; PT-372's cost
  clipping/separator defect remains fixed.
- Normal 1280×577, 480×320, and 320×240 captures all measured 25 rows,
  `maxRow=80`, zero over-wide rows, document width equal to viewport, and an
  empty `#lcs-playtest-errors` channel. The bridge consumed each `data-key`
  command; `data-options` exposed the 12 current page rows. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-crafting-20260813/`.

## 2026-08-13 — strict-headless fresh broad replay and sleeper-header follow-up (PT-376)

- Replayed a fresh Portuguese campaign against disposable Flutter `web-server`
  port 8961 with the repository wrapper only:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agent-browser-headless.sh`,
  session `playtester-fresh-20260813`, `AGENT_BROWSER_HEADED=0`,
  `--headless=new`, `--ozone-platform=headless`,
  `--disable-dev-shm-usage`, and `--disable-cache`. The browser UA was
  `HeadlessChrome/150.0.0.0`; no headed browser, desktop input, or CDP attach
  was used.
- The route covered Portuguese title/language selection, all founder prompts,
  the conservative-era intro, base mode, profile/review, equipment with
  all-item inventory, task assignment, clothing pages 1–5, both flag pages,
  agenda, media overview/article, and sleeper activation. Captures are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fresh-broad-20260813/`.
- Selecting the president sleeper reproduced PT-376 at row 0:
  `Ação Encoberta: Qual será o foco de Presidente Lovecraft?heiro: US$ 1.000.000`.
  The title overwrites the `Dinheiro:` funds label; the exact 80-cell buffer
  and empty `#lcs-playtest-errors` channel are recorded in
  `36-sleeper-activity.json`. This is distinct from the fixed regular activity
  header PT-302 because `activate_sleepers.dart` still uses an unbounded title
  write.
- No other new translation/layout/runtime issue was confirmed in the broad
  routes. Victory was not reached in this pass; waiting reached the newspaper
  route and the replay then returned to base after dismissal.

## 2026-08-13 — constitutional-amendment endgame translation follow-up (PT-377)

- Continuing the same strict-headless Portuguese replay through month-end
  amendment and election screens reached the Supreme Court purge route. The
  DOM buffer at `auto-checkpoint-50.json` and `auto-checkpoint-75.json` shows
  the otherwise Portuguese amendment screen followed by the raw English
  heading `The following former citizens are branded Arch-Conservative:`.
- This is a new missing-translation route defect, distinct from PT-321's
  previously fixed Portuguese agreement fragments. The source branch in
  `lib/politics/constitution.dart` writes the singular/plural heading directly
  with `mvaddstr`, so the Portuguese catalog is bypassed.
- The route remained 25×80 with no over-wide rows or bridge errors. The broad
  run continued into repeated Portuguese court/trial screens but did not reach
  the victory terminal.

## 2026-08-13 — strict-headless disposable victory-fixture replay

- After the natural replay stalled in repeated court/trial/month-end screens,
  a disposable-only `debugInstantVictory` fixture initialized all laws,
  Congress, Supreme Court, and executive offices to Elite Liberal and disabled
  the CCS. The fixture was removed and both source files restored exactly after
  capture; it was never committed.
- A fresh Portuguese route used web-server port 8963 and isolated session
  `playtester-victory-20260813` through the repository wrapper only. The UA was
  `HeadlessChrome/150.0.0.0`; no headed browser, desktop input, or CDP attach
  was used. Advancing one day reached the localized victory agenda screen:
  `O Triunfo da Agenda Liberal` / `O país alcançou o status de Liberal de Elite!`.
- Selecting `L - Ver a lista de pontuação alta` reached the Portuguese high-score
  terminal, `A Elite Liberal`, with January 2023 and no bridge errors. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fresh-broad-20260813/victory-04-wait.json`,
  `victory-05-highscores.json`, and `victory-final-metrics.json`.

## 2026-08-13 — independent strict-headless fixer-batch verification (PT-375/PT-376)

- Replayed PT-375 against a fresh Flutter `web-server` on `127.0.0.1:8973`
  from an isolated disposable source copy. The only browser was
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agent-browser-headless.sh`
  with session `verifier-final-20260813`, `AGENT_BROWSER_HEADED=0`,
  `--headless=new`, `--ozone-platform=headless`, `--disable-dev-shm-usage`,
  and `--disable-cache`; the UA was `HeadlessChrome/150.0.0.0`. No headed
  window, desktop input, or CDP attach was used.
- The Portuguese flag route selected page-2 `H - Bandeira do Orgulho
  Progressista Inters…`, then returned to page 1 with `[`. The page-1 detail
  footer was cleared; the off-page preview and its `US$ 20` no longer
  remained. Normal 1280×577, 480×320, and 320×240 captures all measured 25
  rows, `maxRow=80`, no over-wide rows, document width equal to viewport, and
  an empty `#lcs-playtest-errors` channel. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-final-20260813/01-flag-page1-normal.json`
  through `06-flag-page1-after-back-320x240.json`.
- Replayed PT-376 in separate fresh headless sessions using the isolated
  president-sleeper fixture. The initial natural-funds run
  (`verifier-sleeper-final-20260813`) selected `A - Presidente Yim`; a second
  isolated-only run (`verifier-sleeper-highfunds-20260813`) forced the funds to
  `US$ 1.000.000` and selected `A - Presidente Antle`. Its header rendered
  `Ação Encoberta:   Qual será o foco de Presidente Antle? Dinheiro: US$ 1.000.000 `:
  the complete longest funds label is visible with a separator and no title
  overwrite. The same 25×80, zero-overflow, no-error result held at 1280×577,
  480×320, and 320×240. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-final-20260813/10-sleeper-highfunds-normal.json`
  through `12-sleeper-highfunds-320x240.json` (natural-funds captures are
  `07`–`09`).
- PT-375 and PT-376 are closed as independently verified. Tracker audit found
  PT-377 remains the only other `Replay status: Open` entry; it is the separate
  Supreme Court purge heading finding and remains intentionally open.

## 2026-08-13 — independent strict-headless PT-377 fixer verification

- Replayed the Supreme Court purge heading from a fresh isolated source copy
  against a disposable Flutter `web-server` on `127.0.0.1:8977`. The temporary
  fixture called `tryToPurgeSupremeCourt()` directly after initializing a fresh
  Portuguese `GameState`, with separate plural and singular court compositions;
  no shared source or debug flag was changed.
- The only browser was
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agent-browser-headless.sh`
  with sessions `verifier-pt377-plural-20260813` and
  `verifier-pt377-singular-20260813`, `AGENT_BROWSER_HEADED=0`,
  `--headless=new`, `--ozone-platform=headless`, `--disable-dev-shm-usage`,
  and `--disable-cache`; UA:
  `Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/150.0.0.0 Safari/537.36`.
  No headed window, desktop input, or CDP attach was used.
- Plural branch rendered `Os seguintes ex-cidadãos são classificados como
  Arqui-Conservadores:` and singular branch rendered `O seguinte ex-cidadão é
  classificado como Arqui-Conservador:`. Neither DOM buffer contained the raw
  English heading. Both branches were captured at 1280×577, 480×320, and
  320×240; every capture measured 25 rows, `maxRow=80`, zero over-wide rows,
  document width equal to viewport, and an empty `#lcs-playtest-errors`
  channel. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt377-20260813/01-plural-1280x577.json`
  through `06-singular-320x240.json`.
- PT-377 is closed as independently verified; no new translation, layout, or
  runtime issue appeared on either agreement branch.

## 2026-08-13 — high-score ending-width probe (PT-378)

- Source inspection of `lib/title_screen/high_scores.dart:218-220` found that
  each localized game-over ending is passed to unbounded `addstr` after the
  `Ending` switch. The longest Portuguese variants were measured at September
  2026: medical-debt `O Esquadrão do Crime Liberal foi à falência por contas
  médicas em Setembro de 2026.` (83 cells) and permanent hiding `O Esquadrão
  do Crime Liberal ficou permanentemente escondido em Setembro de 2026.` (81
  cells), both wider than the fixed 80-cell console.
- Added a focused disposable-storage regression at
  `test/title_screen/high_scores_layout_test.dart`. It seeds a September 2026
  `Ending.medicalSiege` score, runs `viewHighScores`, and expects the visible
  ending row to equal the width-fitted Portuguese sentence. The pre-fix run
  failed as expected: actual row ended `... Setembro de 20`, while the
  expected fitted row ended `... Setembro de 2…`.
- The production renderer now calls `mvaddstrFitted` with `console.width` for
  each translated ending row. The focused regression is green after the fix,
  and the shared ellipsis keeps the 83-cell medical ending within 80 cells.
- Commands: `flutter analyze lib/title_screen/high_scores.dart
  test/title_screen/high_scores_layout_test.dart` and
  `flutter test test/title_screen/high_scores_layout_test.dart`.
  PT-378 is **Fixed-pending-verify** until an independent replay covers the
  other ending variants. The ten pre-existing untracked
  `translation_workspace` files were preserved.

## 2026-08-13 — focused wheelchair-profile translation probe (PT-379)

- Source tracing found two player-visible mobility branches in
  `lib/common_display/print_creature_info.dart`: compact transport uses
  `LcsI18n.tr("Wheelchair")` at lines 187–190, and the full profile uses the
  same missing standalone key at lines 901–907 before writing `Carro:`.
- Added the standalone `Wheelchair` key to the canonical English and
  Portuguese shards (`app_en_US_part02.arb` and `app_pt_BR_part02.arb`), with
  `Cadeira de rodas` as the Portuguese value. Both existing profile branches
  now resolve the shared key.
- Added permanent regression
  `test/basemode/pt_br_wheelchair_profile_test.dart`. It initializes `pt_BR`,
  makes both humanoid legs `cleanOff`, sets `hasWheelchair = true`, renders
  `printCreatureInfo` and `printFullCreatureStats`, and asserts
  `Transporte: Cadeira de rodas` and `Carro: Cadeira de rodas` with no raw
  English `Wheelchair` label.
- Focused test command: `flutter test
  test/basemode/pt_br_wheelchair_profile_test.dart`. PT-379 is
  **Fixed-pending-verify** until an independent replay confirms the live
  profile screen. The ten pre-existing untracked `translation_workspace`
  files remain untouched.
-
## 2026-08-13 — ten-strategy strict-headless Portuguese campaign replay

Independent victory-only follow-up `stock-victory-independent-3-20260813` used
the strict headless wrapper on port 9173 with the default Times climate, Clear
Blue Skies CCS,
and team-first initiative. The route selected ordinary founder answers,
assigned Liberal Guardian writing, and waited through the Portuguese newspaper
cycle to 25 January 2023. It remained stock-cheatless (`debugAssisted: false`)
with no runtime/source fixture changes, and no victory/game-over terminal was
reached. Captures and source hashes are under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-victory-independent-3/`.

- Ran ten fresh, isolated strategy manifests under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/`.
  Each manifest records its own local Flutter web-server port/session, commit
  and debug-flag hashes, exact route evidence, and a `summary.json`. All
  captures used only `agent-browser-headless.sh` with
  `AGENT_BROWSER_HEADED=0`, `--headless=new`, and
  `--ozone-platform=headless`; every terminal/route capture measured 25 rows,
  `maxRow=80`, and an empty bridge-error channel. No headed browser, desktop
  input, CDP attach, production edit, or debug fixture was used.
- Stock/cheatless victory attempts (3): `stock-victory-1` stalled in ordinary
  waiting on 7 March 2023; `stock-victory-2` stalled in an active
  community-service route on 23 February 2023; and the third fresh attempt is
  recorded at `stock-victory-3/stock-victory-3b` and stalled on 20 February
  2023. No victory terminal was reached, so none is relabeled as a victory.
- Stock/cheatless game-over attempts (3): `stock-gameover-1` stopped at the
  travel-map liberal-threshold gate; `stock-gameover-2` reached the Portuguese
  high-score terminal `A Elite Liberal` (`...caçado em Novembro de 2033.`);
  `stock-gameover-3` reached the same localized terminal with a distinct route
  (`...caçado em Dezembro de 2034.`).
- Varied routes (4): `var-commerce-equipment-pt` covered equipment, Seattle
  commerce, and Loja de Departamentos de Read; `var-politics-media` covered
  media overview and agenda; `var-police-siege` covered Centro de Seattle and
  Delegacia de Polícia (the siege action was correctly blocked by the liberal
  threshold); `var-crafting-recruitment` covered clothing pages 1–5 and
  recruitment. None reached victory/game-over, and none produced a new PT
  translation/layout/runtime ticket.
- Totals: 10 completed strategy manifests; 0 victory terminals; 2 stock
  game-over terminals; 8 routes stalled or ended at a non-terminal gameplay
  screen; 0 new findings; 0 source/debug cleanup actions. Existing
  user-untracked `translation_workspace` files were preserved.

## 2026-08-13 — independent strict-headless verification of PT-378/PT-379

- This independent verifier used only
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agent-browser-headless.sh`
  with session `verifier-pt378-379-20260813`, Flutter web-server port 9137,
  `AGENT_BROWSER_HEADED=0`, and the wrapper's headless Chromium arguments. No
  headed browser, CDP attach, desktop input, or production/debug fixture edit
  was used. The route stayed at the opt-in `?playtest=1` DOM bridge.
- PT-378 live high-score evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt378-379-20260813/pt378-highscores.json`.
  An isolated browser local-storage score fixture seeded both `Ending.medicalSiege`
  and `Ending.hiding` for September 2026. The live Portuguese rows rendered as
  `O Esquadrão do Crime Liberal foi à falência por contas médicas em Setembro de 2…`
  and `O Esquadrão do Crime Liberal ficou permanentemente escondido em Setembro de 202…`.
  Both rows measured exactly 80 cells, no raw English ending appeared, and the
  bridge error channel was empty.
- PT-379 live profile evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt378-379-20260813/pt379-compact-profile.json`
  and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt378-379-20260813/pt379-full-profile.json`.
  An isolated IndexedDB save fixture made a Liberal with both legs missing and
  `hasWheelchair = true`; the route reached the live Portuguese base, compact
  activity profile, and full profile. The compact row showed
  `Transporte: Cadeira de rodas`; the full row showed `Carro: Cadeira de rodas`.
  Both captures measured 80-cell rows, contained no raw `Wheelchair`, and had an
  empty bridge error channel.
- PT-378 and PT-379 are fixed and independently verified. The ten pre-existing
  untracked `translation_workspace` files remain untouched.

## 2026-08-13 — strict stock-cheatless White House recruitment route

- Fresh route `stock-victory-researched-20260813` used only the strict
  headless wrapper on port 9184, with stock game settings and
  `debugAssisted: false`. It selected the default Times climate, Clear Blue
  Skies CCS, team initiative, and ordinary founder answers (including Sports
  Car and manifesto). No source/runtime fixture, save fixture, or debug flag
  was used.
- The route first hit the legitimate `$100` travel-funds blocker, then assigned
  Anne Rexford to solicit donations until `$643`. Captures show the White House
  payment (`339-Enter.json`), arrival (`340-Enter.json`), no alarm on entry
  (`341-f.json`), and the President present in the Oval Office
  (`440-x.json`).
- Talk → politics against President Tatters succeeded: he agreed to come by
  later that night (`447-Enter.json`). The post-talk security response raised
  the site to `CONSERVATIVES ALARMED`; the final capture has two Secret Service
  opponents (`449-Enter.json`). The route stopped before safe exit and the
  next-day sleeper-agent meeting, so it reached neither victory nor game-over.
- Manifest, route narrative, source hashes, and captures are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-victory-researched-20260813/`.
  This is legitimate partial progress, not evidence of a cheatless victory;
  no new ticket was created.

## 2026-08-13 — fresh stock-cheatless disband-and-wait route

- Fresh isolated session `fresh-stock-stealth-pt-20260813` used the strict
  headless wrapper on Flutter port 9190 at `?playtest=1`. It selected Portuguese
  before starting a stock game, created an intersex founder through the fate
  origin branch, kept the generated New York steelworks base, assigned Liberal
  graffiti activism, and then chose `D - Dissolver e esperar` from the Liberal
  Agenda. No save fixture, debug flag, source edit, headed browser, or CDP
  attach was used (`debugAssisted: false`).
- The route advanced the political summary through September 2035 and reached
  a genuine Portuguese disband/hiding high-score terminal:
  `A Elite Liberal` / `O Esquadrão do Crime Liberal foi caçado em Setembro de
  2035.` This is a game-over/disband ending, not campaign `Ending.victory`.
- Evidence, route narrative, and source hashes are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/fresh-stock-stealth-pt-20260813/`.
  Every sampled capture measured 25 rows with `maxRow: 80` and an empty bridge
  error channel.
- The route confirmed PT-380: disbanding monthly summaries expose raw English
  executive alignment labels (`moderate`, `Conservative`) inside otherwise
  Portuguese rows. The issue was filed Open in `findings-doc/findings.md` with
  captures `62-agenda.json`, `120-month.json`, and `terminal.json`.

## 2026-08-13 — second fresh strict stock route with Black Formalwear

- A separate isolated headless session `stock-victory-blackformal-20260813`
  (port 9185) used stock flags and `debugAssisted: false`. It selected the
  default Times climate, Bad Blood CCS, team initiative, Q6 `E` Black
  Formalwear, Sports Car, and manifesto. The founder visibly started in the
  resulting Black Dress; no equipment or save fixture was injected.
- Ordinary donations raised funds to `$241` by February 10, after which the
  route legitimately traveled to Washington DC and entered White House Level
  2. The final map capture is
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-victory-blackformal-20260813/final-map.json`.
- This route stalled on the stock site map before a victory/game-over
  terminal. It adds no evidence of a natural victory and no new ticket.

## 2026-08-13 — code-only under-attack briefing probe (false positive)

- Reviewed `lib/daily/siege.dart:1960-1978`, where `escapeOrEngage()` builds
  the Portuguese under-attack briefing. Dart's adjacent string literals at
  lines 1962-1973 form one 815-character key, not separate translation
  lookups. That exact key is present in both canonical catalogs; the
  `pt_BR` value is the complete Portuguese briefing (841 characters).
- The first sentence and optional camera/trap sentences are also exact
  catalog keys. The final `addparagraph(..., noTranslate: true)` receives the
  already translated text, so this path does not expose the raw English
  fragments suspected during the initial static scan.
- No ticket was filed: the suspected fragment-missing issue is a false
  positive. Existing under-attack layout coverage remains in PT-215 and
  `test/daily/siege_translation_test.dart`.

## 2026-08-13 — code-only homeless-camp siege layout probe (PT-381)

- Static source review found a branch not covered by the generic under-attack
  regression: `fightHomelessCampSiege()` writes its translated intro and
  cover-fire lines directly at fixed columns in `lib/daily/siege.dart:1813-1825`.
- Current `pt_BR` values measure 65 cells at column 16 for
  `Você está prestes a montar uma defesa do acampamento de sem-teto.` (ending
  at cell 80) and 75 cells at column 11 for
  `fornecerão fogo de cobertura e ficarão na retaguarda até serem necessários.`
  (ending at cell 85). The latter silently clips six cells; the former writes
  one cell beyond the 80-column frame. `sallyForth()`'s corresponding rows fit.
- Filed PT-381 Open for a fixer and independent strict-headless verifier. No
  production source or catalog was changed by this probe.

## 2026-08-13 — independent PT-380 disbanding replay

- A fresh isolated strict-headless session `verify-pt380-20260813` used the
  repository wrapper against a rebuilt Flutter web-server on port 9240. It
  selected Portuguese, created a stock founder, opened `L - O status da agenda
  Liberal`, chose `D - Dissolver e esperar`, entered the generated
  confirmation phrase through the DOM bridge, and advanced the monthly summary
  through June 2026. No save fixture, debug flag, headed browser, CDP attach,
  or production source edit was used.
- The live executive row rendered the generated moderate president as
  `Presidente: Judas Piercey, moderado, 1º Mandato` (captures 56, 62, and 75).
  The route also rendered `Arqui-Conservador` before the alignment change. No
  executive row contained exact raw `moderate` or `Conservative` labels.
- All captures measured 25 rows with `maxRow: 80`, no over-wide rows, and an
  empty `#lcs-playtest-errors` channel under `HeadlessChrome/150.0.0.0`.
  Evidence and replay details are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt380-20260813/`.
- PT-380 is fixed and independently verified; no new translation or layout
  issue was found in this replay.

## 2026-08-13 — PT-381 homeless-camp briefing fixer pass

- Replaced the homeless-camp siege briefing's unbounded fixed-row writes with
  `renderHomelessCampSiegeBriefing()`, which sends each translated sentence
  through `addparagraph()` bounded by the 80-column console and advances later
  sections after any wrapped rows. The row-23 prompt now uses the remaining
  width through `mvaddstrcFitted()`.
- Added a focused Portuguese regression in
  `test/daily/siege_translation_test.dart`; it checks that every translated
  sentence remains visible, the prompt is intact, and all rows stay within the
  console width.
- `dart format`, `git diff --check`, and the focused siege/layout command in
  the PT-381 finding passed. Status is **fixed-pending-verify** until an
  independent strict-headless siege replay confirms the live screen.

## 2026-08-13 — independent PT-381 homeless-camp briefing replay

- Rebuilt the current worktree and served it on Flutter web-server port 9251.
  Fresh isolated session `verify-pt381-20260813` used only
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agent-browser-headless.sh`
  with `?playtest=1` and the `#lcs-playtest-buffer` DOM bridge. The browser
  user agent was `HeadlessChrome/150.0.0.0`; no headed browser, CDP attach,
  source edit, or debug flag was used.
- To make the rare homeless-camp branch deterministic, a disposable save was
  derived from checked-in `test/saves/moe_1_5.json` and injected only into the
  session's IndexedDB save store. It set Site21 (`homelessEncampment`) to a
  police siege, selected it as the active safehouse, and left the repository
  and debug flags unchanged. The fixture and generator are retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt381-20260813/` and
  are not staged.
- After selecting Portuguese, the live base screen showed `F - Lutar/Fugir`.
  Pressing `F` opened the patched homeless-camp briefing. Capture
  `12-briefing.json` contains the wrapped intro, all body text, and the full
  Portuguese prompt `Pressione qualquer tecla para Confrontar os Agressores
  Conservadores`; no raw English source sentence appears.
- `13-briefing-metrics.json` measured 25 rows with `maxRow: 80`, no over-wide
  rows, and an empty `#lcs-playtest-errors` channel. The Portuguese intro and
  cover-fire lines were present across their wrapped rows, and the raw English
  intro/cover-fire strings were absent. PT-381 is fixed and independently
  verified.

## 2026-08-13 — code-only high-score dynamic-count probe (PT-382)

- Static review of `lib/title_screen/high_scores.dart` found that per-score
  and universal flag counters use unbounded `mvaddstr` at column 60. Merged
  `pt_BR` catalog values render as `Bandeiras compr.: 123` and
  `Bandeiras queim.: 123` (21 cells), exceeding the 20-cell right-hand score
  column and dropping the last digit when `Console.addchar()` reaches x=80.
- PT-047's regression proves the compact labels for a two-digit value (`12`),
  but does not cover realistic three-digit totals. PT-382 was filed Open; no
  production source or catalog was changed by this probe.

## 2026-08-13 — PT-382 high-score flag-count fixer pass

- Added a shared `_printHighScoreFlagCount()` renderer in
  `lib/title_screen/high_scores.dart`. It translates each flag-count template,
  fits the label to the 20-cell right-hand statistics column, and preserves the
  complete numeric value for both per-score and universal rows.
- Added a focused regression in `test/title_screen/high_scores_layout_test.dart`
  with 123 bought and burned flags in both views; all four Portuguese values
  remain visible through column 79.
- `dart format`, `git diff --check`, and the focused high-score/layout command
  passed. The independent replay below confirms the live seeded high-score
  screen.

## 2026-08-13 — independent PT-382 high-score replay

- Rebuilt the current worktree on Flutter web-server port `9253` and used the
  fresh strict-headless session `verify-pt382-fresh-20260813`, with no headed
  browser, CDP attach, source edit, or debug flag. The route selected
  Portuguese through the normal title-screen language menu.
- A disposable SharedPreferences web-storage seed supplied one game-over score
  with `statBuys: 123`/`statBurns: 123` and universal bought/burned totals of
  `123`. This exercised the live renderer without changing source or checked-in
  data.
- Captures `07-title-pt.json` and `08-highscore-pt.json` are retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt382-20260813/`.
  The four flag rows visibly end in `Bandeiras compr. 123` and
  `Bandeiras queim. 123`; `09-highscore-pt-metrics.json` measured 25 rows,
  `maxRow: 80`, no over-wide rows, empty bridge errors, and no raw English
  high-score strings. PT-382 is independently verified.

## 2026-08-13 — fresh stock sleeper/cabinet route

- A new strict headless Portuguese session `stock-sleeper-cabinet-20260813` (Flutter web-server port 9260) tried a distinct long-campaign strategy: stock `Os tempos estão mudando`, `Céu Azul e Límpido`, team initiative, repeated recruitment of student candidates, and waiting for eventual sleeper/cabinet progression.
- The route remained blocked in early January 2023. The founder stayed at US$7, candidate meetings repeatedly stalled before the `C - ... joins the LCS` threshold, and no executive was recruited or sleeperized. It did not reach `Ending.victory` or any game-over terminal.
- Evidence and route narrative are under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-sleeper-cabinet-20260813/`. The 156 captured screens stayed at `maxRow: 80`, with empty playtest errors and no new translation/layout issue.

## 2026-08-13 — code-only newspaper masthead probe (PT-383)

- A focused Flutter console reproduction initialized `pt_BR`, rendered
  `conservativeStarTop()` and `thePostTop()`, and captured the actual 80-cell
  rows. The right-column Conservative Star string `NÓS CONHECEMOS NOSSOS`
  stops at `NÓS CONHECEM`; The Post string `NOSSO PRÊMIO PULITZER` stops at
  `NOSSO PRÊMIO PULITZ` because `layout.dart` writes at fixed columns 68 and
  61 without fitting. This is a confirmed clipping defect; PT-383 is
  fixed and independently verified after the renderer fix.
- Evidence is retained at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-newspaper-mastheads-20260813/pt383-static-test.txt`.

## 2026-08-13 — PT-383 independent browser verification

- A fresh disposable copy was rebuilt on Flutter web-server port `9293` and
  exercised through a new wrapper-only `HeadlessChrome/150.0.0.0` session.
  Conservative Star row 2 ends `NÓS CONHECE…`; The Post row 2 ends
  `NOSSO PRÊMIO PULIT…` at column 79.
- Both captures are 25 rows by 80 columns with no over-wide rows, no bridge or
  browser errors, and no raw English masthead strings. The focused newspaper
  suite passed all 29 tests. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt383-20260813/`.
- PT-383 is fixed and independently verified.

## 2026-08-13 — fresh stock media/persuasion route

- Session `stock-media-persuasion-20260813` used a fresh Portuguese stock game
  through the strict headless wrapper only. The distinct strategy covered
  slogan editing, media overview, Manhattan AM radio, newspaper reading,
  donations, recruitment profession paging, candidate lists, sleeper checks,
  and several waits.
- It returned to the Portuguese title screen on 8 January 2023 without
  reaching `Ending.victory` or a game-over terminal. `summary.json` records
  `victory:false`, `gameOver:false`, `cheats:false`, and
  `debugAssisted:false`; 113 captures measured `maxRow:80`, no over-wide rows,
  and zero bridge errors. No new translation/layout issue was confirmed.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-media-persuasion-20260813/`.

## 2026-08-13 — fresh stock police-territory route

- Session `stock-police-territory-20260813` used a fresh Portuguese stock game
  on Flutter web-server port `9273` through the strict headless wrapper and
  `?playtest=1` DOM bridge only. No debug flags, save fixture, headed browser,
  CDP attach, or production edit was used.
- Strategy: recruited student candidates (including a trans candidate), played
  multiple politics conversations and follow-up meetings, visited the Seattle
  police station via the territory map, then ran Liberal Disobedience and illegal
  weed-brownie activity from the homeless-camp base.
- The route reached 31 January 2023 and stalled in base mode before any police
  siege or campaign terminal. It did not reach `Ending.victory` or game-over;
  `summary.json` records `victory:false`, `gameOver:false`, `cheats:false`, and
  `debugAssisted:false`.
- 226 retained captures measured `maxRow:80`, zero over-wide rows, and empty
  `#lcs-playtest-errors`; no new translation/layout ticket was confirmed.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-police-territory-20260813/`.

## 2026-08-13 — stock sleeper/executive bootstrap blocker

- Fresh session `stock-victory-sleeper-20260813` was intended to exercise a strict stock-cheatless Portuguese sleeper/executive campaign. No debug flags, save fixture, source edit, headed browser, or CDP attach was used.
- The new Flutter web-server on port 9290 never emitted `main.dart.js` (HTTP 404) after roughly 30 minutes of frontend compilation, so `#lcs-playtest-buffer` never mounted. Only two empty bootstrap captures exist; no gameplay, terminal, or issue evidence was obtained.
- Preserve as a harness blocker rather than victory/game-over evidence. Summary and route: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-victory-sleeper-20260813/`.

## 2026-08-13 — stock funds-first route

- Fresh strict-cheatless Portuguese session stock-victory-funds-20260813 used
  Flutter web-server port 9295 and the repository headless wrapper only; no
  debug flags, save fixtures, headed browser, CDP attach, or production edits
  were used.
- Strategy began with a randomly generated five-person founder gang, then
  opened task assignment and selected legal fundraising. The route exercised
  Fazer e Vender Arte, Solicitar Doações, and the skill/task pickers, but
  remained at the first base assignment on 1 January 2023 with US$7 before a
  daily activity could produce money. It reached no victory or game-over
  terminal; summary.json records the honest blocker.
- The 46 retained DOM captures stayed at 25 rows and maxRow 80, with zero
  over-wide rows and an empty playtest error channel. No new translation or
  layout issue was confirmed. Evidence is under
  /home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-victory-funds-20260813/.

## 2026-08-13 — fresh stock liberalization/recruitment route

- Session `stock-victory-liberalization-20260813` used a fresh Portuguese
  stock-cheatless game on Flutter web-server port `9281`, through the strict
  headless wrapper and `?playtest=1` DOM bridge only. No debug flag, save
  fixture, headed browser, CDP attach, or production source edit was used.
- The strategy selected a persuasion-oriented founder, repeatedly recruited
  university and homeless-camp candidates, discussed liberal politics
  (including abolition), and waited through ordinary base progression. It
  reached January 4, 2023 recruitment meetings with candidates interested but
  not yet joined; no political office, sleeper cabinet, siege, victory, or
  game-over terminal was reached.
- The 119 retained captures report `maxRow:80`, no over-wide rows, and empty
  `#lcs-playtest-errors`; no new translation/layout issue was confirmed.
  Evidence and the honest blocked summary are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-victory-liberalization-20260813/`.

## 2026-08-13 — fresh stock CCS/politics route

- Session `stock-ccs-politics-20260813` used a fresh Portuguese stock-cheatless
  campaign on Flutter web-server port `9302`, through the strict headless
  wrapper and `?playtest=1` DOM bridge only. It selected `Céu Azul e Límpido`
  (Clear Blue Skies) and team initiative; no debug flags, save fixture, headed
  browser, CDP attach, or production edit was used.
- The founder wrote Liberal Guardian articles, waited to 9 January 2023,
  reviewed the translated media overview, read the AM-radio headline/article,
  planned and reached the AM-radio site map, and opened direct-action help.
  The bounded route stopped at that normal site-mode screen; it reached neither
  `Ending.victory` nor a game-over terminal.
- 53 retained DOM captures stayed at `maxRow:80`, with zero over-wide rows and
  an empty `#lcs-playtest-errors` channel. No new translation/layout issue was
  confirmed. Evidence and route details are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/stock-ccs-politics-20260813/`.

## 2026-08-14 — PT-048/PT-148 residual re-audit

- A code-only prober rechecked the police arrest/subdue guard, canonical
  Portuguese terminal wording, localized police-role interpolation, focused
  tests, and the prior deterministic strict-headless replay. No unverified
  translation or layout defect remains; random police-alarm seeds are optional
  breadth coverage only.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-police-residual-20260814/probe-report.md`.

## 2026-08-14 — fresh strict stock Portuguese president/cabinet route

- Session `stock-victory-president-20260814` used Flutter web-server port
  `9305` and the strict headless wrapper with the `?playtest=1` DOM bridge.
  No debug flags, save fixture, headed browser, CDP attach, or production edit
  was used.
- The valid fresh route chose Portuguese, Times climate, Clear Blue Skies,
  team initiative, a high-charisma/persuasion founder, ordinary legal
  donations, and ordinary travel from New York City to Washington, DC →
  National Mall → White House. After the travel-arrival continuation it
  reached `DC — Casa Branca, Nível 2`; evidence is
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-president-20260814/85-arrival-continue.json`.
- The route stopped before the Oval Office/president encounter. It contains no
  `Ending.victory` or game-over terminal. The honest summary is
  `victory:false`, `gameOver:false`, `cheats:false`, and `debugAssisted:false`;
  this is not victory evidence.
- 141 retained DOM captures report `maxRow:80`, zero over-wide rows, and an
  empty `#lcs-playtest-errors` channel. No new translation/layout issue was
  confirmed and no ticket was filed. Route details are in
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-president-20260814/route.md`.

## 2026-08-14 — fresh strict stock Portuguese Oval Office follow-up

- Session `stock-victory-oval-20260814-r2` used the strict headless wrapper on
  Flutter web-server port `9305`, with an isolated `?playtest=1` DOM-bridge
  session. No debug flags, save fixtures, headed browser, CDP attach, or
  source edits were used.
- This distinct high-charisma route funded ordinary donation solicitation,
  explored Seattle's used-car route, and exercised normal car theft. Two
  Sportscar attempts triggered police pursuit and escape; a later Bug attempt
  remained in the ordinary hotwire loop after repeated failures. Because no
  vehicle was secured, travel to Washington and the White House/Oval Office
  was unavailable.
- The route stopped honestly with `victory:false`, `gameOver:false`,
  `cheats:false`, and `debugAssisted:false`; no translation/layout issue was
  confirmed. Evidence and the capture audit are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-oval-20260814/`.

## 2026-08-14 — fresh strict stock Portuguese car-to-White-House route

- Session `stock-victory-car-20260814` used the strict headless wrapper on
  Flutter web-server port `9306`, with Portuguese selected through the normal
  menu. The questionnaire selected sports-car transport, and no debug flags,
  save fixtures, source edits, headed browser, or CDP attach were used.
- Ordinary donations funded travel from Seattle through Washington, DC and the
  National Mall to the White House. The route reached the Level 2 map, talked
  with guards, explored, and attempted to proceed toward the executive area.
- Sneaking past the Secret Service triggered normal combat before any Oval
  Office/president interaction. The honest summary is
  `victory:false`, `gameOver:false`, `cheats:false`, and `debugAssisted:false`;
  no translation/layout issue was confirmed. Evidence and metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-car-20260814/`.

## 2026-08-14 — fresh strict stock Portuguese politics/media route

- Session `stock-victory-politics-20260814` used Flutter web-server port
  `9307` and the strict headless wrapper with the `?playtest=1` DOM bridge.
  No debug flags, save fixtures, headed browser, CDP attach, or production
  source edits were used.
- The politics/media strategy selected a high-charisma/persuasion founder,
  assigned `Escrever Artigos do Guardião Liberal`, reviewed media, and waited
  through the January rollover. It stalled at the generated Portuguese
  newspaper screen on 26 January 2023 when repeated `W` inputs did not advance
  the view; it did not reach `Ending.victory` or game-over.
- 43 captures stayed at `maxRow:80` with no over-wide rows or bridge errors.
  The `JAMMED UP` story exposed PT-385: `Uma um monte de pessoas negras` and
  `Embora os pessoas negras`, a composed Portuguese article with duplicated
  and mismatched agreement. Ticket details and evidence are in
  `findings-doc/findings.md`; the live buffer is
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-politics-20260814/39-wait-12.json`.

## 2026-08-14 — PT-385 fix independently verified

- The Portuguese catalog now supplies article-aware noun fragments for the
  neutral and arch-conservative `JAMMED UP` branches, while the Portuguese
  template no longer duplicates fixed articles.
- An independent deterministic harness rendered both branches at 25×80,
  with the expected `Uma grande marcha...`/`Embora os manifestantes...` and
  `Um monte de pessoas negras...`/`Embora as pessoas negras...` phrases and
  no `Uma um monte` or `os pessoas` corruption. The focused newspaper suite
  (30 tests) and translation validation passed.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt385-20260814/`.

## 2026-08-14 — fresh strict stock Portuguese combat game-over route

- Session `stock-gameover-combat-20260814` used the strict headless wrapper on
  Flutter web-server port `9309` with the normal `?playtest=1` DOM bridge. It
  selected Portuguese, the active strong CCS setting `Nós não iniciamos o
  fogo`, and alternating combat initiative `Bem-vindo à Selva`; no debug flag,
  save fixture, headed browser, CDP attach, or production edit was used.
- The fate-selected founder received a Daishō, chose Liberal disobedience,
  entered the Seattle Desert Eagle Bar e Grill CCS hideout, and started the
  normal bouncer fight. The encounter spawned stock armed opponents and ended
  in the Portuguese combat terminal: `A Elite Liberal` / `O Esquadrão do Crime
  Liberal foi morto em combate em Janeiro de 2023.` This is a genuine stock
  game-over, not `Ending.victory`.
- The honest summary is `victory:false`, `gameOver:true`, `cheats:false`, and
  `debugAssisted:false`. The route has 129 non-empty 25×80 captures, zero
  over-wide rows, and no bridge errors; no new translation/layout issue was
  confirmed. Evidence, metrics, and route notes are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-gameover-combat-20260814/`.

## 2026-08-14 — fresh strict stock Portuguese cabinet/legislative route

- Session `stock-victory-cabinet-final-20260814` used Flutter web-server port
  `9308` through the strict headless wrapper and `?playtest=1` DOM bridge. The
  earlier English/aborted attempt was quarantined and excluded. No debug flags,
  save fixtures, headed browser, CDP attach, or production source edits were
  used.
- The distinct strategy built an intelligence/law/persuasion founder, assigned
  the questionnaire-created attorney sleeper Pete Menéndez to
  `Comunicação e Advocacia → Defender o Liberalismo`, then funded the squad
  with ordinary donation solicitation. At 59.59 Persuasão and US$49, the
  founder pursued recurring university recruitment meetings and politics
  conversations, including trans and female candidates.
- The route stopped at a normal 20 January 2023 university-candidate list
  before any candidate reached `C - ... entra para o LCS`; no active recruit,
  cabinet, political office, `Ending.victory`, or game-over terminal occurred.
  All 129 captures stayed at 25×80 (`maxRow:80`) with no over-wide rows or
  bridge errors, and no new translation/layout issue was confirmed.
- Honest outcome: blocked, stock-cheatless, non-victory route. Evidence,
  summary, and metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-cabinet-20260814/`.

## 2026-08-14 — fresh strict stock Portuguese coalition/media route

- Session `stock-victory-coalition-20260814` used Flutter web-server port
  `9310` through the strict headless wrapper and normal `?playtest=1` DOM
  bridge. It selected Portuguese and followed a charisma/persuasion,
  questionnaire-lawyer, manifesto, and Liberal Guardian newspaper strategy;
  no debug flags, save fixtures, headed browser, CDP attach, or production
  edits were used.
- The founder was assigned to `Escrever Artigos do Guardião Liberal`. The
  route reached a generated newspaper on 20 January 2023, then returned to
  the base screen after bounded `Enter`, `Space`, `W`, and `A` inputs. It did
  not reach a recruit, political office, `Ending.victory`, or game-over
  terminal.
- All 49 captures stayed at 25×80 (`maxRow:80`) with no over-wide rows or
  bridge errors. The inspected newspaper had no new translation/layout issue.
  Honest outcome: stalled, stock-cheatless, non-victory route. Evidence and
  metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-coalition-20260814/`.

## 2026-08-14 — fresh strict stock Portuguese education/sleeper route

- Session `stock-victory-education-20260814` used the strict headless wrapper
  on Flutter web-server port `9311` with the normal `?playtest=1` DOM bridge.
  It selected Portuguese and built an intelligence/science/education founder;
  no debug flags, save fixtures, headed browser, CDP attach, or production
  source edits were used.
- The founder practiced Science, raised ordinary funds through legal donation
  solicitation, and recruited university students through politics. A stock
  student relationship produced the questionnaire lawyer sleeper Mick Weber,
  who was assigned `Comunicação e Advocacia → Defender o Liberalismo`.
- The route ended honestly at the normal base screen on 18 January 2023 before
  an active recruit, political office, `Ending.victory`, or game-over terminal.
  Its generated Portuguese newspaper, recruitment conversations, and sleeper
  menus remained width-safe; no new translation/layout issue was confirmed.
- 110 non-empty captures stayed at 25×80 (`maxRow:80`) with zero over-wide rows
  and no bridge errors. Keep this as blocked stock-cheatless education breadth,
  not campaign-victory evidence. Artifacts:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-education-20260814/`.

## 2026-08-14 — fresh strict stock Portuguese mass-recruitment/activism route

- Session `stock-victory-recruitment-20260814-r3` used Flutter web-server port
  `9314`, the strict headless wrapper, and the normal `?playtest=1` DOM bridge.
  It selected Portuguese, built a high-charisma founder, repeatedly recruited
  university students through politics conversations, solicited ordinary legal
  donations, and ran Liberal Guardian activism/articles. No debug flag, save
  fixture, headed browser, CDP attach, or production edit was used.
- Persuasão rose from 0.00 to 25.25 during recruitment and the treasury reached
  US$22. The founder was then injured and spent three months at Centro Médico UW;
  the normal discharge showed a US$2,380 bill, and exiting without payment left
  no active squad on 19 February 2023. The route never reached a recruit in the
  active roster, political office, `Ending.victory`, or game-over terminal.
- 269 valid captures stayed at 25×80 (`maxRow:80`) with zero over-wide rows and
  no bridge errors. No new translation/layout issue was confirmed. Honest
  outcome: stalled stock-cheatless recruitment breadth, not victory evidence.
  Evidence and metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-recruitment-20260814/`.

## 2026-08-14 — fresh strict stock Portuguese law/courthouse route (transient asset fetch)

- Session `stock-victory-law-20260814` used the strict headless wrapper on
  Flutter web-server port `9313` with the normal `?playtest=1` DOM bridge. It
  selected Portuguese, built a high-intelligence/law founder, naturally
  recruited the questionnaire lawyer sleeper Karla Hayes, activated her into
  the active squad, and assigned both liberals to ordinary legal donations.
  No debug flags, save fixtures, headed browser, CDP attach, or production
  source edits were used.
- The route advanced through the January newspaper and legislative agenda. On
  the next monthly newspaper event, the stock Portuguese failure screen showed
  `Unable to load asset: "assets/art/newscast.cmv". The asset does not exist or
  has...`, with the Flutter stack rooted at `AssetBundle.load` from
  `lib/newspaper/television.dart`.
- An independent fresh-server probe did not reproduce a source/package defect:
  the tracked 161,068-byte asset is declared by `pubspec.yaml`, appears in the
  generated `AssetManifest.json`, is served with HTTP 200 and matching SHA-256
  from a clean Flutter web-server, is fetched successfully by headless Chrome,
  and loads through `rootBundle.load` in a Flutter test. Treat the single
  capture as a transient dev-server/browser asset-fetch failure, not a
  production ticket. Probe report:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-pt386-asset-20260814/probe-report.md`.
- The honest outcome is blocked, not victory or game-over. 123 captures stayed
  at 25×80 (`maxRow:80`) with zero over-wide rows; the failure evidence is
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-law-20260814/118-wait.json`.
  Route artifacts and metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-law-20260814/`.

## 2026-08-14 — fresh strict stock Portuguese executive route (PT-387)

- Session `stock-campaign-executive-20260814` used the strict headless wrapper
  on Flutter web-server port `9320` with a fresh browser session and the
  normal `?playtest=1` bridge. It selected Portuguese, recruited and activated
  a lawyer and a university student through ordinary conversations, funded
  them with legal donations, and reached a natural sportscar theft/police
  pursuit. No debug flags, save fixtures, headed browser, CDP attach, or
  production edits were used.
- Repeated ordinary disguise/flee choices drove the founder's health below
  zero. The next combat redraw emitted `RELATÓRIO DE FALHA` with `Invalid
  argument: 0` from `_getHealthDisplayForSkill`/`printHealthStat` while
  rendering the party, so the route reached neither victory nor game-over.
- 302 captures remained 25×80 with `maxRow:80`, zero over-wide rows, and no
  bridge errors; the runtime failure is in the visible buffer. Evidence and
  route metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-campaign-executive-20260814/`.

## 2026-08-14 — PT-387 fixed and independently verified

- The display-only clamp in `common_display.dart` preserves negative overkill
  state while rendering dead health as non-negative precision cells. Focused
  regression coverage passed for skills 5/6/7, positive and dead health,
  Portuguese party/profile redraw, and 80-column layout.
- Independent session `verify-pt387-814-r1` replayed the natural sportscar
  theft/police pursuit with no cheats or fixtures. It reached the normal
  Portuguese combat game-over (`105-death-reflect.json`) with 107 valid
  captures, all 25×80, zero over-wide rows, zero bridge errors, zero
  `Invalid argument`, and zero `RELATÓRIO DE FALHA`. PT-387 is closed.
- Verifier artifacts:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt387-20260814/`.

## 2026-08-14 — fresh strict stock Portuguese media/recruitment route (PT-388)

- Session `media-recruit-814-r1` used the strict headless wrapper on Flutter
  web-server port `9320` with a fresh `?playtest=1` DOM-bridge session. It
  selected Portuguese, built a high-intelligence/charisma founder, wrote
  Liberal Guardian articles, recruited and activated Herb Redwine through
  ordinary university-politics meetings, and funded the squad through legal
  donations. No debug flags, save fixtures, headed browser, CDP attach, or
  production edits were used.
- The route reached a natural March Washington, DC newspaper while preparing
  a White House visit. The generated abortion-book story showed the malformed
  Portuguese possessive phrase `dedicou a aposentadoria ela a desencorajar`;
  this is tracked as PT-388. The route then continued toward the White House
  and did not claim victory or game-over.
- Captures stayed at 25×80 with zero over-wide rows and no bridge errors before
  the route continued. Evidence and metrics are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-campaign-media-recruitment-20260814/`.

## 2026-08-14 — PT-388 fixed and independently verified

- The production fix passes `PronounRole.possessive` for the abortion-book
  author, and the deterministic regression covers both author genders plus
  English fallback and 25×80 newspaper rendering.
- Independent fresh strict-headless stock sessions `verify-pt388-814-r1` and
  `verify-pt388-814-r2` reached the actual Clinic Regret article. The feminine
  author rendered `dedicou a aposentadoria dela` and the masculine author
  rendered `dedicou a aposentadoria dele`, never `aposentadoria ela/ele`; the
  Herald suite passed all 31 tests and the gender replay passed.
- Ten evidence captures were 25×80 with zero over-wide rows and zero bridge
  errors. PT-388 is closed. Verifier artifacts:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt388-20260814/`.

## 2026-08-14 — direct-car stock game-over route found PT-389

- Session `stock-gameover-direct-car-814-r1` used a fresh strict-headless
  Flutter web-server on port `9353`, normal `?playtest=1` bridge, and a stock
  Portuguese campaign. The route selected a questionnaire Sportscar theft,
  triggered a police pursuit, chose illegal brownie selling, and fought the
  police unit to the normal combat game-over. No cheats, fixtures, debug flags,
  headed browser, CDP attach, or production edits were used.
- The terminal capture is
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-gameover-direct-car-20260814/208-terminal.json`:
  `O Esquadrão do Crime Liberal foi morto em combate em Janeiro de 2023.`
  This is clean game-over evidence, not campaign victory.
- 209 captures remained exactly 25×80 (`maxRow:80`) with zero over-wide rows,
  bridge errors, `Invalid argument`, or `RELATÓRIO DE FALHA` screens. Route
  artifacts: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-gameover-direct-car-20260814/`.
- Capture `147-brownies-w.json` confirmed PT-389: `A polícia aborda Hiro
  Underhill enquanto selling brownies!`. The arrest template is translated,
  but `lib/daily/activities/fundraising.dart:60` injected raw English
  `selling brownies`. The fixer now routes all five raw fundraising actions
  through the Portuguese catalog; PT-389 is Fixed-pending-verification until
  an independent strict-headless replay passes.

## 2026-08-14 — stock CCS combat game-over route found PT-390–PT-392

- Session `stock-campaign-terminal3-20260814` used fresh strict-headless
  browser sessions against a fresh Flutter web-server on port 9407. It
  selected Português through the normal language menu, enabled the active CCS
  and zipper combat options, waited through an ordinary January newspaper
  cycle, entered the normal `Desert Eagle Bar e Grill (Esconderijo CCS)`, and
  fought the stock encounter to a natural terminal. No fixtures, cheats,
  debug flags, headed browser, CDP attach, or production edits were used.
- Terminal capture:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-campaign-terminal3-20260814/243c-reflect-conservatives.json`:
  `A Elite Liberal` / `O Esquadrão do Crime Liberal foi morto em combate em
  Janeiro de 2023.`. Title-screen return: `244c-highscores-after-terminal.json`.
- The route retained 246 non-empty DOM-bridge captures; every capture measured
  exactly 25 rows with `maxRow: 80`, zero over-wide rows, and an empty bridge
  error channel. Metrics and source configuration are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-campaign-terminal3-20260814/metrics-all.json`
  and `source-config.txt`.
- PT-390 is the hard-coded ad copy `Call for Details` / `Sale` in
  `150c-wait2-01.json` (`lib/newspaper/ads.dart`). PT-391 is the hard-coded
  crime-list conjunction `and` in `176c-wait2-14.json`
  (`lib/newspaper/display_news.dart:493-501`). PT-392 is the hard-coded CCS
  spoof-location names `Research Ethics Commission HQ`, `Labor Union HQ`, and
  `Public Radio Station` in `170c-wait2-11.json`, `176c-wait2-14.json`, and
  `184c-wait2-18.json` (`lib/newspaper/squad_story_text.dart:272-293`). All
  three remain Open for separate prober/fixer/verifier passes.

## 2026-08-14 — PT-392 fixer handoff

- `mapCCSPlace` now sends all nineteen fixed spoof-location labels through
  `LcsI18n.tr`; the dynamic persisted `placename` fallback remains unchanged.
- English fallback entries and natural Portuguese values were added to the
  canonical hash-sharded catalogs, including `Sede da Comissão de Ética em
  Pesquisa`, `Sede do Sindicato`, and `Estação de Rádio Pública`.
- `test/newspaper/squad_story_translation_test.dart` covers every mapped site
  type. Runtime/static catalog tests, the focused regression, and canonical ARB
  validation pass. PT-392 is **Fixed-pending-verification**; no browser replay
  has been run for this fixer handoff.

## 2026-08-14 — PT-393 fixer handoff

- Added canonical English fallbacks and Portuguese translations for the seven
  missing generated CCS cover roles: `Soldier` → `Soldado`, `Transient` →
  `Sem-teto`, `Crackhead` → `Cracudo`, `Telemarketer` → `Teleoperador`,
  `Mailman` → `Carteiro`, `Hairstylist` → `Cabeleireiro`, and `Bartender` →
  `Barman`. Existing role translations were preserved.
- `test/sitemode/ccs_cover_role_translation_test.dart` covers the complete
  fixed-role pool through the runtime localization helper. Focused/runtime/
  static tests and canonical ARB validation pass. PT-393 is
  **Fixed-pending-verification**; no browser replay was run for this fixer.

## 2026-08-14 — PT-394 fixer handoff

- A fresh stock-cheatless CCS combat route exposed two untranslated Portuguese
  messages: `The bouncer assesses your squad.` and the Conservative alarm
  template from `lib/sitemode/stealth.dart:52`.
- Added canonical English fallbacks and Portuguese translations, plus a focused
  runtime regression. PT-394 is **Fixed-pending-verification**; a fresh
  strict-headless replay remains required.

## 2026-08-14 — PT-394 independent verification closure

- Fresh strict-headless session `verify-pt394-root-20260814` replayed the
  Portuguese CCS bouncer and alarm branch without fixtures, cheats, debug
  flags, CDP attachment, or production edits.
- The bouncer rendered `O segurança avalia seu esquadrão.` and the alarm
  rendered Portuguese `observa sua atividade Liberal ... alarme Conservador`.
  Seven valid captures stayed at 25 rows and max width 80, with zero
  over-wide rows, bridge errors, or raw English alarm templates. PT-394 is
  **Closed / Fixed**. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt394-root-20260814/`.

## 2026-08-14 — PT-393 independent verification closure

- Fresh strict-headless session `verify-pt393-fresh-20260814-r4` used the
  normal Portuguese active-CCS route to the Desert Eagle bouncer and combat.
  The roster rendered `Soldado`; the seven fixed English role keys had zero raw
  hits across 21 valid captures.
- Captures measured 25 rows with max width 80, zero over-wide rows, and zero
  bridge errors. No fixtures, cheats, debug flags, CDP attachment, or
  production edits were used. PT-393 is **Closed / Fixed**. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt393-fresh-20260814-r4/`.

## 2026-08-14 — PT-392 independent verification closure

- Fresh strict-headless session `verify-pt392-fresh-20260814` used a stock
  Portuguese campaign with active CCS and no fixtures, cheats, debug flags,
  CDP attach, or production edits.
- Runtime CCS newspaper stories rendered translated spoof locations including
  `Clínica de Aborto`, `Agência de Assistência Social`, `Escritórios do
  Greenpeace`, `Estação de Notícias da Rede`, `Sede da Comissão de Ética em
  Pesquisa`, and `Museu das Ervilhas Rodopiantes`; the raw scan found none of
  the nineteen English map keys.
- 436 valid non-empty captures were 25×80 with zero over-wide rows and zero
  bridge errors. PT-392 is **Closed / Fixed**. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt392-20260814/`.

## 2026-08-14 — PT-389 and PT-390 fresh verification

- Independent strict-headless session `verify-pt389-fresh-20260814-r5` used a
  fresh Portuguese stock game, assigned `Vendendo Brownies`, and reached the
  police branch on 26 January 2023. The live buffer rendered `A polícia aborda
  Danielle Hammond enquanto vendendo brownies!`; no raw `selling brownies`
  warning appeared. The replay recorded 59 width-safe captures with zero
  over-wide rows, bridge errors, invalid-argument errors, or failure reports.
  Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt389-20260814-fresh/r5/`.
- Independent strict-headless session `verify-pt390-20260814-r1` reached a
  Portuguese newspaper page with ads. The fresh capture rendered translated
  labels such as `Mercado de Pulgas de Paris`, `Oferta`, `50% de Desconto`,
  `Cadeiras de Couro Fino`, and `Sedã 4 Portas`; scans across 120 captures found
  no `Call for Details`, `Sale`, or `and Fitness`. All captures stayed 25×80
  with zero over-wide rows or bridge errors. The separate PT-391 `and` leak
  remained visible and was not counted against PT-390.
  Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt390-20260814/`.

## 2026-08-14 — PT-391 independent verification closure

- `display_news.dart` now routes both crime-list conjunction branches through
  `LcsI18n.tr`: the ordinary ` and ` separator and the Oxford `, and ` branch.
- English fallback and Portuguese (` e ` / `, e `) catalog entries are present
  in the canonical hash-sharded catalogs.
- The focused Portuguese crime-list regression and the full
  `test/pt_br_context_translation_test.dart` suite pass; the ARB canonical
  check also passes.
- Independent strict-headless session `verify-pt391-20260814-r2` used a fresh
  stock Portuguese campaign, normal CCS/zipper options, and three ordinary
  daily advances. The four-crime story rendered `... homicídio, violência,
  roubo e arrombamento e invasão.` with no raw English `and` or `, and` in the
  Portuguese-route captures. PT-391 is **Closed / Fixed**.
- `pt391-multicrime.json` recorded 25 rows, maximum width 80, zero over-wide
  rows, and an empty bridge-error channel. Aggregate `metrics-all.json` recorded
  seven non-empty captures, maximum row width 80, zero over-wide captures, zero
  bridge-error captures, and zero raw English conjunction captures. The route
  used no cheats, fixtures, debug flags, CDP attach, or production edits.
- Verifier evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt391-20260814/`.

## 2026-08-14 — fresh stock victory and game-over routes F/C

- `stock-victory-f-20260814` used a distinct Portuguese electoral/legal
  coalition route: legal donations, a Liberal Judge recruit, a journalist
  attempt, fundraising, and the Seattle Forum. It stalled on 27 January 2023
  before any political terminal. The fresh strict-headless run used no cheats,
  debug flags, fixtures, save import, or CDP attachment; 175 captures stayed
  25×80 with zero over-wide rows and zero bridge errors. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-f-20260814/electoral-route/`.
- `stock-gameover-c-20260814` used a deliberately weak one-person Jenny Maddow
  squad against an active CCS, then entered the Death Squad HQ and Desert Eagle
  Bar bouncer encounter. Armed Conservatives appeared, but the route stalled
  before a combat round, losses, or a game-over terminal. It used no cheats,
  debug flags, fixtures, save import, or CDP attachment; 52 captures stayed
  25×80 with zero over-wide rows and zero bridge errors. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-gameover-c-20260814/`.
- Neither route reached `Ending.victory`; no new translation or layout finding
  was confirmed.

## 2026-08-14 — long stock political route G and direct-car route D

- `stock-victory-g-20260814` used a political founder, repeated university
  recruitment and conversion, political follow-ups, Liberal Guardian writing,
  and normal waits with CCS disabled by the stock climate option. It advanced
  through the February Congress agenda and monthly processing to 2 July 2023,
  then stopped at a stable New York base screen without `Ending.victory` or a
  game-over. The strict-headless route had 272 captures (271 non-empty), max
  width 80, zero over-wide captures, and zero bridge errors; all cheat/debug/
  fixture/save/CDP/source-edit flags were false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-g-20260814/`.
- `stock-gameover-d-20260814` used a weak unarmed founder, homeless recruits,
  ordinary car-theft/alarm/hotwire attempts, and an Aluminum Factory visit. It
  stalled on the stock movement map without victory or game-over. Assistance
  flags were false, width stayed at 80 with zero over-wide captures and zero
  bridge errors. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-gameover-d-20260814/`.
- Neither route found a new translation or layout issue. Natural game-over
  evidence remains the earlier combat routes; the only victory evidence remains
  the disposable debug-assisted victory fixture.

## 2026-08-14 — stock sleeper/advocacy route H

- `stock-victory-h-20260814` selected an active-CCS stock climate and built a
  strong legal/media/education founder. It recruited journalists, teachers,
  lawyers, and judges; sleeperized two liberals; assigned Liberal Guardian
  writing and Advocate Liberalism; and advanced through the February newspaper
  cycle to 17 February 2023. No `Ending.victory` or game-over terminal appeared.
- The strict-headless Portuguese evidence retained 262 JSON captures (260
  non-empty), max width 80, zero over-wide rows, and zero bridge errors. All
  assistance flags were false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-h-20260814/`.
- This route found no new translation or layout issue. It reinforces that the
  only observed victory remains the disposable debug-assisted fixture.

## 2026-08-14 — PT-395 code prober

- A disposable Flutter test initialized `pt_BR`, called `generateFiller(1)`
  100 times, and captured the runtime missing-translation set. The route
  logged dozens of arbitrary city proper names (`Kent, WA`, `Anchorage, AK`,
  `Macon, GA`, `Wichita, KS`, and others) from
  `lib/newspaper/filler.dart:6`, which still calls `LcsI18n.tr(randomCityName())`.
- The generated city names remain visually unchanged, but the call bypasses
  the proper-name fallback guard established by PT-369. PT-395 was filed Open
  for a focused fix and independent strict-headless verification.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-pt395-20260814/`.

## 2026-08-14 — PT-395 fixer handoff

- `generateFiller()` now mirrors `City.getName()`: catalog-backed city names
  use `LcsI18n.tr`, while uncatalogued generated proper names remain verbatim
  and do not enter missing-translation telemetry.
- `test/newspaper/filler_translation_test.dart` runs 500 deterministic seeds,
  covers both city categories, checks the rendered filler prefix, and asserts
  that fallback names are absent from the missing-key set. The focused test
  passes; no browser replay was run by this fixer.
- Independent verifier session `verify-pt395-20260814` used a fresh strict-
  headless Portuguese runtime on port 9587 and reached full newspaper filler
  pages. `Stamford, CT` and `Westminster, CO` rendered as `Stamford,
  Connecticut` and `Westminster, Colorado`; `Fayetteville, NC` remained a
  verbatim uncatalogued proper name. The focused 500-seed regression directly
  checked the missing-key set for fallback cities and passed. The replay
  produced 161 valid 25-row captures with maximum width 80, zero over-wide
  rows, zero bridge errors, and no generated-city warnings in browser console.
  Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt395-20260814/`.
  PT-395 is **Closed / Fixed**.

## 2026-08-14 — stock executive route I

- `stock-victory-i-20260814` targeted the natural executive route without
  cheats: it recruited a sleeper, built a small Seattle squad and pickup,
  raised ordinary donations, traveled to Washington, DC, and entered the
  White House through the National Mall.
- The metal detector alarm triggered a stock Secret Service encounter. All
  four Liberals died in combat in February 2023, producing the Portuguese
  game-over text `O Esquadrão do Crime Liberal foi morto em combate em
  Fevereiro de 2023.` No `Ending.victory` screen appeared.
- The route retained 601 non-empty captures (599 metadata-complete), maximum
  width 80, zero over-wide rows, and zero bridge errors. `cheats`,
  `debugAssisted`, fixtures, save imports, CDP, headed browser, and source
  edits were all false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-i-20260814/`.
- No new translation or layout finding was confirmed. This adds a fourth
  independent stock-cheatless game-over route; natural victory remains
  unobserved.

## 2026-08-14 — stock stealth White House probe J

- `stock-victory-j-20260814` attempted a stealthy executive route with a
  charisma/persuasion/street-smarts founder, legal donations, and low-profile
  transport toward Washington, DC. The stock questionnaire left Disguise at
  0.00, however, and the route reached a pickup-truck key-search screen with
  no keys and no Security skill.
- It stopped honestly before the White House: `victory:false`,
  `gameOver:false`, `cheats:false`, `debugAssisted:false`, and all fixture,
  save-import, CDP, headed-browser, and source-edit flags false. The 174
  retained captures were non-empty, max width 80, zero over-wide rows, and
  zero bridge errors. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-j-20260814/`.
- No new translation or layout finding was confirmed; this remains honest
  blocker evidence rather than a victory claim.

## 2026-08-14 — long stock political campaign K

- `stock-victory-k-20260814` used a fresh Portuguese game with the ordinary
  Blue Sky CCS setting, a political/charisma founder, a university-student
  recruit, and a journalist recruit. The route assigned activism, Guardian
  Liberal article writing, and law practice, then processed ordinary monthly
  agendas and the 2024 House election.
- It advanced from January 2023 through 21 February 2025 without a natural
  victory or game-over terminal. The final state was an ordinary base screen
  with moderate agenda status, so this is long-run no-terminal evidence rather
  than a victory claim.
- The strict-headless replay retained 2,683 non-empty captures, maximum width
  80, zero over-wide rows, and zero bridge-error captures. `cheats`,
  `debugAssisted`, fixtures, save imports, CDP, headed browser, and source
  edits were all false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-k-20260814/`.
- No new translation or layout finding was confirmed. Natural victory remains
  unobserved even after this multi-year stock campaign.

## 2026-08-14 — mass-influence stock campaign L

- `stock-victory-l-20260814` used a fresh stock Portuguese game with the
  ordinary Blue Sky CCS setting. It recruited a university student and a
  journalist, kept the founder active on Guardian Liberal writing, assigned
  community service to the student, and assigned Liberal advocacy to the
  journalist sleeper.
- Adaptive stock daily waits handled agenda/news/vote/finance interludes and
  advanced 397 days, from 1 January 2023 through 2 February 2024. The run
  stayed on a non-Elite Liberal agenda screen with no victory or game-over
  terminal.
- All 773 retained bridge states were non-empty and 25×80, with maximum width
  80, zero over-wide rows, zero bridge errors, zero document overflow, and no
  terminal-pattern false positives. `cheats`, `debugAssisted`, fixtures,
  save imports, CDP, headed browser, and source edits were false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-l-20260814/`.
- No new translation or layout finding was confirmed; natural victory remains
  unobserved.

## 2026-08-14 — multi-election stock campaign M

- `stock-victory-m-20260814` used a fresh stock Portuguese game and recruited a
  broader legitimate roster: university, journalist, law, and persuasion
  candidates. Activities were assigned across Guardian writing, community
  service, law practice, and persuasion while the campaign processed repeated
  agendas and elections.
- It advanced about 783 calendar days (800 daily waits) to 22 February 2025.
  The final politics screen still showed conservative laws and no
  `Ending.victory` or game-over terminal; this is a long-run blocker, not a
  victory claim.
- The strict-headless replay retained 1,532 valid non-empty captures, maximum
  row width 80, zero over-wide rows, zero bridge errors, and zero layout
  overflow. `cheats`, `debugAssisted`, fixtures, save imports, CDP, headed
  browser, and source edits were all false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-m-20260814/`.
- No new translation or layout finding was confirmed. Natural victory remains
  unobserved after this multi-election route.

## 2026-08-14 — sustained-advocacy stock campaign N

- `stock-victory-n-20260814` used a fresh stock Portuguese campaign with three
  regulars assigned Guardian Liberal writing/community service and an
  undercover lawyer assigned exact `Promovendo o Liberalismo` (Defender
  Liberalism) work at the Seattle Forum.
- The route processed repeated monthly agendas from 1 January 2023 through
  19 April 2027. Final agenda pages still did not satisfy the Elite-Liberal
  win gate, and no natural victory or game-over terminal appeared.
- Strict-headless evidence retained 134 non-empty captures, max row width 80,
  zero over-wide rows, zero bridge-error text, and no layout overflow. All
  assistance flags (`cheats`, `debugAssisted`, fixtures, save imports, CDP,
  headed browser, and source edits) were false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-n-20260814/`.
- No new translation or layout finding was confirmed. Natural victory remains
  unobserved after this sustained-advocacy route.

## 2026-08-14 — Oval Office sleeper probe O

- `stock-victory-o-20260814` used a fresh stock Portuguese founder with a
  security uniform, ordinary recruitment, a stolen pickup, and travel to the
  White House. It reached the Oval Office map without cheats or fixtures.
- The metal detector still triggered suspicion. One ordinary flee reset the
  encounter, but re-entry immediately produced `CONSERVADORES ALARMADOS`; the
  President could not be contacted and no victory/game-over terminal appeared.
- The strict-headless route retained 369 valid captures, maximum width 80,
  zero over-wide rows, zero bridge errors, and zero document overflow. All
  assistance flags were false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-o-20260814/`.
- No new translation or layout finding was confirmed. This is a clean
  President-contact blocker, not victory evidence.

## 2026-08-14 — optimized stock White House probe P

- `stock-victory-p-20260814` used a fresh strict-headless Portuguese game with
  an optimized stock questionnaire, ordinary Blue Sky CCS setup, a stolen
  pickup, donations, and Seattle-to-Washington travel. It reached White House
  level 2 and exercised the metal-detector/site-map path without fixtures,
  save imports, CDP, headed browsing, or source edits.
- The route never reached the Oval Office special or contacted the President.
  A wrong movement sequence and a later guard encounter forced a documented
  flee/replan; the final known state was a non-terminal White House map. No
  victory or game-over terminal appeared.
- The replay retained 259 captures (all non-empty), maximum width 80, zero
  over-wide rows, zero bridge errors, and zero document overflow. All
  assistance flags (`cheats`, `debugAssisted`, fixtures, save imports, CDP,
  headed browser, and source edits) were false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-p-20260814/`.
- No new translation or layout finding was confirmed. Natural victory remains
  unobserved; the only victory evidence is the disposable debug-assisted
  fixture.

## 2026-08-14 — direct White House corridor probe Q

- `stock-victory-q-20260814` used a fresh Portuguese stock-cheatless session
  with a distinct low-resource route: a homeless founder started in DC, moved
  through National Mall, and entered White House level 2 on foot.
- The route passed the initial detector interaction (`Dia tranquilo, hoje.`),
  then reached a four-guard Secret Service corridor and stopped before the
  Oval Office or President sleeper interaction. No victory or game-over
  terminal appeared.
- The replay retained 42 non-empty captures, maximum width 80, zero over-wide
  rows, zero bridge errors, and zero document overflow. All assistance flags
  (`cheats`, `debugAssisted`, fixtures, save imports, CDP, headed browser, and
  source edits) were false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-q-20260814/`.
- No new translation or layout finding was confirmed. This is another clean
  White House navigation blocker, not victory evidence.

## 2026-08-14 — optimized White House stock campaign R

- `stock-victory-r-20260814` used a fresh Portuguese stock campaign with the
  optimized questionnaire, a stolen and repaired pickup, six donation waits,
  and the security-uniform/manifesto path. It reached White House level 2 and
  replayed the exact 22-key corridor route toward the Oval Office.
- The Secret Service encounter still stopped progress: target/escape choices
  returned to the map before the Oval Office specials. No President contact,
  victory, or game-over terminal appeared.
- The strict-headless replay retained 80 screenshots, max row width 80, zero
  over-wide rows, zero bridge errors, and zero layout overflow. All assistance
  flags (`cheats`, `debugAssisted`, fixtures, save imports, CDP, headed browser,
  and source edits) were false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-r-20260814/`.
- No new translation or layout finding was confirmed. This is a clean
  President-contact blocker; the only observed victory remains the disposable
  debug-assisted fixture.

## 2026-08-14 — bounded political recruitment stock campaign T

- `stock-victory-t-20260814` used a fresh Portuguese campaign with Clear Blue
  Skies, a political founder, and a distinct university-plus-homeless
  recruitment route. It exercised repeated casual political conversations and
  follow-up meetings with named candidates.
- The route stopped in a normal Virginia Sánchez follow-up meeting: the
  founder had only US$7, so the US$50 materials option was unavailable and no
  recruit had visibly joined before the bound. It reached neither monthly
  elections nor a terminal.
- Strict-headless evidence recorded a fresh stock run at commit `fa1e16b8`,
  with all assistance flags false, 25×80 final capture, and no overflow,
  bridge errors, or raw English in observed Portuguese buffers. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-t-20260814/`.
- No new translation or layout finding was confirmed. This is a bounded
  recruitment-throughput blocker, not victory evidence.

## 2026-08-14 — bounded political recruitment stock campaign S

- `stock-victory-s-20260814` used a fresh Portuguese Clear Blue Skies game with
  a political founder, a Seattle homeless base, repeated university
  recruitment, and a distinct Liberal Disobedience/Law-practice strategy.
- The route recruited Mumtaz Tippett and Louis Lauder, then processed 60
  bounded waits through 11 March 2023. The final roster contained three active
  Liberals; no victory or game-over terminal appeared.
- Evidence retained a clean final base/roster capture and explicit false flags
  for source edits, save imports, and debug assistance. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-s-20260814/`.
- No new translation or layout finding was confirmed. This is a bounded
  low-roster political-influence blocker, not victory evidence.

## 2026-08-15 — funded Guardian-influence stock campaign U

- `stock-victory-u-20260814` used a fresh Portuguese Clear Blue Skies campaign
  with the $1,000-savings, high-persuasion/charisma founder route. It recruited
  journalist Nancy Mann, assigned Guardian article writing, solicited
  donations, and processed monthly turns through February 2024.
- Funds reached $3,323 and the agenda showed President Ransom Singh in a first
  mandate, but the Seattle homeless encampment could not be upgraded to a
  video room and no upgradable safehouse was reached. The route stopped at that
  clear infrastructure blocker with no victory or game-over terminal.
- Evidence retained a clean Portuguese agenda/base/assignment set with all
  assistance flags false. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-u-20260814/`.
- No new translation or layout finding was confirmed. This is a bounded
  Guardian/video-room infrastructure blocker, not victory evidence.

## 2026-08-15 — funded legislative stock campaign V

- `stock-victory-v-20260814` used a fresh Portuguese Clear Blue Skies campaign
  with a persuasion/law founder, US$1,000 starting savings, material-backed
  political recruitment, and Liberal Guardian article writing.
- Five recruits joined (six active Liberals total), and the route reached the
  31 January 2023 monthly congressional deliberation plus the 1 February
  legislative agenda and financing screens. Recruitment consumed US$850,
  leaving US$150; no court purge, term-limit result, victory, or game-over
  terminal appeared before the bound.
- Evidence retained a clean 25×80 final capture with all assistance flags false
  (no cheats/debug assistance, fixtures, save imports, CDP, headed browser, or
  source edits). Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-v-20260814/`.
- No new translation or layout finding was confirmed. This is a bounded
  monthly-politics checkpoint, not victory evidence.

## 2026-08-14 — funded New York studio stock campaign W

- `stock-victory-w-20260814` used a fresh Portuguese Clear Blue Skies game
  from New York's ordinary warehouse-type base. It funded a video studio,
  recruited three regular liberals plus three infiltrated journalist/teacher
  sleepers, and assigned four active regulars to Stream Guardian TV.
- The route advanced through roughly seven and a half in-game years to 5 June
  2030. It reached one ordinary Supreme Court turnover (James Zapata replaced
  by moderate Yolanda al-Sisi), but no term-limits amendment, court purge, or
  victory prompt appeared. The final media view was 42.5% Liberal with 74%
  LCS approval; House/Senate and active laws remained far from the strict
  Elite-Liberal win gate.
- The replay was strict headless and clean: `terminalReached:false`, no
  source edits, save imports, debug flags, fixtures/state injection, headed
  browser, or CDP attachment. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-w-20260814/`.
- No new translation or layout finding was confirmed. This is long-run
  political-progress evidence, not victory evidence.

## 2026-08-14 — funded New York studio stock campaign X

- `stock-victory-x-20260814` used a fresh Portuguese Clear Blue Skies game
  with a high-persuasion/law founder, US$1,000 savings, seven ordinary active
  Liberals, and a legal US$2,000 NYC warehouse video-room upgrade.
- Three regulars streamed Guardian TV and two wrote Guardian articles while
  two solicited donations. The route reached repeated monthly Congress,
  election, and Supreme Court screens through 1 July 2023, but media showed
  only 43.7% Liberal views and the law-status issue average was about 43.6%.
  Chambers, laws, term limits, court purge, executive alignment, and the win
  gate remained incomplete; no victory or game-over terminal appeared.
- The final capture was a live NYC base screen (25×80, no overflow or bridge
  errors). All assistance flags were false: no cheats/debug flags, fixtures,
  save imports, headed browser, CDP attachment, or source/document edits.
  Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/stock-victory-x-20260814/`.
- No new translation or layout finding was confirmed. This is a bounded
  political-influence checkpoint, not victory evidence.

## 2026-08-15 — independent newspaper/media dynamic assembly probe

- Prober audit targeted `lib/newspaper/television.dart` and the archived-story
  reader in `lib/basemode/media_overview.dart` on current commit `cd589eb5`.
- A disposable current-build harness replayed all five television body strings
  through `LcsI18n.processString()` and `addparagraph()` in `pt_BR`. The bodies
  remained English because no complete Portuguese catalog keys exist. Captured
  rows were 75–79 cells wide, with no over-wide rows or bridge/runtime errors.
- PT-401 was filed for the visible archived-article leak. The separate
  already-localized dynamic Cable News headline false-missing telemetry was
  recorded but not ticketed because its visible text is unchanged.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-newspaper-20260815/`.

- PT-401 is now fixed and independently verified. Exact full-body catalog
  entries translate all five stories at the media-reader boundary while raw
  archive values remain locale-switchable. The focused regression covers all
  five bodies; the fresh strict-headless replay opened two complete Portuguese
  articles with 25×80, width-safe, bridge-error-free captures. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt401-20260815/final2/`.

## 2026-08-15 — combat-focused gang and police-station stock campaign Z

- `playtester-z-20260815` used a fresh Portuguese stock campaign on Flutter
  web-server port 9404, with isolated strict-headless session
  `playtester-z-20260815-9404`. The founder selected martial-arts, firearms,
  gang-leader, and four-gang-member routes, then visited a Seattle automobile
  factory, department store, and police station. The police visit reached
  `CONSERVADORES ALARMADOS`; the route then advanced ordinary waits through
  the first legislative, newspaper, and Supreme Court cycles.
- The replay explicitly proved language selection with `a` → `p` and retained
  179 JSON buffer captures. Every capture was 25×80 (`maxRow=80`), had zero
  over-wide rows, zero DOM bridge errors, and ran as `HeadlessChrome/150.0.0.0`
  through `?playtest=1`. No cheats, fixtures, save imports, source edits,
  headed browser, or CDP attachment were used by the route.
- The Supreme Court surveillance screen exposed PT-402: long Portuguese
  precedent descriptions collide with vote counts rendered at column 63,
  producing visible joins such as `proprietários4 pelo Status Quo` and
  `polí6 pelo Status Quo`. The rows are still exactly 80 cells, so this is an
  overlap/clipping defect rather than an over-wide-row or bridge error.
- No victory or terminal game-over appeared before the route bound. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-z-20260815/`.

- PT-402 is fixed and independently verified. The renderer now reserves the
  period and separator before column 63; the fresh June vote reveal measured
  period/space/count at columns 61/62/63 with 80-column, error-free captures.
  Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt402b-20260815/`.

## 2026-08-15 — independent Supreme Court turnover verifier

- The fresh current-build Portuguese verifier replay reached the natural
  Supreme Court surveillance vote reveal after the PT-402 separator fix.
- The same turnover sequence exposed PT-403: the departing-justice line
  rendered `Conservative Justiça Jennifer Wolfe is stepping down.` and the
  replacement paragraph mixed a raw English alignment label into Portuguese.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt402b-20260815/32-supreme-court-votes.json`
  and `33-supreme-court-votes.json`.

- PT-403 is fixed and independently verified. A fresh stock-cheatless June
  turnover rendered `Liberal (pol.) Justiça ... está deixando o cargo.` and a
  fully Portuguese appointment sentence. All 21 captures were 80 columns with
  no raw English alignment/suffix text, overflow, or bridge errors. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt403-20260815/`.

## 2026-08-15 — stealth recruitment and media stock campaign

- `playtester-stealth-20260815` used a fresh current-HEAD Portuguese game
  with a New York founder focused on stealth, legal donations, ration
  investment, low-profile recruitment, and repeated university meetings with
  Fidel Cavill, César Hsu, and Wolf Díaz. It also opened media overview and
  Liberal-status screens.
- The route was stock-cheatless: no debug flags, fixtures, save imports,
  headed browser, CDP, or source changes. It retained 118 captures; all were
  80 columns with no over-wide rows, bridge errors, or targeted raw-English
  UI markers. It ended during ordinary recruitment meetings without a
  terminal, victory, or game-over. No new translation/layout issue was
  confirmed. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-stealth-20260815/`.

## 2026-08-15 — independent stock combat game-over

- `verify-terminal-combat-20260815` started a fresh Portuguese game with
  active CCS and easy combat, sent a lone founder to Desert Eagle Bar e Grill,
  and deliberately engaged the armed bouncer/guards. The founder died in the
  live fight and the route advanced through the Portuguese terminal to the
  title screen.
- This was stock-cheatless: no debug flags, fixtures, save imports, headed
  browser, CDP, or source changes. The terminal states
  `O Esquadrão do Crime Liberal foi morto em combate em Janeiro de 2023.`;
  60 captures were 80 columns with zero over-wide rows, bridge errors, or new
  defects. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-terminal-combat-20260815/`.

## 2026-08-15 — car-theft residual probe (no ticket)

- The independent prober audited `lib/daily/activities/car_theft.dart` and
  replayed the post-search car-theft variants in a fresh Portuguese headless
  session. Static catalog gaps for the RNG-only `Why me?`/`Oh no...` branches
  were not visible: the strict route rendered only translated variants before
  a police foot chase interrupted it.
- All retained captures were 25×80 with no bridge errors. The branch remains
  a plausible residual of closed PT-108, but without deterministic RNG proof
  it is not a confirmed issue and no PT ticket was opened. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-pt404-car-theft-20260815/`.

## 2026-08-15 — education, teaching, and Guardian media stock campaign

- `playtester-pt405-education-media-20260815` used a fresh current-HEAD
  Portuguese run with a New York founder. It exercised the education/science
  questionnaire, Science practice, Liberal Arts teaching, Guardian Liberal
  writing, and media overview across 1–4 January 2023.
- The run was stock-cheatless: no debug flags, fixtures, save imports, headed
  browser, CDP, or source changes. It retained 44 captures, all 80 columns,
  with zero over-wide rows, bridge errors, or raw-English gameplay strings.
  It ended on the main screen without victory, defeat, or game over. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-pt405-education-media-20260815/`.

## 2026-08-15 — long illegal-activity police-arrest stock campaign

- `playtester-police-arrest-20260815` started a fresh default Portuguese game,
  assigned Kris Abbott to ordinary `Prostituição`, and advanced one day at a
  time through generated newspaper and legislative pages. On 27 October 2023
  the route naturally reached `A polícia deteve Kris Abbott em uma operação de
  prostituição!`.
- This was stock-cheatless: no debug flags, fixtures, save imports, headed
  browser, CDP, or source changes. It retained 580 non-empty captures, all
  25×80, with zero over-wide rows, bridge errors, or new defects. It is an
  arrest checkpoint rather than victory or game over. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-police-arrest-20260815/`.

## 2026-08-15 — media archive and constitutional-status stock campaign

- `playtester-media-20260815` used a fresh Washington, DC Portuguese game
  with a Guardian-writing founder. It waited through January, opened four
  archived media stories (including television/radio and newspaper variants),
  observed monthly congressional votes, and reviewed all five constitutional
  status pages.
- The stock-cheatless route retained 89 captures, all 80 columns, with zero
  over-wide rows, bridge errors, or targeted raw-English UI markers. Archive
  headlines and bodies were Portuguese; no new translation/layout defect was
  confirmed. It did not reach victory or game over. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-media-20260815/`.

## 2026-08-15 — PT-406 White House Secret Service stock combat route

- Fresh session `pt406b-wh-20260815` selected Português through the normal
  language menu, chose Washington, DC, and sent a five-member stock squad from
  the homeless camp to `National Mall → Casa Branca`. Debug flags remained
  false; no fixtures, save imports, headed browser, CDP, or source changes were
  used.
- The White House metal detector triggered the normal four-agent Secret
  Service encounter. Portuguese combat reached `CONSERVADORES ALARMADOS` and
  ended in the natural game-over screen after all ten squad members were
  martyred: `O Esquadrão do Crime Liberal foi morto em combate em Janeiro de
  2023.`
- PT-406 is confirmed: the encounter roster and hit narration repeatedly
  rendered the raw English role `Secret Service`, including
  `Secret Service POR ENGANO atira em Frank Truman com Pistola 9 mm!`. The
  localized ambush sentence itself was fine; the dynamic role name lacked a
  Portuguese catalog entry. This is a translation ticket, not a gameplay or
  layout defect.
- The route retained 116 captures, all 25×80 (`maxRow: 80`) with zero
  over-wide rows and zero bridge errors. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-pt406-whitehouse-police-20260815/`.
- Independent verification after the catalog fix used a separate fresh
  strict-headless session at `http://127.0.0.1:9984/?playtest=1`. Its 128
  valid buffers rendered `Serviço Secreto` in both the roster and combat hit
  narration, with no raw `Secret Service`, zero over-wide rows, and zero
  bridge errors. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt406-20260815/`.

## 2026-08-15 — coalition, journalism, and Supreme Court stock campaign

- `playtester-coalition-20260815` used a fresh Portuguese Seattle campaign
  with founder Bobby Santiago, legal donations, a journalist-recruitment
  attempt, Guardian article writing, and ordinary waits through the Supreme
  Court change-of-guard checkpoint.
- The route was stock-cheatless: no debug flags, fixtures, save imports,
  headed browser, CDP, or source changes. It retained 257 captures, all with
  `maxRow: 80`, zero over-wide rows, zero bridge errors, and no targeted raw
  English UI markers. It stopped at the post-checkpoint Congress-deliberation
  screen without victory or game-over. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-coalition-20260815/`.

## 2026-08-15 — bounded car-theft stock campaign

- `playtester-whitehouse-20260815` used a fresh Portuguese stock route focused
  on two natural Pickup car-theft attempts, then returned to task assignment.
- It used no cheats, debug flags, fixtures, save imports, headed browser, or
  CDP. The 173 retained captures were all 80 columns, with zero over-wide
  rows, errors, empty buffers, or new tickets. It ended alive at the bounded
  car-theft checkpoint without victory or game-over. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-whitehouse-20260815/`.

## 2026-08-15 — political, education, and media stock campaign #9

- `playtester-political9-20260815` used a fresh Portuguese Washington, DC
  campaign with Myron Meffert. It assigned Guardian articles, attempted
  university-student and journalist recruitment, trained Direito, and then
  practiced law/discretion while advancing monthly politics.
- The stock-cheatless route reached 1 September 2023 after 519 captures.
  Repeated `Agenda Legislativa 2023` screens showed Câmara, Senado, and
  Presidente stages. All captures were at most 80 columns with zero bad
  captures; no targeted raw-English gameplay marker appeared. It remained
  alive with no victory or game-over terminal. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-political9-20260815/`.

## 2026-08-15 — direct police-combat stock campaign #10

- `playtester-strategy10-20260815` used a fresh Portuguese route from the
  base to a police site, provoking a normal two-officer combat encounter.
  The squad survived at the bounded checkpoint (`Agnes 24/270`) on the live
  police-site map.
- The route was stock-cheatless: no debug flags, fixtures, save imports,
  headed browser, CDP, or source edits. It retained 143 valid captures (one
  malformed wrapper was excluded), all at most 80 columns, with zero bridge
  errors, empty buffers, or new tickets. Post-language-switch raw-English
  scanning was clean. No victory, arrest, defeat, or game-over terminal
  appeared. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy10-20260815/`.

## 2026-08-15 — easier-climate sleeper and journalism stock campaign #11

- `playtester-easy11-20260815` used a fresh Portuguese New York campaign with
  the easier `Os tempos estão mudando` climate, `Céu Azul e Límpido`, and
  `Poder para o povo`. Martina Irvin recruited a lawyer sleeper, reached
  Câmara/Senado/Presidente legislative screens, assigned Guardian activity,
  and continued through journalist/professor recruitment.
- The stock-cheatless route retained 483 captures with `maxRow=80`, zero bad
  captures, and zero targeted post-locale raw-English hits. It ended alive at
  a journalist-candidate checkpoint with no victory or game-over terminal.
  Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-easy11-20260815/`.

## 2026-08-15 — lawyer and journalist sleeper stock campaign #12

- `playtester-strategy12-20260815` used a fresh Portuguese Washington, DC
  route. Barney Yerkovich was recruited as a lawyer sleeper and assigned
  `Promovendo o Liberalismo`; journalist János Heath was then recruited,
  sleeperized at Casa Branca, and assigned the same advocacy activity.
- The stock-cheatless route retained 133 captures and ended on a live
  Portuguese news page dated 16 March 2023. Width and bridge checks were
  clean (`maxRow=80`, zero over-wide, empty, or bridge-error captures); the
  only raw-English hits were two expected pre-language title lines. No new
  ticket, victory, game-over, defeat, arrest, or terminal appeared. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy12-20260815/`.

## 2026-08-15 — Guardian media stock campaign #13

- `playtester-guardian13-20260815` used a fresh Portuguese New York campaign
  with Philip Copeland. It recruited journalist Soraya Weygand, placed her as
  a cable-news sleeper, wrote Guardian articles, and advanced through the
  January legislative agenda before returning to base on February 2.
- The stock-cheatless route retained 212 captures at width 80 with zero
  over-wide rows, bridge errors, or bad captures. It found PT-407, the raw
  liberal level title `Activist`, which was fixed and independently verified;
  no victory or game-over terminal appeared. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-guardian13-20260815/`.

## 2026-08-15 — coalition sleeper and legislative stock campaign #14

- `playtester-strategy14-20260815` used a fresh Portuguese Washington, DC
  route with Bebe Washington. It recruited journalist Richie Bogart and
  lawyer Rachael Mendoza, placed both as sleepers, assigned liberal advocacy,
  and reached the January 31 legislative agenda before returning to base on
  February 2.
- The stock-cheatless route retained 117 valid captures with maximum width 80,
  zero over-wide rows, zero actual bridge errors, and no new ticket. It ended
  at a live base checkpoint without victory or game over. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy14-20260815/`.

## 2026-08-15 — persuasion, sleepers, and legislative stock campaign #15

- `playtester-strategy15-20260815` used a fresh Portuguese New York campaign
  with Eloise Lombard. It activated lawyer Ben Ransom, later recruited Selma
  Friend as a second lawyer sleeper, and reached the February 1 legislative
  agenda after natural recruitment and legal-donation work.
- The stock-cheatless route retained 337 captures with maximum width 80,
  zero over-wide rows, bridge errors, empty buffers, or metadata anomalies,
  and zero post-Portuguese raw-English matches. No new ticket, victory, or
  game-over terminal appeared. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy15-20260815/`.

## 2026-08-15 — CCS-absent climate and legislative stock campaign #16

- `playtester-strategy16-20260815` used a fresh Portuguese campaign with a
  materially different `O fim do mundo como o conhecemos` climate. It created
  journalist Laurie Hall and lawyers Flora Weller and Nelly Schumer as
  infiltrated sleepers, assigned liberal advocacy, and reached the January 31
  to February 1 legislative agenda and funding report.
- The stock-cheatless route retained 357 captures with maximum width 80,
  zero over-wide rows, bridge errors, empty buffers, or metadata anomalies,
  and zero post-Portuguese raw-English matches. Both sampled resolutions were
  defeated; no new ticket, victory, or game-over terminal appeared. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy16-20260815/`.

## 2026-08-15 — high-persuasion legislative stock campaign #17

- `playtester-strategy17-20260815` used a fresh Portuguese campaign with
  high-persuasion founder Lilly Clooney. It naturally attempted journalist
  recruitment, assigned the existing Mohammed Rushworth sleeper to liberal
  communications, switched the founder to Guardian articles, and reached the
  January 31 legislative agenda and February 1 base.
- The stock-cheatless route retained 183 snapshots, including six
  bridge-backed captures, all at width 80 with zero over-wide rows, bridge
  errors, or empty buffers. Selected raw-English scanning was clean; no new
  ticket, victory, or game-over terminal appeared. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy17-20260815/`.

## 2026-08-19 — stock police-station game-over #18

- `parent-strategy18-gameover-police-20260819` used a fresh Portuguese Seattle
  founder, Ferenc Meléndez, at current HEAD `b3fc6d56`. Climate stayed at
  `Os tempos estão mudando`, CCS at `Sangue Ruim`, combat at zipper
  `Bem-vindo à Selva`. The unarmed founder went from the homeless camp to
  Centro de Seattle → Delegacia de Polícia and fought `Oficial de Polícia` /
  `Unidade Policial` until death.
- The route was stock-cheatless: no debug flags, fixtures, save imports,
  headed browser, CDP, or source edits. UA `HeadlessChrome/150.0.0.0`. It
  retained 47 captures, all width 80, zero over-wide rows, zero bridge
  errors. No new translation/layout ticket. Terminal:
  `A Elite Liberal` / `O Esquadrão do Crime Liberal foi morto em combate em
  Janeiro de 2023.` Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy18-gameover-20260819/`.
- This is a distinct stock game-over from White House Secret Service combat,
  Desert Eagle combat, CCS assault, and disband-and-wait hiding. Campaign
  victory is still only documented via the disposable 2026-08-13
  `debugInstantVictory` fixture, not a stock run.

## 2026-08-19 — stock homeless-camp siege briefing (PT-409)

- `playtester-strategy18-victory-20260819` is a stock-cheatless Portuguese
  Seattle campaign at HEAD `b3fc6d56`, CCS `Céu Azul e Límpido`, combat
  `Poder para o povo`, founder Angelina Walden writing Guardian articles from
  the homeless camp. UA `HeadlessChrome/150.0.0.0` on
  `http://127.0.0.1:10118/?playtest=1`. No debug flags, fixtures, save
  imports, headed browser, CDP, or source edits.
- Waiting reached `7 de jun de 2023` with `Refúgio Sob Ataque`. A naive wait
  loop stalled because `W - Esperar um dia` is replaced by `Não pode esperar
  até o cerco terminar`. `F - Lutar/Fugir` opened the homeless-camp briefing.
- Capture `091-siege-briefing.json` is 25×80, zero over-wide rows, empty
  errors. Title `SOB ATAQUE: ACAMPAMENTO DE SEM-TETO` is localized. The body
  concatenates `e você terá que` with imperative `derrote todos ou fuja`.
  Filed PT-409. This is not `Ending.victory`.
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy18-victory-20260819/`.

## 2026-08-20 — Seattle legal funding and low-income-housing route #19

- `playtester-strategy19-warehouse-20260820` used a fresh Portuguese Seattle
  founder, Elio Hemingway, with `Os tempos estão mudando`, CCS disabled via
  `Céu Azul e Límpido`, and `Poder para o povo`. UA was
  `HeadlessChrome/150.0.0.0`; the dedicated server was `10128`.
- The founder solicited donations legally. Archibald Blanchard joined as a
  regular journalist and was assigned Liberal Guardian writing; sleeper lawyer
  Beth Lennon remained infiltrated. Funds reached US$17 by 6 January 2023.
- The squad visited `Conjuntos habitacionais da Rua Finn`, read the sign that
  identifies the landlord's office as the first door on the left, and selected
  Não on the locked-door force prompt. It exited to `SEA — Sem-teto` on 7
  January before rent could be accepted; no combat, hiding, disband, cheat, or
  fixture path was used.
- This bounded run ended without `Ending.victory`, game-over, or a new PT
  ticket. It retained 117 captures, all width 80, zero over-wide rows, zero
  bridge errors, and no empty buffers. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy19-warehouse-20260820/`.

## 2026-08-20 — remaining-catalog social-attack probe

- `prober-remaining-catalog-20260820` ran at HEAD `b3fc6d56` in a fresh
  Portuguese Seattle game through the isolated server `127.0.0.1:10120`.
  The wrapper reported `HeadlessChrome/150.0.0.0`; no headed browser, CDP,
  save import, debug flag, or source edit was used.
- The route reached `Visitando Estação de Rádio AM`, entered site mode, and
  exercised repeated `S - Parar` encounter cycles. The live roster showed
  workers, janitors, and secretaries, but did not show `Radio Personality` or
  an English social-attack fragment. Therefore this probe does not confirm a
  new PT ticket.
- Static audit found creature XML social-attack fragments such as `winks at`,
  `smiles at`, and `debates abortion with` absent from both canonical
  catalogs. They are parsed by `creature_type_xml.dart` and translated at
  the `socialAttack(...)` render site, making this an unconfirmed follow-up
  candidate only.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-remaining-catalog-20260820/`.

## 2026-08-20 — PT-409 fixer and independent verification

- Isolated commit `75e9cfe83c845f8ae97fddb67dc9a6a3c5f11f10` merged the
  homeless-camp siege modal into one translatable sentence and added a focused
  regression; it was cherry-picked onto `feature/localization` as `a6a07fbc`.
- A separate verifier used worktree
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt409-wt`, server
  `127.0.0.1:10121`, and session `verify-pt409-20260820`. The fresh Portuguese
  headless route reached `F - Lutar/Fugir`; the expected `terá que derrotá-los`
  wording was present, malformed `terá que derrote` / `terá que fuja` wording
  was absent, and all 25 rows stayed within 80 columns with no browser errors.
- Catalog validation, focused siege tests (13 passing), and targeted analyze
  passed. Temporary debug-only siege reachability edits were restored and did
  not enter the fix commit. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verification-output-pt409/`.

## 2026-08-20 — executive and presidential sleeper route #21

- `playtester-strategy21-executive-20260820` used a fresh Portuguese Seattle
  campaign with the stock `Os tempos estão mudando` climate, `Céu Azul e
  Límpido` (CCS disabled), and `Poder para o povo`. The strict headless wrapper
  and isolated session were used throughout on server `10129`; no debug flag,
  fixture, save import, CDP attachment, headed browser, or source edit was
  used.
- Charisma/persuasion questionnaire choices, the age-18 law-student answer,
  and the manifesto answer naturally created sleeper lawyer Valentina Howard.
  The founder solicited legal donations; Valentina recruited Lily Nash
  (secretary), Noam Straley (lawyer), and Lesley Reasoner (janitor). All four
  were later assigned `Promovendo o Liberalismo`.
- The route was extended through January 31, 2025. Agenda captures showed the
  initial President Nicholas Zlotoff / Vice President Paige Xue and the later
  President Carolina Varga / Vice President Sebastian Itô, with cabinet and
  House/Senate changes. Legislative agenda and vote screens were also
  exercised. The route stopped on a stable base screen without
  `Ending.victory`, a conservative ending, or game-over.
- The 286 retained captures were all non-empty, stayed within 80 columns, and
  had zero bridge errors. No new Portuguese translation/layout issue was
  confirmed. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy21-executive-20260820/`.

## 2026-08-20 — political sleeper-network route #20

- `playtester-strategy20-political-20260820` ran a fresh Portuguese Seattle
  campaign from 2023-01-01 with `Céu Azul e Límpido` (CCS disabled), legal
  donations, and Annis Garnier's sleeper-network activity. The route
  recruited Stanley Slaten, Raven Simms, Vivian Drummond, Yoshi Alley,
  Charlene Rexford, and Gina Cavallero; Robbie Kobayashi and Stanley formed
  a two-person squad with .22 revolvers and ammunition.
- It advanced through the 2024 Supreme Court/election cycle and the January
  2025 agenda checkpoint. The visible political summary had President Shanna
  Han, changed cabinet names, and liberal/minority House and Senate counts,
  but the law page remained mixed. It stopped at a stable Seattle base on
  2025-01-30 without `Ending.victory` or game-over.
- This was stock-cheatless: no debug flags, fixtures, save import, CDP, or
  headed browser. All 354 parsed captures were non-empty, maximum width 80,
  with zero over-wide rows, zero bridge errors, and no exact raw-English UI
  hits. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy20-political-20260820/`.

## 2026-08-20 — New York political sleeper-network route #22

- `playtester-strategy22-politics-20260820` used a fresh Portuguese New York
  campaign with `Os tempos estão mudando`, `Céu Azul e Límpido` (CCS disabled),
  and `Poder para o povo`. The founder was Karla Carberry; questionnaire keys
  were `C C C D C C D D E D`, producing the age-18 lawyer sleeper Tucker
  Newhook and the manifesto origin. The founder was assigned `Solicitar
  Doações`; Tucker received `A -> 3` sleeper-network recruitment.
- Natural recruitment later produced Raven Sasaki (lawyer), Barbie Zhang
  (secretary), and Jeremy Fekete (environmental worker). All four sleepers were
  assigned `Promovendo o Liberalismo`; Raven's `A -> 3` recruitment option was
  stock-disabled pending more energy, so `A -> 2` was used.
- The route reached the November 2024 `Eleições da Câmara 2024` screen. Before
  the election, the agenda showed President Bashar Gu and Vice President Enzo
  Kitchen. Afterward it showed President Luther Ramírez, Vice President Moshe
  MacLeod, changed cabinet members, and changed House/Senate counts. It stopped
  at a stable New York base on 7 January 2025 without `Ending.victory` or
  game-over.
- This was stock-cheatless: no debug flags, fixtures, save import, CDP,
  headed browser, or source edits. It retained 1,172 valid DOM captures
  (1,171 non-empty), maximum width 80, zero over-wide rows, and zero bridge
  errors. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy22-politics-20260820/`.

## 2026-08-20 — constitutional route #23 extended to 2025

- `playtester-strategy23-constitutional-20260820` continued the fresh
  Portuguese Seattle route from 2023-01-01 through January 20, 2025. It kept
  CCS disabled, used legal donations, assigned Angela Ng's `A -> 3` sleeper
  network, and naturally recruited Kayla Marshall, Suzie Slaten, and Malcolm
  Toole. It remained stock-cheatless: no debug flags, fixture, save import,
  headed browser, CDP, or source edit.
- The route exercised the 2024 presidential, Senate, and House elections. The
  final Liberal Agenda showed President Jacob Becker, House visible counts of
  68 Lib+ / 60 Lib / 37 moderate, Senate visible counts of 19 Lib+ / 14 Lib /
  8 moderate, low public-opinion values, and conservative/minimal laws. No
  term-limit amendment, Supreme Court purge, `Ending.victory`, or game-over
  event fired.
- Correct aggregate metrics over 437 retained DOM captures: 437 non-empty,
  maximum row width 80, zero over-wide rows, zero bridge errors, and no
  untranslated gameplay UI English. One news article retained the proper book
  title `The Abortion Files`. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy23-constitutional-20260820/`.

## 2026-08-20 — constellation route #23 extended to April 2025

- `playtester-strategy23-constellation-20260820` was a fresh Portuguese,
  stock-cheatless Washington run using the high-intelligence university/science
  founder route, normal Liberal Guardian writing, and CCS disabled via the
  stock `Céu Azul e Límpido` option. It used no debug flags, fixtures, save
  imports, source edits, CDP, or headed browser.
- The route naturally recruited Dwight Zumbach (lawyer), Meghan Skye
  (education worker), Amelie Reading (lawyer), and Jillian Malone (liberal
  judge). It exercised 2023 state ballots, 2024 legislation and vetoes, the
  2024 presidential/Senate/House elections, and January 2025 agenda pages.
  The final stable base was April 28, 2025; no term-limit amendment, Court
  purge, `Ending.victory`, or game-over appeared. The agenda still showed
  conservative/minimal laws and 0% LCS awareness/support.
- Integrity metrics: 1,251/1,251 captures non-empty, maximum row width 80,
  zero over-wide captures, zero bridge errors, and zero terminal captures.
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy23-constellation-20260820/`.

## 2026-08-21 — high-impact route #24 through February 2025

- `playtester-strategy24-high-impact-20260820` ran a fresh Portuguese Seattle
  campaign from January 1, 2023 through February 1, 2025. It used the stock
  `Os tempos estão mudando`, `Céu Azul e Límpido` (CCS disabled), and `Poder
  para o povo` options; no debug flag, fixture, save import, source edit,
  CDP attachment, or headed browser was used.
- Jerome Damon took the age-18 lawyer route, assigned Roberta Jeong to
  `A -> 3` sleeper expansion, recruited Mindy Zito, and exercised legal
  courthouse conversations with police. The final agenda showed President
  Tucker Africa, visible House counts 62 Lib+ / 58 Lib / 50 moderate, and
  Senate counts 16 Lib+ / 16 Lib / 9 moderate. Media overview showed 28.0%
  liberal views and 0.0% LCS support; laws remained conservative/right-
  authoritarian. No term-limit amendment, Court purge, `Ending.victory`, or
  game-over appeared.
- Integrity metrics: 475/475 captures non-empty, maximum row width 80, zero
  over-wide rows, zero bridge errors, and zero victory/game-over captures.
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy24-high-impact-20260820/`.

## 2026-08-21 — public-mood route #25 through January 2025

- `playtester-strategy25-public-mood-20260821-rerun` ran a fresh Portuguese
  Seattle campaign from January 1, 2023 through January 26, 2025. It used
  the ordinary `Os tempos estão mudando`, `Céu Azul e Límpido` (CCS off), and
  `Poder para o povo` options. Bella Carberry used legal graffiti and
  Guardian writing; the route naturally recruited Zack Bacall and Juliana
  Castro (lawyers), Gábor Downing (police officer), and Myron Thurgood
  (education worker). All infiltrated agents were assigned legal Liberal
  advocacy.
- The final media page showed 34.9% liberal views and 0.0% LCS support. The
  final agenda showed President Meghan Ginsberg, House counts of 86 Lib+ / 57
  Lib / 43 moderate, Senate counts of 17 Lib+ / 17 Lib / 9 moderate, and
  substantially conservative active laws. No `Ending.victory`, constitutional
  shortcut, or game-over screen appeared.
- This was stock-cheatless: no debug flags, fixtures, save import, source
  edits, CDP, or headed browser. All 450 parsed captures were non-empty, the
  maximum row width was 80, and there were zero over-wide rows, bridge errors,
  victory markers, or game-over markers. The three known English hits were
  the stock title/language screens and a quoted proper title in a Portuguese
  news item.
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy25-public-mood-20260821-rerun/`.

## 2026-08-21 — strategy 27 police-combat defeat checkpoint

- Fresh Portuguese stock route `playtester-strategy27-gameover-20260821` used
  Washington, DC, a violent-gang founder origin, `Os tempos estão mudando`,
  `Sangue Ruim`, and `Poder para o povo`. It planned and executed an ordinary
  `Delegacia de Polícia` visit, forced a locked door, and fought escalating
  police/SWAT encounters until the squad was incapacitated.
- `091-game-over.json` / `092-after-game-over-news.json` captured the natural
  Portuguese defeat/news checkpoint: `Felizmente, os marginais da LCS foram
  detidos por cidadãos corajosos.` Clive survived into trial, pleaded guilty,
  and received `prisão perpétua`; no `Ending.victory` or literal game-over
  marker fired after the bounded squad-defeat screen.
- Stock-cheatless integrity held: no debug flags, fixtures, save import, CDP,
  headed browser, or source edits. Valid captures were width-safe (max row 80)
  with zero over-wide rows and zero bridge errors. No new PT issue was found.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy27-gameover-20260821/`.

## 2026-08-21 — strategy 26 stock natural-victory route through March 2025

- The authoritative rerun
  `playtester-strategy26-natural-victory-20260821-rerun` was a fresh
  Portuguese, stock-cheatless Seattle route. CCS was explicitly disabled by
  the stock `Céu Azul e Límpido` option. No cheats, debug flags, fixtures,
  save imports, source edits, CDP, or headed browser were used.
- Lex Patterson started the age-18 lawyer route. Zoë Schröder initially
  expanded the sleeper network; when the UI later disabled `A -> 3` for lack
  of energy/recruiter capacity, the route preserved that fact and assigned
  the available agents to Liberal advocacy. Ordinary recruitment legally
  produced Professor Bea Woodrow and Actor Maximilian Suzuki; both were
  sleeperized with the normal `B` choice. The final six sleepers all showed
  `Promovendo o Liberalismo`.
- The route advanced through the 2024 elections, January 2025 legislation,
  and an ordinary-wait extension to 17 March 2025. Final media showed 32.9%
  liberal views and 0.0% LCS support; the agenda still showed conservative
  laws, Jim Quirk as president, House 91 Lib+ / 50 Lib / 41 moderate, and
  Senate 19 Lib+ / 13 Lib / 11 moderate. No constitutional shortcut,
  `Ending.victory`, or game-over screen appeared.
- Integrity: 977/977 recursive captures non-empty, max row 80, zero
  over-wide rows, zero bridge errors, and zero victory/game-over captures.
  Four raw-English hits were found: two expected pre-Portuguese setup
  screens and two mixed/quoted news buffers.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy26-natural-victory-20260821-rerun/`.

## 2026-08-21 — strategy 30 police-defeat rerun

- Fresh Portuguese stock route `playtester-strategy30-gameover-20260821` used
  Washington, DC, `Os tempos estão mudando`, `Céu Azul e Límpido` (CCS off),
  `Poder para o povo`, and a five-person violent-gang founder.
- The route entered `Delegacia de Polícia`, forced the normal locked-door path,
  and sustained ordinary `F` combat until the squad was detained. Capture
  `359-game-over-terminal.json` contains the natural Portuguese police report;
  `360-after-game-over-news.json` says Andy Downing proceeded to trial. Because
  a liberal survived, this is not literal all-liberals-dead `Ending.gameOver`.
- Stock integrity held: no cheats, debug flags, fixtures, save imports, source
  edits, headed browser, or CDP. All 360 captures were nonempty, max row 80,
  with zero over-wide rows and zero bridge errors. The only raw-English hits
  were the initial title and language screens.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy30-gameover-20260821/`.

## 2026-08-21 — strategy 28 bounded media/legal route

- Fresh Portuguese stock campaign `playtester-strategy28-natural-victory-20260821`
  used Washington, DC, a charisma/persuasion-heavy legal activist founder, and
  ordinary donations, community service, courthouse recruitment, and sleeper
  advocacy. No cheats, fixtures, save imports, source edits, CDP, or headed
  browser were used.
- The route reached 1 November 2023 with 40.6% liberal views and 0.0% LCS
  support. A natural Dom Sellers embezzlement event led to a Portuguese guilty
  plea, clemency, and a two-month prison sentence; the founder returned to a
  normal base screen. No victory, defeat, or literal game-over ending fired.
- Integrity: 909 valid captures, every screen 25 rows with max width 80, zero
  over-wide rows, zero bridge errors, and no new translation/layout issue.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy28-natural-victory-20260821/`.

## 2026-08-21 — strategy 31 literal stock game-over

- Fresh Portuguese stock route `playtester-strategy31-literal-gameover-20260821`
  used a one-founder high-risk police-combat path. It selected Portuguese
  through the normal UI and used no cheats, debug flags, fixtures, save
  imports, source edits, CDP, or headed browser.
- Repeated ordinary police combat killed the entire liberal squad. Capture
  `076-gameover-check.json` is the genuine high-score terminal:
  `O Esquadrão do Crime Liberal foi morto em combate em Janeiro de 2023.`
  Captures 077–079 return to the title/high-score screens; no victory fired.
- Integrity: 78 captures, all nonempty, max row 80, zero over-wide rows, zero
  bridge errors, and only the initial title/language screens in the raw-English
  scan. Port 10143 and the browser session were stopped and verified clear.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy31-literal-gameover-20260821/`.

## 2026-08-21 — strategy 32 bounded media attempt

- Fresh Portuguese stock route `playtester-strategy32-media-victory-20260821`
  used Seattle, Clear Blue Skies, Power to the People, a persuasion-oriented
  founder, ordinary donations, and a normal vehicle purchase attempt. The
  route reached the Seattle courthouse map with US$1,004; the cheapest car was
  US$2,500, so intercity media access was unavailable.
- A police encounter trapped the unarmed one-person squad in the courthouse
  map at capture `089-forum-up3.json`. No victory, defeat, or game-over fired;
  the route was bounded rather than inferring media or political progress.
- Integrity: 89 nonempty captures, max row 80, zero over-wide rows, zero bridge
  errors, no cheats/debug flags/fixtures/save imports/source edits/CDP/headed
  browser, and only two initial English setup hits.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy32-media-victory-20260821/`.

## 2026-08-21 — strategy 33 bounded constitutional route

- Fresh Portuguese stock campaign `playtester-strategy33-constitutional-20260821`
  used New York, `Os tempos estão mudando`, `Céu Azul e Límpido`, `Poder para o
  povo`, and a high-intelligence/high-charisma manifesto founder. Ordinary
  donations and two journalist join-agreement conversations reached the NYC
  school base on 31 March 2023.
- The route stopped before sleeper influence, intercity media takeover, or
  constitutional checks. No victory or game-over terminal fired.
- Integrity: 205 nonempty captures, maximum row width 80, zero over-wide rows,
  zero bridge errors, no cheats/debug flags/fixtures/save imports/source edits,
  and no CDP/headed browser. No new Portuguese issue appeared.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy33-constitutional-20260821/`.

## 2026-08-21 — strategy 35 bounded Seattle broadcast route

- Fresh Portuguese stock-cheatless route `playtester-strategy35-broadcast-20260821`
  selected Seattle, a civil founder, ordinary donations, a sports car, and
  the normal AM Radio station visit. The locked-door path was forced through
  the Portuguese `Sim` prompt, then the alarmed map was explored with visible
  movement/flee actions.
- The studio marker never appeared, so the broadcast prompt and political
  gate were not reached. The run ended at the Seattle AM Radio map with no
  victory, defeat, or literal game-over screen.
- Integrity: 280 complete final-retry 25×80 captures, zero row-width defects,
  zero capture errors, and no cheats, debug flags, fixtures, save imports,
  source edits, CDP, or headed browser. No new translation/layout issue was
  confirmed.
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy35-broadcast-20260821/`.

## 2026-08-21 — strategy 36 bounded Washington political route

- Fresh Portuguese stock-cheatless campaign `playtester-strategy36-political-20260821` used Washington, DC, the default political climate, Clear Blue Skies, Power to the People, ordinary donations, and a normally obtained sports car.
- The route entered White House Level 2 and reached the normal security/Oval Office path. The President encounter was overshot while acknowledging movement/map prompts, so no President recruitment or sleeper conversion is claimed. The run returned naturally to the DC homeless base on 3 January 2023 without victory, defeat, or literal game-over.
- Integrity: 116 parseable captures, 115 complete 25×80 frames, zero row-width defects, zero capture errors, and no cheats, debug flags, fixtures, save imports, source edits, CDP, or headed browser. No new Portuguese or layout issue was confirmed.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy36-political-20260821/`.

## 2026-08-21 — strategy 37 stock President recruitment route

- Fresh Portuguese stock-cheatless campaign `playtester-strategy37-president-20260821` used Washington, DC, the legal default climate, Clear Blue Skies, and the normal White House Level 2 route.
- The run reached the Oval Office and captured the localized President encounter (`O Presidente está no Salão Oval.`), then completed the Portuguese politics conversation with President Zappa. The later recruitment meeting chose sleeper preparation `B`; President Zappa rejected the follow-up and stated there would be no further meeting. The run returned to base without a sleeper conversion, victory, defeat, or literal game-over.
- Integrity: 136 authoritative nonempty headless captures, maximum row width 80, zero over-wide rows, zero bridge errors, and no cheats, debug harness, fixtures, save imports, source edits, CDP, or headed browser. The independent verifier stopped the browser and Flutter server cleanly.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy37-president-20260821/` (`summary.json`, `metrics.json`, `integrity.json`, and `route.md`).

## 2026-08-21 — strategy 38 stock President skills route

- Fresh Portuguese stock-cheatless campaign `playtester-strategy38-president-20260821` used Washington, DC, Clear Blue Skies, Power to the People, and a high-intelligence/legal/science founder. The authoritative `p38d` session walked the normal White House Level 2 route without alarm and reached President Buckner.
- The run captured the localized encounter `O Presidente está no Salão Oval.` and completed the Portuguese politics conversation. The persuasion check failed before a recruitment meeting; no sleeper conversion, victory, defeat, or literal game-over terminal appeared.
- Integrity: 86 authoritative nonempty headless captures, maximum row width 80, zero over-wide rows, zero bridge errors, and no cheats, debug flags, fixtures, save imports, state injection, source edits, CDP, or headed browser. The browser and Flutter server were stopped cleanly.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy38-president-20260821/` (`summary.json`, `final-metrics.json`).

## 2026-08-21 — prober PT-412 hostage-manager alarm audit

- Static prober review found three reachable hostage re-encounter alarm
  variants in `lib/sitemode/map_specials.dart` whose nested `line2` strings
  are explicitly `noTranslate: true`: nursing-home security, nursing-home
  nurses, and insurance CEO help calls. No matching canonical ARB keys exist.
- PT-412 is open pending an independent strict-headless replay. No runtime
  result or victory/game-over claim is inferred from the source audit.
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy39-natural-20260821/`
  (playtester route in progress) and the source locations recorded in
  `findings-doc/findings.md`.

## 2026-08-21 — static prober PT-413–PT-418 sitemode audit

- Source review found three reachable Portuguese sitemode paths that translate
  a template but pass raw English values through arbitrary interpolation
  parameters: insurance claims (`map_specials.dart:1525-1617`), display cases
  (`map_specials.dart:1825-1865`), and radio/Cable News broadcasts
  (`miscactions.dart:387-555`, entered by `map_specials.dart:1781-1822`).
- PT-413 covers claim/denial/short-label values; PT-414 covers selected display
  case items; PT-415 covers broadcast takeover, issue, and viewer/listener
  values plus the uncatalogued `talks about {issue}.` / `discuss {issue}.`
  second-line templates. PT-416 separately records two 83-cell Portuguese
  rows rendered directly by `encounterMessage`, one in the insurance safe and
  one in the bank vault. These are distinct from PT-306's media register issue,
  PT-342's stored media headline, PT-363's vault catalog gap, and the fixed
  PT-412 nested alarm literals. The same pass found PT-417's generic bar
  rejection reactions, distinct from PT-394's CCS-only bouncer/alarm strings,
  and PT-418's combat clothing-destruction interpolation, distinct from
  PT-279's daily clothing-repair fix.
- `dart run scripts/find_translatable_strings.dart --json --glob='sitemode/**'`
  completed the source inventory; `flutter test test/i18n_test.dart
  --plain-name='processString'` passed all 8 focused cases; and
  `dart run scripts/maintain_arb_catalogs.dart --check` reported both canonical
  locales valid. No browser, playtester session, fixture, victory claim, or
  source-code edit was used. All six tickets remain runtime-pending.
- The next replay must inspect `#lcs-playtest-buffer` after each normal map
  route and enforce non-empty 25×80 captures, no raw English, no bridge errors,
  and no over-wide rows; `sitemodePrompt` and `encounterMessage` write rows
  directly without fitting.

## 2026-08-21 — strategy 40 coalition route

- Fresh Portuguese stock-cheatless campaign
  `playtester-strategy40-coalition-20260821` used Washington, DC and a
  high-intelligence/high-charisma founder built through the normal questionnaire
  with law, science, business, and persuasion emphasis. The route assigned
  ordinary recruitment tasks and sleeperized Raghad Lin and Holly Bárány;
  `185-sleepers-list.json` records both infiltrated agents in DC.
- The route entered White House Level 2, followed the normal map path to the
  Oval Office, and captured the localized message `O Presidente está no Salão
  Oval.` at `317-oval-office-target.json`. The regular talk flow selected the
  President and completed a politics conversation; `326-politics-final.json`
  records President Takács agreeing to meet later that day.
- After the conversation the two Secret Service agents raised a normal alarm.
  With only the unarmed founder in the squad, movement toward the stairs was
  blocked by the alarmed encounter; `349-alarm-roster-blocked.json` is the
  bounded terminal capture. No literal `Ending.victory`, game-over screen, or
  new translation/layout defect appeared.
- Integrity: 348 nonempty headless captures, maximum row width 80, zero
  over-wide rows, zero bridge errors, and only two initial English setup hits
  before Portuguese was selected. No cheats, debug flags, fixtures, save
  imports, game-state injection, source edits, CDP, or headed browser were
  used. No production code was changed by this route.
- Verdict: no natural stock victory and no cheat-assisted victory; the route
  ended at an honest White House alarm blocker after a successful coalition,
  sleeper, and President-politics checkpoint.
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy40-coalition-20260821/`.

## 2026-08-21 — independent verifier PT-412/PT-413 follow-up

- PT-413 was replayed independently on a fresh rebuilt Flutter web-server and
  a separate headless Portuguese session. The normal insurance-office route
  reached the claims terminal and produced two localized variants:
  `Solicitação: Exame de ressonância magnética.` / `Negada: Nenhuma
  Autorização prévia...` and `Solicitação: Tomografia computadorizada.` /
  `Negada: Nenhuma Autorização prévia...`. A stock `N` response cleared the
  prompt and left the terminal map live.
- PT-413 captures 116, 118, and 119 were non-empty, exactly 80 columns wide,
  free of over-wide rows and bridge errors, and had no known raw-English claim
  or error sentinels. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt413-runtime-20260821/`.
  The stale 115 capture and all about:blank attempts are excluded. The
  successful approval (`S`) message was not captured, so PT-413 remains
  runtime-pending rather than being closed on prompt/denial evidence alone.
- PT-412 received a separate fresh nursing-home replay on `10153`; it reached
  the live Portuguese map and patient interactions with 80-column, no-error
  buffers but no manager alarm. No `10155` artifact was present. PT-412 remains
  pending, with `114-fresh-status-p412r4.json` as the valid status capture;
  empty/about:blank captures 112 and 113 are excluded.
- These verifier runs provide no victory or game-over evidence and used no
  cheats, fixtures, save imports, debug flags, CDP, headed browser, or source
  edits.

## 2026-08-21 — PT-418 combat clothing interpolation fix

- The combat `severloot` branch previously passed `cr.clothing.shortName`
  directly into the Portuguese clothing-destruction template. It now calls
  `LcsI18n.tr` before interpolation and uses the fitted console renderer,
  preserving the named armor translation without clipping in live combat output.
- The new focused regression
  `test/sitemode/clothing_destruction_translation_test.dart` confirms
  `Black Suit` renders as `Terno preto`, rejects the raw English value, and
  stays within 80 columns. The test-first red run failed on the missing source
  wiring; the green run passed after the one-line fix.
- PT-418 is **Fixed-pending-verify**. A fresh strict-headless Portuguese combat
  replay must still capture the live destruction message before closure.

## 2026-08-21 — independent verifier PT-413 approval-success replay

- A brand-new Flutter server (`10159`) and strict headless Portuguese session
  reached the insurance claims terminal through the normal Seattle route. The
  prompt capture `pt413-approval-20260821/001-approval-prompt.json` contains
  localized `Solicitação: Dispositivo Assistivo.` and `Negada: Nenhuma
  Autorização prévia... (Sim ou Não)`.
- A normal `S` response produced the localized approval line in
  `pt413-approval-20260821/002-approval-success.json`:
  `Alexa Hann aprova a solicitação de dispositivo auxiliar.` Combined with
  prior prompt/denial captures `pt413-runtime-20260821/116`, `118`, and `119`,
  PT-413 has direct prompt, denial, and approval-success proof and is closed.
- Both new captures are non-empty, max row 80, no over-wide rows, no bridge
  errors, and no raw-English sentinels. The replay was stock-cheatless: no
  cheats, debug flags, fixtures, save imports, source edits, CDP, or headed
  browser. The earlier 10158 browser-argument mistake was excluded.

## 2026-08-21 — independent verifier PT-414 courthouse display-case replay

- A fresh Flutter web server (`10165`) and strict-headless Portuguese session
  `p414courthouse_fresh_20260821/a` used the ordinary Seattle → Centro de
  Seattle → Fórum route and triggered a courthouse display case with `U`.
- The live prompt was `Você vê uma vitrine contendo um retrato de Ronald
  Reagan.` followed by the localized `Quebrar isso? (Sim ou Não)` action. A
  normal `S` response closed the prompt and removed the `Vitrine` legend.
- Both captures were non-empty, exactly 80 columns wide, free of raw-English
  values, over-wide rows, and bridge errors. No cheats, debug flags, fixtures,
  save imports, CDP, headed browser, or source edits were used. PT-414 is
  closed after direct live proof. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt414-courthouse-retry2-20260821/`.

## 2026-08-21 — strategy 41 New York media / AM Radio alarm blocker

- Fresh Portuguese stock-cheatless campaign
  `playtester-strategy41-newyork-media-20260821` used New York and a normal
  high-intelligence/high-charisma founder. Ordinary recruitment produced
  journalist Vince Sheen, who was sleeperized at `Canal de Notícias a Cabo`,
  and student Sonali Chen, who joined the active NYC squad.
- The two-member squad reached both local media surfaces and executed a
  normal `Estação de Rádio AM` visit. The Portuguese locked-door prompt was
  answered with the ordinary `Sim` key; `211-am-radio-force-door.json` records
  `Sonali Chen chuta a porta!`. An office worker then raised the alarm and
  `214-final-alarm.json` records the literal
  `NYC — Estação de Rádio AM, Nível 1: CONSERVADORES ALARMADOS` state.
- The route stopped at that honest unarmed alarm encounter. No literal
  `Ending.victory`, victory screen, `Ending.gameOver`, or game-over screen
  appeared. No new Portuguese translation or layout defect was confirmed.
- Integrity: 215/215 captures were nonempty headless frames, maximum row width
  80, zero over-wide rows, zero bridge errors, and only the two expected title
  / language setup frames contained English setup UI. No cheats, debug flags,
  fixtures, save imports, game-state injection, source edits, CDP, or headed
  browser were used; port 10155 and session `p41n` were closed cleanly.
- Verdict: no fresh stock-cheatless natural victory and no cheat-assisted
  victory. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy41-newyork-media-20260821/`.

## 2026-08-21 — strategy 42 long Seattle monthly-politics campaign

- Fresh strict-headless Portuguese stock route used `Os tempos estão mudando`,
  `Céu Azul e Límpido` (the normal setup explicitly says the CCS never
  appears), `Poder para o povo`, and a Seattle founder. Lavender Teige reached
  the first task assignment with Int 10 / Charisma 14 after the normal
  questionnaire. Setup evidence is `003-new-game.json`, `007-ccs-clear.json`,
  `021-base.json`, and `023-founder-activity-menu.json`.
- Normal recruitment produced journalists Racheal Winter and Carina Meléndez.
  Both were sleeperized in Seattle and assigned `Promovendo o Liberalismo`;
  Racheal later joined active service and was assigned
  `Escrevendo para o Guardião Liberal`. After donations reached US$3,372, the
  founder recruited engineer Willy Morton, sleeperized him at `SEA — Corp. HQ`,
  and assigned `Bisbilhotando` to discover secrets. Evidence:
  `091-racheal-sleeper-seattle.json`, `097-carina-sleeper-seattle.json`,
  `106-sleeper-tasks-complete.json`, `127-racheal-write-guardian-confirm.json`,
  `0934-willy-sleeper-corporate-hq.json`, and `0939-willy-task-confirm.json`.
- The route then advanced ordinary days with bounded acknowledgements and
  retained monthly legislative, state-ballot, financing-report, newspaper, and
  related political screens through `SEA — Sem-teto, 23 de set de 2024` in
  `1148-final-base.json`. The campaign was stopped as a parent-directed bounded
  finish while still nonterminal; it did not reach a victory or game-over
  screen.
- Integrity: 679/679 retained captures were nonempty, max row width 80, zero
  over-wide rows, zero bridge errors, and zero runtime raw-English files (the
  only English file was the expected pre-localization title setup frame).
  No cheats, debug flags, fixtures, save imports, state injection, CDP, headed
  browser, or production source edits were used. No new translation/layout
  defect was confirmed.
- Verdict: no natural stock-cheatless victory, no cheat-assisted victory, and
  no game-over. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy42-years-politics-20260821/`.

## 2026-08-21 — independent verifier PT-415 AM-radio replay

- Fresh strict-headless stock Portuguese session `pt415_radio_retry3_20260821`
  on server `10175` used the ordinary AM-radio route. Before the bounded
  checkpoint, the verifier used base-mode `X` to autosave and title-screen `C`
  to resume `lastGameId=4870023` normally; it then continued from the saved
  map instead of discarding the route.
- The route dismissed the full-map pause, opened the normal force-door prompts,
  walked to the `S` studio marker, used `U`, and answered `Sim`. The live
  buffer contained `O Esquadrão assume o controle do microfone e` followed by
  `fala sobre energia nuclear.`.
- The authoritative capture was non-empty, maximum row width 80, free of raw
  English and bridge errors, and used no cheats, debug flags, fixtures, save
  imports, CDP, headed browser, or source edits. The focused regression covers
  the shared TV, viewer/listener, and hostage variants; this live route claims
  only the AM takeover/issue path. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt415-runtime-20260821/003-am-radio-broadcast.json`.

## 2026-08-21 — prober operator-role candidate checkpoint

- A fresh Portuguese strict-headless route reached the Seattle police station
  with a generated `Police Officer`, rendered as `Oficial de Polícia`. The
  officer remained Conservative; normal talk did not convert them, and the
  unarmed founder died in combat before a Liberal could perform a lock, bash,
  or hack action. No direct English operator-role leakage was observed, so no
  PT ticket was opened.
- The prober validated persistence independently: base-mode `X` autosave,
  fresh session title-screen `C` resume at `SEA — Sem-teto`, then a final base
  `X` autosave. Save `gameId=8666347`, in-game date `2023-01-01`; sessions
  `operator-names-persist-20260821-a` → `-b`. Resources were cleaned.

## 2026-08-21 — independent verifier PT-416 insurance-safe prompt retry

- Fresh strict-headless stock Portuguese session
  `pt416_insurance_bank_20260821` on server `10177` reached the unique
  insurance safe. Normal `U` displayed `Você encontrou um cofre.` followed by
  `Quebrar? (Sim ou Não)`; normal `S` then reported
  `Você não consegue ninguém para fazer o trabalho.` because the generated
  five-member squad had no security skill.
- The capture was non-empty, maximum row width 80, free of raw-English
  gameplay, over-wide rows, and bridge errors. The fitted documents line and
  bank vault remain unverified; no ticket closure is claimed. The verifier
  then exited the site normally, used base-mode `X` autosave, and resumed via
  title-screen `C` with `flutter.lastGameId=3309341` (Hailey Rácz, 2 Jan 2023).
  Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt416-runtime-20260821/001-insurance-safe-prompt.json`.
  Save/resume evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt416-runtime-20260821/002-normal-save-resume.json`.

## 2026-08-21 — independent verifier PT-412 nursing-home alarm retry

- Fresh strict-headless stock Portuguese session `pt412_manager_20260821/a`
  on server `10178` used the ordinary NYC → Long Island → Casa de repouso
  Toque Feliz route, normal locked-door `S`, and ordinary combat/map inputs.
  The live state was `NYC — Casa de repouso Toque Feliz, Nível 1:
  CONSERVADORES ALARMADOS`; the nested manager cry/alarm marker remained
  unreachable in the internal corridor.
- The capture was non-empty, maximum row width 80, free of raw-English values,
  over-wide rows, and bridge errors. A normal `X` attempt remained a site-map
  movement key, so base-mode autosave/title `C` resume was impossible; no
  gameId was claimed. PT-412 remains pending. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt412-runtime-20260821/001-nursing-alarm.json`
  and `115-save-attempt-X.json`.

## 2026-08-21 — independent verifier PT-417 naked bar-rejection replay

- A fresh strict-headless Portuguese stock campaign stripped a one-member
  squad through the ordinary equipment screen, entered Desert Eagle Bar e
  Grill through the normal Seattle route, and triggered the nude bouncer
  rejection.
- The live line was `Porra! eu não queria ver seu bunda nu.`, proving the
  dynamic expletive and body-part values were localized before interpolation.
  The capture was non-empty, exactly 80 columns wide, free of raw-English
  values, over-wide rows, and bridge errors.
- No cheats, debug flags, fixtures, save imports, CDP, headed browser, or source
  edits were used. PT-417 is closed after direct live proof; the focused
  regression covers the remaining trans-person, no-profanity, and body-part
  variants. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt417-runtime-20260821/`.

## 2026-08-21 — independent verifier PT-418 White House combat replay

- Fresh strict-headless stock Portuguese session `i` reached the White House
  through the ordinary Washington route with Gerald March, an AK-102,
  `Terno preto`, and four ordinary gang members. The detector capture lists
  four localized `Serviço Secreto` enemies also wearing `Terno preto`.
- A bounded 60-round normal combat replay used slow waits and produced valid
  Portuguese combat buffers, but ended with only two Liberals alive while all
  four Secret Service remained standing. Five ordinary flee cycles then
  reached the Portuguese title after squad defeat; no live clothing-destruction
  sentence was captured. The earlier valid session `f` likewise ended in
  ordinary defeat before any `Terno preto` destruction line.
- All retained route buffers were non-empty, at most 80 columns wide, had no
  over-wide rows or bridge errors, and contained no raw-English clothing value.
  No cheats, debug flags, fixtures, save imports, CDP, headed browser, or
  source edits were used. PT-418 remains **Fixed-pending-verify**.
- A separate same-server setup session `g` demonstrated the requested
  persistence checkpoint: normal base-mode `X` recorded
  `flutter.lastGameId=7235917`, then a fresh browser session reopened the
  Portuguese title. The combat route itself reached site defeat before a
  second base-mode save was possible. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt418-runtime-20260821/`.

## 2026-08-21 — PT-416 bounded insurance retry with persistence checkpoint

- A fresh strict-headless stock Portuguese retry on server `10182` opened the
  insurance office through the normal localized door prompt. The apparent
  `$` marker was tested directly: `042-insurance-on-safe.json` showed
  `Saque no chão!`, and normal `G` revealed `Notebook` in
  `043-pickup-floor-loot.json`; it was floor loot, not the insurance safe.
- No fitted insurance-document line, safe prompt, or bank-vault requirement
  was captured. Later exploratory map captures after a helper naming mistake
  are explicitly excluded from integrity evidence. The authoritative captures
  remain non-empty, at most 80 columns wide, with no over-wide rows or bridge
  errors. PT-416 remains **Fixed-pending-verify**.
- The verifier completed the requested persistence handoff before cleanup:
  normal base-mode `X` recorded `flutter.lastGameId=172748` (Nick Grant,
  `3 de jan de 2023`), and a fresh title-screen `C` resumed the Portuguese
  base screen. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt416-runtime-20260821/`.

## 2026-08-21 — PT-412 bounded manager rerun

- A fresh strict-headless stock Portuguese session performed a normal base
  `X` checkpoint, then started a fresh founder route and reached the normal
  New York → Long Island site list. The nursing-home entry was visible in
  Portuguese, but the route stopped before entering the site and before the
  nested manager alarm marker could be reached.
- The last retained setup buffers were non-empty, max row 80, and bridge-error
  free. The input loop stalled during route progression; the owned server and
  browser were then cleaned up. PT-412 remains **Fixed-pending-verify**; the
  earlier direct localized site-alarm capture is still the only runtime alarm
  evidence. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt412-runtime-20260821/`.

## 2026-08-21 — PT-412 final fresh nursing-home verifier

- A fresh strict-headless stock `pt_BR` session on server `10184` followed the
  ordinary NYC → Long Island → nursing-home route. The site reached the
  localized `CONSERVADORES SUSPEITOS` state, but no `O` manager marker,
  administrator line, or nested cry/alarm line appeared before normal exit.
- The checked captures were nonempty, 25 rows, at most 80 columns wide, and
  free of over-wide rows, raw-English gameplay text, bridge errors, and runtime
  errors. PT-412 remains **Fixed-pending-verify** because the manager-specific
  runtime line is still unverified. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt412-runtime-20260821/fresh-captures-final/`.
- The verifier completed the persistence handoff: normal base-mode `X`
  autosave returned to the title and recorded `flutter.lastGameId=9825324`
  with `pt_BR`; same-session title `C` resumed the saved Portuguese base game.
  A replacement isolated browser could not see that save because its storage
  was separate. Evidence: `113-base-X-title.json`, `114-save-localstorage.json`,
  and `120-same-session-C-resume.json` in the report directory.

## 2026-08-21 — PT-416 fresh safe/bank retry

- A fresh strict-headless stock `pt_BR` session on server `10185` reached
  `SEA — Seguros Cuidado Humano` through the normal route and verified the
  localized claims terminal (`120-left-to-c.json` and
  `121-terminal-use.json`). This is ancillary PT-413 evidence, not PT-416
  closure evidence.
- Both visible `$` positions tested in this run were ordinary ground loot:
  `156-left-to-files-2.json` showed `Saque no chão!`, and normal `G` in
  `158-pick-loot.json` produced `Notebook`. No insurance-safe prompt,
  fitted-documents line, or bank-vault `V` prompt was reached. PT-416 remains
  **Fixed-pending-verify**.
- The run ended in a normal Portuguese alarmed encounter with movement blocked
  while enemies remained. Its authoritative captures were nonempty, at most
  80 columns wide, with no over-wide rows, raw-English gameplay text, bridge
  errors, or runtime errors. The noticed-enemy state prevented a base-mode `X`
  autosave and title `C` resume; the in-page `flutter.lastGameId=9189434` was
  not treated as a save checkpoint. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt416-runtime-20260821/fresh-captures-v8/`.

## 2026-08-21 — PT-418 fresh White House combat replay j

- A fresh strict-headless stock `pt_BR` session on server `10186` followed the
  ordinary Washington, DC → National Mall → Casa Branca route. Capture
  `027-detector-entry.json` shows four localized `Serviço Secreto` enemies in
  `Terno preto`; synchronized ordinary Daishō combat ran through capture 183.
- No clothing-destruction line appeared. The only `destruído` hits described
  squad body-organ damage. Capture `184-game-over-c.json` records the localized
  natural defeat, and `185-game-over-enter.json` returns to the Portuguese
  title. PT-418 remains **Fixed-pending-verify**.
- All 207 fresh captures were nonempty, at most 80 columns wide, with no
  over-wide rows, runtime errors, raw-English gameplay hits, or bridge errors.
  Site defeat prevented base-mode `X` autosave and title `C` resume, so no save
  claim is made. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt418-runtime-20260821/fresh-captures-j/`.

## 2026-08-21 — Strategy44 broad natural-victory campaign

- A fresh stock `pt_BR` campaign used ordinary recruiting, infiltration,
  writing, community service, and Liberal Disobedience assignments. By June 1,
  the valid media overview reached 42.8% Liberal views and 60.6% LCS support
  (`654-jun1-media.json`), with nonempty 80-column buffers and no errors.
- The campaign produced no natural victory or game-over ending. The attempted
  stop hit an `about:blank` reload before base-mode `X`; `655-current.json` is
  excluded, and title `C` could not resume because localStorage had no
  `flutter.lastGameId` (`657-localstorage.json`). No save/resume claim is made.
  Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy44-victory-20260821/`.

## 2026-08-21 — Strategy45 full stock election-cycle replay

- A fresh strict-headless stock `pt_BR` campaign used the ordinary Seattle
  homeless-camp start with Clear Blue Skies, recruited four regulars, and ran
  nonviolent Liberal Guardian writing, community service, and lay-low tasks.
  It advanced through the full 2024 presidential, Senate, House, and state
  election cycle without combat or runtime shortcuts.
- The post-election agenda (`1298-agenda-post-election.json`) still showed
  mixed institutions and laws: President David Day, House `68 Lib+ / 49 Lib /
  51 moderate` with the remainder conservative, and Senate `18 Lib+ / 16 Lib /
  7 moderate` with the remainder conservative. The strict `winCheck` gate was
  therefore false. Media capture `1300-media-post-election.json` reported
  35.9% Liberal views and 59.2% LCS support on 11 Nov 2024; support is not a
  victory condition. No natural victory or game-over terminal appeared.
- The run retained 1,297 nonempty gameplay captures (1,305 JSON files total;
  eight intentional bufferless localStorage metadata files excluded), all at
  most 80 columns wide with zero over-wide rows, bridge errors, or decisive
  raw-English hits. No cheats, debug controls, fixtures, save imports, CDP,
  headed browser, or source edits were used.
- Persistence was verified repeatedly. The final normal lowercase `x` save
  reached the title (`1302-x-nov11-title.json`), recorded
  `flutter.lastGameId=4679123` (`1303-x-nov11-storage.json`), and lowercase
  `c` resumed the same Portuguese campaign (`1304-resume-nov11.json`). The
  owned browser/session and Flutter server were cleaned up afterward.
  Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy45-victory-20260821/`.

## 2026-08-21 — Strategy46 active-CCS sleeper/election replay

- A fresh strict-headless stock `pt_BR` campaign selected the normal active
  CCS variant (`Nós não iniciamos o fogo`), used a Washington, DC founder with
  the ordinary sleeper-lawyer questionnaire choice, and activated Shane Pelosi
  (Advogado) as a normal `Promovendo o Liberalismo` sleeper. An ordinary
  University Student, Justine O, joined later; the founder used nonviolent
  community service. No cheats, debug controls, fixtures, save imports, CDP,
  headed browser, or source edits were used.
- The campaign completed the 2024 presidential, Senate, House, and state
  election reporting sequence and returned to base on 1 Nov 2024. The active
  CCS remained undefeated. A normal CCS route reached the DC planning map but
  was blocked by the stock `O Esquadrão ainda não é Liberal o suficiente`
  requirement, with no car or funds for another city; no intelligence-
  supercomputer or backer-list prompt appeared. No natural victory or
  game-over terminal was captured.
- A rescan of 1,083 gameplay captures found every buffer nonempty with raw
  newline-derived `maxRow=80`, no over-wide rows, no bridge/runtime errors,
  and no raw-English UI/message hits (the intentional `Enter/Escape` control
  label was excluded). Four inline-metadata evaluator outliers were corrected
  by the authoritative raw-buffer rescan.
- Persistence was verified before, after, and at the end of the election
  cycle. Lowercase `x` reached the title and lowercase `c` resumed the same
  Portuguese campaign in checkpoints `506`–`508`, `0857`–`0859`, and
  `0862`–`0864`; each storage artifact recorded
  `flutter.lastGameId=5729550`. The owned browser/session and Flutter server
  were cleaned up afterward. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy46-victory-20260821/`.

## 2026-08-21 — Strategy47 intelligence-HQ natural game-over replay

- A fresh strict-headless stock `pt_BR` campaign used a capability-focused
  questionnaire (intelligence, computers, security, stealth, and sports car),
  ordinary legal fundraising/recruitment, and the DC → Arlington → Intelligence
  HQ route. Three locked doors were opened through normal prompts. No cheats,
  debug controls, fixtures, save imports, CDP, headed browser, or source edits
  were used.
- An alarmed Secret Service/guard-dog encounter killed the lone founder before
  the supercomputer/backer-list objective. Capture `185-intel-no-squad-c.json`
  directly says `O Esquadrão do Crime Liberal foi morto em combate em Janeiro
  de 2023.` (`gameOver=true`, `victory=false`); this is natural game-over, not
  victory evidence.
- All 185 captures were nonempty with maximum row width 80, no over-wide rows,
  runtime errors, or bridge errors. English text was limited to the pre-locale
  title/language screens and intentional key legends; no raw-English gameplay
  sentence appeared after the Portuguese title.
- No base-mode lowercase `x`/title `c` checkpoint is claimed: site combat killed
  the sole founder before base return. Terminal storage recorded
  `flutter.lastGameId=3884001` but null founder/date, so no save import or resume
  was inferred. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy47-victory-20260821/`.

## 2026-08-21 — Strategy48 equipped Intelligence-HQ replay

- A fresh strict-headless stock `pt_BR` campaign selected active CCS, used a
  sports-car/intelligence/computer/security-oriented questionnaire, raised
  funds normally, and recruited a five-member NYC squad. The final roster
  included the founder, two gang members (9mm and knife), and two students;
  all movement, recruitment, and equipment inputs were ordinary. No cheats,
  debug controls, fixtures, save imports, CDP, headed browser, or source edits
  were used.
- The squad followed the normal Manhattan → Intelligence HQ route and opened a
  Level 1 locked door through lowercase `s`. A Secret Service/secretary/
  programmer encounter forced ordinary combat; the squad lost Noël and
  hospitalized Jackie, then returned to base through the failed-raid newspaper
  branch. The supercomputer/backer-list and safehouse-clearing routes were not
  reached, so no natural victory or game-over terminal was captured.
- The 260-capture integrity scan found all gameplay buffers nonempty with
  maximum row width 80, no over-wide rows, runtime errors, bridge errors, or
  post-locale raw-English gameplay text. The two empty buffers were intentional
  localStorage metadata records; the only English UI hit was the pre-locale
  title.
- Persistence was verified twice. Lowercase `x`/title `c` checkpoints
  `143`–`145` recorded `flutter.lastGameId=7882499` and resumed the same NYC
  campaign on 10 Jan 2023; final checkpoints `265`–`267` recorded the same ID
  and resumed on 17 Jan 2023. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy48-victory-20260821/`.

## 2026-08-21 — Strategy49 hidden-CCS political replay

- A fresh strict-headless stock `pt_BR` route selected the ordinary `Céu Azul e
  Límpido` option (`O CCS nunca aparecerá`), then used normal questionnaire,
  sleeper advocacy, fundraising, recruitment, infiltration, and base actions.
  The strongest valid v1 checkpoint had four active liberals and two infiltrated
  agents. No cheats, debug controls, fixtures, save imports, CDP, headed browser,
  or source edits were used.
- V1 ended in an `about:blank` runtime reset immediately after the live review;
  it had no terminal and no save checkpoint. A v2 restart reached a Portuguese
  base and lowercase `x` title, but storage inspection reset the tab before a
  game ID or resume could be established. These are runtime blockers, not
  natural endings.
- V3 provided authoritative persistence evidence: lowercase `x` title capture
  `296`, metadata `297` with `flutter.lastGameId=2475442`, founder Annis McGee,
  and 1 Jan 2023, then same-session lowercase `c` resume `298` with metadata
  `299`. A replacement browser lost IndexedDB state and stayed at the English
  title (`300`–`303`); that isolated-session failure is not inferred as a
  continuation.
- No natural victory or game-over terminal appeared. Across 292 retained
  gameplay captures, every buffer was nonempty, maximum row width was 80,
  over-wide rows and bridge errors were empty, and no raw-English gameplay UI
  appeared after localization. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy49-victory-20260821/`.

## 2026-08-22 — Strategy50 hidden-CCS service-route reset

- A fresh strict-headless stock `pt_BR` campaign selected the ordinary hidden
  CCS option (`Céu Azul e Límpido`, `O CCS nunca aparecerá`), used a normal DC
  founder with sleeper/recruitment choices, and reached a Portuguese Community
  Service base through ordinary input. No cheats, debug controls, fixtures,
  save imports, CDP, headed browser, or source edits were used.
- The valid v1 route ends at `108-base-service.json` with a nonempty 80-column
  buffer. The owned app/tab then reset to `about:blank` before lowercase `x`, so
  no game ID, `c` resume, election cycle, terminal, or victory can be claimed.
  Fresh v2/v5 title resets are retained only as excluded diagnostics, not as
  gameplay evidence.
- Integrity over 106 retained gameplay captures passed: all nonempty, maximum
  row width 80, no over-wide rows, runtime/bridge errors, or post-locale raw
  English. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy50-victory-20260821/`.

## 2026-08-22 — Strategy51 stable hidden-CCS political replay

- A fresh strict-headless stock `pt_BR` campaign selected `Céu Azul e Límpido`
  (`O CCS nunca aparecerá`), used a Seattle founder with an infiltrated-lawyer
  questionnaire path, activated Evan Nettles as a normal liberalism sleeper,
  recruited Hayley Nguyen, and assigned community service/Liberal Guardian
  work. The ordinary Seattle police-station route was entered and exited
  normally. No cheats, debug controls, fixtures, save imports, CDP, headed
  browser, or source edits were used.
- The campaign advanced through July 2023 legislative/media screens without a
  terminal. Public/media progress is not victory; the all-elite-liberal win
  check was not reached (`victory=false`, `gameOver=false`).
- Persistence was verified at setup and at the final July base. Lowercase
  `x`/`c` captures `022`–`024` and `405`–`407` resumed the same campaign with
  `flutter.lastGameId=9364255`, founder Don Pound, Seattle, and dates 1 Jan / 1
  Jul 2023. A site-mode `X` at `387` was movement only and is excluded as a
  save attempt.
- All 324 captures were nonempty and raw-buffer rescans were at most 80 columns
  with no actual over-wide rows, errors, or bridge errors. Fifty-three older
  batch files had malformed stored width metadata from a literal-newline split;
  their raw buffers independently rescanned at ≤80. Post-locale raw-English hits
  were empty. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy51-victory-20260822/`.

## 2026-08-22 — Strategy52 hidden-CCS election replay

- A fresh strict-headless stock `pt_BR` campaign selected hidden CCS (`Céu Azul
  e Límpido`, `O CCS nunca aparecerá`), used the distinct Sasha Tishman NYC
  founder/questionnaire route, recruited seven ordinary liberals (five active
  and two infiltrated sleepers), and assigned nonviolent community-service,
  Liberal Guardian, and sleeper-liberalism work. No cheats, debug controls,
  fixtures, save imports, CDP, headed browser, or source edits were used.
- The campaign advanced through the complete 2024 legislative, presidential,
  Senate, House, and statewide-ballot sequence, then continued normally to 29
  Jan 2025. No natural victory or game-over terminal appeared; election,
  support, and recruitment milestones are not treated as victory.
- Persistence was verified repeatedly with normal base-mode lowercase `x` and
  same-session lowercase `c`. The final checkpoint is captures `677`–`679`;
  metadata records `flutter.lastGameId=7347674` and `pt_BR`, and the resumed
  buffer is the same NYC base campaign.
- Integrity over 2,818 JSON captures passed: zero empty buffers, `about:blank`
  URLs, runtime errors, stored-width mismatches, or over-wide rows; independent
  raw-buffer rescans found a maximum width of 80. Raw English was limited to
  the intentional pre-locale title/language captures. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy52-victory-20260822/`.

## 2026-08-22 — Strategy53 active-CCS full-squad HQ replay

- A fresh strict-headless stock `pt_BR` campaign kept the active CCS option
  (`Sangue Ruim`), used Seattle founder Katelin Fekete with a normal
  computer/security-oriented questionnaire, recruited and funded normally,
  and formed a genuine five-member squad (Lowell, Raven, Melvin, Andrew, and
  Katelin). No cheats, debug controls, fixtures, save imports, CDP, headed
  browser, or source edits were used.
- The full squad reached Intelligence Headquarters, unlocked the ordinary
  doors, and entered the deeper site area. The alarmed Secret Service/Agent
  encounters produced sustained normal combat; Lowell died, Melvin fell, and
  later retreat attempts reached another three-guard encounter. The run
  remained in hostile site combat before the Intelligence Supercomputer or
  backer-list interaction, so no natural victory or game-over terminal was
  captured. The final capture is explicitly an in-combat screen, not an
  ending.
- Persistence was verified before the HQ retry: lowercase `x` title capture
  `539`, metadata `540` with `flutter.lastGameId=2713844` and `pt_BR`, then
  lowercase `c` resume `541` with the same five-member base roster. Site combat
  prevented a second base-mode save; the earlier checkpoint is authoritative.
- Integrity over 710 JSON captures passed: all buffers nonempty, maximum row
  width 80, zero over-wide rows, errors, bridge errors, or post-locale raw-
  English hits. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy53-victory-20260822/`.

## 2026-08-23 — Strategy54 recovery / Strategy57 fresh-current continuation

- Strategy54 session `str54-v1` was already `about:blank`. Navigation back to
  the old server produced an English title; storage capture `3428` showed no
  `flutter.lastGameId`, no language key, and a `lcs_new_age` database with no
  usable save store. The prior campaign was therefore lost and was not treated
  as recoverable. Evidence remains in the Strategy54 artifact.
- A distinct stock-cheatless Strategy57 campaign was started at HEAD commit
  `e682cadd` from a fresh release snapshot on port 10257 in new isolated strict
  headless session `str57-a`. The founder is Kim Aguilera (Seattle,
  manifesto/history route), gameId `9147028`, locale `pt_BR`.
- Early persistence: lowercase `x`, metadata, full same-tab reload, metadata,
  then lowercase `c` restored the campaign (`032`–`036`). This reconciles the
  old Strategy54 IndexedDB blocker as fixed at current HEAD.
- Explored location cycling across Seattle/New York/Los Angeles/DC safehouses,
  all five Liberal Agenda pages, media overview, finance report, review screens,
  activity assignment/bulk assignment, department clothing purchase, pawn-shop
  liberal tools, Internet Café site entry/movement, and ordinary newspaper and
  legislative event flows. No cheats, debug controls, fixtures, imports, CDP,
  headed browser, or source edits were used.
- Recruited Shenna Obama and Jenny Stripe through ordinary College Student
  recruitment conversations and regular-member join prompts, then bulk-assigned
  both to community service while Kim continued recruiting. A durable reload
  checkpoint after June recruitment restored the three-member roster
  (`checkpoint03-*`). The run advanced normally to 5 Jul 2023 with no natural
  victory or game-over terminal.
- Confirmed PT-426: the zero-result recruiting screen omits the expected
  localized failure/success feedback and returns directly to base. Reconciled
  PT-STR54-002 as PT-427, Closed — not reproducible at HEAD. Artifact-local
  PT-STR54-001 remains gameplay logic outside translation/layout scope and was
  not reproduced during this bounded continuation.

## 2026-08-23 — prober i18n/layout B confirmation sweep

- Audited pushed HEAD `dc459f66` on `feature/localization`, preserving the
  concurrent uncommitted findings/workflow edits already present. Ran catalog,
  interpolation, analyzer, and full Flutter validation. One exploratory
  `find_translatable_strings.dart` invocation accidentally ran in its default
  mutating mode; the generated catalog changes were restored immediately, and
  all later extractor use was `--print-only`.
- Built AST scans for direct interpolated display arguments, `.name`/enum-like
  parameters, literal display parameters, and long PT values. Triaged the
  results against existing tests/tickets. Deterministic red console/widget
  tests confirmed seven new issues (PT-428 through PT-434); raw evidence and
  scanner outputs are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-b-20260823/`.
- Removed the temporary failing test after capturing evidence so the checkout
  contains only documentation updates from this prober. No production code or
  canonical ARB files were changed.

## 2026-08-23 — prober i18n/layout A static/live sweep

- Audited current HEAD `e682cadd` on `feature/localization`. Catalog validation
  and interpolation checks were clean. Focused newspaper/siege/disband/core/
  talk/startup/map-editor/site suites passed (100 tests).
- Started a fresh strict-headless Portuguese campaign with wrapper session
  `prober-i18n-layout-a-r1`, disposable HTTP port 10421, and no cheats, debug
  controls, fixtures, save imports, CDP attach, headed browser, or production
  edits. The route reached the PT base screen and captured title/new-game/
  founder/base/equipment/assignment surfaces.
- A deterministic 25×80 console harness reproduced seven fixed-width defect
  groups, filed as PT-419 through PT-425. Evidence and exact stock verifier
  routes are in `findings-doc/findings.md`; raw harness output is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-a-20260823/`.
- Rejected trailing-space false positives for PT-398 and Cable News `ZERO`,
  plus extractor false positives from adjacent literals/localized fragments.
  Kept the pre-locale `File:` loading label as a probe candidate only.

## 2026-08-23 — Pending-ticket independent verification

- Verified current build `e682cadd` on localhost port 10732 with strict-headless
  sessions only. PT-412 ran 16 fresh generated nursing-home campaigns; no `O`
  manager office appeared, so the former-hostage alarm branch remained blocked.
- PT-416 reached `Seguros Cruz Azul` normally, but reached `$` candidates did
  not yield the safe prompt/document row; the First American Bank vault was not
  reached. PT-418 exercised ordinary combat in three routes with `Jaqueta Punk`,
  including hundreds of rounds, but never captured armor destruction.
- All three tickets retain **Fixed-pending-verify**. Integrity summaries passed
  for 2,344 retained captures; no required success line was present. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pending-20260823/`.

## 2026-08-24 — Batch B independent verification

- Rebuilt artifact commit `a4e874ea` with Flutter 3.35.4 and served it from
  localhost `10741`. Used fresh strict-headless wrapper sessions only; no
  cheats, fixtures, imports, source edits during runtime, CDP, or headed
  browsers.
- Closed PT-419 through PT-421 on ordinary Portuguese disband, equipment, and
  review routes. PT-422 through PT-425 remain pending because their natural
  siege, anchor, landlord-cancel, and interruption branches did not occur or
  were blocked before the target text rendered.
- PT-426 remains pending after Engineer, Locksmith, and Sculptor recruiting
  routes: every natural ask resolved to at least one candidate, so the
  zero-result branch never rendered.
- Focused layout and recruiting suites passed (9 tests), interpolation and ARB
  catalog checks were clean, and machine integrity passed for 947 retained
  buffer captures: height 25, maximum width 80, no over-wide rows, empty
  bridge/browser errors, and no raw English target fragments. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-layout-batch-b-20260823/`.
## prober-i18n-layout-c route attempts
- 2026-0824 audit started at origin HEAD a0aa9c79.
- `find_translatable_strings.dart` mutated catalogs during discovery; restored immediately and did not use its additions as evidence.

## 2026-08-24 — prober i18n/layout C dynamic-composition sweep

- Audited origin HEAD `a0aa9c79`. Catalog validation, interpolation check, and
  translation-status checks were clean before changes. Scoped extractor dry-runs
  covered justice/hostage/chase/loot/sleeper/newspaper/politics/travel/editor/
  save/help/score paths; no new missing PT key was found.
- Deterministic probes confirmed PT-435 through PT-442: election alignment
  composition, desktop import title, unbounded import diagnostics, narrow map
  editor overflow, interrogation article/quoting, ransom gender agreement, and
  sleeper/president noun agreement.
- Runtime persistence probe used only wrapper session `prober-layout-c-r1`,
  strict-headless Chromium, current rebuilt web assets, and localhost port
  10873. Selecting Portuguese persisted under `flutter.language` and reload
  restored the PT title. No bridge/runtime errors appeared.
- Rejected for tickets: scoped extractor false positives (`Unknown`, computed
  purge headings, numeric/display shells), constitutional Yea/Nay layout,
  equipment stack labels, high-score ending/date/name rendering already covered,
  and map validation dialog beyond the filed editor-layout issue.
- Temporary red/widget tests were copied into the artifact and removed from the
  checkout; documentation only remains from this prober.
- Final validation passed: `git diff --check`, ARB catalog check,
  interpolation check, `flutter analyze`, and six focused localization/layout
  suites (23 tests).

## 2026-08-24 — Batch C verification attempt

- Rebuilt artifact commit `97bdd8d5` with Flutter 3.35.4 and served only that
  snapshot on localhost `10751`. Used fresh strict-headless wrapper sessions
  `verify-layout-c-setup-a` and `verify-layout-c-pt434-a`; no cheats, fixtures,
  imports, source edits during runtime, CDP, or headed browsers.
- Both focused suites passed: batch B localization/layout (6 tests) and
  high-score layout (4 tests). Machine integrity passed for 728 retained buffer
  captures: height 25, maximum width 80, no over-wide rows, and empty
  bridge/browser errors.
- PT-428 through PT-434 remain verification-pending because the required stock
  success states did not render. Police-station attempts reached ordinary
  civilian encounters and one natural death, but not a carrier profile; a long
  custom slogan could not be retained through the natural death route. November
  elections, courthouse self-defense, dating vacation, multi-effect media, and
  five-digit title counters were unreachable within bounded ordinary play.
- Evidence and build manifest:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-layout-batch-c-20260824/`.

## 2026-08-24 — independent verification PT-435–PT-442

- Built isolated web snapshot `2d10f02d11e699fd50569b2656c15689eca35910` with Flutter
  3.35.4 and replayed it strictly headless on loopback port 34855.
- PT-435 is reopened: fresh Portuguese 2028 election nominees use localized alignment words but
  still render doubled comma-space separators (`capture-004-pt435-election-2028.json`).
- PT-436/PT-437 remain pending: focused regressions pass, but the web import action exposed no
  file input, so the required native picker title and malformed-file diagnostic were unreachable.
- PT-438 remains coverage-only pending: direct narrow map-editor widget probes pass, while the
  stock public route stayed unavailable because the development flag was not enabled.
- PT-439–PT-442 remain pending: gender/punctuation/article regressions pass against the isolated
  build, but ordinary play did not reach their required live branches in this pass.
- Focused batch C plus context/map suites passed (9 and 58 tests). Interpolation integrity found
  zero unclassified items and ARB catalog validation passed for both locales.

## 2026-08-24 — prober i18n/layout D dynamic-path sweep

- Audited pushed HEAD `eb80153f` after fetch/rebase. Catalog validation,
  interpolation default/all checks, translation status (100% source coverage),
  and analyzer were clean before checkout changes. Temporary red/widget tests
  confirmed PT-443 through PT-451 and were copied to the artifact, then removed;
  no production or canonical catalog files changed.
- Deterministic probes covered hospital transfer/burn, dating and recruitment
  rejection, sleeper profession recruitment, President cabinet reports, trial
  self-defense, newspaper datelines, generated pawnshop articles, and repeal
  amendment prose.
- Runtime smoke used only strict-headless wrapper session `prober-layout-d-r1`,
  isolated current-HEAD web assets from commit `eb80153f`, and loopback port
  `11521` with `?playtest=1`. Portuguese selection persisted as
  `flutter.language="pt_BR"`, reload restored the PT title, and options/help
  navigation produced no browser errors. The session and server were stopped.
- Rejected vehicle name/status composition, monthly finance/equipment summary
  layout, save-menu fitted cells, options/help paging width, high-score fitted
  variants, headline/caption/filler width, harmless constitutional trailing
  spaces, quote-scan false positives, and reachable CCS safehouse widths.
- Focused existing suites passed: batch C regression, interface options, high
  scores, site translation, and vehicle layout (35 tests). Post-probe catalog
  and interpolation-all checks passed. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-d-20260824/`.

## 2026-08-24 — playtester strategy58 broad terminal

- Rebuilt artifact commit `ef336d42` with Flutter 3.35.4 and served it from
  localhost `10958` under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy58-broad-terminal-20260824`.
  Used fresh strict-headless wrapper session `str58-a` with explicit persistence
  flags; no cheats, fixtures, imports, source edits during runtime, CDP, headed
  browsers, or production changes.
- Started a fresh Portuguese Changing Times/Bad Blood Seattle campaign and
  reached the first safe base checkpoint. Lowercase `x`, storage inspection,
  reload, lowercase `c`, and resume proved gameId `9044896`, PT-BR locale,
  IndexedDB save-key restoration, Seattle base, date, and founder roster.
- Explored equipment, assignment, legal art fundraising, persuasion classes,
  site planning/visits, media/radio surfaces, monthly legislature, review/
  assets/load/high-score/changelog/options/import entry points, and repeated
  journalist recruiting. Esmerelda Cosgrove and Moe Brandis joined as regular
  members after ordinary meetings; a third journalist meeting remained pending.
- Performed additional lowercase `x`/metadata/reload/metadata/lowercase `c`
  checkpoints after February legislation and later recruitment. Final live
  state resumed at SEA — Sem-teto on 22 Feb 2023 with three active Liberals.
- No natural ending occurred, so this is a still-live checkpoint rather than
  victory/game-over. Web exposes IndexedDB save management but no game-native
  file export under `saves/`; that limitation is documented.
- Machine integrity passed for 376 retained buffer captures: nonempty gameplay
  buffers, height 25, max width <=80, no over-wide rows/collisions, empty
  bridge/browser errors at checkpoints, and zero raw-English scan hits in 373
  post-locale captures excluding accepted decisions/pre-locale title.

## 2026-08-24 — Batch E verification attempt PT-443–PT-451

- Built isolated web snapshot `b749efe355b3c1e2cdb3feaa57bb11190f7ddcd5` with Flutter 3.35.4 after fetch confirmed origin unchanged. Served only that snapshot on loopback port 38971 with `?playtest=1`.
- Used fresh strict-headless session `verify-layout-e-setup-a` with ordinary routes, bridge keys, safe x/reload/c checkpoints, no cheats/debug flags/fixtures/imports/runtime source edits/CDP/headed browsers.
- PT-443 through PT-451 remain **Fixed-pending-verify**: none rendered its required success branch during bounded ordinary play. Dating produced a natural conversion rather than failure; a female-recruiter attempt did not reach dangerous-extremist copy; sleeper recruiting stayed juice-gated.
- Batch-D focused suite passed 9/9 on the isolated source; interpolation check found zero missing/invalid items; ARB validation passed. Machine integrity passed for 1,088 numbered buffer captures: nonempty buffers, height 25, max width <=80, no overflow/collision issues, and four browser-error checkpoints were empty. Raw-target English scan had zero hits.
- Evidence/build logs/integrity summary: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-layout-batch-e-20260824/`.

## 2026-08-24 — prober i18n/layout E rare-branch sweep

- Audited pushed origin HEAD `f4cba427` after fetch/rebase. Catalog validation,
  interpolation check, translation status (100% source coverage), and an AST
  inventory of 3,953 translation/display calls were clean or used only as audit
  evidence. No production files were changed.
- Deterministic probes confirmed PT-452 through PT-459: untranslated CCS final
  actions and hidden-safehouse guidance, corporate/mob siege fallbacks, Broadway
  interview cancellation, raw failed-car-search names, the paged-counter shell,
  and masculine singular purge agreement.
- Runtime smoke used only strict-headless wrapper session `prober-layout-e-r1`,
  isolated current-HEAD web assets from commit `f4cba427`, and loopback port
  `11725` with `?playtest=1`. Portuguese persisted as `flutter.language="pt_BR"`,
  reload restored the PT title, options navigation produced no browser errors,
  and the server/session were stopped after capture.
- Rejected hospital dating/ransom/chase variants as covered or invariant;
  rejected CCS victory paragraphs, backer reports, safehouse widths, high-score
  endings/custom slogans, save/import errors/options, and map-editor narrow
  layouts as already fixed or tested. A prison labor/rehab double-render remains
  probe-only because it was not independently reproduced.
- Focused red evidence passed as current-behavior assertions before its
  temporary repository file was removed. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-e-20260824/`.

## 2026-08-24 — playtester strategy59 ordinary combat pressure

- Built isolated web snapshot `b749efe355b3c1e2cdb3feaa57bb11190f7ddcd5` with
  Flutter 3.35.4 after confirming that SHA matched pushed
  `origin/feature/localization` at run start. Served only that snapshot on
  loopback port `18765` with `/?playtest=1`.
- Used fresh strict-headless wrapper session `str59-a` (namespace
  `strategy59`; UA `HeadlessChrome/150.0.0.0`) with bridge keys only. No cheats,
  debug fixtures, save imports, headed Chrome/CDP, runtime source edits, or
  production changes.
- Created a fresh Portuguese Changing Times/Bad Blood campaign. Bought a .45
  pistol/ammo at the pawn shop, recruited Patton Meir and Winifred Keitel from
  the drug house through ordinary meetings, formed squads, explored maps,
  equipment, assignment options, media, agenda, sleepers, newspapers, trials,
  prison, and interface options.
- First three-member police fight produced wounds, Patton's natural death,
  Winifred carrying him, arrest, newspaper coverage, acquittals, and return to
  base. A later founder/Winifred police fight ended in another natural arrest;
  both pleaded guilty, served sentences, and returned by 1 Aug 2023.
- Performed two genuine durability checks with lowercase `x`, IndexedDB/
  localStorage metadata, same-session reload, lowercase `c`: gameId `3377139`
  restored the January equipment/date and later restored the August checkpoint.
- The campaign remains live at SEA — Sem-teto on 1 Aug 2023 with Winifred active
  in `Coverage59`; Lindsey is alive but unassigned and Patton is dead. No ending
  was fabricated, so verdict is **still-live with checkpoint**, not game-over.
- Machine integrity scanned 391 numbered gameplay buffers: all nonempty, height
  25, maximum width <=80, no over-wide rows/collision suspects, and empty
  buffer/browser-error checks. Raw scan found six `lunges at` hits; filed as
  PT-460 with double-space evidence. Integrity/artifacts:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy59-distinct-terminal-20260824/`.

## 2026-08-24 — weapon attack-description catalog audit (PT-461)

- Enumerated every loaded `weaponTypes` XML attack description and compared it
  with `LcsI18n.hasTranslation` under `pt_BR`.
- The audit found twenty non-`swings at` variants absent from the catalogs;
  this extends the live `lunges at` leak documented as PT-460. The exact list,
  source trace, and independent replay route are recorded in PT-461.
- Added catalog entries and a deterministic coverage test on the isolated
  fixer branch. An independent verifier then tested commit `85419499` with 49
  focused tests, a fresh web build, and a strict-headless Portuguese title
  session with HTTP 200 assets and no browser errors. The natural route did not
  render every weapon family, so source-enumeration coverage is the evidence
  for the remaining variants; PT-461 is **fixed and independently verified**.

## 2026-08-24 — independent verification of PT-458 through PT-461

- Fresh verifier artifacts under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt458-459-20260824/`
  cover the current fixes without modifying or resetting the shared checkout.
- PT-458 asserted `[] - Ver outras páginas Liberais (2/9)`; PT-459 asserted
  both singular and plural purge headings; PT-460 passed the exact knife and
  one-space composition checks on `b75312bf`; PT-461 passed the XML attack
  coverage test on `85419499`.
- The verifier’s stock routes did not naturally reach the counter, purge, or
  every combat-weapon variant. Those reachability limits are recorded rather
  than presented as fabricated live captures; deterministic current-head
  evidence closes the fixes.

## 2026-08-24 — independent PT-435 verification

- A clean detached clone at `ba0bce08` reran
  `flutter test test/localization_layout_batch_c_regression_test.dart`: all 10
  tests passed, including exact Portuguese nominee rows for all five
  `DeepAlignment` values, one comma-space separator, and the 80-column bound.
- Fresh strict-headless session `verify-pt435-independent-20260824` served the
  isolated web build on `127.0.0.1:14563`, selected `pt_BR`, and advanced a
  stock campaign from January 1 through January 31, 2023. Captures
  `evidence/001`–`004` show Portuguese legislative agenda, vote totals,
  president result, and finance report with no raw English UI or overflow.
- The bounded stock route did not reach the November 2024 presidential nominee
  branch; no live-branch claim is made beyond the deterministic regression.
  Artifacts: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt435-independent-20260824/`.

## 2026-08-24 — PT-435 live election replay and PT-457 regression verification

- A separate clean detached verifier at `ba0bce08` built the web app and ran
  strict headless session `verify-pt435-20260824` on `127.0.0.1:19061` with no
  browser or asset errors.
- The fresh Portuguese replay reached `Eleição Geral Presidencial 2028` and
  captured the transient nominee payload before the stock loop returned to the
  November base screen. Live checks found one heading, two candidate rows,
  localized `Arqui-Conservador`/`moderado` prose, zero doubled separators, zero
  raw `L`/`m`/`C`/`C+` alignment shorthand, and maximum row width 80.
- The same verifier reran `test/localization_layout_batch_c_regression_test.dart`
  and `test/daily/car_theft_translation_test.dart`; both passed. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt435-20260824/`.

## 2026-08-24 — independent PT-452–PT-457 regression verification

- The clean verifier suite at
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt458-459-20260824/`
  passed 47 focused tests, including the complete CCS victory actions,
  remaining-safehouse guidance, corporate and rural-mob siege templates, and
  canceled elite-journalist interview prose (PT-452–PT-456).
- The same evidence records PT-458/PT-459 deterministic renders and fresh
  Portuguese web-build/title checks. PT-457 independently passed
  `test/daily/car_theft_translation_test.dart` in the clean
  `verify-pt435-20260824` clone.
- The bounded stock browser routes did not naturally reach the rare CCS/siege,
  purge, or failed-car-search branches. Those reachability limits remain
  explicit; the current-head deterministic render tests are the verification
  evidence rather than fabricated live captures.

## 2026-08-24 — playtester strategy62 political/fundraising checkpoint

- Built isolated pushed snapshot `4c4bbf761ffc0397197ed1cdd04ad696064d213e`
  in `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/worktree`.
  Served only the release web build on `127.0.0.1:14562` with
  `/?playtest=1`, using strict-headless session
  `strategy62-victory-20260824` and namespace `lcs-new-age-strategy62`.
- Ran a fresh Portuguese (`pt_BR`) stock/cheatless campaign with the default
  changing-times climate, active **Sangue Ruim** CCS, **Poder para o povo**
  combat, and founder Manuela Matsumoto moved Seattle → New York → Chicago →
  Washington, DC. This was a distinct route from the earlier strategy61
  campaign.
- Natural progress reached the DC homeless base on 17 Jan 2023. Yann Rota and
  Josephine Falstaff were recruited through ordinary meetings, selected as
  White House sleepers, and assigned Liberal advocacy. At the checkpoint
  Manuela, Donovan Zhou, and Manfred Lyles solicited donations; Donovan Rodham
  recruited; Matteo Varga wrote for the Liberal Guardian. No cheats, imports,
  runtime source edits, headed browser, or shared-checkout mutations were used.
- Agenda captures show the Portuguese overview and opinion pages, including
  125 Lib+ / 50 Lib House seats, 20 Lib+ / 15 Lib Senate seats, public-interest
  movement to Mínimo/Alto on several issues, and 0% LCS awareness. The active
  laws remain short of elite Liberal and CCS remains active, so no victory
  condition was met. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/252-jan17-agenda-page1.json`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/253-jan17-agenda-page2.json`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/254-jan17-agenda-page3.json`.
- A lowercase-`x` save followed by title-screen resume with lowercase-`c`
  restored the Jan 17 base state. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/255-title-save-jan17.json`
  and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/256-reloaded-jan17.json`.
- The captured checkpoint surfaces were Portuguese, within the 80-column
  console width, and had no confirmed issue. No natural victory/game-over was
  reached or claimed; the browser/server and resumable state remain live for a
  further bounded political route.

## 2026-08-24 — playtester strategy62 Feb 1 influence/funding checkpoint

- Continued the isolated Portuguese stock/cheatless campaign from the Jan 17
  checkpoint. To stop an unproductive recurring materials conversation, the
  natural recruiter relationship was interrupted; Manuela Matsumoto then
  joined Matteo Varga as a Liberal Guardian writer. Donovan Rodham sold art,
  while Donovan Zhou and Manfred Lyles solicited donations. No cheats, imports,
  runtime source edits, or shared-checkout mutations were used.
- At the Jan 30 agenda, two Guardian writers had moved public-interest rows
  beyond the Jan 17 state: surveillance, free expression, liberal judges,
  arms, slavery, immigration, health, and pensions showed Mínimo; prison
  rehabilitation and distrust of conservative cable news were Alto. The active
  law pages still showed the non-liberal status quo. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/299-manuela-guardian-jan29.json`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/301-jan30-agenda-page1.json`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/302-jan30-agenda-page2.json`,
  and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/303-jan30-agenda-page3.json`.
- The natural Feb 1 monthly transition showed `Agenda Legislativa 2023`,
  three joint resolutions, Portuguese vote totals, and a funding report:
  donations +US$223, art sales +US$51, recruitment -US$200, net +US$74,
  ending at US$81 cash. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/312-feb1-legislative-agenda.json`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/313-feb1-legislative-votes.json`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/314-feb1-legislative-votes2.json`,
  and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/315-feb1-president-result.json`.
- A second lowercase-`x` save/title and lowercase-`c` resume restored the Feb 1
  DC homeless base. Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/317-title-save-feb1.json`
  and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy62-victory-20260824/evidence/318-reloaded-feb1.json`.
- The captured surfaces were Portuguese and within the 80-column console;
  no confirmed issue, natural victory, or game-over was reached. Browser/server
  and the resumable state remain live for further bounded law/CCS progression.

## 2026-08-24 — Strategy63 r4 police-station pressure route (isolated replay)

- Fresh isolated detached build at `4c4bbf761ffc0397197ed1cdd04ad696064d213e`; strict headless server `127.0.0.1:14664`, agent-browser session `s63r4` / namespace `s63r4ns`. The prior r3 session remained live and untouched.
- This route deliberately avoided the prior founder → sports-car → police-pursuit strategy. It selected Portuguese, `Céu Azul e Límpido` (CCS never appears), `Poder para o povo`, all-`A` founder answers, and one solo unarmed founder Zsigmond Kovács in Seattle.
- The founder entered `Delegacia de Polícia, Nível 1` through normal destination/execute/movement flow and used unarmed `F` combat. The five-police encounter incapacitated the founder; the `C` reflect prompt is retained at `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy63-gameover-20260824-r4/evidence/088-police-fight-50-r4.json`.
- Pressing `C` produced `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy63-gameover-20260824-r4/evidence/089-gameover-reflect-r4.json`, Portuguese police-news detention, followed by natural trial, guilty plea, three-month prison sentence, release, and a June 1 2023 base checkpoint (`107-current-jun1-base-r4.json`). This is a natural defeat/arrest branch, **not** a literal game-over; no game-over claim is made.
- 94 evidence JSON files were collected; 93 retained object captures after the empty about:blank probe. Post-locale scan: 25 rows, max width 80, zero over-wide rows, zero bridge errors, zero raw-English pattern hits, no ticket. Artifact root: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy63-gameover-20260824-r4/`.

## 2026-08-24 — Strategy63 r5 bar-security combat terminal (isolated replay)

- Fresh isolated detached build at `4c4bbf761ffc0397197ed1cdd04ad696064d213e`; strict headless server `127.0.0.1:14665`, session `s63r5`, namespace `s63r5ns`. The earlier r3/r4 sessions and worktrees remained live and untouched.
- This route materially differed from the prior founder → sports-car → pursuit and police-station pressure routes: Portuguese stock setup, active CCS, zipper combat, fate-selected Tawanda Channing, no weapon, and Seattle `Desert Eagle Bar e Grill` security combat.
- The bouncer generated `Habitante do Interior` with `.44 Magnum` and `Fazendeiro` with `AR-15`. Repeated natural `F` combat killed the founder; `C - Reflita` reached the literal game-over screen at `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy63-gameover-20260824-r5/evidence/025-terminal.json`: `A Elite Liberal` and `O Esquadrão do Crime Liberal foi morto em combate em Janeiro de 2023.` The Portuguese title after Enter is captured at `evidence/026-after-terminal.json`.
- 67 object captures were retained. All buffers had 25 rows and maximum width 80; zero over-wide rows, bridge errors, empty/invalid captures, or post-locale raw-English pattern hits. No new ticket was confirmed. Artifact root: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy63-gameover-20260824-r5/`.

## 2026-08-24 — Strategy63 r6 White House Secret Service dispersal terminal (isolated replay)

- Fresh isolated stock/cheatless build at `04ded2704f37f8372b787a1ad2ff00e5e2d87787`; strict headless server `127.0.0.1:14666`, session `s63r6`, namespace `s63r6ns`. Earlier R3/R4/R5 servers, sessions, and evidence remained live and untouched.
- This route materially differed from the R3 sportscar/pursuit and R5 Seattle bar routes: Portuguese stock setup, Washington, DC founder travel, a five-member armed gang led by Eve Chao, normal National Mall → Casa Branca movement, and four `Serviço Secreto` opponents.
- Repeated natural `F` combat killed/dispersed the squad. After the normal `C - Reflita` and Enter death/contact flow, the literal `Ending.dispersed` terminal was captured at `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy63-gameover-20260824-r6/evidence/032-terminal-continued.json`: `A Elite Liberal` and `O Esquadrão do Crime Liberal foi dispersado em Janeiro de 2023.` The Portuguese title after Enter is `evidence/033-after-terminal.json`.
- The replay retained 135 object captures. Every buffer had 25 rows and maximum width 80; there were zero over-wide rows, bridge errors, empty/invalid captures, or post-locale raw-English pattern hits. The `Serviço Secreto` role was localized, so no PT-406 reproduction or new ticket was confirmed. Artifact root: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy63-gameover-20260824-r6/`.
