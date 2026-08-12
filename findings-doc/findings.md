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
| PT-025 | Medium | Translation | Dynamic month names remain English in Portuguese dates |
| PT-026 | Medium | Translation/layout | Default squad name remains English and clips in roster views |
| PT-027 | Medium | Coverage | Character profile retains English labels and body-part names |
| PT-028 | Medium | Layout | Roster footer truncates the final character of a Portuguese action |
| PT-029 | Low | Layout | Founder-option continuation text is not aligned with the option |
| PT-030 | Medium | Title layout | Long founder names collide with the title-screen continue option |
| PT-031 | High | Coverage | Activate-regulars submenus retain English activity labels |
| PT-032 | Medium | Activity layout | Long activity descriptions clip at the console edge |
| PT-033 | Medium | Coverage | Siege and election event strings remain untranslated |
| PT-034 | Medium | Layout | Portuguese date header collides with activity text |
| PT-035 | Low | Layout | Base-mode activism option is ellipsized in Portuguese |
| PT-057 | High | Layout | Mega-founder stats collide with the base roster weapon column |
| PT-058 | Medium | Translation/layout | Equipment transfer rows leak `(item)` and collide at fixed columns |
| PT-059 | Low | Translation | Generated vehicle colors remain English in character profiles |
| PT-060 | Medium | Translation | Portuguese controls still display the English `Enter -` prefix |
| PT-061 | Medium | Shop layout | Pawn-shop status controls merge at the half-screen boundary |
| PT-062 | Low | Translation/layout | Pawn-shop headers expose a raw site name and clip the visit label |
| PT-063 | Medium | Shop layout | Long pawn-shop item names collide with metadata columns |
| PT-064 | Medium | Combat translation/redraw | Police alarm route exposes `Chief of Police` and a stale action legend tail |
| PT-065 | Medium | Help coverage | Direct Action help overlay remains entirely in English |
| PT-066 | Medium | Recruitment context | Generated profession name can bypass the localized display helper in meeting text |
| PT-070 | Medium | Activity layout | Activity preview remains stale after category changes |
| PT-118 | Medium | Newspaper detail | Article impact labels render raw English View names |
| PT-119 | Medium | Newspaper translation | Death-penalty article retains an English sentence fragment |
| PT-120 | Medium | Newspaper layout | Housing article appends filler city directly to the final sentence |
| PT-121 | Low | Newspaper context | Generated pollution think-tank names use English word order/agreement |
| PT-117 | Low | Translation/context | High-score month `May` renders as the Portuguese abbreviation `mai` |
| PT-122 | Low | Translation/context | Male founder high-school option uses feminine agreement |
| PT-123 | Medium | Translation/context | Generic daily mismatch inserts a gerund after `em vez de` |
| PT-124 | Medium | Newspaper detail | Article impact labels omit `Taxes` and `Drugs` catalog entries |
| PT-125 | Medium | Translation/context | Military article can expose generated country fragment `Islands` in Portuguese |
| PT-126 | Medium | Newspaper detail | Article impact label `Income Inequality` remains English |
| PT-127 | Low | Translation/context | Generated country capitals can expose English `Fort` or `Hill` |
| PT-128 | Medium | Translation/context | Liberal Agenda polling rows use infinitive or singular Portuguese fragments |
| PT-129 | Medium | Translation/layout | Teaching footer leaks English cost copy and stale activity text |
| PT-130 | Low | Translation/context | Founder biography translates firearm safety literally |
| PT-131 | Low | Translation/context | High-score rank keeps an English-style all-caps adjective |
| PT-132 | Medium | Translation/context | Arrival template uses the wrong preposition for dynamic site names |
| PT-133 | Low | Translation/context | Hospital short header renders `UW Médica` as a person-like adjective |
| PT-134 | Medium | Combat translation | Chase warning interpolates the English `SWAT Officer` name |
| PT-138 | Medium | Translation/context | Founder biography uses masculine agreement for a female founder |
| PT-139 | Low | Shop context | Medieval armour footer says to buy clothes |
| PT-140 | Medium | Shop layout | Car-dealer action rows collide at a narrow viewport |
| PT-141 | Medium | Translation/context | Conservative-era intro uses feminine agreement for a male vice-president |
| PT-142 | Medium | Shop layout | Portuguese equipment options overlap adjacent key prefixes |
| PT-143 | Medium | Layout | Long daily result messages clip at the console edge |
| PT-144 | Medium | Translation/context | Generated Portuguese site names use the wrong adjective gender |
| PT-145 | Medium | Combat/layout | Portuguese party roster merges skill summaries with weapon labels |
| PT-146 | Medium | Travel/layout | Four-digit pressure values merge with the secrecy label |
| PT-147 | Low | Translation/style | Founder bonus line loses the requested `Artes Marciais` capitalization |
| PT-148 | Medium | Combat translation | Combat interpolation exposes English officer names and death templates |
| PT-149 | Medium | Controls/translation | Dynamic option prefixes change from `-` to an en dash |
| PT-150 | Medium | Flags/translation/layout | Flag metadata remains English and the flag detail repeats cost text |
| PT-151 | Low | Flags/layout | Long Portuguese flag issue labels are ellipsized in the compact table |
| PT-152 | Low | Flags/coverage | Craft-only flag metadata still needs a dedicated localized route sweep |
| PT-153 | Medium | Controls/activity mapping | Acquisition submenu displays the wheelchair on the flag's key |
| PT-154 | Medium | Flags/translation/layout | Crafting exposes raw XML metadata and lets long rows overwrite columns |
| PT-155 | Medium | Flags/layout | Craft preview overwrites heat and joins the translated difficulty label |
| PT-156 | Low | Translation/style | New-game opening mixes hyphenated and unhyphenated `extrema-direita` |
| PT-168 | Medium | Core layout | Localized party armor overwrites the health column |
| PT-169 | Low | Translation pipeline | High-score months are translated twice in Portuguese rendering |
| PT-170 | Medium | Core layout | Long squad locations overwrite the activity column in review rows |
| PT-171 | Low | Combat translation | Siege briefing joins `a isso confronto` in Portuguese |
| PT-172 | Medium | Combat translation | Generic wanted-for template produces unnatural questioning wording |
| PT-173 | Low | Translation telemetry | Prelocalized pager labels, structural keys, and signed numbers create false missing logs |
| PT-174 | Medium | Translation/context | Founder skill rewards use three different Portuguese names for Computers |
| PT-175 | Low | Translation/context | Opinion-poll fragments omit Portuguese articles |
| PT-176 | Medium | Coverage/context | Sorting prompt interpolates the raw English list description |
| PT-177 | Medium | Flags/layout | Portuguese flag footer is truncated before its final sentence |
| PT-178 | Medium | Translation/coverage | Sleeper and justice routes expose raw `WhiteHouse`/`Police` site names |
| PT-179 | Medium | Translation/layout | Full skill sheet exposes `NOW`/`MAX` and crowds the next Portuguese column |
| PT-180 | Medium | Controls/translation | Review-mode profile footer uses an unbounded English-prefix renderer |
| PT-181 | Medium | Core layout | Localized sleeper site name overwrites the activity column |
| PT-182 | Medium | Flags/translation/layout | Flag rows expose raw status labels and collide with the issue column |
| PT-183 | Medium | Missing translation/route coverage | Compound status row exposes raw `BOLLARDS` and `GENERATOR` |
| PT-184 | Medium | Core layout | Daily injury-treatment messages leave stale text on the fixed console row |
| PT-185 | Medium | Core layout | Squad assembly right-aligns the translated header using the English prefix width |
| PT-186 | Medium | Missing translation | CIA raid opening sentence falls back to English because only source fragments are catalogued |
| PT-187 | Medium | Combat/layout | CIA suspense messages clip long Portuguese translations at the fixed console edge |
| PT-188 | Medium | Missing translation | Character profile gender status exposes raw `Transgender` in Portuguese |
| PT-189 | Low | Profile/layout | Long Portuguese profile labels and attribute names are ellipsized in fixed-width columns |
| PT-190 | Medium | Translation/context | Medical-support help text uses awkward literal Portuguese wording |
| PT-191 | Medium | Profile/translation | Wound status codes and special injuries remain in English in Portuguese profiles |
| PT-192 | Medium | Profile/layout | Translated compact wound labels collide with the top-skills heading and status column |
| PT-193 | Medium | Hospital/translation | Hospital discharge interpolates the raw English site name |
| PT-194 | Low | Profile/layout | Long special-injury lists run below the 25-row console and become invisible |
| PT-233 | Medium | Translation/context | Tailoring skill label says `Costura` while the same skill is `Alfaiataria` elsewhere |
| PT-234 | Low | Translation/context | Generated latte-stand names use adjective fragments as malformed noun phrases |
| PT-235 | Medium | Site-map/layout | Full-map overlay leaves a clipped Portuguese control legend underneath the map |
| PT-236 | Medium | Vehicle translation/layout | Vehicle assignment leaks English prompts and drops the final controls below the console |
| PT-237 | Medium | Profile/layout | Special-injury overflow marker collides with the review profile action footer |
| PT-238 | Medium | Safehouse layout | Portuguese compound-status labels overwrite adjacent columns during a siege |
| PT-239 | Low | Title translation/context | Universal score labels call lost/saved people “Américas” |
| PT-071 | Medium | Controls/translation/layout | Review profile footer loses the navigation separator in Portuguese |
| PT-240 | Medium | Daily redraw/layout | Injury-death result leaves the previous hospital destination tail on screen |
| PT-241 | Medium | Investment layout/translation | Safehouse investment options clip and mix Portuguese currency formats |
| PT-242 | Medium | Combat translation | Private Military combatants remain in English |
| PT-243 | Low | Translation telemetry/context | Composed Portuguese status values are translated a second time |
| PT-244 | Medium | Travel/site translation | Intelligence HQ and Corporate HQ remain in English in Portuguese routes |
| PT-245 | Medium | Combat translation | Guard Dog remains in English in security encounters |
| PT-246 | Low | Translation telemetry | Generated Portuguese site names are falsely reported as missing keys |
| PT-247 | Low | Translation telemetry | Numeric health, armor, and price shells create false missing warnings |
| PT-248 | Medium | Review layout | New-squad header is clipped at the right edge in Portuguese |
| PT-249 | Medium | Controls/translation | Portuguese yes/no prompts ignore the localized affirmative key |
| PT-250 | Low | Translation/context | Vegan bar short label uses an unnatural translation |
| PT-251 | Medium | Combat/layout | Ground-loot indicator collides with the localized action footer |
| PT-252 | Medium | Daily translation | Successful interview outcome falls back to English after key concatenation |
| PT-253 | Low | Combat translation/style | Blown-off tongue message uses unnatural Portuguese tense and wording |
| PT-254 | Medium | Safehouse layout | Long Portuguese safehouse names overwrite the security-box frame and action row |
| PT-255 | Low | Combat translation/style | Fleeing creature display lowercases the `SWAT` acronym |
| PT-256 | High | Safehouse/siege runtime | Entering a safehouse siege with no active squad crashes before combat |
| PT-257 | Medium | Combat/layout | Portuguese encounter armor details collapse to an ellipsis in the six-cell health column |
| PT-258 | Medium | Combat/layout | Long Portuguese hit descriptions are clipped at the fixed console edge |
| PT-259 | Medium | Combat/status layout | Death-reflection rows expose negative health values for defeated enemies |
| PT-260 | Medium | Combat translation | Medical-debt collector roles remain English in the Portuguese encounter roster |
| PT-261 | Low | Combat translation/style | Fleeing `CPA` is rendered as `cPA` instead of preserving the acronym |
| PT-262 | Low | Combat/layout | Long medical-debt role labels are truncated in the 17-cell encounter-name column |
| PT-263 | Medium | Siege translation/context | CIA raid opening hard-codes a masculine article before feminine site names |
| PT-264 | Medium | Combat controls | Police-siege foot chase advertises a disabled surrender action |
| PT-265 | High | Siege translation/coverage | Medical-debt raid announcements remain English after the location fragment |
| PT-266 | Medium | Dynamic-name localization | Medical-debt receipt title leaks the raw safehouse name |
| PT-267 | Low | Politics translation/context | Agenda polling and active-law prose use awkward Portuguese wording |
| PT-268 | Medium | Generated-site translation/context | Los Angeles site names leak English and use malformed Portuguese |
| PT-276 | Medium | Translation/context | Clothing crafting selector and preview bypass the Portuguese catalog |
| PT-277 | Medium | Clothing-preview layout | Translated armor stat labels collide at the fixed column boundary |
| PT-282 | Low | Mod-tools translation | Concatenated Mod Tools explanation falls back to English |
| PT-283 | Medium | Infiltrated-agent translation | Liberal level title `Revolutionary` remains English in the action header |
| PT-284 | Low | Help-text style | Hospital activity help line contains an unnecessary double space |
| PT-285 | Low | Combat translation/style | Death-reflection message uses unnatural Portuguese phrasing |
| PT-286 | Low | Activity layout | Clothing-crafting header loses its Portuguese suffix at 80 columns |
| PT-287 | Low | Siege translation/context | Dynamic-site death alert uses an unnatural Portuguese preposition |
| PT-288 | Low | Generated-site translation/context | Street-site names retain English word order in Portuguese |
| PT-289 | Low | Generated-site translation/context | Upscale-apartment names retain English word order in Portuguese |
| PT-290 | Low | Generated-site translation/style | Juice-bar adjectives do not agree with plural Portuguese nouns |
| PT-291 | Low | Generated-site translation/context | Internet-café brand fragments expose automated translator glosses |
| PT-292 | Low | Generated-site translation/context | Vegan co-op names expose an automated `Tofu (soja)` gloss |
| PT-293 | Medium | Fixed-console layout | Industrial site status text overwrites long Portuguese site names |
| PT-294 | Low | Generated-name translation/context | Internet-café fragments use glosses, awkward casing, or duplicated nouns |
| PT-295 | Low | News translation/context | Drug acronyms and gang names carry explanatory glosses into prose |
| PT-296 | Low | Translation/context | Generated cultural labels and recursive fragments carry out-of-context glosses |
| PT-297 | Low | Dialogue translation/context | LGBT pickup lines use gender-incompatible or duplicated noun phrases |
| PT-304 | Low | Politics translation/style | Active-law text uses the legacy hyphen in `semiautomáticas` |
| PT-305 | Medium | Combat translation/coverage | Generated `Security Guard` encounter names fall back to English |
| PT-306 | Low | Media translation/context | Mid-tier broadcast quality uses an incorrect Brazilian Portuguese register |
| PT-326 | Medium | Siege translation/context | Singular police arrest aliases expose English role names and `preso(a)` |
| PT-327 | Medium | Siege translation/context | Singular rescued-hostage terminal exposes English role names and masculine agreement |
| PT-328 | Medium | Daily-siege translation/context | Unoccupied police raids expose English rescued-role names |
| PT-329 | Medium | Daily-siege translation/layout | Dynamic unoccupied-raid locations receive the wrong article and clip the final period |
| PT-330 | Low | Translation/context | Portuguese weapon cells use masculine `Nenhum` for the feminine noun `arma` |
| PT-331 | Low | Translation/context | Dealership sale label uses a hard-coded article and title case |
| PT-332 | Low | Translation/context | Pawn-shop bulk actions mix verbs and title case |
| PT-333 | Low | Translation/style | Investment actions mix imperative and infinitive forms |
| PT-334 | Low | Agenda translation/context | Presidential opinion poll omits the Portuguese article |
| PT-335 | Low | Location translation/style | Siege status sentence uses unnatural Portuguese word order |
| PT-338 | Low | Politics translation/context | Congressional House summary uses literal `Casa` instead of `Câmara` |
| PT-339 | Low | Finance translation/style | Monthly net-change label uses an English title-case calque |
| PT-340 | Low | Dialogue translation/context | Torture discussion fragment uses infinitives after `permitindo que` |
| PT-341 | Low | Help translation/context | Community-service help calls the in-game `Energia` resource `Ânimo` |
| PT-342 | Medium | Media translation/coverage | Media overview leaves a stored Portuguese headline in English |
| PT-343 | Medium | Newspaper translation/coverage | Military article exposes an English hostage-rescue sentence fragment |
| PT-344 | Low | Hospital translation/context | Hospital action omits the possessive article for Conservative wounds |
| PT-345 | Low | Newspaper translation/grammar | Mass-shooting article uses the finite verb `matou` after `já tinha` |
| PT-346 | Low | Newspaper translation/context | Mass-shooting article drops Portuguese school articles and name order |
| PT-347 | Low | Founder translation/context | Founder-origin option says `roubando de Corporações` instead of `das Corporações` |
| PT-348 | Low | Profile/layout | Compact Portuguese Liberal profile ellipsizes body-part, skill, and vehicle labels |
| PT-349 | Medium | Map editor translation/layout | Portuguese map editor bypasses localization and its toolbar overflows narrow viewports |
| PT-350 | Low | Newspaper translation/context | Drug-panic story falls back to drug names and uses a finite verb after `vai` |
| PT-351 | Low | Newspaper translation/context | Retirement story composes generated think-tank names with invalid gender/article agreement |
| PT-357 | Low | Newspaper translation/style | FM article repeats “radio” in `radialista de rádio FM` |

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

## PT-025: Dynamic month names remain English in Portuguese dates

- Severity: Medium
- Type: Missing translation / date formatting
- Screens: Base header and month rollover
- Replay status: **Fixed and reverified in the 2026-07-26 headless pass**

### Actual (before fix)

Portuguese date strings still use English month abbreviations, including
`1 de Jan de 2023`, `31 de Jan`, and the post-rollover `1 de Feb`.

### Resolution

The month abbreviation catalog is now used by the fitted base header; the live
headless replay rendered `1 de jan de 2023` without overwriting the date.

## PT-026: Default squad name remains English and clips in roster views

- Severity: Medium
- Type: Missing translation / fixed-width layout
- Screens: Base roster and character profile
- Replay status: **Fixed and reverified in the 2026-07-26 headless pass**

### Actual

The generated default squad name remains `The Liberal Crime Squad`. In the
80-column roster and profile views it is rendered as `The Liberal Crime S...`,
and the English name is visible in lines such as `Esquadrão: The Liberal Crime
S` and `A - The Liberal Crime Squad`.

### Resolution

The legacy default name is localized through `localizedSquadName`, and review
rows now reserve a 30-column fitted name cell before the location column. The
live row ends with an ellipsis and a blank separator instead of colliding with
`SEA — Sem-teto`.

## PT-027: Character profile retains English labels and body-part names

- Severity: Medium
- Type: Missing translation / profile vocabulary
- Screen: Character profile
- Replay status: **Fixed in catalog and profile regression coverage**

### Actual

The profile still displays the English label `PROFESSION`, the value
`Civil (Highschool Dropout)`, and body-part labels `Left Leg`, `Right Leg`,
`Left Arm`, `Right Arm`, `Head`, and `Torso`.

### Resolution

The profile renderer and Portuguese catalog now cover the profession label,
education status, and body-part names; the focused profile test confirms the
visible strings without mutating gameplay identifiers.

## PT-028: Roster footer truncates the final character of a Portuguese action

- Severity: Medium
- Type: Fixed-width layout / clipping
- Screen: Review-assets or roster footer
- Replay status: **Fixed and reverified in the 2026-07-26 headless pass**

### Actual

The footer renders `T - Atribuir novas bases aos membros sem esquadrã`, dropping
the final `o` from `esquadrão` at the right edge of the 80-column console.

### Resolution

The footer now renders the Z and T actions in explicit 31/49-column cells, so
the live replay keeps the complete `esquadrão.` suffix visible.

## PT-029: Founder-option continuation text is not aligned with the option

- Severity: Low
- Type: Layout / alignment
- Screen: Founder biography option list
- Replay status: **Fixed in renderer and biography regression coverage**

### Actual

On one long founder-option screen, the continuation line begins at column zero
instead of aligning beneath the option text. The line remains readable and is
not clipped, but the indentation changes between otherwise equivalent choices.

### Expected / suggestion

Use the same continuation indentation for every wrapped founder option so the
key, option text, and continuation lines form a consistent block.

The biography option renderer now keeps continuation lines indented, with a
regression test covering the Portuguese wrapped form.

## PT-030: Long founder names collide with the title-screen continue option

- Severity: Medium
- Type: Fixed-width layout / option collision
- Screen: Portuguese title screen after creating a founder
- Replay status: **Fixed in renderer and title-layout regression coverage**

### Actual

After creating a long founder name, the title option `C - Continuar como Bree
Underdown` runs directly into the right-column `L - Carregar e gerenciar
salvamentos`, rendering the boundary as `UnderdownL`.

### Expected / suggestion

Fit the continue label to its left-column budget, or wrap it within that column,
so the right-column save option always starts in its own cell.

The title screen now fits the continue option to its left-column budget, and
the layout regression test confirms it cannot merge with the save option.

## PT-031: Activate-regulars submenus retain English activity labels

- Severity: High
- Type: Missing translation / activity taxonomy
- Screen: Assign Tasks → selected Liberal activity menu
- Replay status: **Fixed and covered by the 2026-07-26 headless verification pass**

### Actual (before fix)

Portuguese activity categories are followed by English sub-actions, including
`Community Service`, `Liberal Disobedience`, `Graffiti`, `Hacking (Need Den)`,
`Stream Guardian TV (Need Studio)`, `Solicit Donations`, `Make and Sell
Clothing`, `Make and Sell Art`, `Perform Live Music`, `Practice a Skill (Free)`,
`Take Paid Classes ($30/day)`, `Recruiting`, `Steal a Car`, `Make Clothing`,
`Teach Liberal Arts`, `Teach Covert Ops`, `Teach Fighting`, and `Go to Hospital`.

### Expected / suggestion

Translate the complete activity taxonomy at the call site, including
availability qualifiers such as `Need Den`, `Need Studio`, `Free`, and the
daily price. Keep the labels short enough for the two-column menu.

## PT-032: Long activity descriptions clip at the console edge

- Severity: Medium
- Type: Fixed-width layout / generated description
- Screen: Assign Tasks → selected Liberal activity menu
- Replay status: **Fixed and covered by the 2026-07-26 headless verification pass**

### Actual (before fix)

The selected recruitment activity description ends at the right edge before its
final words, for example `Lavar e remendar roupas são tratados por Liberais
configurados para m...`. The health-support description also approaches the
same boundary without a stable wrap budget.

### Expected / suggestion

Wrap or fit activity descriptions before rendering them, reserving the full
80-column width and keeping each continuation line inside the console.

## PT-033: Siege and election event strings remain untranslated

- Severity: Medium
- Type: Missing translation / event coverage
- Screens: Siege alerts, election month-end messages, and emergency events
- Replay status: **Fixed in catalog and regression coverage on 2026-07-26**

### Actual (before fix)

The locale extractor still reports English fallbacks for fifteen live strings:
`A skilled pilot gets through!`, `Explosions rock the compound!`,
`Fortunately, no one was hurt.`, `Planes streak overhead!`, `The anti-aircraft
gun takes a direct hit!`, `The generator takes a direct hit!`, `The lights fade
and all goes dark...`, `The solar panels take a direct hit!`, `There's nothing
left but smoking wreckage...`, `Your Liberals are starving!`, `Congressional
Elections are being held today!`, `Local elections are being held today!`, `The
Presidential Election is being held today!`, `The Supreme court is handing down
decisions!`, and the car-theft header `TYPE`.

### Resolution

Added concise Brazilian Portuguese catalog entries for all fifteen strings,
preserving the event-banner style and the short `TIPO` car-table header. The
read-only extractor now reports no new pt_BR strings, and the context
translation regression test covers every entry.

## PT-034: Portuguese date header collides with activity text

- Severity: Medium
- Type: Fixed-width layout / date formatting
- Screen: Base-mode location header with an active squad
- Replay status: **Fixed and reverified in the 2026-07-26 headless pass**

### Actual (before fix)

The Portuguese date expands to `1 de Jan de ...` and runs into the activity
description rendered at column 41. In the captured screen, the year is replaced
by the squad text, producing `1 de Jan de Mantendo Discrição`.

### Resolution

The base header now uses a short localized site name and a fitted 40-column
location/date cell; activity starts at column 41. The live replay rendered
`SEA — Sem-teto, 1 de jan de 2023` and kept `Mantendo Discrição` separate.

## PT-035: Base-mode activism option is ellipsized in Portuguese

- Severity: Low
- Type: Fixed-width layout / option fit
- Screen: Base-mode action menu
- Replay status: **Fixed in catalog and reverified in the 2026-07-26 headless pass**

### Actual (before fix)

The Portuguese `P - Orgulho: Hastear uma bandeira...` option is shortened with
an ellipsis in the 40-column action area. The key remains usable, but the action
name is less informative than the English counterpart.

### Resolution

The `$20` flag action now uses the concise `P - Orgulho: Hastear bandeira
($20)` translation, which fits the activism column without an ellipsis.

## PT-036: Recruitment profession selector exposes English type names

- Severity: Medium
- Type: Missing translation
- Screen: Base mode → Assign Tasks → Recruiting → profession selector
- Replay status: **Fixed and reverified in the 2026-07-26 headless pass**

### Actual (before fix)

The Portuguese selector translated the prompt and difficulty legend but left
the profession rows in English, including `College Student`, `Drug Addict`,
`Highschool Dropout`, and `Gang Member`.

### Resolution

Added catalog coverage for the complete recruitable profession list and
localized the selector's dynamic type field. The live selector now renders
`Estudante Universitário`, `Dependente Químico`, `Evadido do Ensino Médio`, and
`Membro de Gangue`, while retaining the original hotkeys and difficulty column.

## PT-037: Recruitment candidate rows and dialogue use raw type names

- Severity: Medium
- Type: Missing translation / dynamic display
- Screen: Recruiting activity → candidate list and conversation
- Replay status: **Fixed and reverified on 2026-07-26**

### Actual (before fix)

Candidate rows, the candidate profile heading, and the conversation header
showed `College Student` even after the profession selector had been localized.
The footer also rendered `Enter/Escape - Call it a day` in English.

### Resolution

Display-only creature-name localization now translates fallback type names while
leaving generated proper names unchanged. The candidate footer has an explicit
Portuguese catalog entry and the live route now shows `Estudante Universitário`
and `Enter/Escape - Dar o dia por encerrado`.

## PT-038: Long Portuguese issue prompts clip at the console edge

- Severity: Medium
- Type: Fixed-width layout / wrapped dialogue
- Screen: Recruiting conversation → discuss politics
- Replay status: **Fixed and reverified on 2026-07-26**

### Actual (before fix)

Translated issue quotes were written as one unbounded line. A Portuguese line
such as the NSA/privacy prompt ended mid-word at column 80.

### Resolution

Issue prompts now use the console paragraph wrapper after translation, preserving
the quote and its intentional line breaks while wrapping expanded Portuguese
text inside the 80-column viewport.

## PT-039: Interface-options help text used ungrammatical fragments

- Severity: Low
- Type: Translation quality
- Screen: Title screen → Opções de Jogo → Interface
- Replay status: **Fixed and reverified in the 2026-07-26 headless pass**

### Actual (before fix)

The Portuguese help paragraphs used English-shaped infinitive fragments such as
`acidentalmente passar por eles`, singular `escrito` for plural JSON files, and
`linhas pretas para aparecer`. The mouse-input paragraph omitted the preposition
in `compatíveis entrada de mouse`, and the content/tone paragraph had an
agreement error around the frequency at which hate-crime stories are shown.

### Resolution

Reworded the affected catalog fragments with natural Brazilian Portuguese,
correct prepositions, and subjunctive agreement. The fragments still preserve
their original paragraph composition and fit the 80-column console.

## PT-040: Founder tragic-origin hint clipped at the right edge

- Severity: Medium
- Type: Fixed-width layout / translation length
- Screen: New Game → Founder
- Replay status: **Fixed and reverified in the 2026-07-26 headless pass**

### Actual (before fix)

`(D para alternar entre escolha e destino)` exceeded the 40-column hint cell and
was visibly cut off. The fate value `Let Fate Decide` also collided with that
hint in the same row.

### Resolution

Shortened the Portuguese hint to `(D para alternar escolha/destino)` and the
fate value to `Destino Decide`. The A/B/E hints were also tightened for idiomatic
wording while retaining their hotkeys. A fresh founder screen shows all hints
complete.

## PT-041: Education skill selector mixed raw English and clipped Portuguese

- Severity: High
- Type: Missing translation / fixed-width layout
- Screen: Base → Atribuir Tarefas → Educação → Praticar uma Habilidade
- Replay status: **Fixed and reverified in the 2026-07-26 headless pass**

### Actual (before fix)

The dynamic header rendered `practice` in English, and the long `Primeiros
Socorros` row collided with the current/max columns. Its description was also
cut at `bas`.

### Resolution

Added distinct translatable templates for practice and paid classes, widened the
skill column, and fitted the row labels to the column boundary. The live screen
now shows `Que habilidade ... vai praticar?`, a complete `G – Primeiros
Socorros` label, and a complete description.

## PT-042: Founder biography rewards had two terminology errors

- Severity: Low
- Type: Translation accuracy
- Screen: New Game → Founder biography → final-year choices
- Replay status: **Fixed and reverified in the 2026-07-26 headless pass**

### Actual (before fix)

One reward said `+1 Disfarque` instead of the skill name `Disfarce`; another said
`+1 Armas, AK-102`, omitting the established `Armas de Fogo` label.

### Resolution

Corrected both catalog entries. The replay displayed `+1 Disfarce` and
`+1 Armas de Fogo, AK-102`.

## PT-043: Paid-class skill descriptions fell back to English

- Severity: Medium
- Type: Missing translation
- Screen: Base → Atribuir Tarefas → Educação → Fazer Aulas Pagas
- Replay status: **Fixed and reverified in the 2026-07-26 headless pass**

### Actual (before fix)

The paid-class selector header was localized, but all eighteen class
descriptions (`Painting, color theory, and more.`, `Economics and business
management.`, and so on) remained in English.

### Resolution

Added canonical English/Portuguese catalog entries with concise Portuguese
wording sized for the 46-column description area. A fresh replay now renders the
full selector in Portuguese, including `Pintura, teoria das cores e mais.` and
`Métodos e prática da pedagogia.`.

## PT-044: Vehicle-selection guidance was clipped in Portuguese

- Severity: Medium
- Type: Fixed-width layout / translation length
- Screen: Base → Veículos
- Replay status: **Fixed and reverified in the fresh 2026-07-26 headless pass**

The red and shared-vehicle notes exceeded the 80-column console. The live
buffer ended at `quanto` and `mesmo`, hiding the rest of each sentence. The
translations now use shorter wording while preserving indentation and meaning.

## PT-045: Travel-city descriptors remained in English

- Severity: Medium
- Type: Missing translation
- Screen: Base → Vá adiante → Viajar para outra cidade
- Replay status: **Fixed and reverified in the fresh 2026-07-26 headless pass**

The destination list showed four English descriptors beneath otherwise
Portuguese city choices. Added compact Portuguese catalog entries sized for the
right-hand descriptor column.

## PT-046: Save actions and dates leaked or truncated Portuguese text

- Severity: High
- Type: Missing translation / fixed-width layout
- Screen: Title → Carregar salvamentos
- Replay status: **Fixed and reverified in strict-headless save replay on 2026-07-29**

The save-detail menu exposed `L - Load Game`; broken-save rows also used
English `Unknown`/`Error` fallbacks. In-game dates such as `18 de Jul de 2026`
lost the year in the 16-character date cell. The actions and fallbacks now use
Portuguese, and in-game save dates use a compact `18/jul/2026` form.

## PT-047: High-score labels overflowed fixed columns

- Severity: Medium
- Type: Fixed-width layout / translation length
- Screen: Title → Pontuações / universal statistics
- Replay status: **Fixed and reverified in strict-headless high-score replay on 2026-07-29**

The 20-column statistics cells clipped `Bandeiras Compradas` and
`Bandeiras Queimadas`; the title overlay also clipped the final year in
`Vitória Mais Rápida: Fevereiro de 2026`. Portuguese labels are now compact and
regression tests assert the fixed-column limits.

## PT-048: Combat fragment translations disagreed with their prefixes

- Severity: Medium
- Type: Contextual translation quality
- Screen: Site mode → combat / car chase
- Replay status: **Fixed in catalogs/source; core siege plus non-police terminal branches verified in strict-headless replays; police surrender/arrest variants remain open**

The tooth-damage composition produced forms such as `está queimou!` and
`está corte!`. Car-chase fragments also read awkwardly, and the sneak-miss
warning used an infinitive construction. Updated participles, result fragments,
and the warning to `antes de o ataque acertar`.

The fresh strict-headless siege route reached the police alarm, surrender
announcement, siege briefing, localized encounter roster, and localized hit
messages. A later Portuguese corporate-mercenary fixture advanced 140 live
combat inputs and reached randomized final-words/death-reaction text without
raw-English names. Keep the broader police surrender/arrest variants as a
follow-up rather than claiming every random branch is covered.

## PT-049: Changelog release notes are intentionally English-only

- Severity: Low
- Type: Coverage limitation
- Screen: Title → Histórico de alterações
- Replay status: **Known limitation; no fix planned in this pass**

The Portuguese modal heading and notice are localized, but the release-note
bullets remain English and explicitly state that they are available only in
English. This is an intentional product choice, not a stale-locale regression.

## PT-050: Generic city sites leaked English names in Portuguese

- Severity: Medium
- Type: Missing translation / composed parameter
- Screen: Base → Vá adiante → Centro de Seattle; daily arrival message
- Replay status: **Fixed in source/catalogs; fresh route replay confirmed site names**

The destination list and arrival status exposed `Police Station`, `Courthouse`,
`First American Bank`, and `AM Radio Station`. Site names were passed as raw
parameters in daily activity messages, bypassing translation. Added Portuguese
site-name entries and pass `site.getName()` (plus a translated default squad
name) to visit/arrival messages. A fresh headless route now shows `Delegacia de
Polícia`, `Fórum`, `Primeiro Banco Americano`, and `Estação de Rádio AM`.

## PT-051: Save/high-score edge copy clipped or mixed terminology

- Severity: Medium
- Type: Fixed-width layout / consistency
- Screen: Title → Pontuações; save management; outdated/broken-save flows
- Replay status: **Fixed in catalogs/source; focused regression tests and seeded runtime replay pass**

Seeded headless saves exposed clipped universal flag counts, an inconsistent
`$ gasto` label, long outdated-save bullets, and a broken-save `Error - Crash
Expected` fallback that bypassed translation. Delete confirmation also mixed
`excluir` with `apagar` and `jogo salvo` with `salvamento`. Compact Portuguese
wording, the translated fallback, and consistent delete verbs are covered by
catalog and layout/context tests. Fresh seeded headless replay confirms the
high-score, outdated-save, crash-report, broken-save, and delete flows fit and
remain localized.

## PT-052: Combat/hostage assets and pronouns leaked English

- Severity: Medium
- Type: Missing translation / parameter context
- Screen: Site combat roster; kidnapping education prompt
- Replay status: **Fixed in catalogs/source; follow-up replay caught helper gap; focused regression passes**

Combat setup showed `Police Gang Unit`, `Police Uniform`, and `Overalls` in
English. The captive-education prompt also inserted raw `he`/`she`, and two
kidnapping encounter fragments lacked Portuguese entries. Added compact
Portuguese catalog values and translate the pronoun parameter before formatting.

The forced combat replay also found a second context leak: generated target
names bypassed the catalog in attack and hit descriptions, and `flails at` was
translated as the non-combat phrase `agita contra`. Combat now uses an
explicit-catalog lookup in the shared localized creature-name helper,
`golpeia`, and an article-aware armor fragment. The follow-up replay caught
the helper gap; the focused helper regression now covers that generated-name
case.

The same roster exposed column collisions after translation (`Uniforme
PolicialPist. 9 mm`) and an unaccented/raw clothing label. Encounter rows now
translate and fit creature, clothing, and weapon cells to their fixed widths;
the fresh replay shows Portuguese rows with no overlap.

## PT-053: Unarmed founder could crash on first combat attack

- Severity: High
- Type: Gameplay blocker
- Screen: Site mode → combat with the default unarmed founder
- Replay status: **Source guard added; focused tests and fresh unarmed-site replay pass**

The combat loop sampled `attackDescription` before checking `WEAPON_NONE`.
The default unarmed founder has an empty description list, producing a
`RangeError` instead of selecting a martial-arts action. The action now uses an
empty fallback until the weaponless branch selects an unarmed move. A fresh
headless route entered the police site with `Arma Nenhuma` and no `RangeError`.

## PT-054: Multi-tooth injury prefixes remain untranslated

- Severity: Medium
- Type: Missing translation / grammatical composition
- Screen: Site mode → combat → tooth injury
- Replay status: **Plural composition fixed; deterministic replay caught and fixed a suffix duplication; focused regression passes**

The branches for `All {teethminus} of {name}'s teeth are ` and
`{teethminus} of {name}'s teeth are ` had no Portuguese entries. They now select
complete plural-aware templates for each injury type, avoiding the old
context-blind singular suffixes (`queimado`, `cortado`, and similar fragments).
The first deterministic replay then exposed the legacy singular suffix being
appended after the new plural sentence (`...foram arrancados!arrancado!`); the
suffix is now skipped for plural counts, with the focused context suite
covering the complete plural templates.

## PT-055: Creature and clothing data names fell back to English

- Severity: Low
- Type: Missing translation
- Screen: Character details / combat roster
- Replay status: **Fixed in catalogs; focused translation and helper tests pass**

The initialized Portuguese catalog reported raw `Club Security` and `Naked`
data names while rendering player-facing creature and clothing details. Added
`Segurança de Boate` and `Nu` entries and regression assertions; the helper
now translates generated encounter names whenever an explicit catalog entry
exists while preserving arbitrary player-created names.

## PT-056: Daily arrival status retained a stale trailing character

- Severity: Medium
- Type: Fixed-width redraw
- Screen: Base → daily visit arrival status
- Replay status: **Source clear added; fresh headless replay passes**

When a shorter Portuguese arrival message overwrote a previous status line, the
old final character remained visible (`...Delegacia de Polícia.o`). The daily
arrival and safehouse prompt now clear row 8 before rendering; the runtime route
Fresh hot-restarted replay now renders the full row followed by blank padding.

## PT-057: Mega-founder stats collide with the base roster weapon column

- Severity: High
- Type: Fixed-width layout
- Screen: Base roster with developer mega-founder stats
- Replay status: **Fixed in source and focused layout regression; fresh headless replay passes**

With the existing mega-founder cheat enabled for route acceleration, the base
roster rendered `744/30Nenhuma` in the skill/weapon cells. The skill summary is
now fitted to its five-column cell, preserving the separator before `Nenhuma`.

## PT-058: Equipment transfer rows leak `(item)` and merge columns

- Severity: Medium
- Type: Translation / fixed-width layout
- Screen: Review → Revisar e Mover Equipamento
- Replay status: **Fixed in source/catalog, focused regression, and fresh headless equipment replay**

Rows such as `Canhão de 120 mm (iteSEA — Sem-teto` merged the item and current
location columns. The catalog suffix was removed and item/current-location/base
cells now have explicit fitted widths and separators. A full web-server restart
was required before refreshed ARB assets appeared; the fresh headless replay
now shows `Canhão de 120 mm` and `Pistola .22` without the leaked suffix.

## PT-059: Generated vehicle colors remain English

- Severity: Low
- Type: Missing translation
- Screen: Character profile / stolen vehicle label
- Replay status: **Fixed in catalogs and focused vocabulary regression; fresh profile replay passes**

The profile showed `Veículo roubado: Esportivo Beige`. The complete XML-defined
vehicle-color vocabulary is now present in both canonical catalogs, including
`Bege` for `Beige`.

## PT-060: Portuguese controls still display the English `Enter -` prefix

- Severity: Medium
- Type: Translation / controls
- Screen: Shops, travel, equipment, and confirmation prompts
- Replay status: **Fixed in catalogs and validator; focused shop tests pass**

Portuguese control labels now use `Entre -`. The catalog validator treats this
as the intentional Portuguese equivalent of the source `Enter -` prefix while
still rejecting stripped or unrelated prefixes such as `A -`.

## PT-061: Pawn-shop status controls merge at the half-screen boundary

- Severity: Medium
- Type: Fixed-width layout
- Screen: Pawn shop half-screen
- Replay status: **Fixed in source and focused shop regression**

The `0 -` and `# -` status actions now use independent 38/40-column cells, so
the second action no longer overwrites the end of the first.

## PT-062: Pawn-shop headers expose a raw site name and clip the visit label

- Severity: Low
- Type: Translation/layout
- Screen: Pawn-shop header
- Replay status: **Fixed on 2026-07-29; pawn-shop short-name header regression updated**

The activity header now uses the localized short pawn-shop name, rendering
`Visitando Casa de Penhores` in the right-hand activity cell. Full site names
remain available in the shop view, while the compact activity header no longer
depends on the long generated site template.

## PT-063: Long pawn-shop item names collide with metadata columns

- Severity: Medium
- Type: Fixed-width layout
- Screen: Pawn-shop firearms/tools lists
- Replay status: **Fixed in source; focused shop metadata tests pass**

Weapon, ammo, and clothing/item names now fit their name columns before damage,
traits, or price metadata, preventing strings such as `Taco de beisebolN/D`.

## PT-064: Police alarm route exposes `Chief of Police` and a stale action legend tail

- Severity: Medium
- Type: Combat translation/redraw
- Screen: Site mode → police alarm combat
- Replay status: **Fixed and verified on 2026-08-01; strict-headless chase replay passed**

The earlier route exposed a generated `Chief of Police` officer and appeared
to retain a stale `Saque no chão!` legend fragment. The catalog maps
`Chief of Police` to `Chefe de Polícia`, and the forced-chief fixture confirmed
the roster path. It then exposed a second bypass in the `T` talk-target list:
`A – Chief of Police (40s, Masculino)`. Talk-target labels and refusal messages
now translate encounter names before interpolation. A strict-headless forced-chief
replay confirmed both the roster and talk-target selector as `Chefe de Polícia`;
the stale legend itself is already clean. The chase-specific evasive-run screen
now preserves every `D/F/B/P` key prefix, localizes each action, wraps the
Portuguese car legend before the 80-column edge, and keeps the vehicle roster
below the wrapped row. The foot-chase legend likewise keeps its `D/F/E/G`
prefixes while keeping disabled `O - Ordenar` visibly grey without a comma-only
gap. The direct route rendered
`Unidade Policial ainda está no seu encalço!` after the evasive action, and the
car roster rendered `Unidade Policial` rather than the raw English role.
Evidence is retained under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/chase-direct/`.

## PT-137: Combat armor target used a gendered article before dynamic armor names

- Severity: Medium
- Type: Combat translation / grammar
- Screen: Police alarm → combat hit message
- Replay status: **Fixed on 2026-07-30; strict-headless replay and catalog regression added**

The hit message rendered `Unidade Policial acerta o armadura de couro de Dale
HayashiAAAA.`. Because the armor name is dynamic and can be masculine or
feminine, the Portuguese template now omits the incompatible article:
`Unidade Policial acerta armadura de couro de Dale HayashiAAAA.`.

## PT-065: Direct Action help overlay remains in English

- Severity: Medium
- Type: Missing translation
- Screen: Site mode → police/combat map → `?` help
- Replay status: **Resolved on 2026-07-29; verified in fresh strict-headless Portuguese replay**

The contextual help overlay previously displayed the English title and
multi-paragraph guidance. The help payload now passes through the composed
catalog translator, with a focused snapshot test covering the title and body.
The 2026-07-29 replay rendered `=== Ação Direta ===` and Portuguese guidance
through the footer without English leakage; evidence is recorded in
`findings-doc/play-log.md` and the durable headless artifact directory.

## PT-066: Generated profession name bypasses localization in recruitment text

- Severity: Medium
- Type: Contextual translation
- Screen: Daily recruitment meeting
- Replay status: **Resolved on 2026-07-29; verified in fresh strict-headless Portuguese replay**

The meeting response path previously bypassed the localized creature-name
helper. All response and follow-up interpolations now use the same helper as
the candidate list and profile. A fresh `Estudante Universitário` meeting
replay rendered `Estudante Universitário responde` and no `College Student` or
`responds`; evidence and route details are recorded in `findings-doc/play-log.md`.

## PT-117: High-score month `May` renders as `mai`

- Severity: Low
- Type: Translation / context
- Screen: Portuguese high scores
- Replay status: **Fixed on 2026-07-29; catalog and month regression updated**

Seeding a high-score entry dated May exposed `mai` in the long-form sentence
(`... em mai de 2024`), while the other long-form month names use full names.
The source requests `May` through `getMonth`, so the Brazilian Portuguese
translation must be `Maio`; the short abbreviation `mai` belongs only to
short-date contexts. The catalog now uses `Maio`, and the month-end test locks
the distinction in place.

## PT-118: Article impact labels render raw English View names

- Severity: Medium
- Type: Missing translation
- Screen: Media overview → article detail
- Replay status: **Fixed on 2026-07-29; replay and regression coverage updated**

Opening the populated `Cidadão Armado: Salva Vidas`, `Vamos Fritar`, and
`Preço Inaceitável` articles showed `Gun Control`, `Death Penalty`, and
`Housing` beside the Portuguese impact values. The catalog already contains
`Controle de Armas`, `Pena de Morte`, and `Moradia`; the detail renderer now
passes `entry.key.label` through the locale helper. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/month-media-next/mar-article-a.png`,
`mar-article-b.png`, and `article-c.png`.

## PT-119: Death-penalty article retains an English sentence fragment

- Severity: Medium
- Type: Missing translation / interpolation context
- Screen: Media overview → `Vamos Fritar` article
- Replay status: **Fixed on 2026-07-29; catalog coverage updated**

The final paragraph previously read `A promotoria já repetiu que it will be
seeking the death penalty neste caso.`. The dynamic phrase now has the
Portuguese catalog entry `buscará a pena de morte`. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/month-media-next/mar-article-b.png`.

## PT-120: Housing article appends filler city directly to the final sentence

- Severity: Medium
- Type: Fixed-width article layout
- Screen: Media overview → `Preço Inaceitável` article
- Replay status: **Fixed on 2026-07-29; filler-boundary regression updated**

The final body line previously ended `...de suas casas.Scottsdale, AZ`; the
generated filler city was attached to the preceding sentence with no paragraph
break or space. Major-event rendering now enforces a terminal `&r` before the
shared filler generator. Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/month-media-next/article-c.png`.

## PT-121: Generated pollution think-tank names use English word order/agreement

- Severity: Low
- Type: Contextual translation
- Screen: Media overview → `Melhorando` article
- Replay status: **Fixed on 2026-07-29; composition and regression coverage updated**

The generated name `Family Charity Partnership` previously became `Família
Caridade Parceria`, yielding `O Família Caridade Parceria publicou`. Brazilian
Portuguese now uses a neutral article and composed organization name (for
example, `A organização Parceria de Caridade Familiar`) rather than independent
token translations in English order. Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/month-media-next/article-b.png`.

## PT-122: High-school origin choice uses feminine agreement for a male founder

- Severity: Low
- Type: Contextual translation / gender agreement
- Screen: Founder creation → high-school origin choices
- Replay status: **Fixed on 2026-07-29; gender-neutral catalog wording updated**

With the founder's sex set to masculine, option E rendered `e eu me tornei
completamente gótica`. The translation now uses `e eu adotei o estilo gótico`,
which preserves the meaning without arbitrary feminine agreement. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/shops-travel-next2/high-school.txt`;
source `lib/title_screen/questions.dart`, catalog
`lib/l10n/app_pt_BR_part20.arb`.

## PT-123: Generic daily fallback inserts a gerund after `em vez de`

- Severity: Medium
- Type: Contextual translation / grammar
- Screen: Base mode → daily visit plan result
- Replay status: **Fixed on 2026-07-29; generic mismatch template updated**

When a founder's existing activity was `Causando Problemas` and the squad was
assigned to visit a shop, the mismatch line rendered `Hiro Németh agiu com O
Esquadrão do Crime Liberal em vez de Causando Problemas.`. The generic branch
now uses the context-neutral phrase `em vez de cumprir a atividade planejada`.
Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/shops-travel-next2/walden-result1.txt`;
source `lib/daily/advance_day.dart`.

## PT-124: Article impact labels omit `Taxes` and `Drugs` catalog entries

- Severity: Medium
- Type: Missing translation
- Screen: Media overview → article detail
- Replay status: **Fixed on 2026-07-29; catalog and renderer regression coverage updated**

The strict-headless archive replay showed `Taxes: -10.9%` and `Drugs: +11.8%`
under otherwise Portuguese article bodies. The article renderer already passed
impact names through the locale helper, but these two enum labels had no
Portuguese catalog entries. They now render as `Impostos` and `Drogas`, with
focused Herald coverage.

## PT-125: Military article exposes an English country-name fragment

- Severity: Medium
- Type: Contextual translation
- Screen: Media overview → `Exército Toma as Ruas` article
- Replay status: **Fixed on 2026-07-29; generated-title catalog and regression updated**

The strict-headless replay rendered `Enquanto os militares dos EUA se preparam
para se deslocar para Islands de Korsazistan ...`. The generated country-title
list had no Portuguese catalog entries. It now renders `Ilhas de Korsazistan`
and the military regression repeatedly rejects the raw `Islands` token.

## PT-126: Income Inequality impact label remains English

- Severity: Medium
- Type: Missing translation
- Screen: Media overview → `CEO Americano` article detail
- Replay status: **Fixed on 2026-07-29; catalog and regression coverage updated**

The fresh strict-headless replay showed `Income Inequality: +10.1%` below an
otherwise Portuguese article. The `View.ceoSalary` enum label had no catalog
entry; it now renders as `Desigualdade de Renda`.

## PT-127: Generated country capitals expose English location words

- Severity: Low
- Type: Contextual translation
- Screen: Military article / generated country capital
- Replay status: **Fixed on 2026-07-29; catalog coverage and military regression updated**

The generated-capital path selected `Fort` or `Hill` from a dynamic word list;
Portuguese catalog lookup returned the English token for both. They now render
as `Forte` and `Colina`, and the military article regression exercises repeated
country generation to ensure `Islands` and the capital words do not leak.

## PT-128: Liberal Agenda polling rows use non-finite or singular fragments

- Severity: Medium
- Type: Contextual translation / grammar
- Screen: Liberal Agenda → Opinion Poll (Parts 1–2)
- Replay status: **Fixed on 2026-07-29; phrase catalog and agenda regression updated**

The strict-headless month-end replay showed rows such as `favor fazer mais pela
igualdade de gênero`, `apoiar política liberal de imigração`, `apoiar a saúde
universal`, `quer um sistema de aposentadoria governamental`, and `achar o
Rádio AM Conservador de mau gosto`. These fragments follow a percentage and
must use plural finite verbs. The catalog now renders idiomatic forms such as
`defendem mais ações pela igualdade de gênero`, `apoiam a política liberal de
imigração`, and `querem um sistema de aposentadoria estatal`.

## PT-129: Teaching footer leaked English copy and stale activity text

- Severity: Medium
- Type: Missing translation / fixed-width rendering
- Screen: Base mode → Assign Tasks → Teaching Classes → Teach Liberal Arts
- Replay status: **Fixed on 2026-07-29; strict-headless replay and regression added**

The Portuguese teaching screen previously displayed the raw English cost line
`Classes cost up to $20/day to conduct. All Liberals able will attend.`. Its
training detail also overwrote only the beginning of the previous activity
description, leaving the visible tail `nsinando Artes Liberai` on the same row.
The footer now clears its three detail rows before drawing and catalogs the
cost/skill lines in Portuguese. A fresh headless replay rendered
`Aulas custam até $20/dia. Todas as pessoas liberais aptas participarão.` with
no English or overlap.

## PT-130: Founder biography translated firearm safety literally

- Severity: Low
- Type: Contextual translation
- Screen: Founder creation → biography
- Replay status: **Fixed on 2026-07-29; catalog regression added**

The sentence `I learned gun safety the hard way` was rendered as
`Aprendi segurança com armas da maneira difícil`, which is understandable but
unnatural Brazilian Portuguese. It now reads `Aprendi do jeito difícil a ter
cuidado com armas`, preserving the idiom and meaning.

## PT-131: High-score rank keeps an English-style all-caps adjective

- Severity: Low
- Type: Contextual translation / capitalization
- Screen: Title screen → High Scores
- Replay status: **Fixed on 2026-07-30; strict-headless replay and catalog regression added**

The otherwise Portuguese seeded high-score list rendered `A ELITE Liberal`.
The catalog now uses the natural Brazilian Portuguese noun phrase `A Elite
Liberal`; the localized layout regression locks that capitalization in place.
The strict-headless replay reached the seeded high-score screen and displayed
the corrected heading.

## PT-132: Arrival template used the wrong preposition for dynamic site names

- Severity: Medium
- Type: Contextual translation
- Screen: Travel/day advance arrival message
- Replay status: **Fixed on 2026-07-30; strict-headless replay and catalog regression added**

The generic Portuguese template used `chegou a {site}` for every destination.
That produced incorrect contractions for the dynamic site names observed in a
fresh route, including `chegou a Delegacia de Polícia`, `chegou a Fórum`, and
`chegou a Centro Médico UW`. Because the template receives arbitrary site
names, it now avoids article-dependent contractions with
`{squad} chegou ao destino: {site}.`.

## PT-133: Hospital short header rendered `UW Médica`

- Severity: Low
- Type: Contextual translation
- Screen: Hospital action screen
- Replay status: **Fixed on 2026-07-30; strict-headless replay and catalog regression added**

The compact `UW Medical` label was translated as `UW Médica`, which reads as
an adjective describing a woman rather than the medical institution. The
compact label now uses `Hospital UW`, while the full site name remains
`Centro Médico UW`.

## PT-134: Chase warning interpolated the English `SWAT Officer` name

- Severity: Medium
- Type: Combat translation
- Screen: Police alarm → car chase → evasive action
- Replay status: **Fixed and verified on 2026-08-01; strict-headless direct chase replay passed**

The Portuguese police-alarm route localized the siege roster to `Policial da
SWAT`, but the chase warning bypassed the name translator and displayed
`SWAT Officer ainda está no seu encalço!`. Chase enemy names now pass through
the locale helper before interpolation, so the warning will render
`Policial da SWAT ainda está no seu encalço!` while preserving custom names.
The deterministic low-agility chase replay reached the same warning path with
the localized generated role (`Unidade Policial ainda está no seu encalço!`),
confirming that the runtime interpolation fix is active in the rebuilt web app.

## PT-135: Stealth alarm interpolated the English `Police Officer` name

- Severity: Medium
- Type: Runtime interpolation / missing translation
- Screen: Police route → stealth detection alarm
- Replay status: **Fixed on 2026-07-30; strict-headless replay and catalog regression added**

The police route localized the roster to `Oficial de Polícia`, but the stealth
detection message bypassed the translator and rendered
`Police Officer olha para o Esquadrão com suspeita.`. Stealth alarm paths now
translate encounter creature names before interpolation, preserving generated
proper names while localizing catalog-backed roles.

## PT-136: Hospital activity line leaked the site name and English plural

- Severity: Medium
- Type: Runtime interpolation / missing translation
- Screen: Base mode → hospitalized Liberal activity
- Replay status: **Fixed on 2026-07-30; strict-headless replay and catalog regression added**

After fleeing a police alarm, the base activity line rendered
`... estará em UW Medical Center por 4 months.`. The activity renderer now
translates the dynamic site name and the `month`/`months` period token before
filling the Portuguese template, yielding `... estará em Centro Médico UW por
4 meses.`.

## PT-138: Founder biography uses masculine agreement for a female founder

- Severity: Medium
- Type: Contextual translation / gender agreement
- Screen: Founder creation → traumatic childhood biography
- Replay status: **Fixed on 2026-07-30; neutral Portuguese catalog wording and regression coverage added**

The default founder generated by the Portuguese new-game route was Manuela
Frank, but biography choices used masculine agreement. The same choices also
appeared on male and nonbinary founder routes, so changing the Portuguese
catalog to gender-neutral phrasing is safer than adding a sex-specific branch:
`Eu vivia aprontando`, `Eu tinha obsessão por espadas japonesas`, `Me pegaram
hackeando minhas notas`, and `Me pegaram aos beijos com {person}`. The related
childhood and late-life options were audited at the same time (`trancado`,
`punido`, `indisciplinado`, `palhaço`, `sonhador`, `sozinho`, and `pronto`),
with neutral rewrites applied to prevent the same defect from moving to another
answer. `character_creation_translation_test.dart` now locks the complete set
of neutral biography translations.

## PT-139: Medieval armour shop footer says to buy clothes

- Severity: Low
- Type: Contextual translation
- Screen: Commerce → The Oubliette → Buy medieval armour
- Replay status: **Fixed on 2026-07-30; strict-headless replay and regression coverage added**

The armour-only list contains items such as `Couro de moto`, `Cota de malha`,
and `Cota de mithril`. Its footer now uses the armour-specific
`Pressione uma letra para comprar armadura` prompt instead of the clothing
copy. The shop XML parser accepts the explicit `armor` UI marker and the
Oubliette medieval department opts into it.

## PT-140: Car-dealer action rows collide at a narrow viewport

- Severity: Medium
- Type: Fixed-width layout
- Screen: Commerce → Carros Usados de Sanford (480×640 viewport)
- Replay status: **Fixed on 2026-07-30; narrow-layout regression added**

The two status actions are now fitted independently within their left and
right columns. The dealership layout regression asserts that the left action
does not overwrite the right `# - Verificar...` action at the narrow console
width.

## PT-141: Conservative-era intro uses feminine agreement for a male vice-president

- Severity: Medium
- Type: Contextual translation / gender agreement
- Screen: New game → conservative-era intro
- Replay status: **Fixed on 2026-07-30; catalog regression added**

The strict-headless Portuguese replay rendered `Ricardo Seay` as `Sua
vice-presidente ... aliada ... foi empossada`, despite the generated
vice-president being a male patriarch. The translation now uses masculine
agreement (`Seu vice-presidente ... aliado ... foi empossado`) while retaining
the requested `extrema-direita Arqui Conservadora` capitalization.

## PT-142: Portuguese equipment options overlap adjacent key prefixes

- Severity: Medium
- Type: Fixed-width layout / key-prefix preservation
- Screen: Base mode → Equipar Esquadrão
- Replay status: **Fixed on 2026-08-01; strict-headless replay and layout regression added**

Long localized item labels could run into the next option, producing output
such as `A - Rifle M7 (munição: 20)B - Munição 6,8mm x180`. The equipment
renderer now fits each option to its 26-cell column and leaves a separator
column between options. The regression checks that both `A -` and `B -`
remain intact and that neither cell contains the other option's prefix.

Evidence from the fixed strict-headless replay:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/equipment-layout-pt142/equipment-long-item-fixed-final2.png`.

## PT-143: Long daily result messages clip at the console edge

- Severity: Medium
- Type: Fixed-width layout / dynamic interpolation
- Screen: Base mode → daily activity result
- Replay status: **Fixed on 2026-08-01; fitted-message regression added**

`showAdvanceDayMessage` used an unconstrained write, so a long Portuguese
message could be cut off at the 80-column console boundary. It now uses the
fitted renderer and ends with an ellipsis when the translated/interpolated
message is too long. The layout regression asserts the rendered row stays
within the console width and preserves the truncation marker.

## PT-144: Generated Portuguese site names use the wrong adjective gender

- Severity: Medium
- Type: Contextual translation / gender agreement
- Screen: Base mode → generated warehouse site
- Replay status: **Fixed on 2026-08-01; strict-headless replay and translation regression added**

The generated site route rendered `Visitando Siderúrgica Velho` and
`... olha ao redor de Siderúrgica Velho`. `Siderúrgica` is feminine in
Brazilian Portuguese, so the generic adjective must be `Velha`. The
generated-name helper now inflects the four warehouse adjectives against an
explicit list of feminine site types while preserving exact catalog entries
such as `Igreja Antiga` and `Antigo Motel`.

The strict-headless replay capture showing the defect is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/equipment-layout-pt142/daily-message-fixed-replay2.png`; the focused regression now expects
`Siderúrgica Velha` and `Armazém Abandonado`.

## PT-145: Portuguese party roster merges skill summaries with weapon labels

- Severity: Medium
- Type: Fixed-width layout / translated header
- Screen: Base mode and police siege → party roster
- Replay status: **Fixed and verified on 2026-08-01; strict-headless replay and layout regression added**

The translated six-cell `HABIL.` header occupied the boundary immediately
before `ARMA`, producing `HABIL.ARMA`; five-cell body summaries likewise ran
directly into weapon names (`796/…M7`). The party renderer now keeps the body
skill summary at its existing column, reserves a separator cell, and starts
the weapon header/body at x=30. The rebuilt Portuguese route rendered
`HABIL.—ARMA` and `796/… M7` in both base and combat screens.

## PT-146: Four-digit pressure values merge with the secrecy label

- Severity: Medium
- Type: Fixed-width layout / dynamic value
- Screen: Base mode → Vá adiante → district site list
- Replay status: **Fixed and verified on 2026-08-01; high-pressure regression added**

At a high-pressure safehouse the site row rendered
`Pressão: 9000Sigilo: 15`, because the fixed secrecy column was occupied by
the fourth pressure digit. The renderer now computes the secrecy start from
the rendered pressure width while preserving a separator cell. The focused
regression covers heat `9000`, and the rebuilt route displayed a separated
`Pressão: 1000 Sigilo: 15` row.

## PT-147: Founder bonus line loses the requested `Artes Marciais` capitalization

- Severity: Low
- Type: Translation/style consistency
- Screen: New game → founder biography bonuses
- Replay status: **Fixed and verified on 2026-08-01; catalog regression added**

The gang-background bonus line used `+3 Armas de Fogo e Artes marciais`,
while the project’s requested proper-style capitalization is `Artes Marciais`.
The Portuguese catalog now preserves that capitalization; the new-game
replay and context catalog test cover the complete line.

## PT-148: Combat interpolation exposes English officer names and death templates

- Severity: Medium
- Type: Runtime interpolation / translation coverage
- Screen: Police alarm → siege combat
- Replay status: **Fixed on 2026-08-01; direct strict-headless routes verify roster, hit, injury, and non-police terminal branches; police surrender/arrest variants remain under PT-048**

Combat messages passed raw generated creature names into attack, injury, loot,
reaction, and death templates, so Portuguese combat could expose `SWAT
Officer`. Several randomized death/final-words templates also had no catalog
entry. Combat interpolation now uses the localized creature-name helper and
the missing English/Portuguese template pairs are present in both catalogs.
The rebuilt route rendered `Policial da SWAT` in the roster and messages such
as `acerta capacete de Policial da SWAT`. A fresh Portuguese corporate-
mercenary route also rendered localized `Militar Privado` final words and a
localized SWAT death reaction after 140 combat inputs. Keep broader
police-alarm surrender/arrest coverage open in PT-048.

## PT-149: Dynamic option prefixes change from `-` to an en dash

- Severity: Medium
- Type: Controls / translation contract
- Screen: Base mode → travel destinations, intercity travel, vehicles, and other dynamic option lists
- Replay status: **Fixed on 2026-08-01; strict-headless replay and validator regression added**

The Portuguese catalog translated dynamic option templates such as
`{letter} - {name}`, `{key} - {vehicle}`, and `{index} - {base}` to use an en
dash. Static controls retained the ASCII hyphen, so the same input prefix was
rendered inconsistently (`A – Comércio` beside `F - Viajar...`). Because these
prefixes identify the key the player must press, the catalog audit now treats
the option-builder placeholders as control prefixes and rejects changed or
removed separators while allowing prose keys such as `{city} - ...` to vary.
All affected Portuguese templates now preserve ` - `.

The rebuilt strict-headless travel route rendered `A - Comércio`, `B - Centro
de Seattle`, and `F - Viajar para outra cidade ($100)` after restarting the
web-server so the updated ARB assets were loaded.

## PT-150: Flag metadata remains English and the flag detail repeats cost text

- Severity: Medium
- Type: Flag metadata / translation / layout
- Screen: Base mode → `P - Orgulho: Hastear bandeira ($20)`
- Replay status: **Fixed on 2026-08-01; strict-headless replay and focused regression added**

Flag names and descriptions came directly from `assets/xml/flags.xml`, so the
Portuguese menu exposed `United States Flag` and the English patriotism
description. The issue labels were also rendered raw, and the detail footer
printed `Cost: ` before a `Cost: $20` line, producing a duplicated cost in
Portuguese. The visible buyable flag metadata now has catalog entries; the
renderer localizes names, descriptions, and issue labels exactly once, keeps
the issue cell separate from heat, and prints one localized `Custo: $20` line.

The rebuilt strict-headless menu rendered `Bandeira dos Estados Unidos`,
`Bandeira do Orgulho LGBTQ+`, `Demonstre seu patriotismo hasteando a bandeira
nacional.`, `Questão: Liberdade de Expressão`, and `Custo: $20`; no raw English
flag name or `Custo:Custo` duplication remained.

## PT-151: Long Portuguese flag issue labels are ellipsized in the compact table

- Severity: Low
- Type: Fixed-width layout
- Screen: Base mode → flag menu compact table
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-09; regression added**

The compact table now reserves 24 columns for the translated issue before the
heat value at column 64, while keeping the cost cell at column 70. The fresh
headless route rendered `Liberdade de Expressão`, `Direitos LGBTQ+`,
`Direitos das Mulheres`, and `Direitos Civis` without ellipsizing or overwriting
the numeric columns. The focused vocabulary/layout regression guards the new
column boundaries.

## PT-152: Craft-only flag metadata still needs a dedicated localized route sweep

- Severity: Low
- Type: Flag metadata coverage / residual verification
- Screen: Flag crafting flow (not reached in the compact buyable-flag menu)
- Replay status: **Fixed and verified on 2026-08-01; strict-headless craft route and focused regression added**

The menu replay covered the five visible buyable flags, but the XML also
defines craft-only flags such as `Progress Pride Flag`, `Black Flag`, and
`Anarcha-Feminist Flag`. The dedicated route now walks both craft pages and
renders localized names, descriptions, issue labels, difficulty, cost, and
cancel controls. The catalog and `renderFlagPreview` regression cover a
non-buyable `Black Flag`; the strict-headless route also selected the long
`Intersex Progress Pride Flag` and `Variant Labrys Lesbian Flag` entries.

## PT-153: Acquisition submenu displays the wheelchair on the flag's key

- Severity: Medium
- Type: Controls / activity mapping
- Screen: Base mode → Assign Tasks → Recruitment and Acquisition
- Replay status: **Fixed and verified on 2026-08-01; layout regression added**

The activity handler already mapped key `4` to flag crafting, but the submenu
printed `4 - Procure a Wheelchair` and had no visible flag option. Pressing the
visible key therefore opened a different activity than the label promised.
The menu now renders `4 - Fazer uma Bandeira` and moves the wheelchair action
to `5 - Arranjar uma cadeira de rodas`; the Portuguese layout regression and
the strict-headless route verify both labels and the key-to-screen transition.

## PT-154: Crafting exposes raw XML metadata and lets long rows overwrite columns

- Severity: Medium
- Type: Flag metadata / translation / fixed-width layout
- Screen: Base mode → Assign Tasks → Recruitment and Acquisition → Make a Flag
- Replay status: **Fixed and verified on 2026-08-01; focused regression added**

Craft-only names and descriptions came directly from `assets/xml/flags.xml`,
so the Portuguese selector exposed English values such as `Black Flag`, `No
gods, no masters.`, and `Police Behavior`. Long Portuguese names then ran
into the issue column (`...Progressista IntDireitos`), and long issue labels
overwrote the heat value. The route now translates every craft-only flag name
and description, adds the missing `Police Behavior` label, fits the flag name
to 39 cells with a separator, and fits the issue cell to 15 cells before the
heat column. The second craft page now shows `Bandeira do Orgulho
Progressista I… Direitos LGBTQ+ 0` without column collision.

## PT-155: Craft preview overwrites heat and joins the translated difficulty label

- Severity: Medium
- Type: Fixed-width layout / translated labels
- Screen: Flag-crafting preview footer
- Replay status: **Fixed and verified on 2026-08-01; focused regression added**

The preview wrote `Difficulty: ` at a hard-coded English offset, so the longer
Portuguese label rendered as `Dificuldade:Facílimo`; writing it on the same row
also overwrote the preceding `Heat: 0` value. The preview now measures the
localized labels and places both values safely: `Pressão: 0  Dificuldade:
Facílimo`. The difficulty renderer also fits the translated value to the
remaining width, and the craft footer uses the localized
`Escape - Cancelar confecção de bandeira` key.

## PT-156: New-game opening mixes hyphenated and unhyphenated `extrema-direita`

- Severity: Low
- Type: Translation/style consistency
- Screen: New game → Conservative-era introduction
- Replay status: **Fixed and verified on 2026-08-01; context regression updated**

The full opening sentence used `extrema direita` for `far right`, while the
same screen and adjacent political strings used the standard Brazilian
Portuguese hyphenation `extrema-direita` and the requested capitalization
`Arqui Conservadora`. Both the full opening key and its composed fragment now
use `extrema-direita`; the regression keeps `extrema-direita Arqui
Conservadora` unchanged.

## PT-157: Base agenda menu uses an inconsistent Portuguese term

- Severity: Low
- Type: Translation/context consistency
- Screen: Base mode → agenda menu and agenda detail screen
- Replay status: **Fixed and verified on 2026-08-01; catalog regression added**

The base action `L - The Status of the Liberal Agenda` rendered as
`L - O Estado da Agenda Liberal`, while the agenda screen itself used
`O status da agenda Liberal`. `Estado` is a different sense in this UI and
made the same action read inconsistently between the menu and its destination.
The menu now uses `L - O status da agenda Liberal`, matching the detail screen
and the surrounding Brazilian Portuguese vocabulary.

## PT-158: Agenda footer clips the Portuguese exit control

- Severity: Low
- Type: Fixed-width layout / translation length
- Screen: Base mode → `L - O status da agenda Liberal`
- Replay status: **Fixed and verified on 2026-08-01; footer regression added**

The agenda footer placed `Qualquer Outra Tecla - Sair` after the page controls,
but the 80-column console clipped it to `Qualquer Outra Tecla - S`. The
Portuguese control now uses the concise, unambiguous `Outra tecla - Sair`, so
the complete exit instruction remains visible at the console edge.

## PT-159: Recruitment weapon option remains in English

- Severity: Medium
- Type: Missing translation / contextual dialogue
- Screen: Recruitment → conservative gang-member conversation
- Replay status: **Fixed and verified on 2026-08-01; context catalog regression added**

The gang-member conversation rendered `D - Buy weapons.` in English even
though the recruitment header, profile, and other response options were in
Portuguese. Both the ordinary and naked variants now use Portuguese catalog
entries (`D - Comprar armas.` and `D - Comprar armas enquanto está nu.`).

## PT-160: Failed issue-talk response overwrites its response label

- Severity: Low
- Type: Fixed-width layout / stale console text
- Screen: Recruitment → gang-member conversation → talk about issues (failed persuasion)
- Replay status: **Fixed and verified on 2026-08-01; focused regression added**

On a failed issue-talk attempt, the target response label was written with
`addparagraph`, but the response line then reused the old local `y` value. The
response overwrote the beginning of the label while its old tail remained in
the fixed-width buffer. The Portuguese replay rendered `"Tanto faz." <se
vira>nde,`; the `nde,` suffix was stale text from the overwritten `responde,`
label, not a translation. The renderer now advances from `console.y`, and a
Portuguese layout regression covers the failed-persuasion row.

## PT-161: Newspaper subject/object pronoun parameters bypassed Portuguese

- Severity: Medium
- Type: Missing translation / dynamic interpolation
- Screen: Newspaper → immigration and crime stories
- Replay status: **Fixed and verified on 2026-08-01; focused regression added**

The generic pronoun parameter allow-list translated `his`, `her`, `their`, and
`them`, but not raw `he`, `she`, or `him`. Dynamic stories therefore showed
English fragments such as `she aparecer` and `Pegamos him` inside otherwise
Portuguese articles. The allow-list now covers all eight pronoun parameters,
and the newspaper regression exercises subject and object forms.

## PT-162: Plural feminine child-victim conditions used masculine adjectives

- Severity: Medium
- Type: Translation agreement
- Screen: Newspaper → mass-child-killing story
- Replay status: **Fixed and verified on 2026-08-01; focused regression added**

The story template already translated `dead` as plural feminine `mortas`, but
its dynamic condition catalog entries remained masculine singular (`esculpido`
and `mutilado`). The rendered sentence was `mortas e esculpido com símbolos
satânicos`. Both condition values now agree with the child-victim subject
(`esculpidas ...` and `mutiladas ...`).

## PT-163: Seasonal fashion newspaper copy fell back to English

- Severity: Medium
- Type: Missing catalog key / dynamic story selection
- Screen: Newspaper → fashion story with picture
- Replay status: **Fixed and verified on 2026-08-01; focused regression added**

The fashion event selects one of two exact English sentences at runtime. Those
dynamic keys were absent from the canonical catalogs, so both the headline
subheadline and the picture-page text remained English in Portuguese mode.
Both variants now have canonical English identity entries and Portuguese
translations, with a regression covering the two seasonal branches.

## PT-164: Debug-only oversized siege roster can overlap the fixed-width frame

- Severity: Low
- Type: Fixed-width layout / import guard
- Screen: Siege combat with a deliberately oversized debug roster
- Replay status: **Fixed and verified on 2026-08-09; oversized-roster regression added**

The temporary siege fixture combined five debug-seeded liberals with four
history-selected gang members. The resulting ten-person reserve printed past
the six-row roster and overwrote the location box and combat legend (`9D -` was
visible in the combat screen). The fixed renderer now shows the first five
members plus a compact `+N…` overflow marker, preserving row 8 for the
delimiter and preventing imported/debug rosters from writing into the frame.
Normal six-member campaigns retain all rows.

## PT-165: XML-backed equipment titles bypassed the Portuguese catalog

- Severity: Medium
- Type: Missing translation / equipment metadata
- Screen: Base mode → Equipar a Equipe (all-item debug sweep)
- Replay status: **Fixed and verified on 2026-08-01; focused catalog and title-helper regressions added**

The equipment route displayed raw XML names for generic items and flags even
when the rest of the screen was Portuguese. The sweep exposed English rows
such as `Work Clothes`, `Gasoline`, `Cable News Memos`, `Habit`, `Ninja
Costume`, and `BLM Flag`. `Item.equipTitle` and the flag override now resolve
their canonical names through `LcsI18n`, and the English/PT catalogs cover the
XML-backed equipment set. The fresh strict-headless replay covered the long
clothing, loot, memo, and flag pages; rows now render as `Roupa de trabalho`,
`Gasolina`, `Memorandos das Notícias a Cabo`, `Hábito`, `Fantasia de ninja`,
and `Bandeira BLM`. Loanwords such as `Fursuit`, `Tie-dye`, and `Toga` remain
unchanged intentionally.

## PT-166: Media source names were raw and could overwrite the impact column

- Severity: Medium
- Type: Missing translation / fixed-width layout
- Screen: Base mode → Visão Geral da Mídia & Impacto and newspaper detail
- Replay status: **Fixed and verified on 2026-08-01; focused publication and layout regressions added**

The media overview wrote `publicationName` directly, so a Portuguese replay
showed raw `AM Radio`/`Cable News` source names. The source cell also had no
explicit width, allowing long localized names to run into the impact column.
The overview now translates through the fitted renderer with a 16-cell source
budget, while the article header translates its source explicitly. All nine
publication names have canonical Portuguese entries. A fresh headless replay
rendered `Rádio AM` in the overview and `Rádio AM - REFÉM MORTO` in the
article header; the publication catalog regression covers the remaining
sources, including `Estrela Conservadora`.

## PT-167: Dynamic media impact labels and Cable News memo names fell back to English

- Severity: Medium
- Type: Missing translation / dynamic catalog coverage
- Screen: Newspaper footer and Liberal Guardian secret-publication prompt
- Replay status: **Fixed and verified on 2026-08-01; focused impact and equipment regressions added**

Runtime-generated article effects used view labels that were absent from the
Portuguese catalog, so a story could end with raw `Justices: -9.3%` even when
the body was translated. The all-view catalog audit now covers the nine
previously missing labels (`Animal Research`, `Intelligence`, `Justices`,
`Corporations`, `Military`, `Prisons`, `LCS Known`, `LCS Liked`, and `CCS
Hated`). The same event prompt now uses the consistent source translation
`Memorandos das Notícias a Cabo` instead of `Memorandos da Cable News`. The
headless replay verified `Prisões: -10.0%` in an article and the corrected
memo text in the Guardian prompt.

## PT-168: Localized party armor overwrote the health column

- Severity: Medium
- Type: Fixed-width layout / translated equipment
- Screen: Base mode → party roster
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; focused layout regression added**

The Portuguese short name `Unif. de Segurança` is longer than the original
English label. The party renderer wrote the full armor value at column 44 and
then wrote health at column 59, producing `Unif. de Segura~ 130` and making the
health value unreadable. The armor cell now has an explicit 14-cell budget and
an empty separator before health. The live replay renders
`Unif. de Segu… ~ 130`, with the health indicator and value preserved.

## PT-169: High-score months were translated twice

- Severity: Low
- Type: Translation pipeline / redundant localization
- Screen: Title screen → high scores
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; static source regression added**

`getMonth` already returns the localized month, but the detailed high-score
renderer called `LcsI18n.tr` on that Portuguese result a second time. The
visible date was correct, but the runtime reported false missing translations
for `Maio` and `Novembro`, polluting translation telemetry and making a future
catalog collision possible. The renderer now passes `getMonth(s.month)`
directly; the live high-score screen remains `Maio de 2024`/`Novembro de 2023`
without those false missing-translation events.

## PT-170: Long squad locations overwrite the activity column

- Severity: Medium
- Type: Fixed-width layout / localized location name
- Screen: Base mode → Revisar seus Liberais e Monte Esquadrões
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; focused layout regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-review.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/post-fix-current.png`

The review table wrote a localized site name directly at column 31 and the
activity at column 51. `Fabricantes de brinquedos` therefore ran into
`Mantendo Discrição`, making the activity unreadable. The location and activity
cells now have explicit 19- and 29-column budgets with an empty separator. The
headless rebuilt screen keeps both values in their own cells, and the layout
test uses a deliberately long Portuguese site name.

## PT-171: Siege briefing used the wrong demonstrative

- Severity: Low
- Type: Translation agreement / concatenated prose
- Screen: Siege → escape or engage briefing
- Replay status: **Fixed and verified on 2026-08-02; context catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-siege-fight-menu.png`

The source sentence is split across two keys. Portuguese translated the first
fragment as `... sobreviver a isso` and the second as `confronto.`, producing
`sobreviver a isso confronto`. The fragment now ends with `a este`, yielding
`sobreviver a este confronto`.

## PT-172: Wanted-for-questioning announcement was unnatural

- Severity: Medium
- Type: Translation context
- Screen: Siege → loudspeaker surrender announcement
- Replay status: **Fixed and verified on 2026-08-02; focused siege regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-siege-start.png`

When no specific broken law was present, the generic template rendered
`Você é procurado por interrogatório!`. That construction is not idiomatic
Portuguese and does not preserve the English meaning “wanted for questioning”.
The zero-crime branch now uses a dedicated catalog key rendered as
`Você está sendo procurado para interrogatório!`; crime-specific announcements
still use the interpolated template.

## PT-173: Translation telemetry reported intentional rendered values

- Severity: Low
- Type: Translation pipeline / diagnostics
- Screen: Any paged Portuguese list; combat/equipment numeric updates
- Replay status: **Fixed and verified on 2026-08-02; logger and pager regressions added**

Pager getters return already-localized strings such as `[ - Anterior`, but
several callers sent those values through the translator a second time. The
runtime consequently reported false missing keys for pager labels, structural
templates, unchanged model/proper-name values such as `.44 Magnum` and `Banjo`,
and signed numeric deltas such as `+152`. Pager call sites now mark the
prelocalized values as `noTranslate`, and the logger ignores the existing
structural exception set plus signed numeric values. Human-readable missing
copy continues to be reported normally.

## PT-174: Founder skill rewards use inconsistent Portuguese vocabulary

- Severity: Medium
- Type: Translation/context
- Screen: New game → founder biography questions and activity descriptions
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; context catalog regression added**

The same `Computers` skill appeared as `Informática`, `Computação`, and
`Computadores` while creating a founder. The roster and canonical skill label
already use `Computadores`, so the mixed reward vocabulary was confusing and
made the biography screens appear to describe different skills. All founder
bonus strings and the training description now use the canonical
`Computadores` label. The fresh Portuguese replay showed `+1 Computadores`,
`+3 Computadores`, and both composite reward variants with the same term.

## PT-175: Opinion-poll fragments omit Portuguese articles

- Severity: Low
- Type: Translation/context
- Screen: Liberal Agenda → Opinion Polling (Parts 1–2)
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; context catalog regression added**

The agenda composes each polling sentence from translated fragments and a
dynamic executive name. The approval line rendered `uma opinião favorável de
Presidente Dino Dawkins`, and the gun-control row rendered `preocupados com
violência armada`. The fragments now produce `uma opinião favorável do
Presidente Dino Dawkins` and `preocupados com a violência armada`.

## PT-176: Sorting prompt interpolates the raw English list description

- Severity: Medium
- Type: Missing translation / dynamic interpolation
- Screen: Base mode → Assign Tasks to Liberals → Sort options
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; focused prompt regression added**

`SortingScreens.description` was passed as an interpolation value without a
translation lookup. Portuguese therefore showed `Escolha como ordenar a lista
de Liberal activity.` even though catalog entries existed for most list
descriptions. The prompt now translates that value before substitution and the
catalog adds the missing `hostages` entry. The replay showed
`lista de atividade Liberal` and `lista de reféns` with no English leak.

## PT-177: Portuguese flag footer is truncated before its final sentence

- Severity: Medium
- Type: Fixed-width layout / translation
- Screen: Base mode → Pride → flag selection
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; flag-menu regression added**

The Portuguese footer was 84 cells wide while `pagedInterface` reserves one
row for it and the next row for paging controls. The console stopped drawing
at column 80, leaving `Apenas algumas ... feitos pelo` with no `LCS.` and also
used the wrong gender for `bandeiras`. The translation is now a faithful
single-row sentence, `Poucas bandeiras podem ser compradas. Muitas outras
podem ser feitas pela LCS.`, which fits the fixed-width footer. The replay
showed the complete sentence in the live DOM buffer.

## PT-178: Sleeper and justice routes exposed raw site names

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: Base mode → Activate Sleepers; Justice site list
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; vocabulary regression added**

The sleeper activity and justice list used short site names that were not in
the Portuguese catalog. The live buffer therefore showed `WhiteHouse` and
`Police` inside otherwise translated screens. The canonical catalogs now map
these keys to `Casa Branca` and `Polícia`; the replay confirmed both routes
without the raw English names.

## PT-179: Full skill sheet leaked English headers and crossed a column boundary

- Severity: Medium
- Type: Missing translation / fixed-width layout
- Screen: Character profile → full skill sheet
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; vocabulary/layout regression added**

The full profile renderer wrote the source headers `NOW   MAX` with raw
`addstr`, so Portuguese mode displayed English labels. Translating the two
headers exposed a second defect: `ATUAL MÁX.` used the next skill column's
first cell. The renderer now translates both labels and keeps an explicit
blank separator; the rebuilt profile showed `ATUAL  MÁX.` followed by the
next `HABIL.` header in its own column.

## PT-180: Review-mode profile footer concatenated navigation controls

- Severity: Medium
- Type: Controls / missing translation / fixed-width layout
- Screen: Base mode → Review Liberals → profile detail
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; route regression added**

Review mode had a separate footer implementation from the normal profile
screen. It placed a translated `ESQUERDA` option beside an untranslated raw
`RIGHT` option with no reserved separator, producing `ESQUERDRIGHT - Ver
Outros`. The route now reuses the fitted profile-navigation helper and the
catalog uses `DIREITA`; the replay showed `ESQUERDA / DIREITA - Ver Outr…`.

## PT-181: Portuguese sleeper site names overwrote activity text

- Severity: Medium
- Type: Fixed-width layout / localized location name
- Screen: Base mode → Activate Sleepers
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; focused layout regression added**

After adding `Casa Branca`, the sleeper row wrote the localized location into
an unbounded cell beginning at column 42. `Mantendo Discrição` begins at
column 58, so the longer Portuguese value consumed its first characters. The
location cell now has a 15-column budget and ellipsis; the rebuilt buffer kept
the activity text readable after the separator.

## PT-182: Flag status labels leaked English and long rows overwrote issue text

- Severity: Medium
- Type: Missing translation / fixed-width layout
- Screen: Base mode → Pride → flag selection
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-02; integration and catalog regressions added**

The flag table passed `Free`, `Flying`, and `Banned` through translation
without catalog entries, and a long Portuguese flag name ran into the issue
column. The canonical catalogs now provide `Grátis`, `Hasteada`, and `Banida`.
The first column is fitted to 40 cells, leaving the issue cell at column 40;
the rebuilt menu showed an ellipsis before `Direitos LGBTQ+` instead of a
collision.

## PT-183: Compound status row exposed raw BOLLARDS and GENERATOR

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: Base mode → police-siege safehouse status
- Replay status: **Fixed and verified in a fresh strict-headless bundle on 2026-08-02; vocabulary regression added**

The safehouse compound status row was otherwise Portuguese but displayed the
raw English labels `BOLLARDS` and `GENERATOR`, both while the site was under
siege and after surrender returned to the normal safehouse screen. The
canonical catalogs now map these keys to the compact Portuguese labels
`POSTES` and `GERADOR`; the rebuilt browser buffer showed both translations in
the fixed-width row without a collision.

## PT-184: Daily injury-treatment messages left stale text on the fixed row

- Severity: Medium
- Type: Core layout / localized rendering
- Screen: End-of-day processing after a Liberal needs professional treatment
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-02; static and layout regressions added**

The injury-treatment branch wrote its localized sentence directly to row 8
with `mvaddstr`, without clearing the rest of the fixed-width console row. If
the preceding screen left a longer header or location label there, the live
buffer showed a Portuguese sentence followed by stale text, for example
`Os ferimentos de Jared Toft exigem tratamento profissional.l.-teto.`

The branch now uses `showAdvanceDayMessage`, which clears the row and fits the
localized template before waiting for input. A fresh deterministic replay with
the temporary all-pool injury fixture rendered the clean line
`Os ferimentos de Jared Toft exigem tratamento profissional.` and then reached
day 2 without residual text. Evidence is retained at
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/injury-message-2-20260802.png`
and `injury-drained-20260802.png`.

## PT-185: Squad assembly clipped the translated right-aligned header

- Severity: Medium
- Type: Fixed-width layout / localized rendering
- Screen: Base mode → Review Assets and Form Squads → squad assembly
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-02; focused layout regression added**

The squad assembly screen positioned `Squad: {name}` using the English
`Squad:` width, then translated the prefix to `Esquadrão:`. The longer
Portuguese label pushed the end of the default name off the 80-column console,
rendering `Esquadrão: O Esquadrão do Crime Lib`. The renderer now uses the
translated string's visible width through `mvaddstrRight`; the replay showed
the complete `Esquadrão: O Esquadrão do Crime Liberal` header.

## PT-186: CIA raid opening sentence fell back to English

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: CIA safehouse raid opening
- Replay status: **Fixed and verified in a fresh strict-headless Portuguese bundle on 2026-08-02; catalog and translation regression added**

The raid source passed one full template to `LcsI18n.processString`, but the
Portuguese catalog contained only two independently translated source
fragments. Exact lookup therefore fell back to the English sentence while the
following suspense messages were Portuguese. The canonical `pt_BR` catalog
now includes the complete `{location}` template. A fresh-origin replay showed
`No meio da noite, uma coluna de vans pretas sem identificação e com vidros
escuros cerca o ...` before continuing through the localized raid sequence.
Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-raid-english-arrival-20260802.png`
and `cia-raid-arrival-fixed-20260802.png`.

## PT-187: CIA suspense messages clipped long Portuguese translations

- Severity: Medium
- Type: Fixed-width layout / localized rendering
- Screen: CIA safehouse raid suspense sequence
- Replay status: **Fixed and verified in a fresh strict-headless Portuguese replay on 2026-08-02; focused layout regression added**

The CIA sequence wrote compound-suspense, camera, generator, solar-battery,
and darkness messages with single-row `mvaddstr` calls. Portuguese text was
longer than the fixed console width, so the camera message ended at
`...encarar diretamente os` and the darkness message lost its final period.
Those messages now use `addparagraph` so words wrap within the console before
the next prompt. The rebuilt buffer showed the complete camera sentence on two
rows and preserved `destrancam espontaneamente.` in the darkness message.

## PT-188: Character profile gender status exposed raw `Transgender`

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: Base mode → Review Liberals → character profile
- Replay status: **Fixed in the current strict-headless replay; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-transgender-fixed-20260808.png`

The profile's gender line translated `Nonbinary` and `Cisgender`, but a
transgender profile still rendered the raw English `Transgender` token:
`Nascimento: ... (Não binário, Transgender)`. The canonical Portuguese
catalog now maps `Transgender` to `Transgênero`; the focused vocabulary test
guards the entry, and a fresh web-server replay showed
`Nascimento: ... (Não binário, Transgênero)`.

## PT-189: Long Portuguese profile labels are ellipsized in fixed columns

- Severity: Low
- Type: Fixed-width layout / readability
- Screen: Base mode → Review Liberals → character profile stats, skills, and crimes
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-09; focused regressions added**
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-truncation-stats-20260808.png`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-truncation-skills-20260808.png`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-truncation-crimes-20260808.png`

The full profile now uses two wider skill columns and 35-cell crime labels,
with numeric values kept in dedicated cells. The fresh route rendered complete
`Primeiros Socorros`, `Armas Pesadas`, `profanação da bandeira nacional`, and
`entrada ilegal nos Estados Unidos` labels. Long crime descriptions use the
localized compact names `distribuição de drogas`, `terrorismo digital`, and
`vandalismo digital`; no prior ellipses appeared in the captured page buffers.

## PT-190: Medical-support help text used awkward literal Portuguese

- Severity: Medium
- Type: Translation / contextual wording
- Screen: Base mode → Assign Tasks → Health and Support
- Replay status: **Fixed in the current strict-headless replay; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-support-fixed-20260808.png`

The help paragraph said `Médicos capazes sempre fornecerão cuidados médicos
para si mesmos ou outro no mesmo local`, which is unnatural and leaves
`outro` without a noun. The fragments now compose as `Médicos capacitados
sempre oferecem cuidados médicos para si ou para outros no mesmo local`,
followed by the unchanged task warning. The contextual translation test
covers both revised fragments.

## PT-191: Wound status and special-injury labels fell back to English

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: Base mode → Review Liberals → character profile and task assignment
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-08; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/injury-profile-stats-20260808.png` (before), `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/injury-profile-translated-20260808.png` (after)

The deterministic injury fixture exposed raw `Sht,Brs,Cut,Trn,Brn` codes and
English labels such as `Heart Punctured`, `R. Lung Collapsed`, and `Broken
Neck` in an otherwise Portuguese profile. The catalog now covers every
`HumanoidBody.allSpecialInjuries()` key. Runtime wound codes are translated
component-by-component because their comma-separated combinations are built
at runtime. The regression also checks that the compact profile has no English
injury tokens.

## PT-192: Compact Portuguese wound labels overwrote adjacent columns

- Severity: Medium
- Type: Fixed-width layout / localized rendering
- Screen: Base mode → Assign Tasks → Liberal activity details
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-08; layout regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/activity-wounds-layout-fixed-20260808.png`

The compact activity view assumed the English `Top Skills:` heading and short
body-part names. Portuguese text rendered as `Habilidades PrincipaisPerna...`
and `Perna esquerdaTir...`, overwriting the wound/status column. The heading
and body-part labels now fit their cells, reserve a separator, and keep the
localized status codes readable (`Perna esque… Tir,Con,...`).

## PT-193: Hospital discharge used an untranslated site parameter

- Severity: Medium
- Type: Missing translation / contextual interpolation
- Screen: Daily healing → hospital discharge bill
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-08; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/injury-hospital-days-20260808.txt` (before), `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/hospital-discharge-translated-20260808.png` (after)

The discharge template itself was translated, but its `{site}` parameter was
passed as `p.site!.name`, so the bill screen said `recebendo alta de UW Medical
Center`. The caller now passes `p.site!.getName()`, producing `recebendo alta
de Centro Médico UW` and keeping the location consistent with the task screen.

## PT-194: Special-injury list overflows the fixed console

- Severity: Low
- Type: Fixed-width layout / discoverability
- Screen: Character profile with multiple severe injuries
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-09; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-pagination-20260808/before.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-pagination-20260808/after.png`

The injury fixture can produce more special injuries than the fixed stats
column can show beside the profile controls. The stats page now keeps the
first rows bounded and displays a localized `+7 outras — BAIXO` hint. The
existing up/down profile navigation opens a dedicated, localized injury page
that fits all 17 labels, including kidneys, stomach, spleen, and ribs, without
writing into the footer rows. Both the standalone profile screen and the
review-mode profile use the same page-count and renderer helpers.

## PT-195: Base roster weapon/ammo text collided with the armor column

- Severity: Medium
- Type: Fixed-width layout / localized rendering
- Screen: Base mode party roster
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-08; layout regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/roster-weapon-ammo-fixed-20260808.txt`

The roster's weapon cell used the full weapon title and ammo suffix without a
cell boundary. `M7 20/180` could run directly into `Jaqueta Punk`, especially
after Portuguese equipment labels were expanded. The weapon cell now has an
explicit width and the live buffer keeps a blank separator before the armor
column.

## PT-196: Sleeper review heading exposed raw `Sleepers`

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: Base mode → Review Assets and Form Squads
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-08; catalog regression added**

The management heading still displayed `Sleepers` while the rest of the review
menu was Portuguese. The canonical catalog now uses `Agentes Infiltrados` and
the review route shows the same phrase in its heading and option label.

## PT-197: Founder birth-sex description exposed raw `Intersex`

- Severity: Medium
- Type: Missing translation / character creation
- Screen: New game founder biography
- Replay status: **Fixed and verified in focused test and strict-headless replay on 2026-08-08**

The nonbinary founder path used the literal `Intersex` label instead of the
localized catalog. It now renders `Intersexo` through the shared translation
key.

## PT-198: Profile month names were capitalized mid-sentence

- Severity: Low
- Type: Contextual translation / readability
- Screen: Base mode → Review Liberals → profile birth date
- Replay status: **Fixed and verified in focused test and strict-headless replay on 2026-08-08**

Portuguese profile dates rendered `9 de Novembro`, using the standalone month
translation in a sentence. The sentence-context month helper now lowercases
the month (`9 de novembro`) without changing title-style month headings.

## PT-199: Loaded weapon titles clipped before the ammo count

- Severity: Medium
- Type: Fixed-width layout / equipment rendering
- Screen: Base mode → Equip Squad → weapon assignment
- Replay status: **Fixed and verified in focused test and strict-headless replay on 2026-08-08**

The long weapon title was fitted before its ammo suffix, so the useful count
could disappear (`Rifle M…`). Equipment routes now use a compact title such as
`Rifle M7 (20)` before fitting, preserving the count in the fixed cell.

## PT-200: Task-detail skill text overwrote the wound column

- Severity: Medium
- Type: Fixed-width layout / localized rendering
- Screen: Base mode → Assign Tasks → activity details
- Replay status: **Fixed and verified in focused test and strict-headless replay on 2026-08-08**

`Armas de Fogo: 0.0` was rendered without a bounded skill cell, so the next
Portuguese wound label began immediately after the value (`0.0Braço...`). The
skill summary now fits its cell and leaves a separator before wounds.

## PT-201: Sleeper review option capitalization differed from its heading

- Severity: Low
- Type: Translation consistency
- Screen: Review Assets and Form Squads menu
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-08**

The heading used `Agentes Infiltrados`, but the numbered option used
`Agentes infiltrados`. The option now follows the title-case wording of the
heading.

## PT-202: Full profile vehicle text overwrote the first skill value

- Severity: Medium
- Type: Fixed-width layout / profile rendering
- Screen: Character profile with a vehicle assigned
- Replay status: **Fixed and verified in focused test and strict-headless replay on 2026-08-08**

Long localized vehicle names plus the driver suffix could reach the skill
column (`Carro: ... 31.00`). The vehicle field now stops one column before the
skill sheet and ellipsizes its own content.

## PT-203: Sleeper activation names overwrote job and site columns

- Severity: Medium
- Type: Fixed-width layout / management table
- Screen: Base mode → Activate Sleeper Agents
- Replay status: **Fixed and verified in focused test and strict-headless replay on 2026-08-08**

Long Portuguese sleeper names ran into the job and location columns in both
the single-agent and bulk activation tables. Both name cells now have explicit
widths and retain a blank separator before the following column.

## PT-204: Sleeper activation headers exposed raw `JOB` and `SITE`

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: Activate Sleeper Agents tables
- Replay status: **Fixed and verified in focused test and strict-headless replay on 2026-08-08**

The table headers were still English (`JOB`, `SITE`). Canonical Portuguese
entries now render `PROFISSÃO` and `LOCAL` in both activation modes.

## PT-205: Bulk sleeper management mixed raw English actions with an overflowing activity cell

- Severity: Medium
- Type: Missing translation + fixed-width layout
- Screen: Activate Sleeper Agents in bulk
- Replay status: **Fixed and verified in focused test and fresh strict-headless replay on 2026-08-08**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/sleeper-bulk-fixed-20260808.txt`

The bulk table exposed English headers/actions (`EFF`, `CURRENT`, `BULK
ACTIVITY`, `Lay Low`, `Advocate Liberalism`, and others). Its current-activity
text also ran into the numbered action options, and the footer was hard-clipped
at the right edge. The Portuguese catalog now covers the headers/actions; the
current-activity and action cells are bounded, and the footer uses ellipsis.

## PT-206: Social weapon label exposed raw `Voice`

- Severity: Medium
- Type: Missing translation / character profile
- Screen: Character profile with a social weapon
- Replay status: **Fixed and verified in focused test and strict-headless replay on 2026-08-08**

The profile's weapon line showed `Voice` while all surrounding labels were
Portuguese. The canonical entry now renders `Voz`.

## PT-207: Equipment reassignment headers exposed raw English labels

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: Equip Squad → move equipment between safehouses
- Replay status: **Fixed and verified in fresh strict-headless replay on 2026-08-08**

The reassignment table used `CURRENT LOCATION` and `NEW LOCATION`. These
headers now render `LOCALIZAÇÃO ATUAL` and `NOVO LOCAL`, with the item and
location cells still separated in the 80-column console.

## PT-208: Compact health and armor codes exposed raw English abbreviations

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: Site-mode party roster and combat roster
- Replay status: **Fixed and verified in focused test and fresh strict-headless replay on 2026-08-08**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/health-status-fixed-20260808.txt`

Low-intelligence health summaries rendered `Crit`, `OK`, and armor codes such
as `+Lgt` and `+Hvy` in an otherwise Portuguese roster. The canonical short
labels now render as `Crít`, `Bem`, `+Lev`, and `+Pes` (with the remaining
severity levels covered as well), preserving the compact column width.

## PT-209: Founder succession message fell back to English after a split key

- Severity: Medium
- Type: Missing translation / complete-template lookup
- Screen: Daily advance after the founder dies
- Replay status: **Fixed and verified in focused test and fresh strict-headless replay on 2026-08-08**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/founder-succession-fixed-20260808.txt`

The source concatenated `"{newboss} is the new leader "` with
`"of the Liberal Crime Squad!"`, while the Portuguese catalog only contained
the fragment with a trailing space. Exact lookup therefore showed the full
English sentence. The source now uses one complete template and the live
buffer shows `James Simon é o novo líder do Esquadrão do Crime Liberal!`.

## PT-210: High-school dropout was translated as an escapee

- Severity: Medium
- Type: Contextual translation error
- Screen: New game biography, recruitment profession selector, and character profile
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-08; focused regressions updated**

The `Highschool Dropout` creature type appeared as `Evadido do Ensino Médio`.
In Brazilian Portuguese, `evadido` describes someone who escaped or fled, so
the label misrepresented the recruit type. The catalog now uses the contextual
person label `Desistente do Ensino Médio`, and recruitment/profile vocabulary
tests cover it.

## PT-211: Generated newspaper gender words and capitalization fell back to English

- Severity: Medium
- Type: Missing translation / generated interpolation
- Screen: Monthly advance → Portuguese newspaper article
- Replay status: **Fixed and verified by strict-headless newspaper replay and focused regression on 2026-08-08**

A generated `WOKE HIRE` article rendered `(man)` after the Portuguese phrase
`uma pessoa negra` and left the sentence-start interpolation as `He
provavelmente...`. The dynamic `man`/`woman`/`friend` vocabulary is now in the
catalog, and the article capitalizes the translated lower-case pronoun rather
than looking up the absent key `He`/`She`.

## PT-212: Bulk regular-activity choices leaked English labels

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: Atribuir Tarefas → Atribuir Tarefas em Massa
- Replay status: **Fixed and verified in strict-headless Portuguese replay and focused regression on 2026-08-08**

The bulk-action selector rendered `Community Service`, `Liberal Activism`,
`Liberal Guardian`, `Legal Fundraising`, `Sell Brownies`, `Prostitution`,
`Credit Card Fraud`, `Stealing Cars`, and `Recruiting` in English even though
the surrounding task-management screens were Portuguese. The selector now
translates the enum labels through `LcsI18n`; the missing `Sell Brownies` and
`Stealing Cars` keys are present in both canonical locales.

## PT-213: Bulk regular-activity column clipped long Portuguese labels

- Severity: Medium
- Type: Fixed-width layout / readability
- Screen: Atribuir Tarefas → Atribuir Tarefas em Massa
- Replay status: **Fixed and verified in strict-headless Portuguese replay and focused layout regression on 2026-08-08**

After localization, `Fraude de Cartão de Crédito` was written with an
unbounded option renderer at column 51 and silently ended as
`Fraude de Cartão de Crédi`, with no indication that the text was truncated.
The bulk selector now uses the fitted option renderer and shows a visible
ellipsis while preserving the 80-column boundary.

## PT-214: Bulk regular-activity header leaked `CURRENT ACTIVITY`

- Severity: Medium
- Type: Missing translation / route coverage
- Screen: Atribuir Tarefas → Atribuir Tarefas em Massa
- Replay status: **Fixed and verified in strict-headless Portuguese replay and focused layout regression on 2026-08-08**

The bulk table header still showed `CURRENT ACTIVITY`; the Portuguese bundle
now renders `ATIVIDADE ATUAL` and keeps the header cell separated from the
bulk-action column.

## PT-215: Under-attack briefing clipped translated text and used broken fragments

- Severity: Medium
- Type: Contextual translation / fixed-width layout
- Screen: Safehouse siege → `F - Lutar` → `SOB ATAQUE: FUGIR OU ENFRENTAR`
- Replay status: **Fixed and verified in a fresh strict-headless Portuguese replay on 2026-08-08**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/under-attack-briefing-20260808/before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/under-attack-briefing-20260808/after.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/under-attack-briefing-20260808/after.png`

The briefing was drawn as fixed source-width rows. Portuguese text was silently
cut at the 80-column edge (`...Crime Liber`, `...grupo maio`, and `...dar
cobert...`), while separately translated fragments produced malformed grammar
such as `ele estar`, `um Liberais`, and `dar cobertura fogo`. The source now
looks up one complete catalog template and wraps the combined body with
`addparagraph` before the prompt. The live buffer now shows grammatical
Portuguese throughout, with every body line inside the console boundary and the
prompt preserved on its own row. A focused siege translation regression guards
the wrapped layout.

## PT-216: Siege wait warning was a literal, ungrammatical phrase

- Severity: Medium
- Type: Contextual translation / fixed-width layout
- Screen: Safehouse siege base screen
- Replay status: **Fixed and verified in a fresh strict-headless Portuguese replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/siege-wait-warning-20260809/after.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/siege-wait-warning-20260809/after.png`

The warning `Cannot Wait until Siege Resolved` rendered as
`Não Pode Esperar até Cerco Resolvido`, which was not natural Brazilian
Portuguese and used title-style capitalization in a sentence. The replacement
`Não pode esperar até o cerco terminar` preserves the meaning, fits the
left-hand 38-column area, and leaves `X - Sair para a Tela Inicial` intact in
the adjacent column. A base-mode regression covers both the wording and the
column boundary.

## PT-217: Single-arrest siege result used a malformed present-tense fragment

- Severity: Medium
- Type: Contextual translation
- Screen: Police siege surrender with exactly one wanted Liberal
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/single-arrest-20260809/before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/single-arrest-20260809/after.txt`

The one-person branch rendered `Prendem Antonio Balgos.`. This is an
imperative-like fragment rather than a natural report of what just happened.
The catalog now uses `A polícia deteve {name}.`, and the focused Portuguese
context regression covers the exact branch wording.

## PT-218: Built-in high-score slogans bypassed Portuguese localization

- Severity: Medium
- Type: Missing translation / legacy-save compatibility
- Screen: Game over → high scores after a CIA terminal surrender
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-surrender-20260809/before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-surrender-20260809/after.txt`

The game-over screen showed the stored built-in slogan `Revolution never
comes with a warning!` in English while the surrounding score screen was
Portuguese. High-score rendering now localizes only known built-in default
slogans and preserves arbitrary player-created slogans. A focused regression
covers both behaviors.

## PT-219: Medical-debt receipt labels were untranslated and overlaid by dots

- Severity: High
- Type: Missing translation / fixed-width layout
- Screen: Medical-industry siege surrender receipt
- Replay status: **Fixed and verified in strict-headless Portuguese replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-20260809/before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-20260809/after-fixed.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-20260809/after-fixed.png`

The receipt initially leaked five English labels: `Total outstanding debt`,
`Cash paid`, `Good faith adjustment`, `Total debt cleared`, and `Total debt
remaining`. Adding catalog entries exposed a second defect: the dot leader was
positioned using the English source length, so longer Portuguese labels were
silently overwritten (`Total da dívida penden...`, `Total da dívida qu...`).
The receipt now translates and fits the label before calculating the dot
leader, keeping every amount at column 50. A direct receipt-rendering test
guards the Portuguese labels and column alignment.

## PT-220: Bluff result left the previous talk header suffix on screen

- Severity: Medium
- Type: Fixed-width layout / stale frame rendering
- Screen: Live site encounter → `T - Falar` → `C - Blefar`
- Replay status: **Fixed and verified in a fresh strict-headless Portuguese replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/live-combat-20260809/bluff-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/live-combat-20260809/bluff-before.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/live-combat-20260809/bluff-after.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/live-combat-20260809/bluff-after.png`

The bluff branch wrote the shorter result directly over the row containing
`Buster Lovecraft fala com Pierre Willett:`. Because it did not clear the
message area first, the live Portuguese buffer showed
`"A situação está sob controle."e Willett:`. The branch now clears rows 9–10
before rendering every bluff response. The focused
`test/talk/talk_in_combat_layout_test.dart` regression captures the actual
intermediate frame and asserts that the previous target name cannot remain.

## PT-221: Long Portuguese major-event picture caption crashed the newspaper

- Severity: High
- Type: Fixed-width layout / runtime crash
- Screen: Monthly advance → Portuguese major-event newspaper (`View.sweatshops`)
- Replay status: **Fixed and verified by a deterministic Portuguese rendering regression and a fresh strict-headless sweep through 13 Feb 2023 on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/monthly-sweep-20260809/day-17-0.txt`

The monthly sweep reached the sweatshop picture story and crashed while
centering its localized caption. `Uma camiseta em uma loja é encontrada
rabiscada com uma mensagem de um trabalhador de uma oficina exploradora.` is
longer than the 80-column console, so `mvaddstrCenter` computed an x origin of
`-8` and `Console.addchar` raised a `RangeError`. Picture captions now pass
through the existing console-width fitter after localization, preserving a
visible ellipsis and leaving the stored story text available for the article
view. `test/newspaper/herald_translation_test.dart` renders the exact event in
Portuguese and guards both normal completion and the ellipsis boundary.

## PT-222: Live combat talk header exposed the generated SWAT target in English

- Severity: Medium
- Type: Missing translation / dynamic interpolation
- Screen: Ordinary live site encounter → `T - Falar`
- Replay status: **Fixed and verified in strict-headless Portuguese replay and focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/live-encounter-20260809/ordinary-combat-open.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/live-encounter-20260809/talk-header-fixed.txt`

The ordinary police encounter itself rendered `Policial da SWAT`, but the
combat-talk header inserted the generated creature's raw `name`, producing
`Les Rappaport fala com SWAT Officer:`. The talk and intimidation response
paths now use `localizedCreatureName`, which translates built-in type names
while preserving player-created names. The Portuguese combat-layout
regression asserts the full localized header.

## PT-223: Portuguese transport labels clipped the driver marker

- Severity: Medium
- Type: Fixed-width layout / stale suffix
- Screen: Ordinary live site encounter and base party roster
- Replay status: **Fixed and verified by focused Portuguese layout regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/live-encounter-20260809/ordinary-combat-open-fixed.txt`, `/home/henry/tmp/lcs-new-age-playtest/live-encounter-20260809/surrender-fixed.txt`

The localized vehicle label `Esportivo` occupied nearly the entire ten-column
transport cell. Appending the driver marker afterward left a dangling
`Esportivo-` and hid the `D`. Party rendering now reserves the two marker
columns before fitting the translated vehicle name, so the marker remains
visible with an ellipsis when needed. The focused layout regression checks that
the cell contains `-D` and never ends with a bare hyphen.

## PT-224: Graffiti pickup used the wrong article and leaked the English safehouse name

- Severity: Medium
- Type: Contextual translation / dynamic location name
- Screen: Daily graffiti activity when a Liberal scavenges spray paint
- Replay status: **Fixed and verified by focused Portuguese activity regression on 2026-08-09**

The pickup message rendered `Wally Rexford agarrou um Tinta spray de Homeless
Camp.`. The article disagreed with the feminine weapon name, and the activity
passed the site's raw English `name` instead of its locale-aware display name.
The message now uses the parameter-aware translation path and `Site.getName()`,
producing `Wally Rexford pegou uma Tinta spray no Acampamento sem-teto.`.
`test/daily/graffiti_translation_test.dart` covers the exact Portuguese output
and the safehouse localization.

## PT-225: Long Portuguese skill names collided with education values

- Severity: Medium
- Type: Fixed-width layout
- Screen: Base → Atribuir Tarefas → Educação e Aprendizado → skill picker
- Replay status: **Fixed and verified in strict-headless Portuguese replay and focused regression on 2026-08-09**

With a high first-aid value, the picker joined the translated label and number
as `Primeiros Socorros30.0`. The numeric columns now start one cell later,
leaving a separator after long skill names while preserving the description
column and 80-column buffer. The Portuguese core-vocabulary regression asserts
the separator and rejects the collision.

## PT-226: Justice Amok used an ungrammatical possessive interpolation

- Severity: Medium
- Type: Contextual translation / dynamic interpolation
- Screen: Portuguese newspaper → Justice Amok major event
- Replay status: **Fixed and verified by focused regression plus a rebuilt strict-headless newspaper route on 2026-08-09**

The translated article composed the source placeholders as `com base em dele
crença de que ...`, which is not valid Brazilian Portuguese. The catalog now
keeps the reason phrase independent and places the gendered possessive in the
neutral `na opinião {judgePossessive}` clause, so both `dele` and `dela` remain
grammatical. `test/newspaper/herald_translation_test.dart` renders the exact
template and rejects the old `dele crença` form.

## PT-227: Combat death messages clipped long Portuguese final words

- Severity: Medium
- Type: Fixed-width layout / combat feedback
- Screen: Police siege → `F - Lutar` → live combat death-result message
- Replay status: **Fixed and verified in a fresh strict-headless Portuguese siege replay and focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-death-20260809/death-message-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-death-20260809/death-message-after.txt`

The final-words branch wrote a localized sentence directly into one fixed-width
row. At 80 columns the Portuguese line ended at
`"Melhor morrer do que ser liber`, silently dropping the rest of
`liberal...`. Death messages now render through a two-row `addparagraph` area,
so the live replay keeps the complete output as
`"Melhor morrer do que ser` / `liberal...` and preserves the combat roster
below it. `test/sitemode/fight_death_layout_test.dart` selects the deterministic
final-words branch, asserts the complete Portuguese sentence, and checks the
80-column buffer invariant.

## PT-228: Combat death message used a subject pronoun as a possessive

- Severity: Medium
- Type: Contextual translation / gendered interpolation
- Screen: Portuguese ordinary police combat death message
- Replay status: **Fixed and verified by focused Portuguese regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-combat-layout-20260809/overlap.txt`

The live female-officer branch rendered `o corpo ela`, because the death
renderer translated the English `her` key instead of the catalog's
`her (possessive)` entry. The sentence now uses the possessive catalog key and
the neutral verb form, producing `morre antes que o corpo dela atinja o chão.`
The focused death-layout suite covers the deterministic branch and rejects the
old `corpo ela` composition.

## PT-229: Encounter health text overwrote the police-station map

- Severity: Medium
- Type: Fixed-width layout / combat roster
- Screen: Portuguese ordinary police combat map and encounter roster
- Replay status: **Fixed and verified in a fresh strict-headless route plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-combat-layout-20260809/overlap.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-combat-layout-20260809/overlap-fixed.txt`

The encounter roster printed health and armor from column 49 without a width
limit, while the map preview starts at column 55. Portuguese armor details
therefore overwrote the map (`Bem +Ext.d` and `Bem   xt.`). The compact health
cell now fits within six columns, preserving the map frame and its contents
with a bounded ellipsis. `test/sitemode/site_encounter_layout_test.dart`
protects the map columns and the 80-column buffer invariant.

## PT-230: Education skill picker joined max value to description

- Severity: Medium
- Type: Fixed-width layout / education picker
- Screen: Base → Atribuir Tarefas → Educação e Aprendizado → Praticar uma Habilidade
- Replay status: **Fixed and verified in strict-headless Portuguese replay and focused regression on 2026-08-10**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/education-skill-layout-20260810/before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/education-skill-layout-20260810/after.txt`

The picker placed `DESCRIÇÃO` at column 34 immediately after `MÁX.` at
column 29. Portuguese max values such as `38.00` consumed through column 33,
so rows rendered as `38.00Crie obras visuais...`. The description header and
text now start at column 35, preserving column 34 as a separator, and the
description is fitted to the right edge. The focused core-layout regression
checks the separator, description start, and Portuguese text.

## PT-231: Narrow title version overwrote the frame border

- Severity: Medium
- Type: Fixed-width layout / responsive viewport
- Screen: Portuguese title screen at a 480×320 viewport
- Replay status: **Fixed and verified in strict-headless Portuguese replay and focused regression on 2026-08-10**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/title-narrow-pt-480x320-20260810.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/title-narrow-pt-480x320-20260810-fixed2.png`

The title frame reserves columns 78–79 for its right border, but the version
metadata used an un-margined right-aligned renderer and wrote through column
79. At the narrow viewport this visibly clipped `Versão 1.5.5.HF.1-SNAPSHOT`
against the border. A two-column right margin keeps both frame cells clear;
`test/title_screen/title_screen_translation_test.dart` now protects them.

## PT-232: Combat heart injury used the wrong Portuguese role article

- Severity: Medium
- Type: Contextual translation / possessive interpolation
- Screen: Portuguese police siege → live combat → torso special injury
- Replay status: **Fixed and verified in a strict-headless siege replay plus focused regression on 2026-08-10**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/heart-possessive-20260810/heart-message-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/heart-possessive-20260810/victory-fixed.png`

The heart-injury branch translated the English possessive template as
`O coração de {name} foi destruído!`. When `{name}` was the generated role
label `Policial da SWAT`, the live Portuguese buffer showed
`O coração de Policial da SWAT foi destruído!`; the role label needs the
contracted masculine article `do`. Proper names still need the neutral `de`
construction.

The combat renderer now formats a locale-aware possessive name (`do`/`da` for
generated role labels, `de` for named characters), and the blast, torn, and
punctured-heart catalog templates share the article-safe form. The focused
context regression covers both the generated SWAT label and `Zack Marsh`, and
the same headless campaign reached the Portuguese siege victory screen after
the fix.

## PT-233: Tailoring skill label disagreed with the rest of the Portuguese UI

- Severity: Medium
- Type: Contextual translation / vocabulary consistency
- Screen: Base → Atribuir Tarefas → Educação e Aprendizado → skill picker
- Replay status: **Fixed and verified in strict-headless replay plus focused context regression on 2026-08-10**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/tailoring-label-20260810/skill-picker.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/tailoring-label-20260810/skill-picker-after.txt`

The skill picker rendered `T - Costura`, while founder rewards and the help
text consistently called the same `Tailoring` skill `Alfaiataria`. The catalog
label now uses `Alfaiataria`, and the focused activity-menu regression asserts
the shared vocabulary.

## PT-234: Generated latte-stand names used malformed adjective fragments

- Severity: Low
- Type: Contextual translation / generated commerce name
- Screen: Travel → Centro de Seattle site list
- Replay status: **Fixed and verified in strict-headless replay plus focused composition regression on 2026-08-10**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/latte-name-20260810/latte-after.txt`

The dynamic Portuguese template turned `Milky Mug Latte Stand` into
`Quiosque de Latte Caneca de Leitoso`; the adjective was being used after
`de` as though it were a noun. Context-specific fragments now render as
`Leite` and `Espuma`, producing grammatical forms such as
`Quiosque de Latte Caneca de Leite` and `Quiosque de Latte Caneca de Espuma`.
The catalog composition regression covers both repaired fragments.

## PT-235: Full-map overlay left a clipped control legend

- Severity: Medium
- Type: Fixed-width layout / site map
- Screen: Portuguese site mode → `M - Mapa`
- Replay status: **Fixed and verified in strict-headless replay plus focused map-overlay regression on 2026-08-10**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/site-controls-overflow-20260810/map-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/site-controls-overflow-20260810/map-after.txt`

The full map draws through rows 1–23, but the underlying command legend was
left in place. Unknown tiles exposed fragments such as `W,A,`, while the
remaining Portuguese controls were clipped off the bottom of the 25-row
console. The overlay now clears the stale roster/legend and reserves row 24
for the localized `Pressione qualquer tecla para continuar.` prompt.

## PT-236: Vehicle assignment leaked prompts and dropped its final controls

- Severity: Medium
- Type: Vehicle translation / fixed-width layout
- Screen: Portuguese base → vehicle assignment (`V`)
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/vehicle-passenger-20260810/before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fixed-route-20260809/vehicle-after-fresh-server.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fixed-route-20260809/vehicle-passenger-after.txt`

The passenger prompt fell back to English (`Choose a Liberal to be a
passenger.`), and the original footer wrote rows 25 and 26 even though the
console ends at row 24. The red vehicle-status note and `Enter - Done` were
therefore invisible. The driver/passenger prompts now have Portuguese catalog
entries, the status legend is compact and fitted, and the completion action is
kept on row 24. `test/basemode/pt_br_vehicle_layout_test.dart` protects the
translations, visible footer, and 80-column bound.

## PT-237: Review profile footer overwrote injury overflow text

- Severity: Medium
- Type: Profile layout / fixed-width footer
- Screen: Portuguese review mode → active Liberals → `V` details → profile
- Replay status: **Fixed and verified in strict-headless Portuguese replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fixed-route-20260809/review-profile-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fixed-route-20260809/review-profile-after-decoded.txt`

With a badly injured Liberal, the compact special-injury overflow marker was
drawn on the same row as the review action. The old buffer ended with
`A - Atribuir uma TarefaO`, because the action overwrote the marker's right
edge. Profile-page rendering now reserves row 22 for that footer, reducing the
visible injury list by one row only when needed. The marker remains intact and
the action is fully readable; `test/basemode/pt_br_profile_footer_layout_test.dart`
covers the collision.

## PT-238: Portuguese safehouse status labels overwrote adjacent columns

- Severity: Medium
- Type: Safehouse layout / translated fixed-width labels
- Screen: Portuguese base mode → CIA siege safehouse
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/siege-cia-20260809/base-siege-before-decoded.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/siege-cia-20260809/base-siege-after-pt-inline.txt`

The base renderer kept English column positions for compound upgrades. The
longer Portuguese labels therefore rendered as
`CÂMERAS DESLIGADARMADILHAS` and `CANHÃO AAPOSTES` in the live siege buffer.
Each status now uses a bounded fitted cell with explicit one-column separators;
the focused core-layout regression covers cameras, traps, the AA gun, and
bollards, and the corrected replay keeps the entire row inside 80 columns.

## PT-239: Universal score labels referred to continents instead of people

- Severity: Low
- Type: Title translation / contextual wording
- Screen: Portuguese title screen → Universal Liberal Statistics
- Replay status: **Fixed and verified in a fresh strict-headless title replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/title-stats-pt-20260809/title.txt`

The score counters track Americans lost and saved, but the source labels said
`Total Americas Lost/Saved`. Portuguese consequently displayed
`Total de Américas Perdidas/Salvas`, which describes continents rather than
people. The canonical keys now use `Americans`, with Portuguese labels
`Total de Americanos Perdidos/Salvos`; the title capture confirms both labels
fit their columns.

## PT-070: Activity preview remained stale after category changes

- Severity: Medium
- Type: Activity selection / fixed-width redraw
- Screen: Portuguese base mode → `Atribuir Tarefas` → activity category
- Replay status: **Fixed and verified in strict-headless replay plus focused regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/activity-sweep-20260811/acquisition-menu.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/activity-sweep-after-20260811/07-acquisition-menu-postfix.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/activity-sweep-after-20260811/08-acquisition-recruiting-postfix.txt`

Switching from Liberal Activism to `Recrutamento e Aquisição` changed the
submenu but left the previous activity footer visible, for example
`vai assar e vender brownies de maconha.`. The footer now clears its three
detail rows whenever the current activity does not belong to the open
category. Choosing a valid sub-option restores the localized preview, such as
`vai recrutar novos membros.`. The focused
`activity category changes clear the previous action preview` regression
protects both the blank transition and subsequent selection behavior.

## PT-071: Review profile footer loses the navigation separator in Portuguese

- Severity: Medium
- Type: Controls / translation / fixed-width layout
- Screen: Portuguese review mode → active Liberals → profile details
- Replay status: **Fixed and verified in strict-headless replay plus focused regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/route-sweep-20260811/25-profile-actions.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/route-sweep-after-20260811/25-profile-after-fix`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/route-sweep-after-20260811/25-profile-after-fix.png`

The profile footer placed the translated `CIMA` option at a fixed English
width, then wrote the literal ` / ` separator and the translated `BAIXO`
option at overlapping coordinates. The Portuguese buffer therefore showed
`CIMA BAIXO - Mais Info`, making the two navigation actions ambiguous.

Profile navigation now uses the shared bounded option helper, which advances
the separator after the localized prefix. The replay shows
`CIMA / BAIXO - Mais Info` inside the 80-column console, and the focused
Portuguese vocabulary regression protects both the separator and the absence
of the old merged form.

## PT-240: Injury-death result leaves the previous hospital destination tail

- Severity: Medium
- Type: Daily redraw / fixed-width layout
- Screen: Portuguese management → hospital treatment → next-day injury death
- Replay status: **Fixed and verified in strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/management-hospital-sweep-20260809/10-after-hospital-day.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/management-hospital-sweep-after-20260809/09-hospital-message-after-fix.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/management-hospital-sweep-after-20260809/10-death-after-fix.txt`

The hospital branch first displayed a long destination message such as
`Grace Redman estará em Centro Médico UW por 16 meses.`. When the Liberal died
of injuries on the following day, the death branch used a raw `mvaddstrc` call
and overwrote only the beginning of the row. The live buffer therefore showed
`Sandy Zedong morreu de ferimentos.co UW por 16 meses.`. The death result now
uses `showAdvanceDayMessage`, which clears the row before rendering the shorter
localized result. The focused layout regression verifies that the hospital
location and duration cannot survive into the death message.

## PT-241: Safehouse investment options clip and mix Portuguese currency formats

- Severity: Medium
- Type: Investment menu / translation / fixed-width layout
- Screen: Portuguese base → LA warehouse → `I - Investir neste local`
- Replay status: **Fixed and verified in strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/map-travel-sweep-20260809/14-invest.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/map-invest-after-20260809/09-invest-after.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/map-invest-after-20260809/09-invest-after.png`

The long automated translation for the bollard upgrade contained invisible
zero-width spaces and ran through the right edge, leaving only `(US` visible
for its price. The same menu mixed `$ 2.000`, `$3000`, `$40,000`, and `US$`
formats. Investment rows now use the bounded option renderer, the bollard
label is a concise contextual Portuguese phrase, and static and dynamic costs
use the consistent Portuguese `US$ 3.000`/`US$ 40.000` style. The focused
regression checks the full bollard row, removes the zero-width characters, and
asserts the dynamic solar cost remains inside the 80-column console.

## PT-242: Private Military combatants remained in English

- Severity: Medium
- Type: Combat translation / generated creature names
- Screen: Portuguese safehouse siege → live corporate combat
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-live-20260809/04-live-encounter-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-live-20260809/06-live-encounter-after.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-live-20260809/08-game-over-after.txt`

The corporate siege route exposed the XML creature type name `Private
Military` in both the opening attack message and the encounter roster, even
though the rest of the route was Portuguese. The canonical catalogs now map
that generated role label to `Militar Privado`; the shared
`localizedCreatureNameValue` path therefore covers combat messages and every
roster/profile caller. The focused Portuguese context regression asserts the
catalog entry, translation presence, and rendered creature name. The replay
also reached the live death reflection and high-score screen without a new
layout defect.

## PT-243: Composed status values were translated a second time

- Severity: Low
- Type: Translation telemetry / composed runtime values
- Screen: Portuguese founder creation → biography prompt → base status header
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regressions on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/dc-route-20260809/07-console-warnings.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/dc-route-20260809/07-console-warnings-after.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/dc-route-20260809/07-tragic-origin-volunteer-after.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/dc-route-20260809/08-base-after-city-code.txt`

The Portuguese founder route displayed correct text, but the console reported
false missing translations for already-rendered values such as
`~130/130`, `+~30 (proteção)`, and the localized volunteer biography answer.
City codes such as `DC` were also sent through the prose translator. This
polluted headless telemetry and made real missing translations harder to spot.

Compact health/armor rendering now translates only stable catalog entries,
already-localized biography options opt out of a second pass, and city short
names remain stable map codes. The focused vocabulary, logger, and character
creation tests cover the behavior. A rebuilt headless replay keeps the visible
Portuguese output while the warning log contains no false entries from these
values.

## PT-244: Headquarters route names remained in English

- Severity: Medium
- Type: Travel / site translation
- Screen: Portuguese base → Leste de Washington → headquarters routes
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809/03-intelligence-hq-map-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809/05-corporate-hq-map-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809-final/01-washington-menu-after.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809-final/02-corporate-hq-map-after.txt`

The Portuguese travel menu exposed `Intelligence HQ` and `Corporate HQ`, and
the site-mode header repeated the English names. The canonical catalogs now
provide `Sede de Inteligência` and `Sede Corporativa`; the fresh route renders
both names in the travel menu and the site header (`SEA — Sede Corporativa,
Nível 1`).

## PT-245: Guard Dog encounter label remained in English

- Severity: Medium
- Type: Combat translation / generated creature names
- Screen: Portuguese security-site encounters
- Replay status: **Fixed and verified by focused combat-context regression and strict-headless HQ replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809/04-intelligence-hq-console.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809/05-corporate-hq-console.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809-final/02-corporate-hq-console-after.txt`

Security maps instantiated `Guard Dog` alongside translated `Agent`, leaving a
raw English generated role in the encounter path. `Guard Dog` is now a
canonical Portuguese entry (`Cão de Guarda`) and the shared creature display
helper is covered by `pt_br_context_translation_test.dart`.

## PT-246: Generated Portuguese site names polluted missing-translation telemetry

- Severity: Low
- Type: Translation telemetry / generated names
- Screen: Portuguese travel and site-mode headers
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809/01-console-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809/06-army-base-console.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809-final/01-console-after.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809-final/02-corporate-hq-console-after.txt`

Names generated during world creation, such as `Prisão Sullivan` and `Base
do Exército McKinley`, were already localized but were sent back through the
English-key translator on every render. That produced false missing-key
warnings. `Site.getName` now translates only stable catalog keys and preserves
generated localized values; the core vocabulary regression covers this path.

## PT-247: Numeric display shells polluted missing-translation telemetry

- Severity: Low
- Type: Translation telemetry / runtime formatting
- Screen: Portuguese roster, armor, and shop-price renderers
- Replay status: **Fixed and verified by focused logger regressions and a fresh strict-headless replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809/01-console-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/travel-sweep-20260809-final/01-console-after.txt`

Runtime shells `{current}/{max}`, `+{armor}`, and ` ({price})` were logged as
untranslated even though their numeric values and surrounding labels are
assembled at render time. The structural-key allowlist now matches the
trimmed price shell and both compact health/armor shells. Logger and core
Portuguese regressions assert that these values stay out of the missing-key
report.

## PT-248: New-squad header is clipped at the right edge in Portuguese

- Severity: Medium
- Type: Review layout / fixed-width rendering
- Screen: Portuguese review mode → `Z - Montar um Novo Esquadrão`
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-sweep-20260809/13-assemble-squad.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-sweep-20260809/13-assemble-squad.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-sweep-20260809/14-assemble-squad-fixed.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-sweep-20260809/14-assemble-squad-fixed.png`

The new-squad renderer placed the source-length `New Squad` label at column
71. Its Portuguese translation, `Novo Esquadrão`, is longer than the
remaining nine cells and was cut to `Novo Esqu` at the 80-column boundary.
The renderer now uses the shared right-alignment helper, which measures the
localized text before choosing its start column. The fresh 480×320 replay
shows the complete `Novo Esquadrão` label, and the focused layout regression
asserts that the translated header remains visible and within the console.

## PT-249: Portuguese yes/no prompts ignored the localized affirmative key

- Severity: Medium
- Type: Input localization / interaction contract
- Screen: Portuguese site mode → police-station locked door
- Replay status: **Fixed and verified in a clean strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/party-rescue-20260809/03-portuguese-yes-prompt-s-ignored.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/party-rescue-fixed-20260809/02-portuguese-s-accepted.txt`

The translated prompt displayed `Tentar arrombar a fechadura? (Sim ou Não)`
but the input loop accepted only the English `Y`/`N` codes. Pressing the
natural Portuguese `S` key left the prompt blocked, while `Y` advanced it.
Localized yes/no handling now accepts `S` as an additional affirmative key in
Portuguese while retaining `Y` for compatibility; the direct site-door loops
and shared special-tile prompts use the same helper. The focused regression
guards the Portuguese aliases, and the clean 480×320 replay advanced with `S`
and rendered `Wendell Sellers destranca a porta!`.

## PT-250: Vegan bar short label used an unnatural translation

- Severity: Low
- Type: Translation quality / site labels
- Screen: Portuguese new-game route → campaign base header
- Replay status: **Fixed and verified in a strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/vegan-bar-20260809/01-before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/vegan-bar-20260809/01-before.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/vegan-bar-20260809/02-after.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/vegan-bar-20260809/02-after.png`

The short site key `Vegan Bar` appeared in the live Portuguese header as
`Barra Vegan`, which is not natural Brazilian Portuguese for a bar or
restaurant. The canonical catalog now uses `Bar Vegano`. A focused site-name
regression exercises `Site.getName(short: true)`, and the after-fix replay
renders `SEA — Bar Vegano` in both the campaign header and base panel. The
temporary deterministic bar fixture used to reach this otherwise random site
was removed and all debug flags remain disabled.

## PT-251: Ground-loot indicator collides with the localized action footer

- Severity: Medium
- Type: Combat layout / fixed-width rendering
- Screen: Portuguese siege combat at the 80×25 console
- Replay status: **Fixed and verified by strict-headless combat replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-footer-loot-20260809/01-loot-footer-before.txt`, `test/localized_layout_regression_test.dart`

The old renderer placed `Loot on the ground!` at row 24, column 57. A
localized footer then wrapped into the same cells and produced
`R:ReorganizaSaque no chão!`. The indicator now occupies the unused left side
of row 22 and is drawn after encounter clearing, while row 24 remains reserved
for the action legend. The fresh headless replay keeps the complete
`R:Reorganizar ?` footer; the regression asserts both the Portuguese indicator
and the intact final action row.

## PT-252: Successful interview outcome falls back to English after key concatenation

- Severity: Medium
- Type: Daily-event translation coverage
- Screen: Portuguese siege/news interview outcome
- Replay status: **Fixed and verified by focused regression on 2026-08-09**
- Evidence: `test/daily/siege_translation_test.dart`

The successful interview branch passed two cataloged sentences to one
`processString` call by concatenating their English keys first. The exact
combined key was absent from the catalog, so the Portuguese replay displayed
`Theo Godwin later went on to win a Pulitzer for it. Virtually everyone in
America was moved by Ricardo Mathers's words.` The branch now translates each
sentence independently before joining them; the focused test covers both
interpolations.

## PT-253: Blown-off tongue message uses unnatural Portuguese wording

- Severity: Low
- Type: Combat translation quality
- Screen: Portuguese siege combat hit messages
- Replay status: **Fixed and verified in a fresh strict-headless combat replay plus focused regression on 2026-08-09**
- Evidence: fresh port-7934 combat buffer and `test/pt_br_context_translation_test.dart`

Combat rendered `a língua de Policial da SWAT é explodida!`. The canonical
catalog now uses the natural past-tense form `A língua de {name} foi
arrancada!`, and the focused context test covers the tongue message alongside
the other standalone injury templates.

## PT-254: Long safehouse names overwrite the security-box frame

- Severity: Medium
- Type: Safehouse layout / fixed-width rendering
- Screen: Portuguese base mode → safehouse security box
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: fresh port-7934 base buffer and `test/basemode/pt_br_core_layout_test.dart`

The security box has a 16-cell interior, but the renderer wrote the localized
short site name without a width limit. A name such as `SEA — Fabricantes de
brinquedos` overwrote the right border and visually merged into `O -
Reordenar`. The name now uses the shared fitted renderer with the box's 16-cell
budget; the regression asserts the border remains at column 18 and the action
starts independently.

## PT-255: Fleeing creature display lowercased the `SWAT` acronym

- Severity: Low
- Type: Combat translation/style
- Screen: Portuguese site combat roster when a conservative flees
- Replay status: **Fixed and verified in a focused render regression and fresh strict-headless combat replay on 2026-08-09**
- Evidence: fresh port-7934 combat buffer and `test/sitemode/site_encounter_layout_test.dart`

The flee indicator used `name.toLowerCase()`, turning the translated `Policial
da SWAT` into `policial da swat`. The display now lowercases only the first
character, preserving acronyms and proper nouns; the regression exercises the
actual encounter renderer with a fleeing SWAT officer.

## PT-256: Empty-squad safehouse siege entry crashed before combat

- Severity: High
- Type: Runtime crash / safehouse siege
- Screen: Portuguese safehouse under attack → select a safehouse with no active squad → `F - Lutar/Fugir` → `X - Enfrentar`
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/empty-defense-20260809.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/empty-defense-20260809.png`, and the stable multi-enemy capture at `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/corporate-siege-20260809/combat-loot.png`

The under-attack safehouse could be selected while the campaign had no active
squad. Choosing `F - Lutar/Fugir` and then `X - Enfrentar` reached the siege
entry path, but the live Portuguese buffer changed to the crash report
`Bad state: No element` at `lib/sitemode/sitemode.dart:211`; `_siteModeAux`
read `squad.first` after checking only `activeSquad`.

The base action now checks for available active Liberals at the selected
safehouse, and `escapeOrEngage` handles a last-second empty-squad transition
before entering site mode. The guarded route displays the localized
explanation `Não há Liberais disponíveis para defender este esconderijo.` and
returns safely. The focused siege regression and fresh headless replay cover
both the message and the no-squad state.

## PT-257: Portuguese encounter armor details collapsed to an ellipsis

- Severity: Medium
- Type: Combat layout / compact status rendering
- Screen: Portuguese terminal-combat encounter roster
- Replay status: **Fixed and verified in a fresh strict-headless replay and focused regressions on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-combat-armor-20260809.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-combat-fixed-20260809.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-combat-fixed-20260809.png`, `test/basemode/pt_br_core_vocabulary_test.dart`, and `test/sitemode/site_encounter_layout_test.dart`

The Portuguese armor translation appends `(proteção)` to the numeric detail.
The encounter roster gives the health cell only six columns, so the old fitted
renderer reduced every value to `+…`, hiding whether the enemy had any armor.
The compact renderer now keeps a plain `+` marker when the numeric token cannot
fit, while preserving the numeric `+~30 (proteção)` prefix in wider party cells.
The fresh replay shows `170 +` and `140 +` in the encounter roster with no
ellipsis, and the focused tests cover both narrow encounter and wider party
cells.

## PT-258: Long Portuguese hit descriptions clipped at the console edge

- Severity: Medium
- Type: Combat layout / fixed-width rendering
- Screen: Portuguese terminal-combat attack and hit-message rows
- Replay status: **Fixed and verified in a fresh strict-headless replay and focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-combat-fixed-20260809.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/terminal-combat-fixed-20260809.png`, and `test/sitemode/fight_death_layout_test.dart`

Long localized hit descriptions were written with a single unbounded
`addstr`, so text such as `... armadura de braço direito ... atingindo 3 vezes`
was cut at column 80. The attack-message renderer now clears its reserved
message area and wraps the already-localized sentence across rows 9–10. The
fresh buffer keeps the complete two-line Portuguese sentence and every console
row remains exactly 80 cells wide.

## PT-259: Death-reflection rows expose negative health values

- Severity: Medium
- Type: Combat status / layout
- Screen: Portuguese combat death reflection immediately after an enemy dies
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-death-20260809/replay-negative-7974.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-death-20260809/fixed-replay-7976.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/combat-death-20260809/fixed-replay-7976.png`, and `test/sitemode/site_encounter_layout_test.dart`

When a defeated enemy's death message was shown, the encounter list was
redrawn before the corpse was removed. The row could therefore display a
negative blood value such as `-4 +24` (and, in a fresh replay, `-400 +`) rather
than a clear dead-state label or an empty status. The value is understandable
to the engine but misleading to players and can make the armor marker look
like a live statistic.

The compact encounter renderer now omits dead rows during that transient
redraw; the death message remains the player-facing terminal state. The
focused regression protects an empty dead row, and a fresh 480×320
strict-headless siege replay advanced 34 attacks with multiple enemy deaths,
no negative-health rows, 25 rows of exactly 80 cells, and no browser errors.

## PT-260: Medical-debt collector roles remain English in Portuguese

- Severity: Medium
- Type: Combat translation / generated creature labels
- Screen: Portuguese medical-debt siege encounter roster
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regressions on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-before-20260809.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-before-20260809.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-fixed-server-restart-20260809.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-fixed-server-restart-20260809.png`, and `test/sitemode/site_encounter_layout_test.dart`

The medical-debt collector encounter drew `Actuary` and `Claims Adjuster`
unchanged in the Portuguese roster. Generated role names can also arrive with
only their first word lowercased, which previously bypassed the exact-key
lookup. The canonical catalog now uses `Atuário` and the idiomatic Brazilian
insurance term `Regulador de Sinistros`, and creature-name localization
recognizes case-insensitive generated role names before translating them.
`Auditor` remains `Auditor` because that is the
same valid Brazilian Portuguese term; it is explicitly recorded as an
intentional unchanged catalog label. The restarted web-server replay loaded
all 7,912 Portuguese entries and rendered `Regulador de Sin…` in the fixed
17-cell roster column with no browser errors.

## PT-261: Fleeing `CPA` is rendered as `cPA`

- Severity: Low
- Type: Combat translation/style / acronym casing
- Screen: Portuguese medical-debt siege encounter roster when a conservative flees
- Replay status: **Fixed and verified in focused render regressions and a fresh strict-headless replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-before-20260809.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-fixed-server-restart-20260809.txt`, and `test/pt_br_context_translation_test.dart`

The flee styling lowercased the first character of every conservative name,
turning the acronym `CPA` into `cPA`. The shared helper now preserves any
leading all-uppercase acronym while still lowercasing ordinary labels such as
`Policial da SWAT` to `policial da SWAT`. The focused encounter regression and
the restarted medical-debt replay both keep `CPA` uppercase.

## PT-262: Long medical-debt role labels are truncated

- Severity: Low
- Type: Combat layout / readability enhancement
- Screen: Portuguese medical-debt siege encounter roster
- Replay status: **Fixed and verified in focused regressions and a fresh strict-headless replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-role-7990/office-worker-roster-before.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-role-7990/office-worker-roster-after-restart.png`, and `test/sitemode/site_encounter_layout_test.dart`

The encounter name column has a deliberate 17-cell budget. The natural
translation `Trabalhador de Escritório` formerly rendered as
`Trabalhador de E…`. The encounter-only renderer now uses the cataloged
`Funcionário` label for generated Office Worker rows, which fits the 17-cell
budget while leaving the full role translation unchanged in profiles,
dialogue, and siege announcements. Flee styling still lowercases the compact
label without changing the other roster columns.

## PT-263: CIA raid opening uses the wrong article for feminine site names

- Severity: Medium
- Type: Siege translation / dynamic-name agreement
- Screen: Portuguese base → CIA safehouse raid opening
- Replay status: **Fixed and verified in focused tests and a fresh strict-headless replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-siege-20260809/opening.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-siege-20260809/current.png`, and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-siege-20260809/fixed-replay.txt`

The catalog entry for `In the dead of the night, a column of unmarked black vans with tinted windows surrounds the {location}.` formerly rendered the fixed phrase `cerca o {location}`. A strict-headless CIA replay therefore showed `cerca o Estação Esquecida`, even though `Estação` is feminine in Portuguese. The same template receives generated site names independently, so a single masculine article cannot agree with every site.

The Portuguese catalog now uses `cerca o local chamado {location}`, which is
grammatically neutral for both masculine and feminine generated site names.
The regression covers `Antigo Motel` and `Estação Esquecida`; a fresh
640×480 headless CIA replay rendered `cerca o local chamado Frigorífico
Abandonado.` with all 25 bridge rows exactly 80 cells wide and no browser
errors.

## PT-264: Police-siege foot chase advertises a disabled surrender action

- Severity: Medium
- Type: Combat controls / police-siege flow
- Screen: Portuguese safehouse under siege → `F - Lutar/Fugir` → foot chase
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-09**
- Evidence: pre-fix `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-siege-surrender-20260809/replay.txt`; fixed `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-siege-fixed-20260809/replay.txt` and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-siege-fixed-20260809.png`

The pre-fix strict-headless Portuguese siege replay reached a foot chase with
six `Policial da SWAT` pursuers. The action legend displayed `G - Desistir`,
but the control was visibly disabled and pressing `G` did not enter the
localized arrest result; the buffer remained unchanged after repeated
attempts.

Direct police sieges bypass the generic chaser builder, so their fresh
`ChaseSequence` never enabled surrender even though the encounter contained
law-enforcement enemies. The siege path now derives `canpullover` from the
alive enemy law-enforcement encounter, matching the normal police pursuit
policy while leaving mercenary and military pursuers ineligible.

The fixed replay accepts `G` immediately and renders `Você para e é preso.`.
The Portuguese roster (`Armadura da SWAT`, `Policial da SWAT`) and fixed-width
layout remain clean: 25 rows, maximum width 80, no English-control matches,
and no browser errors.

A comparison replay confirmed that the same safehouse's base-mode
`G - Desistir` action works and renders the confiscation result in Portuguese;
the original residual was isolated to the foot-chase control state.

## PT-265: Medical-debt raid announcements remain English

- Severity: High
- Type: Missing translation / full-template coverage
- Screen: Portuguese base → medical-industry raid announcement
- Replay status: **Fixed and verified in focused regressions and a fresh strict-headless replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-fixed-20260809/replay.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-fixed-20260809/receipt.png`, and `test/daily/siege_translation_test.dart`

The deterministic medical-debt route originally localized only the generated
site name; the three-page briefing then fell back to English because the
runtime concatenated full strings while the catalog contained only fragments.
The source now uses complete templates for the arrival, collection speech, and
finance speech, with full English/Portuguese catalog entries and a focused
translation regression. The fixed replay rendered all three pages in natural
Portuguese, including the office-worker and finance-department jokes.

The fixed-width buffer stayed readable, with long speeches wrapping inside the
80-column console, and the browser error channel was empty.

## PT-266: Medical-debt receipt title leaks the raw safehouse name

- Severity: Medium
- Type: Dynamic-name localization / receipt context
- Screen: Medical-debt raid → `G - Desistir` receipt
- Replay status: **Fixed and verified in a focused receipt regression and a fresh strict-headless replay on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-fixed-20260809/replay.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-fixed-20260809/receipt.png`, and `test/daily/siege_translation_test.dart`

The receipt title originally rendered `PARA HOMELESS CAMP:` even though the
surrounding Portuguese base and raid screens displayed `Acampamento sem-teto`.
The receipt now passes `loc.getName()` through the complete title template
before uppercasing it, so the fixed replay rendered `PARA ACAMPAMENTO
SEM-TETO:`. Receipt labels, dot leaders, and amount alignment remained clean
at column 50.

## PT-267: Agenda polling and active-law prose use awkward Portuguese wording

- Severity: Low
- Type: Politics translation/context
- Screen: Portuguese Liberal Agenda pages 2, 4, and 5
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agenda-fix-7993/pt-page2.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agenda-fix-7993/pt-page4.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agenda-fix-7993/pt-page5.png`, and `test/pt_br_context_translation_test.dart`

The agenda polling fragment `{approval}% have a favorable opinion of ` was
translated as `têm uma opinião favorável do`, which reads as though the
President owns the favorable opinion. The active-law sentence for “big money”
used the literal and unnatural `pelo grande dinheiro`, and two adjacent law
lines lacked the Portuguese article/comma required by their context:
`com energia nuclear` and `permitida mas`.

The catalog now uses `opinião favorável sobre`, `forte influência das grandes
fortunas`, `com a energia nuclear`, and `permitida, mas`. The focused context
regression protects all four fragments. After a Flutter asset-manifest restart,
the Portuguese replay rendered the corrected opinion line and the complete
active-law sentence without new clipping; the existing fixed-width ellipses on
longer law rows remain bounded and intentional.

## PT-268: Los Angeles generated site names leak English and use malformed Portuguese

- Severity: Medium
- Type: Generated-site translation / contextual grammar
- Screen: Portuguese new game → Los Angeles → Downtown and Grande Hollywood
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regressions on 2026-08-09**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/city-sites-7995/headless-check.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/city-sites-7995/13-la-downtown.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/city-sites-7995/15-la-hollywood.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/city-sites-7995/15-la-hollywood.png`, and `test/location/site_translation_test.dart`

The pre-fix LA route exposed three generated-name defects. A nursing home
appeared as `Concurso Reflexões Casa de Enfermagem`: `Tender` had the wrong
false-friend translation, the facility term was not Brazilian Portuguese, and
the word order did not form a natural name. Grande Hollywood also displayed the
raw-English `Cable News Station` and `CEO Mansion`. The vegan co-op template
rendered `Cooperativa Vegana Prado Aspargo`, omitting the linking preposition.

Portuguese nursing-home generation now uses the phrase-level `Casa de repouso
{noun} {adjective}` template and inflects the generated adjective for the noun's
gender and number. The catalog adds full and short site labels for Cable News,
CEO mansion/castle/house, and nursing homes, corrects `Tender`/`Touch`, and
changes the vegan co-op template to `Cooperativa Vegana {noun} de {vegetable}`.

After a Flutter asset-manifest restart, the strict-headless replay rendered
`Casa de repouso Jornada Carinhosa`, `Canal de Notícias a Cabo`, `Mansão do
CEO`, and `Cooperativa Vegana Prado de Rabanete`. Both captured menus stayed at
80 columns or less, and the browser error channel was empty.

## PT-269: Oubliette shop names remain English in Portuguese activity context

- Severity: Low
- Type: Missing translation / dynamic site-name context
- Screen: Portuguese New York commerce → The Oubliette
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: pre-fix `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ny-sites-7996/37-shopping-sites.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ny-sites-7996/38-oubliette-selected.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ny-sites-7996/39-after-wait.txt`; fixed `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/oubliette-fixed-7998/`

The commerce menu translated surrounding site labels but left the branded
`The Oubliette` name in English. Selecting the shop then leaked the same name
through `Visitando The Oubliette`, the arrival message, and the short active-site
header `NYC — Oubliette`.

The Portuguese catalog now uses `O Calabouço` for the full name and `Calabouço`
for the compact header key. The focused site-translation regression protects
both keys. After a Flutter asset-manifest restart, the headless route rendered
`O Calabouço`, `Visitando O Calabouço`, and `NYC — Calabouço`; the Oubliette
action screen remained Portuguese, all rows stayed within 80 columns, and the
browser error channel was empty.

## PT-270: Juice bars are mislabeled as energy bars in Portuguese

- Severity: Low
- Type: Generated-site translation / business-type context
- Screen: Portuguese Seattle → University District site list
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: pre-fix `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/daily-sweep-8000/02-u-district-sites.txt`; fixed `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/juice-fixed-8001/`

The generated `Healthy Carrot Juice Bar` / `New You Orange Juice Bar` family
used `Bar de Energia`, which changes a juice shop into an energy-bar business.
The live Portuguese University District menu exposed `G - Bar de Energia Novo
Você Laranja`.

The catalog now calls the business `Bar de Sucos`. The generated-name helper
uses a phrase-level `Bar de Sucos {noun} {adjective}` template and inflects
`Harmonious` for plural/feminine generated nouns, yielding names such as
`Bar de Sucos Laranja Relaxante` and `Bar de Sucos Métodos Harmoniosos`. The
focused site-translation regression protects the compact label, template, and
both contextual examples. The fresh strict-headless replay reported
`HeadlessChrome`, no browser errors, and no rows wider than 80 columns.

## PT-271: White House site label leaks English in Portuguese National Mall menu

- Severity: Low
- Type: Missing translation / full site label
- Screen: Portuguese Washington, DC → National Mall site list
- Replay status: **Fixed and verified in a focused regression and a fresh strict-headless replay on 2026-08-09**
- Evidence: pre-fix `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/dc-national-mall-8003/01-before.txt`; fixed `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/dc-national-mall-8003/02-after.txt` and `test/location/site_translation_test.dart`

The National Mall travel menu translated `Grayson Park` but displayed the
White House entry as `B - White House`. The short key `WhiteHouse` already
translated to `Casa Branca`, but `Site.getName()` uses the full `White House`
label in this menu and the full key was missing from both canonical catalogs.

The English catalog now declares the full key and the Portuguese catalog maps
it to `Casa Branca`. The regression protects the full label, and the fixed
replay renders `B - Casa Branca`. The 80-column buffer stayed bounded and the
headless browser identified itself as `HeadlessChrome`.

## PT-272: Monthly Guardian AM Radio stories mixed English and malformed Portuguese

- Severity: Medium
- Type: Translation assembly / context-sensitive Portuguese grammar
- Screen: Portuguese game → monthly Liberal Guardian → AM Radio memoranda
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-09**
- Evidence: pre-fix `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/monthly-loot-8005b/01-am-radio-before.txt`; fixed `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/monthly-loot-8005b/02-am-radio-after.txt`

The monthly AM Radio story assembled adjacent source literals into a single
lookup key, while the catalogs stored the fragments independently. That made
the runtime fall back to English for complete paragraphs. Independently
translated fragments also exposed context errors such as `promover um ditador
estrangeiro`, `dinheiro de o regime`, and `para garantir seguir o nome`; the
LGBT variant mixed gender and spacing in `um pedófilo`.

Monthly story construction now translates each catalog fragment separately and
keeps paragraph separators as raw layout text. Canonical catalogs contain clean
keys for the paragraph endings and retaliation lines. The Portuguese catalog
also fixes the AM lead and fragment grammar (`sobre planos`, `para promover`,
`do regime`, LGBT feminine agreement, and the listener/hostility sentence).
The focused context suite protects these keys and the assembled low-power
paragraph. A fresh headless route rendered an AM story with no English text,
80-column maximum width, and an empty browser-error channel.

No new defect was confirmed after the replay. Keep the residual PT-048/PT-148
police-alarm variants and PT-083 responsive-readability enhancement open;
accepted PT-049 historical changelog English remains out of the fix queue.

## PT-273: Monthly Guardian Cable News and CCS stories needed contextual joins

- Severity: Medium
- Type: Translation assembly / context-sensitive Portuguese grammar
- Screen: Portuguese game → monthly Liberal Guardian → Cable News and CCS loot
- Replay status: **Fixed and verified in a fresh strict-headless replay plus focused regression on 2026-08-10**
- Evidence: pre-fix `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/monthly-context-8010f/01-before-summary.txt`; fixed `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/monthly-context-8010f/02-after.txt`

The broader monthly-family replay found context errors that were not covered by
the earlier AM Radio fix. Cable News case 0 had incorrect agreement and
conjunctions (`obrigando que ... devem ser aprovado ... antes de eles pode ser
exibido`), while the shared planning branch became `planos ... planejando` in
AM Radio and did not agree with Cable News' plural `memorandos`. The CCS story
also contained literal-translation and fragment-join errors: `revelando em
detalhes extremos`, `seria acima da acusação`, `poderiam ... agir`, a dangling
`contra ele`, and an awkward second paragraph.

The Portuguese catalog now uses context-aware fragments: `com planos`,
`destinados a forjar`, `exigindo que ... sejam aprovadas ... antes que possam
ser exibidas`, and a complete CCS sentence with `acima de qualquer processo`,
`poderia ... e servir de contraponto`, and `energia pública`. The CCS media
ending now explicitly names `as Notícias a Cabo`. Focused runtime composition
assertions protect the AM, Cable, and CCS joins.

The fixed route selected AM Radio, Cable News, and the CCS backer list in
successive months. All captured Portuguese rows stayed within 80 columns, the
browser identified itself as `HeadlessChrome`, and the error channel was empty.
Keep PT-048/PT-148 police-alarm variants and PT-083 responsive-readability
enhancement open; accepted PT-049 historical changelog English remains out of
the fix queue.

## PT-274: First American Bank teller prompt fell back to English

- Severity: Low
- Type: Missing translation / encounter message
- Screen: Portuguese First American Bank site view → teller tile
- Replay status: **Fixed and verified in a strict-headless replay after a full Flutter web-server restart on 2026-08-10**
- Evidence: pre-fix `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/bank-teller-8014e-before.txt`; fixed `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/bank-teller-8014e-after.txt`; regression `test/pt_br_context_translation_test.dart`

Stepping onto the bank teller tile displayed the raw English line `A bank
teller is available.` in an otherwise Portuguese route. The canonical English
catalog now declares the key and the Portuguese catalog maps it to `Há um caixa
do banco disponível.`. The focused runtime catalog test protects the exact
entry, and the fresh headless replay rendered the Portuguese line with no
English fallback, no browser errors, and no row wider than the fixed 80-column
console.

No new layout issue was confirmed. The compact roster cell `Esporti…-D` is the
existing fixed-width vehicle truncation covered by `test/basemode/pt_br_vehicle_layout_test.dart`.

Keep PT-048/PT-148 police-alarm variants and PT-083 responsive-readability
enhancement open; accepted PT-049 historical changelog English remains out of
the fix queue.

## PT-275: Portuguese car-chase intro clipped at the console edge

- Severity: Low
- Type: Portuguese layout / unbounded single-line intro
- Screen: Portuguese car chase → immediate pursuit introduction
- Replay status: **Fixed and verified in a focused regression and a fresh strict-headless replay on 2026-08-10**
- Evidence: pre-fix `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/car-chase-8022/before-intro.txt`; fixed `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/car-chase-8023/after-intro.txt`; regression `test/basemode/help_translation_test.dart`

The translated intro was emitted with an unbounded single-line `mvaddstrc`
call. At the fixed 80-column console edge, `Ao se afastar do local, você
percebe que está sendo seguido por porcos Conservadores!` ended at
`Conservad`, hiding the final `ores!` from the player. The intro now uses a
bounded paragraph renderer, and the focused test asserts the complete
Portuguese sentence plus the 80-column limit.

The fixed replay also exercised car-chase `D` and `B`, the evasive foot-chase,
and its `F` result path. Every captured row stayed within 80 columns, the
browser identified itself as `HeadlessChrome`, and the browser-error channel
was empty. Keep the random police-alarm variants PT-048/PT-148 and the PT-083
narrow-layout enhancement open; accepted PT-049 historical changelog English
remains out of the fix queue.

## PT-276: Clothing crafting selector and preview bypassed the Portuguese catalog

- Severity: Medium
- Type: Missing translation / dynamic metadata
- Screen: Portuguese base mode → Atribuir Tarefas → Recrutamento e Aquisição → Fazer Roupas
- Replay status: **Fixed and verified in a strict-headless replay after a full Flutter web-server restart on 2026-08-10**
- Evidence: pre-fix `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/clothing-selector-20260810/before.txt`; fixed `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/clothing-selector-20260810/after.txt`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

The clothing selector rendered XML item names such as `Black Bloc Outfit`,
`Tank Top`, and `Apron` in English. Its detail preview also passed dynamic
clothing names and traits as un-translated parameters, and all 14 armor
descriptions were absent from the canonical catalogs. The fullest armor
preview additionally exposed the raw trait `Alarming`.

The selector now localizes and bounds each item name before drawing the fixed
36-column cell. The preview pre-translates dynamic names and traits, uses the
new English/Portuguese armor-description entries, maps `Alarming` to
`Alarmante`, and marks numeric penalty shells as non-translatable. The focused
test protects selector coverage, preview descriptions/traits, the alarming
branch, raw-English absence, and the 80-column limit. The fresh replay reported
`HeadlessChrome/150.0.0.0`, an empty browser-error channel, and a maximum row
width of 80.

## PT-277: Translated clothing-preview armor stats collided at the fixed boundary

- Severity: Medium
- Type: Fixed-width layout
- Screen: Portuguese clothing detail preview, fullest armor upgrade
- Replay status: **Fixed and verified in the same strict-headless replay on 2026-08-10**
- Evidence: pre-fix `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/clothing-selector-20260810/collision-before.txt`; fixed output and DOM checks `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/clothing-selector-20260810/after.txt`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

After `Armor` was localized to `Armadura`, the left stat values were still
drawn up to the old right-column origin. Rows became `ArmaduraPrecisão` and
`ArmaduraComplexidade`, visually merging the armor type and the adjacent
accuracy/complexity labels.

The preview now reserves the right stats at column 42 and fits each left stat
to the remaining width. The final replay rendered `Armadura  Precisão` and
`Armadura  Complexidade` with visible separation, retained all controls, and
kept every row at or below 80 columns. The regression rejects both concatenated
forms.

## PT-278: Police-siege newspaper fragments disagreed with the squad and joined incorrectly

- Severity: Medium
- Type: Translation assembly / Portuguese agreement and spacing
- Screen: Portuguese police-siege result → next-day Liberal Guardian newspaper
- Replay status: **Fixed and verified in a strict-headless replay plus focused regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/repair-20260811/newspaper-and-terms.md`; regression `test/pt_br_context_translation_test.dart`

The newspaper prepended the plural subject `Membros do Esquadrão do Crime
Liberal` to singular fragments such as `escapou`. The translated fragment also
omitted its joining space, producing `de acordoa`, and the following source
fragment used the wrong Portuguese preposition. The four police-siege variants
now use plural verbs, retain the trailing join space, and end in
`de acordo com um porta-voz ...`. The focused composition test protects all
four variants. The fixed replay rendered a complete Portuguese sentence with
an 80-column maximum and no browser errors.

## PT-279: Clothing-repair activity exposed English item names and a bad gender placeholder

- Severity: Medium
- Type: Dynamic translation / activity message
- Screen: Portuguese base mode → end-of-day clothing repair message
- Replay status: **Fixed and verified in a strict-headless replay plus focused regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/repair-20260811/route.md`; regression `test/daily/clothing_repair_translation_test.dart`

The repair activity passed the raw XML item name and an English gender
placeholder into the Portuguese sentence, producing text like `Kate Yankovic
repara ela Black Suit.`. The activity now translates the dynamic clothing
name and uses a Portuguese-neutral clothing phrase for wash, recycle, and
repair messages. The fixed route rendered `Sherlock Bump conserta a peça de
roupa chamada Terno preto.` with no `Black Suit`, no browser errors, and no
rows wider than 80 columns.

## PT-280: Upgrade restriction was translated as an update restriction

- Severity: Low
- Type: Contextual terminology
- Screen: Portuguese base mode → non-upgradable location
- Replay status: **Fixed and covered by catalog/context validation on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/repair-20260811/newspaper-and-terms.md`

The location action used `Este local não pode ser atualizado`, which describes
updating rather than improving/upgrading a site. The canonical Portuguese
entry now reads `Este local não pode ser melhorado`.

## PT-281: Equipment action used an inconsistent Portuguese squad term

- Severity: Low
- Type: Contextual terminology
- Screen: Portuguese base mode → squad planning controls
- Replay status: **Fixed and covered by catalog/context validation on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/repair-20260811/newspaper-and-terms.md`; regression `test/sitemode/shop_translation_test.dart`

The equipment control said `Equipar a Equipe` while the rest of the game calls
the organization `Esquadrão`. The catalog and regression now keep the control
consistent as `Equipar o Esquadrão`.

## PT-282: Mod Tools explanation falls back to English after source concatenation

- Severity: Low
- Type: Translation assembly / missing runtime translation
- Screen: Portuguese title screen → Ferramentas de Mod
- Replay status: **Fixed and verified in a strict-headless replay plus focused regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/mod-tools-20260811/route.md`; regression `test/title_screen/options_translation_test.dart`

The Mod Tools paragraph concatenated two English source literals before the
translation wrapper ran. The catalogs contained translations for the separate
fragments, but the runtime looked up the combined sentence and displayed the
English explanation in the Portuguese menu.

The renderer now translates the two fragments independently and preserves their
joining space. The fixed headless replay rendered `Crie e edite mapas
personalizados para o Esquadrão do Crime Liberal. Este recurso está atualmente
em desenvolvimento.`, with no raw English, no browser errors, and no rows over
80 columns.

## PT-283: Infiltrated-agent action header exposes the English `Revolutionary` title

- Severity: Medium
- Type: Missing translation / dynamic level title
- Screen: Portuguese base mode → Agentes Infiltrados → covert-action focus
- Replay status: **Fixed and covered by a strict-headless reproduction plus focused regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/infiltrated-title-20260811/route.md`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

The infiltrated-agent header rendered a liberal at level four as
`——Leila Hemingway, Revolutionary——` even though the surrounding screen was
Portuguese. `levelTitle` translated the other level names but the source key was
missing from both catalogs, so the runtime returned the English key and logged a
missing translation.

The source and Portuguese catalogs now include `Revolutionary` →
`Revolucionário`. The focused profile regression exercises the level-four title,
requires the Portuguese value, and rejects raw English.

## PT-284: Hospital activity help line contains an unnecessary double space

- Severity: Low
- Type: Portuguese help-text typography
- Screen: Portuguese base mode → Atribuir Tarefas → Hospital
- Replay status: **Fixed and covered by a strict-headless replay plus catalog regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/hospital-help-spacing-20260811/route.md`; regression `test/pt_br_context_translation_test.dart`

The fixed-width help line displayed `no mesmo local.  Isso não`, preserving an
English double-space typo that is awkward in Portuguese. The canonical
translation now uses `no mesmo local. Isso não`; the console remains bounded to
80 columns.

## PT-285: Combat death-reflection message uses unnatural Portuguese phrasing

- Severity: Low
- Type: Combat translation/style
- Screen: Portuguese police-siege combat death reflection
- Replay status: **Fixed in the Portuguese catalog and covered by a focused regression on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-siege-live-20260811/route.md`; regression `test/pt_br_context_translation_test.dart`

The live death reflection for the catalog key `{name} breathes heavily,
coughing up blood...  then is quiet.` rendered as `Policial da SWAT respira
fortemente, tossindo sangue... então está quieto.`. The sentence is
understandable, but `respira fortemente` is not idiomatic for a dying person and
`então está quieto` is a literal, abrupt rendering of “then is quiet”. A more
natural option would be `respira com dificuldade, tossindo sangue... e então
fica em silêncio.` while preserving the existing death-message tone.

The catalog now uses `respira com dificuldade, tossindo sangue... e então fica
em silêncio.`. The focused composition regression protects the complete
sentence, interpolation, and absence of the old literal phrasing; the existing
strict-headless route confirmed the surrounding combat screen remains bounded.

## PT-286: Clothing-crafting header loses its Portuguese suffix at 80 columns

- Severity: Low
- Type: Activity layout / translation length
- Screen: Portuguese base mode → Atribuir Tarefas → Recrutamento e Aquisição → Fazer Roupas
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/clothing-prompt-20260812/route.md`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

The translated header `O que {name} vai tentar fazer?  (Nota: Metade do custo
se você tiver tecido)` was drawn as one fixed-width line. With a normal founder
name the console ended at `... tiver tec`, hiding the rest of the cost note.
The compact Portuguese wording is now `O que {name} fará? (Custo pela metade
com tecido)`, and the focused selector regression requires the complete suffix
while retaining the 80-column limit.

## PT-287: Dynamic-site death alert uses an unnatural Portuguese preposition

- Severity: Low
- Type: Siege translation / dynamic-site context
- Screen: Portuguese police siege → surrender terminal
- Replay status: **Fixed in the Portuguese catalog, covered by a focused regression, and verified in a fresh strict-headless replay on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/siege-terminal-20260811/route.md`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/siege-terminal-replay-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The police-siege terminal rendered `Todos em Armazém Esquecido foram mortos.`.
For a generated site name, the bare `em` construction is awkward and reads as
if the name were an unintroduced common noun. The translation now uses
`Todos os presentes em {location} foram mortos.`, which remains grammatical
for every dynamic site name without guessing its grammatical gender or adding
an incorrect contraction.

## PT-288: Street-site names retain English word order in Portuguese

- Severity: Low
- Type: Generated-site translation / contextual word order
- Screen: Portuguese base mode → plan a site visit in the Seattle industrial district
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; focused location regressions added**
- Evidence: fresh site-list buffer from the strict-headless replay; regression `test/location/site_translation_test.dart`

The generated list exposed `Motel (hotel) Abandonado`, `Conjuntos habitacionais
Sánchez St.`, and `Gorbachev St. Casa de Drogas`. The first added an unnecessary
gloss to an already natural Portuguese loanword; the latter two retained the
English street suffix and placed it before/after the translated site type in a
way that is not natural Brazilian Portuguese.

The catalog now renders `Motel Abandonado`, `Conjuntos habitacionais da Rua
{name}`, `Centro de Drogas Recreativas da Rua {name}`, `Dispensário de Maconha
da Rua {name}`, and `Casa de Drogas da Rua {name}`. The focused tests cover the
full dynamic templates and the identical-loanword exception for `Motel`.

## PT-289: Upscale-apartment names retain English word order

- Severity: Low
- Type: Generated-site translation / contextual word order
- Screen: Portuguese base mode → plan a site visit in Centro de Seattle
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; focused location regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/condominiums-20260811/after.txt`; regression `test/location/site_translation_test.dart`

The live district menu rendered `Russell Condomínios`. The source template is
`{name} Condominiums`, but Brazilian Portuguese places the common noun first:
`Condomínios Russell`. The catalog now uses the natural order and the focused
regression protects the placeholder position. A fresh headless menu rendered
`Condomínios Piercey` with no browser errors and an 80-column maximum.

## PT-290: Juice-bar adjectives do not agree with plural Portuguese nouns

- Severity: Low
- Type: Generated-site translation / Portuguese number agreement
- Screen: Portuguese base mode → plan a site visit in Distrito Universitário
- Replay status: **Fixed and covered by a fresh strict-headless composition regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/condominiums-20260811/route.md`; regression `test/location/site_translation_test.dart`

The live district menu rendered `Bar de Sucos Métodos Natural`. `Métodos` is
plural, so the generated adjective must be `Naturais`. The juice-bar
composition helper now inflects plural `Natural`, `Relaxante`, and `Saudável`
forms, while preserving the existing gender and plural handling for
`Harmonioso`. The focused regression requires `Bar de Sucos Métodos Naturais`;
the fresh menu remained within 80 columns with no browser errors.

## PT-291: Internet-café brand fragments expose automated translator glosses

- Severity: Low
- Type: Generated-site translation / out-of-context gloss
- Screen: Portuguese base mode → plan a site visit in Distrito Universitário
- Replay status: **Fixed in the Portuguese catalog and covered by a focused composition regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/condominiums-20260811/route.md`; regression `test/location/site_translation_test.dart`

The generated menu rendered `Internet Café Panda (animal) Nano (escala)`.
`Panda` and `Nano` are valid unchanged brand fragments in Brazilian Portuguese;
the parenthetical explanations came from translating isolated words without
their generated-name context. The catalog now uses `Panda` and `Nano` without
glosses, records both as intentional unchanged fragments for runtime
telemetry, and the composed name is protected as `Internet Café Panda Nano`.

## PT-292: Vegan co-op names expose an automated `Tofu (soja)` gloss

- Severity: Low
- Type: Generated-site translation / out-of-context gloss
- Screen: Portuguese base mode → plan a site visit in Distrito Universitário
- Replay status: **Fixed and covered by a focused composition regression on 2026-08-11; post-fix strict-headless route stayed clean**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/generated-gloss-layout-20260811/replay.md`; regression `test/location/site_translation_test.dart`

The pre-fix live district menu rendered `Cooperativa Vegana Jardim de Tofu
(soja)`. The source uses `Tofu` as one of the generated vegetable/name
fragments in `{vegetable} {noun} Vegan Co-op`; the parenthetical ` (soja)` was
an isolated translator explanation, not player-facing site-name content. The
catalog now keeps `Tofu` unchanged, registers it as an intentional generated
fragment, and the phrase-level regression requires `Cooperativa Vegana Jardim
de Tofu`.

## PT-293: Industrial site status text overwrites long Portuguese site names

- Severity: Medium
- Type: Fixed-console layout / dynamic site status
- Screen: Portuguese base mode → plan a site visit in Distrito Industrial
- Replay status: **Fixed and verified by a deterministic Portuguese screen regression on 2026-08-11; post-fix strict-headless route stayed within 80 columns**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/generated-gloss-layout-20260811/replay.md`; regression `test/basemode/pt_br_plan_site_visit_layout_test.dart`

The pre-fix industrial-district menu rendered a long LCS row as
`Fábrica de Brinquedos Assombrada (Possível EscondePressão: 0   Sigilo: 15`.
The localized site name and `(Possível Esconderijo)` status extended into the
fixed `Pressão`/`Sigilo` columns at column 54, so the status and name merged
even though the buffer remained 80 columns wide. Destination rows now reserve
the fixed metadata columns and fit both the name and status before rendering;
the deterministic regression asserts no `EscondePressão` merge and an 80-cell
row. The broader PT-083 narrow/fixed-console queue remains open for other
screens.

## PT-294: Internet-café fragments use glosses, awkward casing, or duplicated nouns

- Severity: Low
- Type: Generated-site translation / short-fragment context
- Screen: Portuguese base mode → generated Internet Café names
- Replay status: **Fixed and covered by focused generated-name regressions on 2026-08-11**
- Evidence: regression `test/location/site_translation_test.dart`

The neighboring fragment audit found `Micro (microfone)`, lowercase `troll`,
`Cabeado` for the brand adjective `Wired`, and `Café latte` producing the
duplicated name `Internet Café Café latte ...`. The catalog now uses `Micro`,
`Troll`, and the idiomatic `Conectado`; the context-aware generated-name helper
keeps the standalone `Latte` label while rendering the generated brand as
`Internet Café Latte ...`.

## PT-295: News drug and gang names carry explanatory glosses into prose

- Severity: Low
- Type: News translation / proper-name context
- Screen: Portuguese newspaper and hostage-news fragments
- Replay status: **Fixed and covered by focused catalog/composition regressions on 2026-08-11**
- Evidence: regression `test/pt_br_context_translation_test.dart`

The isolated values `LSD (droga)`, `MDMA (droga)`, `Crips (gangue)`, and
`Bloods (gangue)` were inserted into sentences and lists where the source
already supplies the context. The acronyms and gang names now remain proper
names, and the gang sentence explicitly renders `pela gangue Crips/Bloods`.

## PT-296: Generated labels and recursive fragments carry out-of-context glosses

- Severity: Low
- Type: Translation/context
- Screen: Portuguese recruitment labels, newspaper title fragments, court charges, and combat reactions
- Replay status: **Fixed in the Portuguese catalog and covered by focused regressions on 2026-08-11**
- Evidence: `test/recruitment_translation_test.dart`; `test/pt_br_context_translation_test.dart`

The context audit found `Emo (estilo)`, `Hippie (movimento)`, and
`Punk (estilo)` being used as generated labels or title fragments, plus
`{items}, {item} (lista)` and `{name} {cower} (reação)` being appended to
runtime sentences. Those parenthetical explanations were not part of the
source context and made otherwise natural Portuguese read like translator
notes. The values now remain `Emo`, `Hippie`, `Punk`, `{items}, {item}`, and
`{name} {cower}`; the three cultural fragments are recorded as intentional
unchanged names for translation telemetry.

## PT-297: LGBT pickup lines use gender-incompatible or duplicated noun phrases

- Severity: Low
- Type: Dialogue translation/context
- Screen: Portuguese pickup-line rejection pool
- Replay status: **Fixed in the source templates and Portuguese catalog, with
  gendered composition regressions on 2026-08-11**
- Evidence: `lib/creature/gender.dart`, `lib/talk/drop_a_pickup_line.dart`, and
  `test/pt_br_context_translation_test.dart`

The rejection pool rendered `Caramba! Essa pessoa ({person}) está a fim de
mim!`, `com outro(a) {person}`, and `é outro(a) {person}`. The first exposed
the English gender token as a parenthetical gloss, while the latter two used a
slash-style placeholder that is not player-facing Portuguese. The three source
templates now pass localized article-bearing fragments (`um homem`, `uma
mulher`, or the nonbinary fallback) and compose as `Uma mulher está a fim de
mim`, `com um homem`, and `é uma mulher` without changing placeholder names or
the rejection pool's tone.

## PT-298: Bulk activity instructions were clipped in Portuguese

- Severity: Medium
- Type: Fixed-console layout / translation length
- Screen: Portuguese base mode → Atribuir Tarefas em Massa
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; exact-row regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/queue-audit-20260811/replay.md`; regression `test/basemode/pt_br_core_layout_test.dart`

The localized instruction exceeded the fixed 80-column console and was
clipped after `seleci`. The catalog now uses the concise, natural
`Pressione uma letra para atribuir uma atividade; um número para selecioná-la.`
The regular and sleeper bulk screens both assert the complete 77-column row.

## PT-299: Founder fate toggle used an unnatural and then overlong label

- Severity: Medium
- Type: Translation/context and fixed-console layout
- Screen: Portuguese new game → founder setup → Origem Trágica
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/queue-audit-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The literal `Destino Decide` read like a malformed headline. The initially
natural `Deixar o destino decidir` then collided with the fixed `(D para...)`
hint, so the final context-aware label is the compact and grammatical `O
destino decide`.

## PT-300: Biography question header used an unnatural literal construction

- Severity: Low
- Type: Translation/context
- Screen: Portuguese new game → randomized founder biography
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; title-screen regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/queue-audit-20260811/replay.md`; regression `test/title_screen/character_creation_translation_test.dart`

`Nos momentos após meu nascimento, em 2004...` was grammatical but stilted
and did not sound like a first-person biography prompt. It now reads
`Pouco depois de eu nascer, em 2004...` in both the catalog and live route.

## PT-301: Activity sorting prompt used singular noun and English-style casing

- Severity: Low
- Type: Translation/context
- Screen: Portuguese base mode → Atribuir Tarefas → sorting options
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; vocabulary regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/queue-audit-20260811/replay.md`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

The dynamic source description `Liberal activity` was translated as
`atividade Liberal`, producing `lista de atividade Liberal` for a multi-item
list. The catalog now uses `atividades Liberais`, yielding the natural
`Escolha como ordenar a lista de atividades Liberais.` and a consistent
faction adjective in generated stealth prose.

## PT-302: Activity header joined the translated title to the funds label

- Severity: Medium
- Type: Fixed-console layout / translation length
- Screen: Portuguese base mode → Atribuir Tarefas → select a Liberal
- Replay status: **Fixed and verified in a fresh strict-headless 480×320 replay on 2026-08-11; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-sweep-20260811/replay.md`; `test/basemode/pt_br_core_vocabulary_test.dart`

The long Portuguese translation `Entrando em Ação: O que {name} fará hoje?`
could consume the blank cell before the right-aligned `Dinheiro: $0` label.
The live header therefore rendered `...fará hoje?Dinheiro: $0`, merging the
title and funds metadata. The player-facing title is now the concise,
natural `O que {name} fará hoje?`, and the renderer fits it to the available
width before the funds label, preserving a visible separator for long names.
The focused regression uses a deliberately long generated name; the fresh
480×320 replay stayed within 80 columns with an empty playtest-error channel.

## PT-303: Full-profile birth date used English punctuation

- Severity: Low
- Type: Contextual translation / date formatting
- Screen: Portuguese base mode → Review Liberals → view a Liberal → full profile
- Replay status: **Fixed and verified in a fresh strict-headless 480×320 replay on 2026-08-11; focused layout regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-date-fix-20260811/route.md`; `test/basemode/pt_br_core_layout_test.dart`

The profile composed the localized prefix as `Nascimento: 30 de junho, ` and
then appended the year, yielding `Nascimento: 30 de junho, 2004`. Brazilian
Portuguese uses `de` between the month and year in this date form. The catalog
now supplies `Nascimento: {day} de {month} de `, and the focused profile test
requires `Nascimento: 9 de novembro de 2004` while rejecting the comma form.

## PT-304: Active-law text used a legacy hyphen in `semiautomáticas`

- Severity: Low
- Type: Politics translation/style
- Screen: Portuguese agenda → Active Laws (Part 1)
- Replay status: **Fixed and verified in a rebuilt strict-headless 480×320 replay on 2026-08-11; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/route-next-20260811/replay.md`; `test/pt_br_context_translation_test.dart`

The gun-control policy row used `Versões semi-automáticas de rifles
militares...`. In current Brazilian Portuguese orthography, the compound is
`semiautomáticas`; the hyphen made an otherwise polished active-law page look
like an unreviewed legacy spelling. The catalog now uses the corrected form and
the live page renders it within the 80-column console.

## PT-305: Generated `Security Guard` encounter names fall back to English

- Severity: Medium
- Type: Combat translation/coverage
- Screen: Portuguese AM Radio site → encounter roster
- Replay status: **Fixed in the catalog and verified by focused regression on 2026-08-11; fresh-server replay captured the defect before the fix**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/media-security-20260811/raw.json` and `security-guard-raw.png`; regression `test/pt_br_context_translation_test.dart`

The generated creature type is `Security Guard`, while the Portuguese catalog
only contained the lower-case fragment `security guard`. The encounter helper
therefore treated the generated role as untranslated and rendered
`Security Guard` in both the roster and the suspicion message. The exact
capitalized key now maps to `Segurança`, preserving the existing lower-case
newspaper fragment for contexts that need it.

## PT-306: Mid-tier broadcast quality used an incorrect Brazilian Portuguese register

- Severity: Low
- Type: Media translation/context
- Screen: AM Radio/Cable News broadcast quality result
- Replay status: **Fixed in the catalog and covered by the context regression on 2026-08-11**
- Evidence: `lib/sitemode/miscactions.dart` (`_mediaQualityDescriptionTemplate`), `test/pt_br_context_translation_test.dart`

The quality ladder places `The show was all right.` between a mediocre
broadcast and a good show. The previous `O espectáculo foi bom.` used the
European spelling `espectáculo` and erased the intended middle-tier meaning.
It now reads `O espetáculo foi razoável.`, using current Brazilian spelling
and preserving the distinction from the following `bom espetáculo` result.

## PT-307: Squad assembly columns merged health and profession text

- Severity: Medium
- Type: Fixed-console layout
- Screen: Portuguese base mode → Revisar Ativos e Formar Equipes → squad assembly
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; exact-row regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-layout-20260811/replay.md`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

The health bonus and translated profession were drawn into adjacent fixed
columns, producing rows such as `+30Profissional` and allowing the location
field to run into the profession. The renderer now reserves separator cells,
caps the health column, and fits profession/location independently.

## PT-308: Safehouse activity-help body used literal house-repair wording

- Severity: Low
- Type: Translation/context
- Screen: Portuguese help → activity overview
- Replay status: **Fixed and covered by a focused regression on 2026-08-11**
- Evidence: regression `test/basemode/help_translation_test.dart`

`casa segura` and `remendos` were literal choices that did not match the
game's established `esconderijo` and `consertos` vocabulary. The body now
reads `Liberais que ficam no esconderijo ainda ajudam com a lavanderia e os
consertos quando necessário.`

## PT-309: Public-interest level used feminine `Nenhuma` under a masculine header

- Severity: Low
- Type: Translation/context
- Screen: Portuguese agenda → Pesquisa de Opinião
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-layout-20260811/replay.md`; regression `test/localized_layout_regression_test.dart`

The `Interesse público` column rendered `Nenhuma`, disagreeing with the
masculine noun and with the other level labels. The catalog now uses
`Nenhum`; the live page shows it on every row.

## PT-310: GM newspaper template produced the malformed `o(a)` article

- Severity: Low
- Type: Generated-news translation/context
- Screen: Portuguese media/news generated story
- Replay status: **Fixed and covered by the context regression on 2026-08-11**
- Evidence: regression `test/pt_br_context_translation_test.dart`

The template inserted `o(a)` before an already gendered incident, yielding
output such as `o(a) garota`. The Portuguese template now uses the neutral
construction `Aquela história de {incident} é pura {hooey}.`.

## PT-311: Siege briefing mixed a singular enemy with plural pronouns

- Severity: Low
- Type: Translation/grammar
- Screen: Portuguese safehouse siege briefing
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; exact-fragment regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-layout-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The briefing said `O inimigo está pronto...` and then switched to
`derrotá-los`. It now consistently uses plural `Os inimigos estão prontos...`
and `derrotá-los`.

## PT-312: Animal-research terminology varied across agenda and polling text

- Severity: Low
- Type: Translation/context consistency
- Screen: Portuguese agenda and public-interest polling
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; catalog regressions added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-layout-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

Related fragments alternated between `pesquisa animal` and
`investigação em animais`, with the latter sounding like an unrelated
investigation. The family now consistently uses `pesquisa com animais`.

## PT-313: Undercover-action prompt used an unnatural focus question

- Severity: Low
- Type: Translation/context
- Screen: Portuguese Agentes Infiltrados → activity selection
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; exact-fragment regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-layout-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

`Ação Encoberta: No que Presidente Winter vai focar?` was conversationally
awkward and became especially clumsy with generated names. It now reads
`Ação Encoberta: Qual será o foco de Presidente Winter?`.

## PT-314: Vehicle passenger instruction was a literal translation

- Severity: Low
- Type: Translation/context
- Screen: Portuguese vehicle assignment
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; exact-fragment regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-layout-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

`Pressione uma letra para especificar passageiros...` sounded like a form
field rather than an instruction to choose squad members. It now reads
`Pressione uma letra para escolher os passageiros daquele veículo Liberal.`

## PT-315: Siege reserve fragment lowercased the faction name

- Severity: Low
- Type: Faction-vocabulary consistency
- Screen: Portuguese siege briefing
- Replay status: **Fixed and covered by the context regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-layout-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The fragment used lowercase `liberais` even though the game's faction name
is capitalized as `Liberais` throughout management and combat screens. The
catalog now preserves that proper faction casing.

## PT-316: Founder biography choices contained literal and inconsistent casing

- Severity: Low
- Type: Translation/context and capitalization
- Screen: Portuguese new game → founder biography
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; exact-entry regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-layout-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The founder choices showed `Recorri ao controle de pessoas...` and began the
stepmother choice with lowercase `minha`. They now read
`Passei a manipular pessoas. Construí meu próprio grupo de marginalizados.`
and `Minha madrasta atirou...`, respectively.

## PT-317: Long destination name was silently clipped in the arrival message

- Severity: Medium
- Type: Fixed-console layout
- Screen: Portuguese base mode after executing a site visit
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; fitted-message regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/squad-layout-20260811/replay.md`; regression `test/localized_layout_regression_test.dart`

`O Esquadrão do Crime Liberal chegou ao destino: Loja de Departamentos de
Buckman` was written directly to the 80-column row, dropping the final `n`
without indicating that any text was missing. Arrival messages now use the
shared fitted daily-message renderer and end with an ellipsis when the
destination name is too long.

## PT-318: Dealership picker bypassed Portuguese for dynamic vehicle and color text

- Severity: Medium
- Type: Translation/context
- Screen: Portuguese base mode → dealership → comprar um carro
- Replay status: **Fixed and verified in a fresh strict-headless 480×320 replay on 2026-08-11; focused catalog/UI regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/vehicle-picker-20260811/raw-vehicle-picker.json`, `raw-color-picker.json`, `fixed-vehicle-picker.json`, and `fixed-color-picker.json`

The dealership built its option list from XML names and colors, then passed those
values as interpolation parameters. The translation helper intentionally leaves
ordinary parameters untouched, so the Portuguese picker showed `Pickup Truck`,
`Sportscar`, `Red`, and `White`. The footer and exit label were also injected as
raw parameters, producing `selecionar Vehicle` and `We don't need a Conservative
car`. The call site now translates the dynamic vehicle/color values and the
labels before interpolation. The rebuilt screen renders `Picape`, `Carro
esportivo`, `Vermelho`, `Branco`, `Veículo`, `Cor`, and
`Não precisamos de um carro Conservador`.

## PT-319: Volunteer biography noun disagreed with a masculine candidate pronoun

- Severity: Low
- Type: Translation/context and grammatical agreement
- Screen: Portuguese new game → founder biography → “I was only 15 when I ran away...”
- Replay status: **Fixed in the catalog and covered for female and male runtime genders on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/route-sweep-after-20260811/11-founder-options`; regression `test/title_screen/character_creation_translation_test.dart`

The previous translation rendered `Fiz voluntariado para uma candidatura de
esquerda. {pronoun} nem chegou perto de vencer.` The source supplies a runtime
candidate pronoun, so the male branch could produce the semantically broken
`candidatura ... Ele`. The translation now uses the gender-neutral person
description `Fiz voluntariado para uma pessoa de esquerda que se candidatou.
{pronoun} nem chegou perto de vencer.`, preserving the interpolation while
remaining grammatical for `Ela`, `Ele`, or `Elu`.

## PT-320: Portuguese site-map special labels clipped at the map edge

- Severity: Medium
- Type: Fixed-console layout
- Screen: Portuguese site mode → full map and compact map overlays
- Replay status: **Fixed and verified with a strict-headless police-station replay and focused map-overlay regression on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/site-special-labels-20260811/replay.md`; regression `test/sitemode/pt_br_map_overlay_test.dart`

The map label renderers translated special labels through the console wrappers,
but positioned them using the raw English length and wrote them into fixed-width
rows without fitting the localized text. For example, `Police Detention Room`
is 21 columns in English but `Sala de Detenção da Polícia` is 27 columns in
Portuguese; the full-map label started too far right and the compact label was
silently cut at column 80. Both renderers now translate before layout, fit to
their 27- and 23-column map regions with an ellipsis when necessary, and center
the full-map label inside its frame.

## PT-321: Constitutional amendment fragments broke Portuguese agreement

- Severity: Low
- Type: Translation/context
- Screen: Portuguese month end → constitutional amendment proposal
- Replay status: **Fixed and verified in a fresh strict-headless founder-debt/sleeper replay on 2026-08-11; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/debt-sleeper-20260811/replay.md`; regression `test/monthly/month_end_translation_test.dart`

The amendment was assembled from short translated fragments. The previous
values produced `ser limitados a um mandato no cargo. Isso será imediatamente
aplicado ... após o ratificação desta emenda`, with a wrong preposition and
awkward agreement. The fragments now compose a grammatical sentence using
`deverão ... ter apenas um mandato`, `Essa regra será aplicada imediatamente`,
and `após a ratificação desta emenda`.

## PT-322: Election result prompt retained stale text from the previous screen

- Severity: Medium
- Type: Fixed-console layout
- Screen: Portuguese Senate/House election result screens
- Replay status: **Fixed and verified in a fresh strict-headless founder-debt/sleeper replay on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/debt-sleeper-20260811/replay.md`

The shorter Portuguese `Pressione qualquer tecla para continuar as eleições.`
prompt was written over a longer prior prompt without clearing the row, leaving
the visible suffix `s eleições.`. The presidential, Senate, and House election
renderers now clear their prompt rows before writing the localized text.

## PT-323: Trial notices used masculine agreement for arbitrary names

- Severity: Medium
- Type: Translation/context and grammatical agreement
- Screen: Portuguese month-end court notices and trial screens
- Replay status: **Fixed in the catalog and trial interpolation path; strict-headless replay captured the female-name failure on 2026-08-11; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/random-variants-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The source templates provide only `{name}`, but the Portuguese translations
used masculine forms such as `é levado`, `está sendo julgado`, `foi absolvido`,
and `será devolvido`. A generated female defendant (`Roberta Westlake`) was
shown as `Roberta Westlake é levado ao tribunal para julgamento.`. The affected
notices now use neutral verb forms. The acquittal return path also translates
the gendered possessive before inserting it, so the sentence ends in `dele`,
`dela`, or `delu` instead of the raw English pronoun.

## PT-324: Jury-selection notice was a literal, unidiomatic translation

- Severity: Low
- Type: Translation/context
- Screen: Portuguese trial flow → jury selection
- Replay status: **Fixed and verified in the strict-headless trial replay on 2026-08-11; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/random-variants-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

`A seleção do júri é primeiro` is not idiomatic Brazilian Portuguese. The
notice now says `A seleção do júri é a primeira etapa`, preserving the source
meaning while reading naturally.

## PT-325: Generated newspaper city list misspelled San Bernardino

- Severity: Low
- Type: Source data / proper-name accuracy
- Screen: Portuguese newspaper generated from a city-name event
- Replay status: **Fixed and verified in the strict-headless city/site replay on 2026-08-11; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/city-sites-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The generated city table used `San Bernadino, CA`, dropping the second `r` from
the real city name. The table now reuses the `sanBernardinoCity` constant for
both weighted entries, so generated newspaper locations retain the correct
proper-name spelling in every locale.

## PT-326: Singular police arrest aliases exposed English role names

- Severity: Medium
- Type: Runtime interpolation / translation context
- Screen: Portuguese police siege → surrender → singular arrest terminal
- Replay status: **Fixed and verified in a strict-headless replay on 2026-08-11; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-alias-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The singular alias branch rendered `Sergio Macy, vulgo Police Officer, é
preso(a).` in Portuguese. The dynamic role name bypassed the localized
creature-name helper, and the parenthetical gender workaround was awkward
Brazilian Portuguese. The runtime now localizes the alias as `Oficial de
Polícia`, while the catalog uses the neutral and natural `As autoridades
prendem {properName}, vulgo {name}.` form.

## PT-327: Singular rescued-hostage terminal exposed English role names

- Severity: Medium
- Type: Runtime interpolation / translation context
- Screen: Portuguese police siege → surrender → rescued-hostage terminal
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-11; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-hostage-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The singular rescued-hostage branch rendered `Police Officer é levado para
custódia e reabilitado.`. It bypassed localized creature-role rendering and
used a masculine-only construction for an arbitrary victim. The runtime now
localizes the role and the catalog uses `As autoridades colocam {name} sob
custódia para reabilitação.`.

## PT-328: Unoccupied police raids exposed English rescued-role names

- Severity: Medium
- Type: Runtime interpolation / translation context
- Screen: Portuguese daily police raid → unoccupied safehouse cleanup
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-11; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-unoccupied-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

When a police raid found a conservative creature in an otherwise empty LCS
safehouse, the cleanup line passed the raw `p.name` value into
`{name} has been rescued.`. A generated role therefore appeared as
`Conseguiram resgatar Police Officer.`. Both the police and Conservative
unoccupied-raid branches now pass creature names through the localized-role
helper, producing `Conseguiram resgatar Oficial de Polícia.`.

## PT-329: Unoccupied-raid locations used a hard-coded article and clipped
the final period

- Severity: Medium
- Type: Translation / fixed-console layout
- Screen: Portuguese daily police raid → unoccupied safehouse opening
- Replay status: **Fixed and verified in strict-headless replay on 2026-08-11; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-unoccupied-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The opening template rendered `Os policiais invadiram o Escola Velha, um
esconderijo desocupado.`. The fixed `o` article disagreed with a feminine
generated site name, and the longer neutral replacement silently dropped the
final period at the 80-column boundary. The police, no-LCS-members, and
Conservative raid templates now use `local chamado {location}` with the
shorter `esconderijo vazio` wording, and their dynamic opening rows use the
width-aware renderer.

## PT-330: Portuguese weapon cells used masculine no-weapon agreement

- Severity: Low
- Type: Translation / grammatical agreement
- Screen: Portuguese base roster and Liberal profile
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/weapon-label-20260811/replay.md`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

The shared `None` item-name translation rendered `Nenhum` in the `ARMA`
column and the profile line `Arma: Nenhum`. In this context the omitted item
is an `arma`, a feminine noun, so the label must be `Nenhuma`. The weapon
renderer now uses a dedicated `No weapon equipped` catalog key only for the
empty weapon sentinel, leaving other `None` contexts unchanged. A rebuilt
480×320 route rendered `Nenhuma` in both the roster and profile with a 25×80
buffer, no overflow, and an empty playtest error channel.

## PT-331: Dealership sale label used a hard-coded article and title case

- Severity: Low
- Type: Translation/context and capitalization
- Screen: Portuguese Commerce → car dealership → sell a stolen car
- Replay status: **Fixed and verified in a fresh strict-headless 480×320 replay on 2026-08-11; focused context regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/funded-shops-20260811/dealership-fixed.json` and `dealership-fixed-480x320.png`; regression `test/pt_br_context_translation_test.dart`

The dealership combined the Portuguese article `o` with the generated title-case
vehicle name, producing `S - Vender o Veículo roubado: Esportivo Azul ($800)`.
The sale label now omits the article and asks the vehicle formatter for
sentence-case output, rendering `S - Vender veículo roubado: Esportivo Azul
($800)` while leaving other vehicle-name contexts unchanged.

## PT-332: Pawn-shop bulk actions mixed verbs and title case

- Severity: Low
- Type: Translation/context and capitalization
- Screen: Portuguese Commerce → pawn shop → sell items
- Replay status: **Fixed and verified in a fresh strict-headless 480×320 replay on 2026-08-11; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/funded-shops-20260811/pawn-fixed.json` and `pawn-fixed-480x320.png`; regression `test/pt_br_context_translation_test.dart`

The bulk-action row mixed `Empenhar` and `Penhorar` and capitalized common
nouns in sentence context: `F - Empenhar Seletivamente`, `W - Penhorar todas as
Armas`, and `L - Empenhar todo o Saque`. The labels now consistently use the
Brazilian Portuguese pawn-shop verb and sentence case: `F - Penhorar
seletivamente`, `W - Penhorar todas as armas`, and `L - Penhorar todo o saque`.

## PT-333: Investment actions mixed imperative and infinitive forms

- Severity: Low
- Type: Translation/style
- Screen: Portuguese base mode → location → `I - Investir neste local`
- Replay status: **Fixed and verified in a rebuilt strict-headless replay on 2026-08-11; focused layout regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/deep-sweep-20260811/investment-menu-before.png`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/deep-sweep-20260811/investment-menu-after.png`

The investment list mixed infinitive labels (`Fortificar`, `Preparar`, `Criar`)
with formal imperatives (`Coloque`, `Instale`, `Armazene`). The corrected
catalog uses consistent menu-style infinitives: `Colocar`, `Instalar`, and
`Armazenar`, while preserving the existing Portuguese currency formatting and
80-column fitting.

## PT-334: Presidential opinion poll omitted the Portuguese article

- Severity: Low
- Type: Agenda translation/context
- Screen: Portuguese Liberal Agenda → opinion polling, page 2
- Replay status: **Fixed and verified in a rebuilt strict-headless replay on 2026-08-11; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/deep-sweep-20260811/agenda-polling-after.png`

The prefix translation composed `... opinião favorável sobre Presidente`.
Because the following dynamic label is `President {name}` (or `King {name}`),
the Portuguese prefix now includes `o`, producing `... sobre o Presidente
Ezekiel Lipman.` and the corresponding `Rei` variant.

## PT-335: Location siege status used unnatural word order

- Severity: Low
- Type: Location translation/style
- Screen: Portuguese base mode → location status header
- Replay status: **Fixed and verified in a rebuilt strict-headless replay on 2026-08-11; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/deep-sweep-20260811/investment-menu-after.png`

`Você não está sob cerco... ainda.` is grammatical but unnatural in Brazilian
Portuguese. The status now reads `Você ainda não está sob cerco...`, keeping the
threatening pause while placing `ainda` in its idiomatic position.

## PT-336: Portuguese save deletion ignored the localized affirmative key

- Severity: Medium
- Type: Runtime input / localized control path
- Screen: Portuguese save management → saved-game deletion confirmation
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/save-shop-confirm-20260811/replay.md`; regression `test/save_load_translation_test.dart`

The Portuguese confirmation displayed `Y - Sim, excluir o salvamento.`, but
pressing the natural Portuguese affirmative key `S` left the deletion prompt
open. The handler compared only the legacy `Y` code point instead of the
shared locale-aware yes-key predicate. It now accepts `S` in Portuguese while
preserving the original `Y` control prefix required by the catalog validator.

## PT-337: Pawn-shop bulk sale leaked an English category and ignored `S`

- Severity: Medium
- Type: Runtime interpolation / localized control path
- Screen: Portuguese Commerce → pawn shop → bulk weapon sale confirmation
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-11; focused regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/save-shop-confirm-20260811/replay.md`; regression `test/sitemode/shop_translation_test.dart`

The bulk-sale confirmation rendered `Vender realmente todos os weapons? (S)im
para confirmar.`. The category was a lower-case internal token with no catalog
entry, so English leaked into the Portuguese screen. The same handler accepted
only `Y`, making the advertised Portuguese `S` confirmation ineffective. The
runtime now uses cataloged `Weapons`/`Armas` (and the corresponding ammunition
and clothes keys), a neutral `Vender todo o lote de {items}?` template, and
the shared locale-aware yes-key predicate. A strict-headless replay rendered
`Vender todo o lote de armas? (S)im para confirmar.` and completed the sale
with `S`.

## PT-338: Congressional House summary used the literal `Casa`

- Severity: Low
- Type: Translation/context
- Screen: Portuguese Liberal Agenda → summary page
- Replay status: **Fixed and verified in a rebuilt strict-headless replay on 2026-08-11; catalog and layout regressions added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-content-20260811/replay.md`, `test/pt_br_context_translation_test.dart`, and `test/localized_layout_regression_test.dart`

The context-specific `House: {summary}` catalog entry rendered
`Casa: 125 pessoas ...`, while the same political surface and the standalone
`House` key already use `Câmara`. The entry now renders
`Câmara: {summary}`, matching Brazilian Portuguese congressional terminology
and staying within the fixed-width summary row.

## PT-339: Monthly net-change label used English title-case capitalization

- Severity: Low
- Type: Translation/style
- Screen: Portuguese Liberal Agenda → finance report
- Replay status: **Fixed and verified in a rebuilt strict-headless replay on 2026-08-11; catalog regression added**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/narrow-content-20260811/replay.md` and `test/pt_br_context_translation_test.dart`

The finance report showed `Mudança Líquida Este Mês (Dia):`, an English
title-case calque that reads unnaturally in Brazilian Portuguese. The catalog
now uses the sentence-case label `Variação líquida neste mês (dia):`; the
replayed report showed the corrected label alongside the translated purchase
and asset rows.

## PT-340: Torture discussion fragment used infinitives after `permitindo que`

- Severity: Low
- Type: Dialogue translation/context
- Screen: Portuguese recruitment conversation → political discussion → Torture
- Replay status: **Fixed in catalog and focused context regression; live
  recruitment route reproduced the pre-fix wording and the rebuilt catalog
  assertion passes**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/recruitment-torture-20260811/replay.md`; regression `test/pt_br_context_translation_test.dart`

The recruitment discussion composes two fragments. The Portuguese first
fragment ends with `permitindo que`, so the second fragment must use the
subjunctive. The live route rendered `... permitindo que o governo torturar e
abusar de seres humanos em nosso nome.`, which is ungrammatical. The catalog
now uses `o governo torture e abuse de seres humanos em nosso nome.`; the
focused context test asserts the exact corrected fragment and the rebuilt
Portuguese catalog passes it.

## PT-341: Community-service help used an inconsistent resource name

- Severity: Low
- Type: Help translation/context
- Screen: Portuguese task assignment → `? - Sobre a Atividade Selecionada` for `1 - Serviço Comunitário`
- Replay status: **Fixed in catalog and focused help regression; fresh strict-headless replay passes**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/community-service-energy-20260811/replay.md`; regression `test/help_system_translation_test.dart`

The community-service help body called the game’s `Juice` resource `Ânimo`:
`aumentando gradualmente o Ânimo até o máximo de 10.`. The same resource is
consistently labeled `Energia` in counters, recruitment prompts, and the other
activity help bodies. The catalog now says `aumentando gradualmente a Energia
até o máximo de 10.`. The focused regression failed against the old wording,
then passed after the edit; the fresh headless browser rendered the corrected
line with no over-wide rows or bridge errors.

## PT-342: Media overview leaves a stored headline in English

- Severity: Medium
- Type: Media translation/coverage
- Screen: Portuguese base mode → `Visão geral da mídia`
- Replay status: **Fixed with a headline-rendering helper and focused regression; strict-headless live route reproduced the leak before the fix**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/media-headline-20260811/media-overview-before.txt`; regression `test/basemode/media_overview_translation_test.dart`

The media overview interpolated non-empty stored headlines into an option
template without translating the value. A developer-flag route archived the
television headline `GENIUS MUTANT`; the overview showed that English text
while opening the article showed the cataloged `MUTANTE GÊNIO`. The overview
now translates stored headlines before fitting them into the fixed-width row,
while dynamic headlines and already-localized values remain unchanged.

## PT-343: Military article exposes an English hostage-rescue sentence fragment

- Severity: Medium
- Type: Newspaper translation/coverage
- Screen: Portuguese newspaper → military intervention article (`FIM DA GUERRA`)
- Replay status: **Fixed with split-fragment composition and focused regression; strict-headless route reproduced the live leak before the fix**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/military-article-20260811/article-before.txt`; regression `test/newspaper/herald_translation_test.dart`

The military article translated the incident with one exact lookup even though
the catalog stores the adjacent source literals separately. The live route
therefore rendered `somehow managed to shoot every one of the hostages and
none of the captors during a hostage rescue mission` inside an otherwise
Portuguese article. `translateMilitaryIncident` now translates the two
cataloged fragments independently and joins them as
`de alguma forma conseguiu atirar em todos os reféns e em nenhum dos captores
durante uma missão de resgate de reféns`.

## PT-344: Hospital wound-action label omits the possessive article

- Severity: Low
- Type: Hospital translation/context
- Screen: Portuguese site mode → University Hospital (`Centro Médico UW`)
- Replay status: **Fixed with a contextual catalog correction and strict-headless replay on 2026-08-11**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/hospital-wounds-context-20260811/before.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/hospital-wounds-context-20260811/after.txt`; regression `test/pt_br_context_translation_test.dart`

The hospital action translated `F - Go in and fix up Conservative wounds` as
`F - Entrar e tratar ferimentos Conservadores`. Without the article and
possessive preposition, `Conservadores` modifies `ferimentos` as an adjective
rather than naming the faction whose wounds are being treated. The catalog now
renders `F - Entrar e tratar os ferimentos dos Conservadores`, which keeps the
faction term and its context explicit.

## PT-345: Mass-shooting article used the wrong past participle

- Severity: Low
- Type: Newspaper translation / grammar
- Screen: Portuguese newspaper → mass-shooting major event
- Replay status: **Fixed in the catalog and covered by a deterministic school-type regression on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/mass-shooting-context-20260812/before.txt`; regression `test/newspaper/herald_translation_test.dart`

The article rendered `Quando a polícia chegou, o estudante já tinha matou 23...`.
After the auxiliary `tinha`, Brazilian Portuguese requires the past participle
`matado`. The catalog now uses `matado {count} e ferido dezenas de outras
pessoas`; the regression rejects the old phrase across 500 generated stories.

## PT-346: Mass-shooting article lost Portuguese school articles and name order

- Severity: Low
- Type: Newspaper translation / contextual grammar
- Screen: Portuguese newspaper → mass-shooting major event
- Replay status: **Fixed with context-aware school placeholders and covered by the same deterministic regression on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/mass-shooting-context-20260812/before.txt`; regression `test/newspaper/herald_translation_test.dart`

The pre-fix article composed `dois professores em escola fundamental Spasov`
and `entrou em escola fundamental`. The runtime now supplies Portuguese
contextual placeholders: `na escola fundamental Spasov` and `na escola
fundamental` (with `no ensino médio` for high school). The regression covers all
four generated school types and rejects the article-less `em escola`, `em
ensino`, and `em universidade` forms. The source-language path retains the
original English `at {schoolName}` / `the {school}` wording.

## PT-347: Founder-origin option used the wrong Portuguese contraction

- Severity: Low
- Type: Founder setup / contextual grammar
- Screen: Portuguese new-game founder origin choices
- Replay status: **Fixed in the catalog and covered by the Portuguese context catalog regression on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/founder-choices-20260812/last-year-before.txt`; regression `test/pt_br_context_translation_test.dart`

The origin option `A - Stealing from Corporations...` was translated as
`A - roubando de Corporações...`. In this context the definite plural noun
requires the contraction `das Corporações`; the corrected translation also
preserves the original capitalization of `Corporações`.

## PT-348: Compact Portuguese Liberal profile ellipsized useful labels

- Severity: Low
- Type: Profile/layout
- Screen: Portuguese Review → Assemble Squad → `V - Ver um Liberal`
- Replay status: **Fixed with context-specific compact catalog labels and verified in strict-headless replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/surface-sweep-20260812-current.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/compact-profile-fix-20260812/profile-after.txt`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

The fixed 80-column profile cells previously rendered `Perna esq…`,
`Braço dir…`, `Esperteza de R…`, and `Carro: Veículo roubado: Espo…`. The
profile now uses cataloged compact labels (`Perna esq`, `Braço dir`,
`Esp. de Rua`, and `Carro: Roubado: Esportivo`) only in those narrow cells;
the full skill/profile pages retain their complete Portuguese wording. The
post-fix browser capture has 25 rows, a maximum width of 80, no stale fragments,
and an empty `#lcs-playtest-errors` channel. The adjacent crime and full-skills
pages were also replayed and retained complete labels.

## PT-349: Map editor controls remained English and overflowed narrow viewports

- Severity: Medium
- Type: Map editor translation / layout
- Screen: Portuguese mod-tools → Map Editor (Flutter route)
- Replay status: **Fixed with runtime localization, catalog coverage, and strict-headless/widget replay on 2026-08-13**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/map-editor-translation-20260813/`; regression `test/map_editor/map_editor_translation_test.dart`

The Portuguese mod-tools menu opened a separate Flutter map editor whose toolbar,
terrain palette, special palette, and tooltips remained English (`Map editor`,
`Pencil`, `Objectives`, `Validate map`, and similar labels). The same route also
overflowed horizontally at a compact viewport, and a long site name could clip
inside the dropdown. The editor now routes visible labels through `LcsI18n`,
adds the missing English/Portuguese catalog entries, scrolls the top toolbar
instead of overflowing, and ellipsizes long site names within the dropdown.
The focused widget replay confirms Portuguese palette and toolbar semantics;
the strict-headless browser replay confirms the separate route uses
`HeadlessChrome/150.0.0.0` with no headed window or browser focus.

## PT-350: Drug-panic article used English choices and the wrong verb form

- Severity: Low
- Type: Newspaper translation / contextual grammar
- Screen: Portuguese newspaper → `DRUG PANIC`
- Replay status: **Fixed in the canonical catalogs and covered by a focused regression on 2026-08-13**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-rerun-20260813/newspaper.txt`; regression `test/newspaper/herald_translation_test.dart`

The randomized article selected `methamphetamine`, which had no Brazilian
Portuguese entry, and rendered the consequence as `vai morrem instantaneamente`.
The dynamic choices now include `cocaína`, `heroína`, `metanfetamina`, and
`fentanil`; `instantly die` is `morrer instantaneamente`, preserving the
infinitive required by `vai {consequence}`. The rebuilt strict-headless replay
loaded the updated catalogs; the random article did not reselect this exact
event within its bounded post-fix cycle, so the deterministic regression is the
authoritative post-fix check.

## PT-351: Retirement article generated invalid think-tank agreement

- Severity: Low
- Type: Newspaper translation / contextual grammar
- Screen: Portuguese newspaper → `INSECURITY`
- Replay status: **Fixed with context-specific generated-name composition and covered by a randomized regression on 2026-08-13**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-rerun-20260813/postfix-w-*.txt` (adjacent newspaper sweep); regression `test/newspaper/herald_translation_test.dart`

The retirement article could produce forms such as `porta-voz do Parceria
Unido da Liberdade`: `Parceria` is feminine, and the article/adjective
agreement was invalid. Portuguese retirement names now use an organization-
neutral construction (`porta-voz da organização ...`) with invariant modifiers
such as `da União` and `Familiar`, so every randomized noun/adjective draw
remains grammatical. The regression samples 200 generated stories and rejects
the former agreement and English fallback.

## PT-357: FM article repeated the radio label in Portuguese

- Severity: Low
- Type: Newspaper translation / contextual style
- Screen: Portuguese newspaper → `FM OBSCENITY`
- Replay status: **Fixed in the canonical catalog and covered by a generated-story regression on 2026-08-13**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-next-20260813/day-5.txt`; regression `test/newspaper/herald_translation_test.dart`

The live strict-headless police-siege replay reached the FM article and showed
`O polêmico radialista de rádio FM ...`. In Brazilian Portuguese, `radialista`
already identifies a radio presenter, so `de rádio FM` repeats the medium and
reads like an automated calque. The catalog now says
`O polêmico radialista de uma rádio FM ...`, which keeps the station context
without the duplicated label. The deterministic regression generates the
article under Portuguese and rejects the old wording and English fallback.
