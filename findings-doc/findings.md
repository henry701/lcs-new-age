# Findings

## Summary

| ID | Severity | Area | Summary |
|---|---|---|---|
| PT-001 | High | Layout | Save-management option is clipped on the title screen |
| PT-002 | Medium | Translation/rendering | Portuguese title displays `NNOVA ERA` |
| PT-003 | Medium | Translation | `Bay 12 Games` is mistranslated as `Jogos da Bay 12` |
| PT-004 | High | Coverage/layout | Character creation mixes English and Portuguese and clips answers |
| PT-005 | High | Coverage | Core management screens retain English UI vocabulary |
| PT-006 | High | Layout | Portuguese management actions and table columns collide |
| PT-007 | High | Saves | Save management mixes languages, clips text, and merges columns |
| PT-008 | Medium | Settings | Interface/content explanations remain English |
| PT-009 | Medium | Context | Generated place names are translated word by word |
| PT-010 | High | Coverage | Shopping and inventory flows remain mostly English |
| PT-011 | Medium | Controls/layout | Key prefixes duplicate and action legends overflow |
| PT-012 | Low | Style | Several Portuguese prompts are overly literal or over-capitalized |
| PT-013 | Low | Coverage | Changelog has no Portuguese presentation |
| PT-014 | High | Intro/layout | Conservative-era prose is clipped and capitalization diverges from the original |
| PT-015 | High | Newspaper | Newspaper chrome and subheadline mix English with Portuguese |
| PT-016 | Medium | Politics | Month-end legislative screens retain English status labels |
| PT-017 | Medium | Finance | Monthly finance line items remain English |
| PT-018 | Medium | New-game layout | Difficulty legend clips its right endpoint |
| PT-019 | Medium | Translation | Sports-car transport renders as malformed `Sportção` |
| PT-020 | Medium | Shop layout | Pawn-shop status action is clipped |
| PT-021 | Medium | Media | Media overview retains English chrome |
| PT-022 | High | Crash/newspaper | Major-event newspaper crashes with a negative text index |
| PT-023 | Medium | Context | Major-event gun-control story leaks English context tokens |
| PT-024 | Medium | Core layout | Long party names collide with the skill column |

## PT-001: Save-management option is clipped

- Severity: High
- Type: Layout / discoverability
- Screen: Portuguese title screen
- Replay status: **Resolved on 2026-07-19**
- Evidence:
  [`screenshots/02-portuguese-selected.png`](screenshots/02-portuguese-selected.png),
  [`screenshots/46-title-portuguese-replay.png`](screenshots/46-title-portuguese-replay.png)

### Reproduction

1. Launch the game at the captured 1527 × 1293 viewport.
2. Select `A - Seleção de Idioma`.
3. Select `P - Português`.
4. Inspect the right column of title-screen actions.

### Actual

`L - Carregar e gerenciar salvamentos` extends beyond the right edge of the
console and is visibly clipped after `salvame…`.

### Expected / suggestion

All action text should remain inside the console. Options include moving the
right column left, allocating it more width, shortening the label, or wrapping
it without colliding with the following row.

### Replay result

The full `Carregar e gerenciar salvamentos` label is visible inside the
console in screenshot 46.

## PT-002: Portuguese title displays `NNOVA ERA`

- Severity: Medium
- Type: Translation / color-marker rendering
- Screen: Portuguese title screen
- Replay status: **Resolved on 2026-07-19**
- Evidence:
  [`screenshots/02-portuguese-selected.png`](screenshots/02-portuguese-selected.png),
  [`screenshots/46-title-portuguese-replay.png`](screenshots/46-title-portuguese-replay.png)

### Actual

The title renders as `ESQUADRÃO DO CRIME LIBERAL: NNOVA ERA`, with a cyan `N`
immediately followed by `NOVA ERA`.

### Expected / suggestion

Render `ESQUADRÃO DO CRIME LIBERAL: NOVA ERA` once while retaining the intended
color treatment. Review whether the localized value preserved an English
color-marker prefix as an extra visible character.

### Replay result

The title now renders `NOVA ERA` once.

## PT-003: `Bay 12 Games` is translated as `Jogos da Bay 12`

- Severity: Medium
- Type: Contextual translation / proper name
- Screen: Portuguese title-screen credits
- Replay status: **Resolved on 2026-07-19**
- Evidence:
  [`screenshots/02-portuguese-selected.png`](screenshots/02-portuguese-selected.png),
  [`screenshots/46-title-portuguese-replay.png`](screenshots/46-title-portuguese-replay.png)

### Actual

The credit reads `Jogos da Bay 12`.

### Expected / suggestion

Keep the studio name as `Bay 12 Games`.

### Replay result

The credit now preserves `Bay 12 Games`.

## PT-004: Character creation mixes English and Portuguese and clips answers

- Severity: High
- Type: Missing translation / layout
- Screens: New-game configuration and biography
- Replay status: **Resolved on 2026-07-26**
- Evidence:
  [`screenshots/03-new-game-intro.png`](screenshots/03-new-game-intro.png),
  [`screenshots/05-origin-story.png`](screenshots/05-origin-story.png),
  [`screenshots/06-childhood-choice.png`](screenshots/06-childhood-choice.png),
  [`screenshots/08-later-life-choice.png`](screenshots/08-later-life-choice.png),
  [`screenshots/51-new-game-config-replay.png`](screenshots/51-new-game-config-replay.png),
  [`screenshots/67-founder-biography-clipping-replay.png`](screenshots/67-founder-biography-clipping-replay.png)

### Reproduction

1. Start a new game in Portuguese.
2. Choose manual character creation.
3. Advance through the biography questions.

### Actual

- Configuration text remains English, including `Starting Political Climate`,
  `Combat Difficulty`, and `Power to the People`.
- Prompts remain English, including `In the moments after I was born...`,
  `As a kid, when I was bad...`, and later-life questions.
- Labels such as `Clothes`, `Security`, `Driving`, `Disguise`, `Law`, and
  `Music` remain English.
- One translated answer starts `She nem chegou...`.
- Several Portuguese choices extend beyond the right edge and are clipped.

### Expected / suggestion

Translate the full setup/biography unit and test every answer at the game's
fixed console width. Treat a prompt, its answer options, and its resulting
skill/item labels as one review unit so a single screen does not alternate
languages.

### Replay result

The setup labels are translated. Biography options now wrap inside the fixed
console width, and the clothing/skill metadata is localized. Fresh replay
screenshots 78–80 confirm the long origin and biography options remain visible.
The separate difficulty-legend regression is tracked as PT-018.

## PT-005: Core management screens retain English UI vocabulary

- Severity: High
- Type: Missing translation / inconsistent presentation
- Screens: Base, assets, Liberal lists, status, activities, travel
- Replay status: **Resolved for replayed base/equipment surfaces on 2026-07-19**
- Evidence:
  [`screenshots/10-story-intro.png`](screenshots/10-story-intro.png),
  [`screenshots/13-active-liberal.png`](screenshots/13-active-liberal.png),
  [`screenshots/14-character-status.png`](screenshots/14-character-status.png),
  [`screenshots/17-activity-menu.png`](screenshots/17-activity-menu.png),
  [`screenshots/27-go-forth.png`](screenshots/27-go-forth.png),
  [`screenshots/58-base-post-rebuild.png`](screenshots/58-base-post-rebuild.png),
  [`screenshots/59-equipment-post-rebuild.png`](screenshots/59-equipment-post-rebuild.png)

### Actual

Persistent English includes:

- Table headers: `SKILL`, `WEAPON`, `ARMOR`, `HEALTH`, `TRANSPORT`,
  `SQUAD NAME`, `LOCATION`, and `ACTIVITY`.
- State and identity: `Homeless Camp`, `Laying Low`, `Civilian`,
  `Cisgender`, and `Professional Thief`.
- Equipment and skills: `Punk Jacket`, `Computers`, `Security`, and others.
- Activity categories: `Liberal Activism`, `Legal Fundraising`,
  `Education and Learning`, `Medical and Support`, and `Lay Low for Now`.
- The default slogan `We really need a slogan!`.

### Expected / suggestion

These are high-frequency core-game strings and should present consistently in
Portuguese. Prioritize shared headers, states, professions, skills, equipment,
and activity taxonomies because translating each shared value fixes many
screens at once.

### Replay result

The replayed base and equipment screens now show Portuguese location, state,
headers, clothing, and slogan text. The malformed transport value visible in
those screens is tracked separately as PT-019.

## PT-006: Portuguese management actions and table columns collide

- Severity: High
- Type: Layout / readability / control discoverability
- Screens: Base, assets, active Liberal list, character status, task assignment
- Evidence:
  [`screenshots/10-story-intro.png`](screenshots/10-story-intro.png),
  [`screenshots/13-active-liberal.png`](screenshots/13-active-liberal.png),
  [`screenshots/14-character-status.png`](screenshots/14-character-status.png),
  [`screenshots/16-assign-task.png`](screenshots/16-assign-task.png)

### Actual

- Adjacent options merge, such as `Atribuir TarefaB`.
- Right-side actions are clipped, including `Próxima Locali...` and
  `Equipar Esquadrã...`.
- List columns concatenate health, location, and activity values.
- The character screen joins unrelated fields, such as the energy/skill and
  task/activity rows.
- Footer keys collide with the preceding instruction.

### Expected / suggestion

No option, key, or data column should share cells with adjacent content.
Portuguese needs explicit width budgeting rather than English-width offsets.
Add screenshot/golden coverage at the fixed console width for the base menu,
list tables, and character details.

### Fix status

Resolved on 2026-07-26. Base actions and shared management tables now use
locale-safe fitted cells and explicit column boundaries. Regression coverage
verifies the base controls, task-assignment table, active-Liberal table, and
character details at the 80-column console width.

## PT-007: Save management mixes languages, clips text, and merges columns

- Severity: High
- Type: Missing translation / layout / navigation clarity
- Screen: Save management
- Replay status: **Resolved on 2026-07-19**
- Evidence:
  [`screenshots/26-save-management.png`](screenshots/26-save-management.png),
  [`screenshots/47-save-management-replay.png`](screenshots/47-save-management-replay.png)

### Reproduction

1. Create or autosave a Portuguese game.
2. Return to the title screen.
3. Open save management.

### Actual

- The heading and columns remain English: `Liberal Save Game Management
  System`, `IN GAME DATE`, `CREATED`, and `SIZE`.
- Date/name columns merge (`2023Justin`).
- The Portuguese return prompt is clipped at the right edge.
- A second `Enter - Back` instruction appears in English below it.

### Expected / suggestion

Use one localized navigation instruction and allocate fixed, non-overlapping
columns for date, name, creation time, and size.

### Replay result

An actual autosave row now renders with a Portuguese heading, separated
columns, and one unclipped `Enter - Retornar ao menu principal` control.

## PT-008: Interface and content explanations remain English

- Severity: Medium
- Type: Missing translation
- Screens: Interface options and content options
- Replay status: **Resolved on 2026-07-19**
- Evidence:
  [`screenshots/22-interface-options.png`](screenshots/22-interface-options.png),
  [`screenshots/24-content-options.png`](screenshots/24-content-options.png),
  [`screenshots/48-gameplay-options-replay.png`](screenshots/48-gameplay-options-replay.png),
  [`screenshots/49-interface-options-replay.png`](screenshots/49-interface-options-replay.png),
  [`screenshots/50-content-options-replay.png`](screenshots/50-content-options-replay.png)

### Actual

Most option names are Portuguese, but their explanatory paragraphs remain
English. `Default Page Up/Down Keys` also remains English.

### Expected / suggestion

Localize labels, values, and descriptions as one option record. Mixed-language
settings are particularly difficult because the untranslated text is the part
that explains consequences and warnings.

### Replay result

Gameplay, interface, and content option labels and explanations replayed in
Portuguese. Conventional input/file-format names such as `Page Up/Down`,
`Mouse`, and `JSON` remain appropriately technical.

## PT-009: Generated place names are translated word by word

- Severity: Medium
- Type: Contextual translation / generated grammar
- Screens: Shopping and Downtown Seattle destinations
- Evidence:
  [`screenshots/28-shopping.png`](screenshots/28-shopping.png),
  [`screenshots/36-downtown.png`](screenshots/36-downtown.png)

### Actual

- `Towne Pawn & Gun` becomes `Towne Peão e Arma`; `peão` is the wrong sense
  of English `pawn` for a pawn shop.
- Generated names such as `Humano Cuidado Seguros` and
  `Quiosque de Latte Cafeína Caneca` read like independently translated tokens
  concatenated in English order.

### Expected / suggestion

Translate generated names with phrase-level templates designed for Portuguese
word order and agreement. For the pawn shop, use the established financial
sense (`penhor`/`casa de penhores`) while preserving `Towne` as the name.

### Fix status

Resolved on 2026-07-26. Generated commerce templates now provide Portuguese
phrase-level word order, including `Towne — Casa de penhores e armas`,
`Seguros Cuidado Humano`, and `Quiosque de Latte Caneca de Cafeína`. Composition
tests exercise the translated templates with concrete generated components.

## PT-010: Shopping and inventory flows remain mostly English

- Severity: High
- Type: Missing translation
- Screens: Pawn-shop menu, firearms, tools, equipment
- Replay status: **Resolved for transaction coverage on 2026-07-19**
- Evidence:
  [`screenshots/31-pawn-shop-buy.png`](screenshots/31-pawn-shop-buy.png),
  [`screenshots/32-pawn-shop-guns.png`](screenshots/32-pawn-shop-guns.png),
  [`screenshots/33-pawn-shop-tools.png`](screenshots/33-pawn-shop-tools.png),
  [`screenshots/34-pawn-shop-equipment.png`](screenshots/34-pawn-shop-equipment.png),
  [`screenshots/60-shop-post-rebuild.png`](screenshots/60-shop-post-rebuild.png),
  [`screenshots/61-shop-firearms-post-rebuild.png`](screenshots/61-shop-firearms-post-rebuild.png),
  [`screenshots/62-shop-tools-post-rebuild.png`](screenshots/62-shop-tools-post-rebuild.png),
  [`screenshots/63-shop-equipment-post-rebuild.png`](screenshots/63-shop-equipment-post-rebuild.png)

### Actual

The store mixes a few Portuguese controls with English categories, prompts,
headers, item names, ammunition types, descriptions, and navigation:
`Conservative Guns`, `Liberal Tools`, `Ammo Boxes`, `What will ... buy?`,
`NAME`, `AMMO TYPE`, `DAMAGE`, `PRICE`, and `Enter - Back`.

### Expected / suggestion

Localize the complete transaction flow, including catalog metadata and item
descriptions. Shared item names should match the terminology used by character
and equipment screens.

### Replay result

Categories, purchase prompts, table headers, item names, descriptions, paging,
and back controls now replay in Portuguese. A separate clipped status action
on the store menu is tracked as PT-020.

## PT-011: Key prefixes duplicate and action legends overflow

- Severity: Medium
- Type: Control-label integrity / layout
- Screens: Character status and site action
- Evidence:
  [`screenshots/14-character-status.png`](screenshots/14-character-status.png),
  [`screenshots/39-police-station-action.png`](screenshots/39-police-station-action.png)

### Actual

- The character footer renders `QQualquer outra tecla - continue a Luta`,
  duplicating the `Q` used as a key prefix.
- The site-action legend continues beyond the right edge after `O -`, hiding
  part of the available controls.

### Expected / suggestion

Keep the key token separate from localized prose and validate its rendered
composition. Action legends should wrap or paginate without losing commands.

### Fix status

Resolved on 2026-07-26. Character-status continuation now uses the option
renderer, so the localized prose is highlighted without duplicating its key
prefix. Wrapped site-action regression tests verify that every command stays
inside the console.

## PT-012: Several prompts are overly literal or over-capitalized

- Severity: Low
- Type: Portuguese style
- Screens: Title and identity prompts
- Evidence:
  [`screenshots/02-portuguese-selected.png`](screenshots/02-portuguese-selected.png),
  [`screenshots/04-character-origin.png`](screenshots/04-character-origin.png),
  [`screenshots/09-later-life.png`](screenshots/09-later-life.png)

### Actual

- `Selecione uma Opção para Perseguir sua Agenda Liberal`
- `Deixe-me Escolher`
- `Qual é o seu nome para o povo?`

### Expected / suggestion

Portuguese UI prose normally uses sentence case. For example:
`Selecione uma opção para seguir sua agenda liberal`.

`Seguir` also reads more naturally than the literal `perseguir` in this
context. Review `nome para o povo` against the gameplay meaning (public name,
alias, or code name) rather than translating the source in isolation.

### Fix status

Resolved on 2026-07-26. The title and identity prompts now use Brazilian
Portuguese sentence case and an idiomatic public-name question:
`Selecione uma opção para seguir sua agenda liberal`, `Deixe-me escolher`, and
`Como você será conhecido pelo povo?`. Catalog regression tests cover all three
phrases.

## PT-013: Changelog has no Portuguese presentation

- Severity: Low
- Type: Localization coverage / enhancement
- Screen: Changelog
- Evidence: [`screenshots/25-changelog.png`](screenshots/25-changelog.png)

### Actual

The heading, close action, version metadata, and body are wholly English.

### Expected / suggestion

If historical entries are intentionally source-language-only, localize at
least the surrounding UI and label the content as English. Otherwise, include
release notes in the locale workflow.

### Fix status

Resolved on 2026-07-26. The changelog overlay now localizes its title, close
tooltip, version/date metadata, and an explicit notice that historical release
notes remain English-only. The overlay also sizes itself to the available
viewport; focused widget tests cover the Portuguese presentation.

## PT-014: Conservative-era prose is clipped and capitalization diverges

- Severity: High
- Type: Layout / contextual translation / capitalization
- Screen: New-game conservative-era introduction
- Replay status: **Resolved on the 2026-07-19 15:29 build checkpoint**
- Evidence:
  [`screenshots/40-conservative-era-overflow.png`](screenshots/40-conservative-era-overflow.png),
  [`screenshots/52-conservative-era-fixed.png`](screenshots/52-conservative-era-fixed.png)

### Reproduction

1. Start a new game in Portuguese.
2. Complete the founder biography.
3. Inspect the `UMA NOVA ERA CONSERVADORA` introduction.

### Actual

- Two long prose lines continue beyond the right edge of the console. The
  clauses after `eleições intermedi...` and `nova era Conservador...` cannot be
  read.
- The vice-president description renders `arqui-conservador` in lowercase and
  with a hyphen.

### Expected / suggestion

Wrap the introduction by translated display width so every clause remains
visible. Match the original emphasis requested for this phrase:
`extrema-direita Arqui Conservadora` (spaces, with both words title-cased).
Apply the feminine form because the phrase modifies `vice-presidente` in this
rendered sentence.

### Replay result

The introduction wraps inside the console and displays the exact requested
phrase `extrema-direita Arqui Conservadora`.

## PT-015: Newspaper chrome and subheadline mix English with Portuguese

- Severity: High
- Type: Missing translation / layout
- Screen: Daily newspaper
- Replay status: **Resolved in renderer/catalog tests on 2026-07-26**
- Evidence:
  [`screenshots/41-newspaper-mixed-language.png`](screenshots/41-newspaper-mixed-language.png),
  [`screenshots/66-newspaper-range-error.png`](screenshots/66-newspaper-range-error.png)

### Reproduction

1. Start a Portuguese campaign.
2. Wait until a newspaper is displayed (3 January in this run).

### Actual

- The main headline is Portuguese (`RIO EM CHAMAS`), but the subheadline is
  English: `The Cuyahoga River is ablaze as pollution increases.`
- Masthead and subscription chrome remain English, including `THE HERALD` and
  `SUBSCRIBE $3/WK`.
- The navigation bar clips `ESTILO DE VIDA`, and the subscription copy is
  truncated at the right edge.

### Expected / suggestion

Treat each story headline and subheadline as one localization unit. Localize
the surrounding newspaper chrome and budget fixed-width columns for the longer
Portuguese navigation/subscription labels.

### Replay result

The major-event crash that blocked the replay is tracked as PT-022. Focused
Herald tests now verify the Portuguese masthead, navigation, subscription
copy, and pollution subheadline at the fixed 80-column width. The renderer
also clips over-wide localized headlines before centering, so this newspaper
path no longer depends on English headline widths.

## PT-016: Month-end legislative screens retain English status labels

- Severity: Medium
- Type: Missing translation
- Screens: Month-end Congress notice and legislative results
- Replay status: **Resolved on 2026-07-26**
- Evidence:
  [`screenshots/42-month-end-congress.png`](screenshots/42-month-end-congress.png),
  [`screenshots/43-legislative-results-mixed.png`](screenshots/43-legislative-results-mixed.png)

### Actual

- The base-screen notice remains `Congress is acting on legislation!`.
- The otherwise Portuguese results table retains `House`, `Senate`, and
  `President`.

### Expected / suggestion

Localize the month-end notice and all institutional column labels consistently
with the Portuguese resolution names and prompts already shown on these
screens.

### Fix status

The month-end notice, legislative agenda, joint-resolution headings, vote
labels, and House/Senate/President columns now resolve through the Portuguese
catalog. The rendering path keeps translated labels from being translated a
second time after their fixed-column placement. The monthly translation suite
covers the notice, institutional columns, and fixed-width rows in both
locales.

## PT-017: Monthly finance line items remain English

- Severity: Medium
- Type: Missing translation
- Screen: Monthly financing report
- Replay status: **Resolved on 2026-07-26**
- Evidence:
  [`screenshots/44-monthly-finance-mixed-language.png`](screenshots/44-monthly-finance-mixed-language.png)

### Actual

The report title, total, and footer are Portuguese, but every asset category is
English: `Cash`, `Tools and Weapons`, `Clothing and Armor`, `Ammunition`, and
`Miscellaneous Loot`.

### Expected / suggestion

Localize the finance categories as one report vocabulary set so the screen
does not switch languages between its heading, rows, and total.

### Fix status

The liquid-asset rows now translate `Cash`, `Tools and Weapons`, `Clothing and
Armor`, `Ammunition`, and `Miscellaneous Loot` through `LcsI18n` before writing
the fixed-width report. Portuguese and English regression coverage verifies
the complete row set, totals, and row widths.

## PT-018: Difficulty legend clips its right endpoint

- Severity: Medium
- Type: Layout / fixed-width budgeting
- Screen: New-game configuration
- Evidence:
  [`screenshots/51-new-game-config-replay.png`](screenshots/51-new-game-config-replay.png)

### Reproduction

1. Select Portuguese at the title screen.
2. Start a new game.
3. Inspect the bottom difficulty scale.

### Actual

The red right endpoint `Mais difícil` continues past the console's right
border and is visibly clipped.

### Expected / suggestion

Keep both difficulty endpoints within columns 0–79, shortening or shifting the
legend as needed.

### Replay status

Resolved in the character-creation regression suite on 2026-07-26.

### Fix status

The legend now fits the fixed console width; the regression is covered by the
character-creation translation suite in both Portuguese and English.

## PT-019: Sports-car transport renders as malformed `Sportção`

- Severity: Medium
- Type: Contextual translation / item metadata
- Screens: Base and equipment
- Evidence:
  [`screenshots/58-base-post-rebuild.png`](screenshots/58-base-post-rebuild.png),
  [`screenshots/59-equipment-post-rebuild.png`](screenshots/59-equipment-post-rebuild.png)

### Actual

The transport column displays `(Sportção)`, which is not a Portuguese word and
appears to combine fragments of the source and target terms.

### Expected / suggestion

Render the complete vehicle name with established Portuguese terminology, or
preserve the source proper/model name consistently.

### Fix status

Resolved on 2026-07-26. XML vehicle short names are translated as complete
metadata values; `Sport` now renders as `Esportivo`, with a regression test
guarding against the former `Sportção` splice.

## PT-020: Pawn-shop status action is clipped

- Severity: Medium
- Type: Layout / control discoverability
- Screen: Pawn-shop main menu
- Evidence:
  [`screenshots/60-shop-post-rebuild.png`](screenshots/60-shop-post-rebuild.png)

### Actual

The right-side action ends at `Verificar o status de um Liberal do`, with the
remaining squad reference outside the console.

### Expected / suggestion

Shorten, wrap, or move the status action so the complete control is visible
inside the 80-column console.

### Fix status

The two status actions now use full-width rows and the Enter action has its own
row. The layout regression test verifies all three complete strings on the
80-column console.

## PT-021: Media overview retains English chrome

- Severity: Medium
- Type: Missing translation
- Screen: Media overview
- Evidence:
  [`screenshots/65-media-overview-mixed.png`](screenshots/65-media-overview-mixed.png)

### Reproduction

1. Continue a Portuguese campaign.
2. Select `M - Visão Geral da Mídia & Impacto`.

### Actual

`Media Overview`, `HEADLINE`, `DATE`, `SOURCE`, `IMPACT`, and
`Press a Letter to read a news article` remain English while the metrics and
guidance below are Portuguese.

### Expected / suggestion

Localize the overview title, table schema, and read instruction as one screen
unit.

### Fix status

The shared paged-interface chrome is now backed by Portuguese catalog entries
for the title, headers, footer, and guidance lines. A dedicated catalog test
covers the complete chrome unit. Resolved on 2026-07-26.

## PT-022: Major-event newspaper crashes with a negative text index

- Severity: High
- Type: Runtime crash / localized layout
- Screen: Major-event newspaper
- Replay status: **Resolved in renderer and regression tests on 2026-07-26**
- Evidence:
  [`screenshots/66-newspaper-range-error.png`](screenshots/66-newspaper-range-error.png)

### Reproduction

1. Continue the captured Portuguese campaign.
2. Select `W - Esperar um dia` through 5 January 2023.
3. Let the major-event newspaper render.

### Actual

The game stops at the failure-report screen with:

`RangeError (index): Index out of range: index must not be negative: -8`

The visible stack includes `printNewsText`, `print5x5NewsText`,
`displayCenteredNewsFont`, and `displayMajorEventStory`.

### Expected / suggestion

The story should render without calculating a negative text or glyph index.
Add a Portuguese major-event integration test that exercises the full
newspaper layout, not only isolated string widths.

### Fix status

The renderer now bounds-checks glyph writes, normalizes Portuguese diacritics,
falls back to compact 4×5/3×5 fonts, and clips any remaining over-wide
headline before centering. Direct, full gun-control, and very-long-headline
regressions pass.

## PT-023: Major-event gun-control story leaks English context tokens

- Severity: Medium
- Type: Contextual translation
- Screen: Portuguese major-event newspaper body
- Replay status: **Resolved in production code and tests on 2026-07-26**

### Actual

The gun-control event used the raw English `mass shooting`, left `university`
untranslated in one branch, and inserted the raw pronoun `he` into Portuguese
text (`he pudesse ferir mais alguém`).

### Fix status

`mass shooting` and `university` now have Portuguese catalog coverage, and the
shooter pronoun goes through the locale-aware pronoun translator. The
major-event tests assert `tiroteio em massa`, `universidade`, and `ele pudesse`
in the rendered gun-control story.

## PT-024: Long party names collide with the skill column

- Severity: Medium
- Type: Core layout
- Screen: Squad management table
- Replay status: **Fixed in renderer and regression test on 2026-07-26**
- Evidence: [`screenshots/82-name-next.png`](screenshots/82-name-next.png)

### Actual

An overlong founder name entered during the Portuguese replay continued into
the adjacent skill column, producing a merged value such as
`Ayla Probstaaaaaaa24/0`.

### Expected / suggestion

Keep each party-table cell inside its fixed column, preserving the skill value
and truncating only the display name when necessary.

### Fix status

`printParty` now renders names with the shared fitted-text helper and the
management table's 23-column name width. A regression test confirms the name
ends with an ellipsis, the skill column remains intact, and the underlying
creature name is not mutated.
