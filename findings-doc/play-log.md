# Portuguese Play Log

## Environment

- Local URL: `http://127.0.0.1:7357`
- Flutter: 3.35.4
- Dart: 3.9.2
- Browser: isolated headed Chrome-for-Testing session
- Repository branch: `feature/localization`
- Starting commit: `03e2ca594771276f6a809ba6be941dd49521aed7`
- Viewport captured at 1527 × 1293

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
