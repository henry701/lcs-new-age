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
