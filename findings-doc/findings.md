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

## PT-001: Save-management option is clipped

- Severity: High
- Type: Layout / discoverability
- Screen: Portuguese title screen
- Evidence: [`screenshots/02-portuguese-selected.png`](screenshots/02-portuguese-selected.png)

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

## PT-002: Portuguese title displays `NNOVA ERA`

- Severity: Medium
- Type: Translation / color-marker rendering
- Screen: Portuguese title screen
- Evidence: [`screenshots/02-portuguese-selected.png`](screenshots/02-portuguese-selected.png)

### Actual

The title renders as `ESQUADRÃO DO CRIME LIBERAL: NNOVA ERA`, with a cyan `N`
immediately followed by `NOVA ERA`.

### Expected / suggestion

Render `ESQUADRÃO DO CRIME LIBERAL: NOVA ERA` once while retaining the intended
color treatment. Review whether the localized value preserved an English
color-marker prefix as an extra visible character.

## PT-003: `Bay 12 Games` is translated as `Jogos da Bay 12`

- Severity: Medium
- Type: Contextual translation / proper name
- Screen: Portuguese title-screen credits
- Evidence: [`screenshots/02-portuguese-selected.png`](screenshots/02-portuguese-selected.png)

### Actual

The credit reads `Jogos da Bay 12`.

### Expected / suggestion

Keep the studio name as `Bay 12 Games`.

## PT-004: Character creation mixes English and Portuguese and clips answers

- Severity: High
- Type: Missing translation / layout
- Screens: New-game configuration and biography
- Evidence:
  [`screenshots/03-new-game-intro.png`](screenshots/03-new-game-intro.png),
  [`screenshots/05-origin-story.png`](screenshots/05-origin-story.png),
  [`screenshots/06-childhood-choice.png`](screenshots/06-childhood-choice.png),
  [`screenshots/08-later-life-choice.png`](screenshots/08-later-life-choice.png)

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

## PT-005: Core management screens retain English UI vocabulary

- Severity: High
- Type: Missing translation / inconsistent presentation
- Screens: Base, assets, Liberal lists, status, activities, travel
- Evidence:
  [`screenshots/10-story-intro.png`](screenshots/10-story-intro.png),
  [`screenshots/13-active-liberal.png`](screenshots/13-active-liberal.png),
  [`screenshots/14-character-status.png`](screenshots/14-character-status.png),
  [`screenshots/17-activity-menu.png`](screenshots/17-activity-menu.png),
  [`screenshots/27-go-forth.png`](screenshots/27-go-forth.png)

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

## PT-007: Save management mixes languages, clips text, and merges columns

- Severity: High
- Type: Missing translation / layout / navigation clarity
- Screen: Save management
- Evidence:
  [`screenshots/26-save-management.png`](screenshots/26-save-management.png)

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

## PT-008: Interface and content explanations remain English

- Severity: Medium
- Type: Missing translation
- Screens: Interface options and content options
- Evidence:
  [`screenshots/22-interface-options.png`](screenshots/22-interface-options.png),
  [`screenshots/24-content-options.png`](screenshots/24-content-options.png)

### Actual

Most option names are Portuguese, but their explanatory paragraphs remain
English. `Default Page Up/Down Keys` also remains English.

### Expected / suggestion

Localize labels, values, and descriptions as one option record. Mixed-language
settings are particularly difficult because the untranslated text is the part
that explains consequences and warnings.

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

## PT-010: Shopping and inventory flows remain mostly English

- Severity: High
- Type: Missing translation
- Screens: Pawn-shop menu, firearms, tools, equipment
- Evidence:
  [`screenshots/31-pawn-shop-buy.png`](screenshots/31-pawn-shop-buy.png),
  [`screenshots/32-pawn-shop-guns.png`](screenshots/32-pawn-shop-guns.png),
  [`screenshots/33-pawn-shop-tools.png`](screenshots/33-pawn-shop-tools.png),
  [`screenshots/34-pawn-shop-equipment.png`](screenshots/34-pawn-shop-equipment.png)

### Actual

The store mixes a few Portuguese controls with English categories, prompts,
headers, item names, ammunition types, descriptions, and navigation:
`Conservative Guns`, `Liberal Tools`, `Ammo Boxes`, `What will ... buy?`,
`NAME`, `AMMO TYPE`, `DAMAGE`, `PRICE`, and `Enter - Back`.

### Expected / suggestion

Localize the complete transaction flow, including catalog metadata and item
descriptions. Shared item names should match the terminology used by character
and equipment screens.

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
