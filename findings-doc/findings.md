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
| PT-358 | — | Playtest verification | Medical-debt raid and receipt replay clean; no new defect confirmed |
| PT-359 | Low | Interface-options translation/grammar | Encounter-warning help uses masculine `por eles` for feminine `pessoas` |
| PT-360 | — | Playtest verification | Additional police-terminal surrender/fight variation stayed localized and width-safe |
| PT-361 | Medium | Site-map console layout | Courthouse special label overwrote the Portuguese `L:Carregar` command |
| PT-363 | Medium | Bank-vault translation/coverage | Vault continuation fragments fell back to English and called an informática specialist `um computador` |
| PT-364 | — | Playtest verification | Rebuilt police-fixture route stayed localized and width-safe; arrest/subdue branch remains unforced |
| PT-365 | — | Playtest verification | Strict-headless police combat replay stayed localized and width-safe; remaining random subdue seeds are optional coverage only |
| PT-366 | Low | Translation telemetry / display boundary | Already-localized profile and site values were retranslated |
| PT-371 | Medium | Clothing-crafting layout | Long localized difficulty collides with a four-digit craft cost |
| PT-372 | Medium | Flag-crafting layout | Portuguese currency costs clip and difficulty touches the cost column |
| PT-373 | Low | Clothing-crafting navigation | Paging leaves an off-page clothing preview selected |
| PT-374 | Medium | Hostage translation/composition | Hostage prose falls back to English or leaves nested placeholders |
| PT-375 | Low | Flag-crafting navigation | Paging leaves an off-page flag preview selected |
| PT-376 | Medium | Sleeper-management layout | Undercover activity header overwrites the Portuguese funds label |
| PT-377 | Medium | Constitutional-amendment translation | Supreme Court purge heading falls back to English in Portuguese |
| PT-378 | Medium | High-score layout | Long Portuguese game-over ending rows overflow the fixed console |
| PT-379 | Medium | Profile translation | Wheelchair transport label falls back to English in Portuguese profiles |
| PT-380 | Medium | Disbanding translation | Disband-and-wait political summary exposes English executive alignment labels |
| PT-381 | Medium | Fixed-console layout | Homeless-camp siege briefing overflows in Portuguese |
| PT-382 | Medium | High-score layout | Three-digit Portuguese flag counts clip at the right edge |
| PT-383 | Medium | Newspaper layout | Translated decorative masthead strings clip at fixed right columns |
| PT-384 | Medium | Sleeper-management layout | Long Portuguese sleeper profession overwrites the site column |
| PT-385 | Medium | Newspaper translation/context | Arch-conservative civil-rights story produces broken Portuguese agreement |
| PT-389 | Medium | Daily translation/context | Brownie-selling arrest message interpolates the raw English action in Portuguese |
| PT-390 | Medium | Newspaper translation | Portuguese newspaper ads expose hard-coded English copy in normal save/news overlays |
| PT-391 | Medium | Newspaper translation | Portuguese squad-action crime lists join translated terms with hard-coded English `and` |
| PT-392 | Medium | Newspaper translation/context | Portuguese CCS squad stories expose hard-coded English spoof-location labels |
| PT-393 | Medium | Combat translation | Portuguese CCS encounter roster and hit log expose the raw role `Soldier` |
| PT-394 | Medium | Combat translation | Portuguese CCS bouncer and alarm messages expose hard-coded English text |
| PT-406 | Medium | Combat translation | Portuguese White House Secret Service roster and hit logs expose the raw role `Secret Service` |
| PT-407 | Medium | Translation interpolation/display leak | Liberal level title `Activist` leaks English in Portuguese recruitment screens |
| PT-408 | Medium | Missing translation / dynamic creature type | `Political Activist` type name leaks English in Portuguese liberal profiles |
| PT-409 | Medium | Translation/context | Homeless-camp siege briefing concatenates a modal `terá que` with imperative `derrote`/`fuja` |
| PT-419 | Medium | Disbanding layout | Monthly disband footer clips the Portuguese next-month action |
| PT-420 | Medium | Agenda layout | Disband confirmation prompt clips its final Portuguese instruction |
| PT-421 | Medium | Equipment/layout | Base-selection prompts lose their final Portuguese words |
| PT-422 | Medium | Siege layout | Portuguese raid and escape warnings clip at the console edge |
| PT-423 | Low | Newspaper layout | Cable News anchor overlay loses the right border in Portuguese |
| PT-424 | Low | Dialogue layout | Homeless-camp relocation note clips its closing punctuation |
| PT-425 | Low | Launch layout | Conservative-interruption footers clip the final period |

| PT-435 | Medium | Election translation/composition | Presidential nominees expose compact alignment tokens and a doubled separator |
| PT-436 | Medium | Save import translation | Native file-picker title remains English in Portuguese mode |
| PT-437 | Low | Save-import error layout | Long Portuguese error diagnostics are silently clipped without wrapping or ellipsis |
| PT-438 | Medium | Map-editor widget layout | Narrow map editors overflow palette chips and the hover/status bar |
| PT-439 | Medium | Interrogation interpolation | Workplace interrogation leaks the raw English article `the ` into Portuguese |
| PT-440 | Low | Interrogation punctuation | Interrogation questions render with spaces inside quotation marks |
| PT-441 | Medium | Ransom gender agreement | Female ransom leads receive masculine arrest participles |
| PT-442 | Medium | Sleeper/president gender agreement | Female and nonbinary sleeper/president messages use masculine agent/president nouns |

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
- Replay status: **Fixed and independently verified; remaining random police-alarm surrender/arrest seeds are optional coverage-only follow-up with no confirmed translation or layout defect**

The tooth-damage composition produced forms such as `está queimou!` and
`está corte!`. Car-chase fragments also read awkwardly, and the sneak-miss
warning used an infinitive construction. Updated participles, result fragments,
and the warning to `antes de o ataque acertar`.

The fresh strict-headless siege route reached the police alarm, surrender
announcement, siege briefing, localized encounter roster, and localized hit
messages. A later Portuguese corporate-mercenary fixture advanced 140 live
combat inputs and reached randomized final-words/death-reaction text without
raw-English names. The deterministic terminal and interpolation paths are
independently verified; additional police surrender/arrest seeds are optional
breadth coverage, not unverified corrections.

### PT-048 follow-up — forced police subdue terminal (2026-08-12)

A disposable-only debug hook routed the rebuilt Portuguese police fixture into
the exact `_fightSubdued` terminal after the siege briefing. It rendered
`A polícia imobiliza e prende o esquadrão.` from the canonical catalog, with no
English role names, missing-translation warning, or fixed-width overflow. The
bridge remained 25 rows at maximum width 80 with an empty error channel. This
closes the previously unverified police subdue wording branch; random
police-alarm variants tracked by PT-148 are optional breadth coverage only.

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
- Replay status: **Fixed and independently verified; remaining random police-alarm surrender/arrest seeds are optional coverage-only follow-up with no confirmed translation or layout defect**

Combat messages passed raw generated creature names into attack, injury, loot,
reaction, and death templates, so Portuguese combat could expose `SWAT
Officer`. Several randomized death/final-words templates also had no catalog
entry. Combat interpolation now uses the localized creature-name helper and
the missing English/Portuguese template pairs are present in both catalogs.
The rebuilt route rendered `Policial da SWAT` in the roster and messages such
as `acerta capacete de Policial da SWAT`. A fresh Portuguese corporate-
mercenary route also rendered localized `Militar Privado` final words and a
localized SWAT death reaction after 140 combat inputs. Additional police-alarm
surrender/arrest seeds are optional breadth coverage under PT-048.

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

No new defect was confirmed after the replay. The residual PT-048/PT-148
police-alarm seeds are optional breadth coverage, and PT-083 is an optional
responsive-readability enhancement rather than an unverified defect. Accepted
PT-049 historical changelog English remains out of the fix queue.

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
The residual PT-048/PT-148 police-alarm seeds are optional breadth coverage,
and PT-083 is an optional responsive-readability enhancement rather than an
unverified defect. Accepted PT-049 historical changelog English remains out of
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

The residual PT-048/PT-148 police-alarm seeds are optional breadth coverage,
and PT-083 is an optional responsive-readability enhancement rather than an
unverified defect. Accepted PT-049 historical changelog English remains out of
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
was empty. The random police-alarm variants PT-048/PT-148 are optional
breadth coverage, and PT-083 is an optional narrow-layout enhancement rather
than an unverified defect. Accepted PT-049 historical changelog English
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
row. PT-083 remains an optional narrow/fixed-console enhancement for other
screens, not an unverified defect.

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

## PT-358: Medical-debt raid replay found no residual issue

- Severity: Informational
- Type: Playtest verification / translation and layout
- Screen: Portuguese base → medical-industry raid → debt receipt
- Replay status: **Verified clean in a fresh strict-headless replay on 2026-08-13**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-debt-20260813/`

The temporary founder-debt fixture was adjusted only for deterministic coverage:
it supplied eligible funds, hostile healthcare law, and an immediate medical
raid. The replay rendered the Portuguese ambulance briefing, collection and
finance speech, status line, under-attack base, and receipt. At 320×240 the DOM
bridge remained 25 rows with a maximum width of 80, no document overflow, and
an empty browser-error channel. The fixture was restored to its original
all-false state; no translation, prefix, or layout fix was required.

## PT-359: Interface-help text used the wrong pronoun for people

- Severity: Low
- Type: Interface-options translation / grammar
- Screen: Portuguese title screen → Opções de Jogo → Opções de Interface
- Replay status: **Fixed in the catalog and covered by a focused regression and strict-headless replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/interface-options-pronoun-20260812/`; regression `test/title_screen/options_translation_test.dart`

The encounter-warning explanation rendered `Adiciona uma confirmação ao
encontrar pessoas para que você não passe acidentalmente por eles.` The
antecedent is the feminine plural noun `pessoas`, so `por eles` was a visible
agreement error. The catalog now uses `por elas`; the focused screen regression
rejects the masculine form. The rebuilt strict-headless replay stayed at 25
rows and 80 columns with no document overflow, no bridge errors, and a
`HeadlessChrome/150.0.0.0` user agent.

## PT-360: Additional police-terminal variation found no residual issue

- Severity: Informational
- Type: Playtest verification / translation and layout
- Screen: Portuguese safehouse → police siege → surrender, fight, foot escape, and combat terminal
- Replay status: **Verified clean in a fresh strict-headless replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-next-20260812/`

A second seeded police-siege route exercised the warning, loudspeaker, surrender
status, fight briefing, SWAT roster, foot-escape, combat-hit, fleeing-role, and
post-siege screens. The generated warehouse and equipment labels remained
localized. Captures stayed at 25 rows and a maximum width of 80, with no
document overflow or bridge errors. The lowercase `policial da SWAT` marker is
intentional flee-state styling; no translation, prefix, punctuation, or layout
defect was confirmed.

## PT-361: Compact map special label overwrote the Portuguese command legend

- Severity: Medium
- Type: Site-map console layout
- Screen: Portuguese courthouse site map with a localized special label
- Replay status: **Fixed and verified by focused regression plus strict-headless replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/site-map-command-overlap-20260812/`; regression `test/sitemode/pt_br_map_overlay_test.dart`

The compact map normally painted its special label at the same row and column
range used by the site action legend. On a display case tile, `Vitrine` was
painted over `L:Carregar`, producing `L:CarregaVitrineenar` and making the load
command unreadable. `printSiteMapSmall` now detects an occupied command footer
and uses the map's bottom border as a dedicated label footer, while retaining
the existing clearing behavior for the non-overlapping layout. The regression
asserts that `Vitrine` is on row 22, `L:Carregar` remains intact on row 23, and
the old merged form cannot occur. The accompanying rebuilt headless route kept
the command row at 25 rows and 80 columns with no document overflow or bridge
errors.

## PT-362: Map-editor hover status leaked raw special enum names

- Severity: Low
- Type: Map editor translation
- Screen: Portuguese mod-tools → Map Editor → White House, floor 2
- Replay status: **Fixed with localized fallback labels and verified in strict-headless replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/map-editor-followup-20260812/`; regression `test/map_editor/map_editor_translation_test.dart`

The editor’s curated palette did not include every special state that can be
loaded from shipped CSV maps. Its hover/status fallback used the Dart enum name
directly, so the White House’s Oval Office tile rendered
`ovalOfficeNW [bloco 7, especial 39]` in a Portuguese playtest. The shared
`specialLabel` boundary now maps non-palette states (Oval Office, prison
security tiers, nursing-home/insurance states, tents, and post-visit markers)
to user-facing English source labels, which are translated through `LcsI18n`.
The regression covers representative Oval Office, prison-control, nursing-home,
and insurance labels; the rebuilt headless replay confirms the same tile no
longer exposes the enum identifier.

## PT-363: Bank-vault continuation fragments fell back to English

- Severity: Medium
- Type: Translation coverage / context
- Screen: Portuguese First American Bank site map → vault route
- Replay status: **Fixed in the catalogs and covered by a focused regression on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/additional-route/19-bank-arrival.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/bank-teller-8014e-after.txt`; regression `test/pt_br_context_translation_test.dart`

The fresh strict-headless bank replay reached the Portuguese `Primeiro Banco
Americano` map and verified the teller prompt. A source/catalog audit of the
adjacent vault route then found thirteen production fragments absent from both
hash-sharded catalogs. The missing pieces included the lock description,
`Abrir o cofre do banco? (Sim ou Não)`, the three lock-result messages, hostage
and sleeper-manager outcomes, the empty teller-window message, and the
no-qualified-member fallback. Those literals would have rendered in English
when the vault branch was reached.

The same audit found an existing Portuguese fragment translating `a computer`
as `um computador`; in this sentence it names a specialist, so it now reads
`um especialista em informática`. The new regression asserts that every vault
fragment exists in both catalogs, has the intended Portuguese value, and does
not regress to the noun `um computador`. Catalog canonicalization and the
prefix validator pass. The live route remained strictly headless
(`HeadlessChrome/150.0.0.0`); no headed window was opened or focused.

## PT-364: Rebuilt police-fixture route stayed localized and width-safe

- Severity: Informational
- Type: Playtest verification / translation and layout
- Screen: Portuguese safehouse → police siege → combat map
- Replay status: **Verified clean in a fresh rebuilt strict-headless replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-terminal-cops-20260812/`

After restarting the temporary web server with the police fixture enabled, the
route rendered `A polícia cercou o local`, the Portuguese loudspeaker surrender
prompt, localized SWAT equipment, and the Portuguese combat legend. The bridge
reported 25 rows with a maximum width of 80, no document overflow, no bridge
errors, and a `HeadlessChrome/150.0.0.0` user agent. The run did not force the
combat `_fightSubdued` arrest path; that branch is covered separately by the
deterministic replay and focused catalog test, while random seed variation is
optional breadth coverage.

## PT-365: Strict-headless police combat replay found no new defect

- Severity: Informational
- Type: Playtest verification / translation and layout
- Screen: Portuguese safehouse → police siege → surrender → SWAT combat
- Replay status: **Verified clean in a fresh strict-headless replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-subdue-20260812/`

The rebuilt disposable route exercised the police surround warning, loudspeaker
`Rendam-se!` prompt, surrender status, combat briefing, SWAT roster, localized
weapons and armor, hit/injury messages, and repeated `F - Lutar` rounds. The DOM
bridge remained at 25 rows with a maximum width of 80; no document overflow or
bridge errors appeared. No English fallback, key-prefix mutation, punctuation
loss, or layout collision was observed. The normal `_fightSubdued` guard did not
fire before the combat state changed; a separate deterministic replay verified
that terminal wording, so remaining random seed variation is optional breadth
coverage rather than an unverified translation or layout defect.

### PT-048/PT-148 residual re-audit (2026-08-14)

The code-only re-audit confirmed that canonical arrest wording and localized
police-role interpolation are covered by focused tests and the prior
deterministic strict-headless replay. No actual unverified translation or
layout defect remains. Future random police-alarm seeds may broaden coverage,
but they are not pending corrections. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-police-residual-20260814/probe-report.md`.

## PT-366: Already-localized profile and site values were retranslated

- Severity: Low
- Type: Translation telemetry / display boundary
- Screen: Portuguese founder profile and base → Assign Tasks
- Replay status: **Fixed with focused regressions and a fresh strict-headless replay on 2026-08-13**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/double-translation-20260813/replay.md`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

The Portuguese founder route logged `Nenhuma`, `Daishō`, and `SEA — Sem-teto`
as missing translations even though each value was already localized and
visible in the correct Portuguese form. The profile weapon renderer and the
Assign Tasks location cell passed their rendered values through the English-key
translation wrapper a second time. Those boundaries now mark resolved values
as `noTranslate`; the Assign Tasks fallback `In Hiding` still uses the catalog.
Focused regressions cover both paths. A rebuilt headless replay kept the labels
unchanged, removed the false warnings, and stayed at 25×80 with no overflow or
bridge errors.

The follow-up sweep found the same boundary pattern in clothing titles, Review
location rows, sleeper work locations, equipment-transfer site labels, and the
full profile's `Roupas` value. Those renderers now also preserve values returned
by `LcsI18n.tr` or `Location.getName`; their fallback labels (`Away` and
`Missing`) still enter the catalog normally. The new regressions cover weapon,
clothing, Review, task, and equipment display paths, and the rebuilt replay
produced no false missing-translation warnings.

## PT-367: Profile armor details touched the body-status label

- Severity: Low
- Type: Fixed-width profile layout
- Screen: Portuguese founder profile with armored clothing
- Replay status: **Fixed with a focused regression and fresh strict-headless replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-armor-fixed-8901.png`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

The profile printed each body status and armor bonus without a separator, so
the Portuguese row read `Perna esq: Liberal+30`. This merged the translated
status with its numeric detail and made the label harder to scan. The shared
`printWounds` renderer now prepends one literal space to the already-rendered
armor suffix before fixed-width fitting. The regression rejects `Liberal+` and
requires the separated form. The rebuilt 80-column headless capture shows
`Liberal +…`, remains 25 rows wide-safe, and reports no browser or bridge
errors.

### Residual queue after this playtest

- PT-048/PT-148: optional random police arrest/subdue seed variation; the
  deterministic terminal and localized interpolation are already verified, so
  there is no unverified correction pending.
- PT-083: optional exploration of a broader 80-column narrow-console redesign
  beyond current fitting and ellipses; no confirmed defect is tracked.
- Persisted generated names: decide whether a locale switch should translate
  names already stored in save data or preserve their original-language form.
- PT-049: historical changelog English remains an accepted product decision,
  not an untracked translation defect.

## PT-368: Pretranslated raid briefings were translated twice

- Severity: Low
- Type: Translation telemetry / siege display
- Screen: Portuguese safehouse → CIA raid briefing (also corporate and rural
  raid branches)
- Replay status: **Fixed with a focused regression and fresh strict-headless
  replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-briefing-fixed-8903.png`;
  regression `test/daily/siege_translation_test.dart`

The CIA fixture rendered the briefing in correct Portuguese, but the second
translation pass still logged the complete rendered sentence as a missing
catalog key. The same pretranslated-value boundary existed in the corporate
raid, rural-mob raid, and rural assault paragraphs. Those calls now pass
`noTranslate: true` after `LcsI18n.processString` has already rendered the
template; raw templates continue through the normal translation path.

The rebuilt CIA route reports `HeadlessChrome/150.0.0.0`, 25 rows, maximum
width 80, no document overflow, an empty bridge-error channel, and no missing
translation warning for the briefing. The temporary debug fixture was restored
to its default disabled police setting.

## PT-369: Proper-name city fallback polluted Portuguese telemetry

- Severity: Low
- Type: Translation telemetry / proper-name boundary
- Screen: Portuguese police-siege daily cycle and city-composite labels
- Replay status: **Fixed with a focused regression and strict-headless replay on 2026-08-12**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-subdue-fixed-8906.png`; regression `test/basemode/pt_br_core_vocabulary_test.dart`

The forced police-subdue replay exposed a false missing-translation warning for
`San Antonio, TX`. `City.getName()` always sent every generated city proper name
through `LcsI18n.tr`, even though the Portuguese catalog intentionally contains
only selected localized city labels. The city renderer now mirrors the existing
site-name boundary: catalog-backed names are translated, while proper-name
fallbacks remain unchanged without telemetry. The regression covers an
uncatalogued city and confirms it is rendered verbatim with no missing key.

## PT-370: Police-behavior major-event headlines lacked Portuguese variants

- Severity: Low
- Type: Translation coverage / newspaper headline
- Screen: Portuguese newspaper → police-behavior major event
- Replay status: **Fixed with canonical catalog entries and focused regression on 2026-08-12**

The strict-headless police replay logged `BASTARDS` while generating the
player-facing police-behavior headline. The no-profanity branch also used
`[JERKS]`; neither key had a Portuguese catalog entry. The canonical shards now
render these as `CANALHAS` and `[BABACAS]`, preserving the headline's tone
without a missing-key warning. Regression:
`test/newspaper/herald_translation_test.dart`.

## PT-371: Clothing-crafting difficulty collides with a four-digit cost

- Severity: Medium
- Type: Fixed-width clothing-crafting layout
- Screen: Portuguese base mode → Atribuir Tarefas → Recrutamento e Aquisição → Fazer Roupas, page 4
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-12**
- Before evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/crafting-clothing-20260813/page4-after-back.txt`; after evidence is recorded in `findings-doc/play-log.md` and the `crafting-fixes-20260813` capture set.

The selector writes the localized difficulty at column 37 and right-aligns the
cost from column 64. For `Armadura tática da SWAT`, the full `Extremamente
Difícil` label and `US$ 2.100` overlap, producing
`Extremamente DifícUS$ 2.100`. Shorter prices do not expose the collision.
The difficulty and cost columns need a measured separator or a width-aware
cost/difficulty layout. The fix now reserves that space; the focused layout
regression and fresh page replay show no collision.

## PT-372: Flag-crafting currency and difficulty cells are clipped or joined

- Severity: Medium
- Type: Fixed-width flag-crafting layout
- Screen: Portuguese base mode → Atribuir Tarefas → Recrutamento e Aquisição → Fazer uma Bandeira
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-12**
- Before evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/crafting-clothing-20260813/flags-page1.txt`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/crafting-clothing-20260813/flags-page2.txt`, and `flags-page2-h.png`; after evidence is recorded in `findings-doc/play-log.md` and the `crafting-fixes-20260813` capture set.

The table places Portuguese currency at column 75, leaving only five cells
(columns 75–79); `US$ 10` therefore renders as `US$ 1`
and `US$ 20` as `US$ 2`. The selected flag's detail footer shows the complete
amount, proving the list value is being clipped rather than intentionally
rounded. On page 2, `Abaixo da Mé…US$ 2` also has no separator between the
fitted difficulty and cost. Keep the full amount visible and reserve at least
one blank cell between the two cells. The width-aware cost column now satisfies
both constraints in the fresh replay.

## PT-373: Clothing-crafting paging leaves an off-page preview selected

- Severity: Low
- Type: Fixed-width clothing-crafting navigation/display
- Screen: Portuguese base mode → Atribuir Tarefas → Recrutamento e Aquisição → Fazer Roupas
- Replay status: **Fixed and verified in a fresh strict-headless replay on 2026-08-12**
- Before evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/crafting-clothing-20260813/page4-after-back.txt`; after evidence is recorded in `findings-doc/play-log.md` and the `crafting-fixes-20260813` capture set.

After selecting `G - Traje de tanque humano` on page 5 and pressing `[` to
return to page 4, the footer still shows the page-5 tank preview even though
that item is no longer in the visible page. Paging should either keep the
selected row in view or clear/reselect the detail footer when the page changes.
The page-change handler now clears the selection; the after capture has no
off-page tank footer.

## PT-374: Hostage prose bypassed composed translation and nested formatting

- Severity: Medium
- Type: Translation coverage / runtime composition
- Screen: Portuguese safehouse → hostage tending → recruitment, love-bombing, and release
- Replay status: **Fixed with composed-template rendering and focused regressions on 2026-08-12**
- Regression: `test/daily/hostages_translation_test.dart`

Several hostage routes assembled sentences from adjacent source literals or
inserted a second localized sentence as a parameter to an outer template.
`processString` only performs one exact catalog lookup and one placeholder pass,
so these paths either fell back to English or displayed literal `{heShe}` /
`{hostage}` tokens. The new `processComposedString` helper translates the
longest catalog fragments before formatting. Recruitment reactions and
love-bomb activities are rendered before nesting; release siege labels are
localized before insertion. The focused tests cover a composed recruitment
paragraph, a nested pronoun reaction, a love-bomb activity, and release/
psychology fragments, including assertions that no placeholder survives.

## PT-375: Flag-crafting paging leaves an off-page preview selected

- Severity: Low
- Type: Fixed-width flag-crafting navigation/display
- Screen: Portuguese base mode → Atribuir Tarefas → Recrutamento e Aquisição → Fazer uma Bandeira
- Replay status: **Fixed and independently verified in a fresh strict-headless replay on 2026-08-13**
- Before evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-crafting-20260813/15-flag-page2-H-selected-normal.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-crafting-20260813/16-flag-page1-after-back-normal.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-crafting-20260813/17-flag-page1-after-back-480x320.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-crafting-20260813/18-flag-page1-after-back-320x240.json`
- After evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-final-20260813/03-flag-page2-H-selected-normal.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-final-20260813/04-flag-page1-after-back-normal.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-final-20260813/05-flag-page1-after-back-480x320.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-final-20260813/06-flag-page1-after-back-320x240.json`

### Reproduction

1. Open the Portuguese flag-crafting route from Assign Tasks → Recrutamento e Aquisição → `4 - Fazer uma Bandeira`.
2. Press `]` to move from page 1 to page 2.
3. Press `H` to select `Bandeira do Orgulho Progressista Inters…`.
4. Press `[` to return to page 1.

### Actual

Page 1 correctly lists flags `A`–`L`, but the detail footer still shows the page-2 selection: `Bandeira do Orgulho Progressista Inters…`, its description, `Questão: Direitos LGBTQ+`, `Dificuldade: Acima da Média`, and `US$ 20`. The preview is not a visible row on the current page. The behavior is reproducible at 1280×577, 480×320, and 320×240; each bridge capture remains 25×80 with no document overflow or runtime errors.

### Expected / recommendation

Changing the flag page should clear the preview or move the selected row into view, matching the fixed clothing-crafting pager behavior in PT-373. Add an `onPageChanged` reset for the selected flag (and clear the preview area) before considering PT-375 closed.

### Resolution

The flag pager now clears the selected preview and detail area on page changes. In the fresh replay, selecting page-2 `H` and returning to page 1 left the page-1 footer blank at 1280×577, 480×320, and 320×240; all captures remained 25×80 with no overflow or bridge errors.

## PT-376: Sleeper activity header overwrites the Portuguese funds label

- Severity: Medium
- Type: Fixed-console sleeper-management layout
- Screen: Portuguese base mode → Agentes Infiltrados → select a sleeper
- Replay status: **Fixed and independently verified in a fresh strict-headless replay on 2026-08-13**
- Before evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fresh-broad-20260813/36-sleeper-activity.json`
- After evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-final-20260813/10-sleeper-highfunds-normal.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-final-20260813/11-sleeper-highfunds-480x320.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-final-20260813/12-sleeper-highfunds-320x240.json` (natural-funds captures remain in `07`–`09`)

### Reproduction

1. Start a fresh Portuguese campaign with an available sleeper agent (the disposable replay used the president-sleeper fixture).
2. From base mode, open `B - Agentes Infiltrados`.
3. Select `A - Presidente Lovecraft`.

### Actual

The row-0 header is rendered as
`Ação Encoberta: Qual será o foco de Presidente Lovecraft?heiro: US$ 1.000.000`.
The long localized title consumes the start of the right-aligned `Dinheiro:` label, leaving the suffix `heiro` attached to the question. The DOM bridge remains exactly 80 cells wide, so this is an overwrite/collision rather than an over-wide-row report.

### Expected / recommendation

Keep a visible separator and the complete `Dinheiro: US$ 1.000.000` metadata. Fit or ellipsize the undercover-action title against the funds column, using the same width-aware header treatment as PT-302's regular activity screen. The affected source path is the unbounded `mvaddstr` title in `lib/basemode/activate_sleepers.dart`.

### Resolution

The sleeper header now fits the action title against the funds column. In the
fresh president-sleeper replay with the isolated fixture's longest tested
funds value, the header preserved the complete `Dinheiro: US$ 1.000.000` label
with a visible separator at 1280×577, 480×320, and 320×240; each capture
remained 25×80 with no overflow or bridge errors.

## PT-377: Supreme Court purge heading falls back to English in Portuguese

- Severity: Medium
- Type: Missing translation / endgame constitutional-amendment route
- Screen: Portuguese month end → elite-liberal constitutional amendment → Supreme Court purge
- Replay status: **Fixed and independently verified in a fresh strict-headless replay on 2026-08-13**
- Before evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fresh-broad-20260813/auto-checkpoint-50.json` and `auto-checkpoint-75.json`
- After evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt377-20260813/01-plural-1280x577.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt377-20260813/02-plural-480x320.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt377-20260813/03-plural-320x240.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt377-20260813/04-singular-1280x577.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt377-20260813/05-singular-480x320.json`, and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt377-20260813/06-singular-320x240.json`

### Reproduction

1. Start a fresh Portuguese campaign with the disposable elite-liberal/public-opinion fixture.
2. Advance through the month-end constitutional-amendment route until the Supreme Court purge amendment is displayed.
3. Observe the heading above the former justices.

### Actual

The Portuguese amendment screen renders the raw English line:
`The following former citizens are branded Arch-Conservative:`
while the heading, names, and following paragraph are otherwise in the Portuguese route. The source writes this dynamic singular/plural heading directly with `mvaddstr` in `lib/politics/constitution.dart` and no Portuguese catalog entry exists.

### Expected / recommendation

Localize both singular and plural heading variants (and preserve the existing agreement branch) before writing to the console. The route should not expose English constitutional language in a Portuguese endgame screen.

### Resolution

The singular and plural purge headings now use the Portuguese catalog before
writing to the fixed-width console. Independent strict-headless fixture replays
rendered `Os seguintes ex-cidadãos são classificados como Arqui-Conservadores:`
and `O seguinte ex-cidadão é classificado como Arqui-Conservador:` at
1280×577, 480×320, and 320×240. No raw English heading, overflow, or bridge
error remained.

## PT-378: Long Portuguese game-over ending rows overflow the fixed console

- Severity: Medium
- Type: High-score layout / localized ending text
- Screen: Portuguese game-over → high-score list
- Replay status: **Fixed and independently verified in a fresh strict-headless replay on 2026-08-13**
- Evidence: focused regression `test/title_screen/high_scores_layout_test.dart`; live replay `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt378-379-20260813/pt378-highscores.json`

### Reproduction

1. Seed or reach a Portuguese game-over high-score entry with ending
   `Ending.medicalSiege`, month September, and year 2026.
2. Open the high-score screen after the game-over terminal.
3. Inspect the ending sentence row beneath the slogan.

### Actual

Before the fix, `lib/title_screen/high_scores.dart:218-220` wrote the
localized `endingTemplate` with unbounded `addstr`. The Portuguese
medical-siege sentence rendered as:

`O Esquadrão do Crime Liberal foi à falência por contas médicas em Setembro de 2026.`

The rendered width is 83 cells, so the fixed 80-cell console silently clips the
last three cells (`26.`). The other longest tested ending, permanent hiding,
renders as 81 cells:

`O Esquadrão do Crime Liberal ficou permanentemente escondido em Setembro de 2026.`

### Expected / recommendation

Fit each localized ending row to the 80-cell console before writing it (for
example, with `fitConsoleText` and a visible ellipsis), or wrap it without
overwriting the score/stat rows. Preserve the full date when the row fits and
ensure no ending text is silently clipped.

The focused regression seeds `Ending.medicalSiege`, runs `viewHighScores`, and
expects the row to equal the width-fitted Portuguese sentence.

### Resolution

`viewHighScores` now renders the translated ending through `mvaddstrFitted`
with the full console width. This preserves the complete sentence when it
fits and adds the shared visible ellipsis when a localized ending exceeds 80
cells, preventing the ending row from writing into the stat columns below.
The focused regression is green after this production change. A fresh
strict-headless replay independently verified both the medical-siege and
permanent-hiding variants in Portuguese; each live ending row measured 80
cells with no raw English text or bridge errors. PT-378 is fixed and
independently verified.

## PT-379: Wheelchair transport label falls back to English in Portuguese profiles

- Severity: Medium
- Type: Profile translation / mobility status
- Screen: Portuguese base mode → profile a Liberal with both legs missing and a wheelchair
- Replay status: **Fixed and independently verified in a fresh strict-headless replay on 2026-08-13**
- Evidence: focused regression `test/basemode/pt_br_wheelchair_profile_test.dart`; live replay `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt378-379-20260813/pt379-compact-profile.json` and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt378-379-20260813/pt379-full-profile.json`

### Reproduction

1. Initialize a fresh `GameState` and Portuguese (`pt_BR`) locale.
2. Create a Liberal whose `HumanoidBody.leftLeg.cleanOff` and
   `rightLeg.cleanOff` are true, then set `hasWheelchair = true`.
3. Render the compact profile with `printCreatureInfo` and the full profile
   with `printFullCreatureStats`.

### Actual (before fix)

Both profile renderers call `LcsI18n.tr("Wheelchair")`, but neither canonical
catalog contains a standalone `Wheelchair` key. The focused runtime test
reported `LcsI18n: Missing translation for "Wheelchair" in pt_BR` and rendered
`Transporte: Wheelchair` in the compact profile and `Carro: Wheelchair` in the
full profile. Existing action/help keys (`Procure a Wheelchair`, `Procuring a
Wheelchair`, and the wheelchair help paragraphs) do not cover this status
label.

The source branches are `lib/common_display/print_creature_info.dart` lines
187–190 (compact profile) and 901–907 (full profile); the full profile writes
the resulting label at lines 910–916.

### Expected / recommendation

Add a standalone Portuguese catalog entry for `Wheelchair` (for example,
`Cadeira de rodas`) and keep both profile branches on that shared key. Add a
focused profile regression asserting that both transport cells stay Portuguese
and produce no missing-translation warning.

### Resolution

Added the standalone `Wheelchair` key to the canonical English and Portuguese
shards (`app_en_US_part02.arb` and `app_pt_BR_part02.arb`), with the Portuguese
value `Cadeira de rodas`. The existing compact `printTransportation` and full
`printFullCreatureStats` branches now resolve the same key without falling
back to English. The focused regression renders both branches with a
wheelchair user and asserts the Portuguese label in each. A fresh
strict-headless replay independently verified the live compact and full
Portuguese profile screens; each wheelchair row measured 80 cells with no raw
English text or bridge errors. PT-379 is fixed and independently verified.

## PT-380: Disband-and-wait political summary exposes English executive alignment labels

- Severity: Medium
- Type: Missing translation / disbanding political summary
- Screen: Portuguese campaign → Liberal Agenda → Dissolver e esperar → monthly political summary
- Replay status: **Fixed and independently verified in a fresh strict-headless replay on 2026-08-13**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/fresh-stock-stealth-pt-20260813/62-agenda.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/fresh-stock-stealth-pt-20260813/120-month.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260813/fresh-stock-stealth-pt-20260813/terminal.json`

### Reproduction

1. Start a fresh stock Portuguese campaign and continue through founder creation.
2. Open `L - O status da agenda Liberal` from base mode.
3. Choose `D - Dissolver e esperar` and advance the monthly political summary.
4. Inspect the executive line beneath the Portuguese month heading.

### Actual

The otherwise Portuguese disbanding summary renders the executive alignment
labels in English, for example:

`Presidente: Don Justice, moderate, 1º Mandato`

and later:

`Presidente: Aidan Woods, Conservative, 1º Mandato`

The Portuguese catalog already contains `moderate` → `moderado` and
`Conservative` → `Conservador`, but `lib/basemode/disbanding.dart::printExec`
passes `exec[Exec.president]!.label` directly to the interpolated string rather
than translating it. The line is a fixed 80-column row; the captured route
measured `maxRow: 80` and `#lcs-playtest-errors` was empty, so this is a
translation leak rather than a width or runtime failure.

### Fix and verification handoff

`printExec()` now resolves `exec[Exec.president]!.label` through
`LcsI18n.tr` before interpolating the Portuguese `President: {name}, {label}`
template. The focused regression
`test/basemode/disbanding_translation_test.dart` covers both `moderate` →
`moderado` and `Conservative` → `Conservador` on the actual disbanding row.
Focused command:

```text
/home/henry/extracted-apps/flutter-sdk/flutter/bin/flutter test test/basemode/disbanding_translation_test.dart
```

Independent verifier replay (required before closing):

1. Rebuild the Flutter web app from the current branch and serve it on a fresh
   local port.
2. Start a new headless `agent-browser` session with a unique
   `AGENT_BROWSER_SESSION`, open `http://127.0.0.1:<port>/?playtest=1`, and
   select Portuguese (`pt_BR`).
3. Complete founder creation, open `L - O status da agenda Liberal`, choose
   `D - Dissolver e esperar`, and advance the monthly summary.
4. Capture the executive row and confirm it contains `moderado` or
   `Conservador` (depending on the generated president), contains no raw
   `moderate`/`Conservative`, stays within 80 cells, and reports no bridge
   errors.

Verifier evidence: fresh isolated session
`verify-pt380-20260813` on Flutter web-server port 9240. The live route reached
the disbanding summary and advanced through June 2026. Captures
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt380-20260813/56-month.json`,
`62-month.json`, and `75-month.json` render
`Presidente: Judas Piercey, moderado, 1º Mandato`; no captured executive row
contains exact `, moderate,` or `, Conservative,` text. Every capture measured
25 rows with `maxRow: 80`, no over-wide rows, and an empty
`#lcs-playtest-errors` channel under `HeadlessChrome/150.0.0.0`. Full route and
source hashes: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verifier-pt380-20260813/route.md`.

PT-380 is fixed and independently verified.

## PT-381: Homeless-camp siege briefing overflows fixed-width console

- Severity: Medium
- Type: Fixed-console layout / translated siege briefing
- Screen: Portuguese safehouse → homeless-camp siege → `F - Lutar`
- Replay status: **Fixed and independently verified in a fresh strict-headless replay on 2026-08-13**
- Evidence: static width reproduction from `lib/daily/siege.dart:1813-1825`;
  Portuguese catalog values in `lib/l10n/app_pt_BR_part13.arb`,
  `app_pt_BR_part03.arb`, and `app_pt_BR_part17.arb`; live capture
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt381-20260813/12-briefing.json`

### Reproduction

1. Start a Portuguese campaign with a Liberal safehouse at a homeless camp.
2. Trigger a siege and choose `F - Lutar` to open the homeless-camp defense
   briefing.
3. Inspect the translated intro and cover-fire rows at the fixed 80-column
   console boundary.

### Actual

`fightHomelessCampSiege()` writes translated strings with unbounded `mvaddstrc`
and `mvaddstr` calls at fixed source coordinates. With the current `pt_BR`
catalog, the intro `Você está prestes a montar uma defesa do acampamento de
sem-teto.` is 65 cells at column 16, ending at cell 80 (one cell beyond the
valid 0–79 range). The cover-fire row
`fornecerão fogo de cobertura e ficarão na retaguarda até serem necessários.` is
75 cells at column 11, ending at cell 85; six trailing cells are clipped.
The corresponding `sallyForth()` safehouse rows fit, so this is a distinct
homeless-camp branch gap rather than the already-fixed generic briefing.

### Expected / recommendation

Render the homeless-camp briefing with width-aware fitting or wrapped prose,
preserving all Portuguese text and the row-23 prompt. Add a focused layout
regression and an independent strict-headless replay at the standard narrow
viewport before closing this ticket.

### Fix and verification handoff

`renderHomelessCampSiegeBriefing()` now renders each translated sentence through
the bounded `addparagraph()` path, advancing the next section from the actual
wrapped cursor position and reserving the row-23 prompt. The prompt itself uses
`mvaddstrcFitted()` with the remaining console width. Regression coverage in
`test/daily/siege_translation_test.dart` asserts that every Portuguese sentence
is present in the rendered rows and that no row exceeds 80 cells.

Focused commands:

```text
/home/henry/extracted-apps/flutter-sdk/flutter/bin/flutter test \
  test/daily/siege_translation_test.dart \
  test/localized_layout_regression_test.dart
```

Independent verifier replay: a rebuilt Flutter web app was opened through the
strict-headless wrapper in isolated session `verify-pt381-20260813` on port
9251. A deterministic save fixture derived from the checked-in
`test/saves/moe_1_5.json` was injected into the browser's disposable IndexedDB
save store; the fixture changed only Site21 to a police siege, set it as the
active safehouse, and was not committed or used as a production/debug flag.
After selecting Portuguese, the live base screen showed `F - Lutar/Fugir`;
`F` opened the fixed homeless-camp briefing. Capture
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt381-20260813/12-briefing.json`
contains the complete wrapped intro, body, and Portuguese row-23 prompt.
The metrics capture
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt381-20260813/13-briefing-metrics.json`
reports 25 rows, `maxRow: 80`, `overWideRows: []`, and an empty
`#lcs-playtest-errors` channel under `HeadlessChrome/150.0.0.0`; the raw
English intro and cover-fire text are absent. PT-381 is independently
verified.

## PT-382: Three-digit Portuguese flag counts clip at the right edge

- Severity: Medium
- Type: Fixed-width high-score layout / dynamic numeric value
- Screen: Portuguese title → high-score list / universal statistics
- Replay status: **Fixed and independently verified in a fresh strict-headless replay on 2026-08-13**
- Evidence: live replay and static runtime reproduction against `lib/title_screen/high_scores.dart:256-316` and the canonical `pt_BR` catalog

### Reproduction

1. Seed a high-score entry with `statBuys: 123` (or a universal total of 123)
   and open the Portuguese high-score screen.
2. Inspect the `Bandeiras compr.:` / `Bandeiras queim.:` cells at column 60.

### Actual

`viewHighScores()` writes the localized flag labels directly with `mvaddstr`
at column 60. The Portuguese values are `Bandeiras compr.: {buys}` and
`Bandeiras queim.: {burns}`. With the three-digit value `123`, each rendered
cell is 21 columns wide, but only columns 60–79 (20 cells) are available; the
last digit is silently dropped by `Console.addchar()` once `x == 80`. The
same unbounded writes are used by the universal statistics rows. The existing
PT-047 compact-label regression only exercises a two-digit value (`12`), so it
does not cover this dynamic-width case.

### Expected / recommendation

Keep every flag-count value visible inside its 20-column cell for realistic
three-digit totals, using a width-aware numeric/label renderer or a shorter
Portuguese label. Add a regression with `123` for both the per-score and
universal rows before closing this ticket.

### Fix and verification handoff

`_printHighScoreFlagCount()` now translates the flag-count template first,
shortens only its label as needed, and writes the complete numeric value within
the 20-cell right-hand column. Both per-score and universal statistics use this
shared bounded renderer. The focused regression in
`test/title_screen/high_scores_layout_test.dart` seeds 123 bought/burned flags
in both views and asserts that each Portuguese value remains visible through
column 79.

Focused commands:

```text
/home/henry/extracted-apps/flutter-sdk/flutter/bin/flutter test \
  test/title_screen/high_scores_layout_test.dart \
  test/localized_layout_regression_test.dart
```

The independent replay below confirms the four flag rows retain `123`, fit
the 80-column buffer, and report no bridge errors.

### Independent strict-headless verification

- Rebuilt the current worktree on Flutter web-server port `9253` and used the
  fresh isolated session `verify-pt382-fresh-20260813` through only
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/agent-browser-headless.sh`
  with `?playtest=1` and the `#lcs-playtest-buffer` DOM bridge. The browser
  user agent was `HeadlessChrome/150.0.0.0`; no headed browser, CDP attach,
  source edit, or debug flag was used.
- The disposable fixture was seeded only in that browser's SharedPreferences
  web storage, using the package's nested JSON encoding: one high-score entry
  with `statBuys: 123` and `statBurns: 123`, plus universal bought/burned totals
  of `123`. The source and repository storage were not modified.
- `07-title-pt.json` records the Portuguese title route and `08-highscore-pt.json`
  records the live high-score screen. The per-score rows 4–5 and universal
  rows 23–24 each retain the complete `Bandeiras compr. 123` and
  `Bandeiras queim. 123` strings. `09-highscore-pt-metrics.json` reports 25
  rows, `maxRow: 80`, no over-wide rows, an empty playtest error channel, and
  no raw English high-score strings. Evidence is retained under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt382-20260813/`.

## PT-383: Translated decorative newspaper chrome clips at fixed right columns

- Severity: Medium
- Type: Fixed-width newspaper layout / translation
- Screen: Portuguese newspaper mastheads (Conservative Star and The Post)
- Replay status: **Fixed and independently verified in a fresh strict-headless replay on 2026-08-13**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-newspaper-mastheads-20260813/pt383-static-test.txt`; deterministic Flutter console reproduction against `lib/newspaper/layout.dart:76,139`

### Reproduction

1. Initialize the runtime with locale `pt_BR`.
2. Render `conservativeStarTop()` and inspect row 2, or render `thePostTop()` and inspect row 2.
3. Read the fixed 80-column console buffer.

### Actual

The Conservative Star masthead translates `WE KNOW OUR` to `NÓS CONHECEMOS NOSSOS` but writes it unbounded at column 68. Only the first 12 cells fit, so the live row ends `NÓS CONHECEM` and loses the rest of the phrase. The Post translates `OUR PULITZER PRIZE` to `NOSSO PRÊMIO PULITZER` but writes at column 61; the row ends `NOSSO PRÊMIO PULITZ`, dropping the final `ER`. `Console.addchar()` silently discards characters once x reaches 80. The catalog translations are present; this is a renderer-width defect, distinct from the already-verified Herald/Daily masthead paths.

### Expected / recommendation

Keep translated decorative copy inside its fixed right-hand masthead cells by fitting or shortening each phrase before drawing. Preserve the newspaper's satire and visual hierarchy, and add a focused regression for both mastheads asserting that no text is written beyond column 79 and that the chosen bounded copy remains legible.

### Fix and verification handoff

`conservativeStarTop()` and `thePostTop()` now pass their translated right-hand
strings through `mvaddstrFitted()` with the remaining width (`console.width -
68` and `console.width - 61`). This keeps the existing translated copy and
uses the shared ellipsis behavior when it cannot fit. The focused regression in
`test/newspaper/herald_translation_test.dart` renders both mastheads under
`pt_BR` and asserts the bounded rows end with `NÓS CONHECE…` and
`NOSSO PRÊMIO PULIT…` at the 80-column boundary.

Independent verifier replay steps:

1. Rebuild the Flutter web app after this change and serve it on a fresh local
   web-server port.
2. Start a new isolated strict-headless `agent-browser` session, open
   `/?playtest=1`, and select `pt_BR`.
3. Reach a Conservative Star newspaper and a Post newspaper, capturing the
   masthead rows from `#lcs-playtest-buffer`.
4. Confirm no row exceeds 80 cells, no bridge errors are present, and the
   right-hand strings remain bounded without raw English text.

### Independent verification result

The fresh wrapper-only replay on Flutter web-server port 9293 captured both
mastheads under `pt_BR`: `NÓS CONHECE…` and `NOSSO PRÊMIO PULIT…` ended at
column 79. Both screens remained 25 rows by 80 columns with no over-wide rows,
no bridge errors, and no raw English masthead strings. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt383-20260813/`.

## PT-384: Long Portuguese sleeper profession overwrites the site column

- Severity: Medium
- Type: Fixed-width sleeper-management layout
- Screen: Portuguese base mode → Agentes Infiltrados
- Replay status: **Fixed and independently verified in a fresh strict-headless Portuguese replay on 2026-08-14**
- Before evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-sleeper2-pt-20260814/107-sleeper-menu.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-sleeper2-pt-20260814/108-sleeper-bulk-menu.json`
- After evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt384-20260814/10-single-sleeper.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt384-20260814/11-bulk-sleeper.json`, with cell metrics in the matching `*-metrics.json` files and full replay notes in `verification-summary.md`

### Reproduction

1. Start a fresh stock-cheatless Portuguese campaign and recruit a college
   student as a sleeper (the route reached this naturally after ordinary
   donation and political-recruitment steps).
2. From base mode, open `B - Agentes Infiltrados`.
3. Inspect the sleeper table row containing the `Estudante Universitário`
   profession.

### Actual

The row renders `Estudante UniversiSEAio`. The localized profession is written
unbounded at column 24, while the short city site cell begins at column 42, so
the legitimate `SEA` value overwrites the middle of `Universitário` and the
trailing `io` spills after it. The bulk table has
the same defect at its tighter columns: `Estudante Unive23%táMantendo Discriç…`
merges the profession, effectiveness, current-activity, and bulk-action cells.
Both rows remain 80 cells wide and report no bridge error, but the profession,
site/metadata, and activity values are corrupted. This is distinct from PT-181
(which bounded the site cell) and PT-203 (which bounded sleeper names); the
job/profession cell itself still has no width budget.

### Expected / recommendation

Bound the profession/job cell to the space before column 42 (with a separator
or ellipsis) in both single-sleeper and bulk activation tables. Add a focused
regression using `Estudante Universitário` that asserts the site column remains
intact and no row exceeds 80 cells.

### Independent verification result

The fixer bounds the single-sleeper profession to 17 cells and the bulk
profession to 14 cells. In a fresh wrapper-only `HeadlessChrome/150.0.0.0`
replay with a disposable college-student sleeper fixture, the single row
rendered `Estudante Univer…` followed by a blank separator and intact `SEA`;
the bulk row rendered `Estudante Uni…`, blank separator, intact `50%`, and a
17-cell `Promovendo o Lib…` activity field. Both captures measured 25×80 with
`maxRow=80`, `overWideRows=[]`, empty bridge errors, and no
`UniversiSEAio`/`Unive23%` corruption. Focused
`flutter test test/basemode/pt_br_core_layout_test.dart` also passed all 31
tests. Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt384-20260814/`.

## PT-385: Arch-conservative civil-rights story produces broken Portuguese agreement

- Severity: Medium
- Type: Newspaper translation/context
- Screen: Portuguese newspaper → `JAMMED UP` major event (arch-conservative publication)
- Replay status: **Fixed; independently verified after a fresh strict stock-cheatless reproduction**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-victory-politics-20260814/39-wait-12.json`

### Reproduction

1. Start a fresh stock-cheatless Portuguese campaign through the normal language menu.
2. Assign the founder to `Escrever Artigos do Guardião Liberal` and wait through the January month roll-over.
3. At the generated newspaper screen, inspect an arch-conservative `JAMMED UP` civil-rights story.

### Actual

The live Portuguese story begins `Wichita, KS - Uma um monte de pessoas negras bloqueou...` and later says `Embora os pessoas negras tenham saído...`. The template already supplies `Uma` and `os`, but the arch-conservative substitutions are translated as `um monte de pessoas negras` and `pessoas negras`; the resulting article has a duplicated article and masculine plural agreement error. This is a composed-template defect, not intentional satire or a missing proper-name translation.

### Resolution and independent verification

The Portuguese catalog now owns the article-bearing noun fragments for both the
neutral and arch-conservative branches, and the Portuguese story template no
longer supplies fixed `Uma`/`os` articles around those fragments. The source
selects the context-specific keys only for `pt_BR`; English and other locales
retain their existing template path. A focused regression covers both
publication alignments.

An independent source-level harness rendered neutral Herald and
arch-conservative AM Radio stories from fresh deterministic seeds. Both
contained the expected Portuguese phrases, rejected `Uma um monte` and `os
pessoas`, and rendered as 25 rows of 80 cells. The focused newspaper suite (30
tests) and `dart run scripts/validate.dart` also passed. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt385-20260814/`.

## PT-387: Portuguese police chase crashes while rendering invalid health

- Severity: High
- Type: Runtime crash / combat status layout
- Screen: Portuguese stock route → stolen sportscar → police pursuit
- Replay status: **Closed after fixer tests and an independent strict-headless stock replay**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-campaign-executive-20260814/305-police-d2-10.json`

### Reproduction

1. Start a fresh stock-cheatless Portuguese campaign through the normal
   language menu.
2. Build a high-charisma/persuasion founder, recruit an ordinary lawyer and
   university student, and assign ordinary legal donations.
3. Assign the founder to `Roubar um Carro`, choose `Esportivo`, approach the
   vehicle, and choose `Arrombar a fechadura`.
4. During the police pursuit, repeatedly choose `D - Tentar despistá-los`.
5. Inspect the visible `#lcs-playtest-buffer` output.

### Actual

The game emits `RELATÓRIO DE FALHA: Uma captura ajudará o desenvolvedor a
corrigir este bug.`, followed by `Invalid argument: 0`. The stack points to
`common_display.dart:550 _getHealthDisplayForSkill`, called by
`printHealthStat`, `printCreatureInfo`, `printParty`, and `sitemode/fight.dart`
line 1331. The founder's health reaches an invalid zero/negative value while
the police pursuit is active, and no game-over/victory terminal is reached.
The capture remains 25×80; this is a runtime failure in the visible buffer,
not a bridge error.

### Expected / recommendation

Handle zero/negative health before `_getHealthDisplayForSkill` formats combat
status, preserve a normal Portuguese game-over/failure path, and add a focused
regression for a police pursuit that drives a liberal below zero health. A
separate prober/fixer/verifier must confirm the invariant and independently
replay the route before closing this ticket.

### Resolution and verification

`lib/common_display/common_display.dart` now clamps only the display-local
health value to zero before precision rounding; the negative overkill model is
unchanged. The focused Portuguese regression covers intelligence precision
5/6/7, positive health, dead overkill, combat redraw, and 80-column layout.
The fixer suite (71 tests plus validation and analysis) passed. An independent
fresh session `verify-pt387-814-r1` replayed the same car-theft/police-pursuit
route through normal combat game-over with 107 valid 25×80 captures, zero
`Invalid argument`, zero `RELATÓRIO DE FALHA`, zero over-wide rows, and no
bridge errors. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt387-20260814/`.

## PT-388: Portuguese abortion-book story inserts a subject pronoun as a possessive

- Severity: Medium
- Type: Newspaper translation/context
- Screen: Portuguese newspaper → generated major event about `The Abortion Files`
- Replay status: **Closed after fixer and independent verifier replay**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-campaign-media-recruitment-20260814/141-arrival.json`

### Reproduction

1. Start a fresh stock-cheatless Portuguese campaign through the normal
   language menu.
2. Build a founder with ordinary media/recruitment activities, assign the
   founder to `Escrever para o Guardião Liberal`, and advance through the
   March newspaper cycle.
3. Inspect the generated Washington, DC abortion-book story in the visible
   `#lcs-playtest-buffer` output.

### Actual

The story renders `O autor, um ex-médico abortista, dedicou a aposentadoria ela a desencorajar mulheres de fazer abortos.` The Portuguese catalog template at
`lib/l10n/app_pt_BR_part15.arb:195` places `{authorPossessive}` after
`a aposentadoria`, while `lib/newspaper/major_event.dart:1863-1867` supplies
`author.gender.hisHer`; for a feminine author this becomes `ela`, a subject
pronoun rather than a possessive. The resulting phrase is ungrammatical and
visible in a normal stock route, not an intentional proper-name fallback.

### Expected / recommendation

Use a Portuguese possessive form that agrees with the template (for example
`sua` or `dela`) while preserving the English and other-locale paths. Add a
deterministic regression for both author genders and an independent fresh
headless replay before closing PT-388.

### Resolution and verification

`major_event.dart` now passes `PronounRole.possessive` to the transparent
pronoun translator. The regression covers deterministic feminine and masculine
authors (`dela`/`dele`), English `her`/`his`, newspaper rendering, and 25×80
rows. The fixer validation passed. Independent fresh strict-headless stock
sessions `verify-pt388-814-r1` and `verify-pt388-814-r2` reached the actual
Clinic Regret article: the feminine author produced `dedicou a aposentadoria
dela` and the masculine author produced `dedicou a aposentadoria dele`, with
neither malformed subject-pronoun form. The focused Herald suite passed all 31
tests and the gender replay passed. Ten evidence captures were 25×80 with zero
over-wide rows and zero bridge errors. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt388-20260814/`.

## PT-389: Portuguese brownie-selling arrest message leaks the raw English action

- Severity: Medium
- Type: Daily translation/context
- Screen: Portuguese stock route → illegal fundraising → `Vendendo Brownies` → police arrest warning
- Replay status: **Closed after focused tests and an independent fresh strict-headless stock replay**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-gameover-direct-car-20260814/147-brownies-w.json`

### Reproduction

1. Start a fresh stock-cheatless Portuguese campaign through the normal language menu.
2. Assign a founder to `Arrecadação Ilegal → Vender Brownies` and advance one day until the ordinary police-arrest branch occurs.
3. Inspect the visible `#lcs-playtest-buffer` output.

### Actual

The Portuguese daily result renders `A polícia aborda Hiro Underhill enquanto selling brownies!`. The localized arrest template in `lib/l10n/app_pt_BR_part02.arb:259` translates the surrounding sentence but interpolates the raw English action. `lib/daily/activities/fundraising.dart:60` passes the literal `selling brownies` to `attemptArrest`, so the live stock route exposes an English gerund inside Portuguese prose.

### Expected / recommendation

The action should be localized in Portuguese (for example, `vendendo brownies`) while preserving the existing English and other-locale text. Route the action through a localized key or translate the activity label before interpolation, then add a deterministic regression for the Portuguese arrest branch and a fresh strict-headless replay at 25×80.

### Fix and verification

The five raw fundraising arrest actions now pass through `LcsI18n.tr` before
`attemptArrest`: soliciting donations, selling shirts, selling art, playing
music, and selling brownies. English source keys and Portuguese translations
(`solicitando doações`, `vendendo camisetas`, `vendendo arte`, `tocando música`,
and `vendendo brownies`) are present in the canonical hash-sharded catalogs.
The focused regression also preserves the already-localized bury-body action.
Independent verifier session `verify-pt389-fresh-20260814-r5` reached the real
arrest branch on 26 January 2023. The live buffer rendered `A polícia aborda
Danielle Hammond enquanto vendendo brownies!`, with no raw `selling brownies`
warning. The 59-capture replay stayed 25×80 with zero over-wide rows, bridge
errors, invalid-argument errors, or failure reports. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt389-20260814-fresh/r5/`.

## PT-390: Portuguese newspaper ads expose hard-coded English copy

- Severity: Medium
- Type: Newspaper translation
- Screen: Portuguese stock route → ordinary newspaper/save overlay
- Replay status: **Closed after fixer tests and an independent fresh strict-headless stock replay**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-campaign-terminal3-20260814/150c-wait2-01.json`

### Reproduction

1. Start a fresh stock-cheatless Portuguese campaign through the normal language menu.
2. Advance ordinary days until a newspaper/save overlay renders an ordinary ad.
3. Inspect the visible `#lcs-playtest-buffer` output.

### Actual

The Portuguese overlay renders the English ad fragments `Call for Details` and
`Sale` alongside localized news text. The same capture also shows the ad's
English `and` in an otherwise translated row. These strings are appended
directly in `lib/newspaper/ads.dart` (including the `Call for Details` and
`Sale` branches) instead of going through `LcsI18n`.

### Expected / recommendation

Catalog the ad copy and render the Portuguese equivalents in `pt_BR` while
preserving the English and other-locale text. Add deterministic ad coverage and
an independent strict-headless replay before closing PT-390.

### Fix and verification

`lib/newspaper/ads.dart` now translates every ordinary and Liberal Guardian ad
label through `LcsI18n.tr` before the newspaper renderer's `noTranslate` layout
path. The corresponding English and Portuguese keys were added to the
canonical hash-sharded catalogs. Focused ad and newspaper tests pass, and the
ARB catalog check is clean. Independent verifier session
`verify-pt390-20260814-r1` rendered translated labels including `Mercado de
Pulgas de Paris`, `Oferta`, `50% de Desconto`, `Cadeiras de Couro Fino`, and
`Sedã 4 Portas`. Across 120 captures there were zero raw `Call for Details`,
`Sale`, or `and Fitness` hits, zero over-wide rows, and zero bridge errors. The
separate PT-391 raw `and` remained visible and was not counted against PT-390.
Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt390-20260814/`.

## PT-391: Portuguese squad-action crime lists use hard-coded English `and`

- Severity: Medium
- Type: Newspaper translation
- Screen: Portuguese stock route → CCS/LCS newspaper save overlay
- Replay status: **Closed / Fixed**
- Original evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-campaign-terminal3-20260814/176c-wait2-14.json`
- Independent verification evidence:
  - `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt391-20260814/report.md`
  - `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt391-20260814/pt391-multicrime.json`
  - `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt391-20260814/metrics-all.json`

### Reproduction

1. Start a fresh stock-cheatless Portuguese campaign with an active CCS.
2. Advance ordinary days until a squad-action newspaper story contains at
   least three crimes.
3. Inspect the visible `#lcs-playtest-buffer` output.

### Actual

The Portuguese story renders `em homicídio, violência, roubo and arrombamento
e invasão.`. The crime names are translated, but the list separator remains
the raw English `and`. `lib/newspaper/display_news.dart:493-501` appends
`" and "`/`", and "` directly in `addDrama` without a locale branch.

### Expected / recommendation

Localize the list separator (`e`/`, e`) through the existing i18n path and add
multi-crime Portuguese newspaper regression coverage; the fix and independent
strict-headless replay below satisfy that closure requirement.

### Fix and independent verification

`lib/newspaper/display_news.dart` now translates both list conjunction branches
(`and` and Oxford `, and`) before the newspaper renderer's `noTranslate` layout
path. English fallback and Portuguese catalog entries were added for both
separator fragments. The focused Portuguese context regression and full
context-translation suite pass, and the canonical ARB check is clean. Independent
strict-headless session `verify-pt391-20260814-r2` then replayed a fresh stock
Portuguese campaign with normal CCS/zipper options and three ordinary daily
advances. The four-crime story rendered `sugerem que o CCS se envolveu em
homicídio, violência, roubo e arrombamento e invasão.` with no raw English `and`
or `, and` in the Portuguese-route captures. The canonical capture had 25 rows,
maximum width 80, zero over-wide rows, and an empty bridge-error channel.
Aggregate metrics recorded seven non-empty captures, maximum row width 80, zero
over-wide captures, zero bridge-error captures, and zero raw English conjunction
captures. The route used no cheats, fixtures, debug flags, CDP attach, or
production edits.

## PT-392: Portuguese CCS squad stories expose English spoof-location labels

- Severity: Medium
- Type: Newspaper translation/context
- Screen: Portuguese stock route → CCS newspaper/save overlays
- Replay status: **Closed / Fixed**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/170c-wait2-11.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/176c-wait2-14.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/184c-wait2-18.json`

### Reproduction

1. Start a fresh stock-cheatless Portuguese campaign with an active CCS.
2. Advance ordinary days until a CCS newspaper story is generated at a
   mapped site type.
3. Inspect the visible `#lcs-playtest-buffer` output.

### Actual

Portuguese stories render English spoof-location labels such as `Research
Ethics Commission HQ`, `Labor Union HQ`, and `Public Radio Station` in the
middle of translated prose. `lib/newspaper/squad_story_text.dart:272-293`
hard-codes these `mapCCSPlace` values; they are not generated persisted proper
names and therefore should follow the selected locale.

### Expected / recommendation

Provide locale-aware labels for the CCS spoof locations (or catalog each
mapped value) while preserving the source English names. Add deterministic
coverage for the mapped site table and a fresh strict-headless replay before
closing PT-392.

### Fix

`lib/newspaper/squad_story_text.dart` now routes all nineteen fixed
`mapCCSPlace` spoof-location labels through `LcsI18n.tr`, while leaving the
persisted `placename` fallback untouched. English catalog fallbacks and natural
Portuguese catalog values were added for the complete mapped table, including
`Sede da Comissão de Ética em Pesquisa`, `Sede do Sindicato`, and `Estação de
Rádio Pública`. The focused `test/newspaper/squad_story_translation_test.dart`
regression covers every mapped site type, the runtime/static catalog suites
pass, and canonical ARB validation is clean.

### Independent verification

Fresh strict-headless session `verify-pt392-fresh-20260814` replayed a stock
Portuguese campaign with active CCS and reached translated CCS newspaper
stories containing `Clínica de Aborto`, `Agência de Assistência Social`,
`Escritórios do Greenpeace`, `Estação de Notícias da Rede`, `Sede da Comissão
de Ética em Pesquisa`, and `Museu das Ervilhas Rodopiantes`. All nineteen
fixed English keys were absent from the raw scan. The route produced 436 valid
non-empty captures, all 25×80, with zero over-wide rows and zero bridge-error
captures. No cheats, fixtures, debug flags, CDP attach, or production edits
were used. Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt392-20260814/`.

## PT-393: Portuguese CCS combat exposes the raw role `Soldier`

- Severity: Medium
- Type: Combat translation
- Screen: Portuguese stock route → CCS safehouse → bouncer combat roster and
  hit log
- Replay status: **Closed / Fixed**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-campaign-terminal3-20260814/202c-fight-guard.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/ten-strategies-20260814/stock-campaign-terminal3-20260814/210c-fight-08.json`

### Reproduction

1. Start a fresh stock-cheatless Portuguese campaign with an active CCS and
   enter the normal `Desert Eagle Bar e Grill (Esconderijo CCS)` encounter.
2. Move into the bouncer fight and inspect the roster or hit messages.

### Actual

The Portuguese combat roster and hit log render the encounter role `Soldier`
unchanged, for example `2 Soldier ... M4` and `Soldier atira em Ranma
Gillmouth com Carabina M4!`. `lib/creature/hardcoded_creature_type_stuff.dart:310`
assigns this cover role, and the UI passes it through `LcsI18n.tr`; unlike the
other CCS cover roles, no `Soldier` key exists in the Portuguese catalog.

### Expected / recommendation

Add a Portuguese catalog entry such as `Soldado` and preserve the English
fallback. Add deterministic CCS encounter coverage and a fresh strict-headless
replay before closing PT-393.

### Fix and verification

The canonical English and Portuguese catalogs now cover all seven missing
generated CCS cover roles: `Soldier`, `Transient`, `Crackhead`, `Telemarketer`,
`Mailman`, `Hairstylist`, and `Bartender`. Existing role translations remain
unchanged. The focused
`test/sitemode/ccs_cover_role_translation_test.dart` regression exercises the
complete fixed-role pool through `localizedCreatureNameValue`; the runtime and
static catalog suites plus canonical ARB validation pass. Fresh strict-headless
session `verify-pt393-fresh-20260814-r4` then rendered the bouncer roster as
`Soldado`; all seven formerly missing English role keys had zero raw hits in 21
valid captures. Captures were 25 rows with maximum width 80, zero over-wide
rows, and zero bridge errors. No fixtures, cheats, debug flags, CDP attachment,
or production edits were used. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt393-fresh-20260814-r4/`.
PT-393 is **Closed / Fixed**.

## PT-394: Portuguese CCS bouncer and alarm messages expose hard-coded English text

- Severity: Medium
- Type: Combat translation
- Screen: Portuguese stock route → CCS safehouse → bouncer and alarm messages
- Replay status: **Closed / Fixed**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-broad-20260814-ccs-combat/captures/022-move-1.json`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-broad-20260814-ccs-combat/captures/024-fight-start.json`

### Reproduction

1. Start a fresh stock-cheatless Portuguese campaign with an active CCS and enter the normal `Desert Eagle Bar e Grill (Esconderijo CCS)` encounter.
2. Move into the bouncer encounter and force the alarmed combat branch.

### Actual

The bouncer message rendered `The bouncer assesses your squad.` and the alarm message rendered `{name} observes your Liberal activity and lets forth a piercing Conservative alarm cry!` without Portuguese translation. The sources are `lib/sitemode/map_specials.dart:194` and `lib/sitemode/stealth.dart:52`.

### Fix and verification

Added canonical English fallbacks and Portuguese values (`O segurança avalia seu esquadrão.` and `... solta um grito de alarme Conservador penetrante!`) to the hash-sharded catalogs. The focused runtime regression passed, and fresh strict-headless session `verify-pt394-root-20260814` confirmed both messages with seven valid 25-row captures, maximum width 80, zero over-wide rows, zero bridge errors, and no raw alarm template. Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt394-root-20260814/`. PT-394 is **Closed / Fixed**.

## PT-395: Generated newspaper filler translates arbitrary city proper names

- Severity: Low
- Type: Translation telemetry / proper-name boundary
- Screen: Portuguese newspaper filler stories generated during daily/news cycles
- Replay status: **Closed / Fixed**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt395-20260814/verification-report.md`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt395-20260814/metrics.json`

### Reproduction

1. Initialize a fresh Portuguese runtime.
2. Generate 100 short filler stories through `generateFiller(1)`.
3. Inspect the runtime missing-translation set or logs.

### Actual

`lib/newspaper/filler.dart:6` calls `LcsI18n.tr(randomCityName())` for every
generated city. Most city names are intentional proper-name fallbacks rather
than catalog entries, so the run logs missing translations for names such as
`Kent, WA`, `Anchorage, AK`, `Macon, GA`, and `Wichita, KS`. The visible names
remain unchanged, but this bypasses the proper-name guard fixed by PT-369 and
pollutes Portuguese missing-translation telemetry.

### Expected / recommendation

Use the same catalog-backed boundary as `City.getName()`: translate a city only
when `LcsI18n.hasTranslation` is true, otherwise preserve the proper name
without recording a missing key.

### Fix and independent replay steps

`generateFiller()` now applies that boundary before composing the colorized city
prefix. The focused regression covers 500 deterministic generated-city seeds,
including catalog-backed and uncatalogued names, and asserts that fallback names
do not enter missing-translation telemetry. The regression passes.

Fresh strict-headless Portuguese session `verify-pt395-20260814` on Flutter port
9587 reached newspaper filler pages. `Stamford, CT` rendered as `Stamford,
Connecticut` and `Westminster, CO` rendered as `Westminster, Colorado`; the
uncatalogued `Fayetteville, NC` proper name remained unchanged in the same
route. The focused regression directly checked `LcsI18n.getMissingTranslations()`
for 500 deterministic seeds covering both city categories and passed. The
route produced 161 valid 25-row captures, maximum width 80, zero over-wide
rows, zero bridge errors, and no generated-city warnings in the browser
console. The playtest bridge has no DOM missing-key set; unrelated console
warnings are recorded in the verification metrics. Evidence is under
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt395-20260814/`.
PT-395 is **Closed / Fixed**.

## PT-396: Portuguese site specials expose hard-coded English encounter messages

- Severity: Medium
- Type: Site-mode translation
- Screen: Portuguese site mode → White House, CCS, armory, CEO safe, graffiti,
  corporate files, and safehouse interactions
- Replay status: **Closed / Fixed**
- Evidence: source probe `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-victory-20260814/probe-report.md`; affected call sites in `lib/sitemode/map_specials.dart`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) playtest with a route that enters a site
   containing one of the affected specials.
2. Trigger the special through the normal site-mode interaction.
3. Inspect the encounter message buffer and the Portuguese catalog coverage.

### Actual

Multiple `encounterMessage` literals in `lib/sitemode/map_specials.dart` have
no canonical ARB key and bypass the extractor, so the runtime renders English
in Portuguese. Confirmed examples include the Oval Office (`The President is
in the Oval Office.`), CCS boss states (`The CCS leader is here.`), the armory,
graffiti, CEO/safe loot, corporate files, the conservative blocked door, and
safehouse pickup branches.

### Expected

Every user-visible encounter message must pass through the normal translation
catalog with Portuguese text preserving the game's tone. Add focused runtime
coverage for the affected specials and static catalog coverage so future
`encounterMessage` literals cannot bypass extraction.

### Resolution / Verification

Added canonical `en_US`/`pt_BR` entries for the affected site-special messages,
extended `find_translatable_strings.dart` to extract both quote forms of
`encounterMessage`, and added static/catalog tests covering all affected
literals and Oval Office variants. Independent verification used a fresh
strict-headless Portuguese session and observed width-clean, Portuguese
site/map/alarm buffers with no raw-English leakage; the exact special branches
were not all reached in that bounded route. Focused map/death tests passed
(`+9`). Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt396-397-20260814/verifier.md`.

## PT-397: Portuguese combat death descriptions expose raw English templates

- Severity: Medium
- Type: Combat translation
- Screen: Portuguese site-mode combat → Liberal or enemy death messages
- Replay status: **Closed / Fixed**
- Evidence: source probe `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-victory-20260814/probe-report.md`; affected function `lib/sitemode/fight.dart:addDeathMessage`

### Reproduction

1. Start a fresh Portuguese playtest and enter any ordinary combat encounter.
2. Cause a combatant to die, including lighter-tone and severe/head/body-loss
   branches where possible.
3. Inspect the death-message buffer for raw English prose.

### Actual

`addDeathMessage` sends English templates through `processString` and then
renders them with `noTranslate: true`; the dynamic fragments (`dies.`, `is
dead.`, `is gone.`) and the head/body-loss and severe-death templates are absent
from the canonical catalogs. Portuguese combat therefore exposes raw English
death descriptions even though names and pronouns are localized.

### Expected

Translate the complete death-message templates and dynamic fragments through
the canonical catalogs, retaining the existing tone/no-profanity variants and
fixed-width safety. Add focused tests that exercise lighter-tone, head-loss,
body-loss, severe, and ordinary death branches.

### Resolution / Verification

Added canonical `en_US`/`pt_BR` entries for the lighter-tone fragments and
head/body-loss templates, with focused tests for Portuguese localization,
pronouns, interpolation, and wrapping. Independent verification reached
Portuguese combat and the natural death/game-over branch without raw-English
leakage or width overflow; the individual death fragment was not retained in
the final live buffer because combat redraws replaced it. Focused map/death
tests passed (`+9`). Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt396-397-20260814/verifier.md`.

## PT-398: Constitutional ratification prompts overflow in Portuguese

- Severity: Medium
- Type: Fixed-width layout / constitutional-amendment translation
- Screen: Portuguese month-end constitutional ratification and election
  prompts
- Replay status: **Closed / Not Reproducible**
- Evidence: source probe `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-victory-20260814/probe-report.md` (pending final prober write-up); catalog values in `lib/l10n/app_pt_BR_part17.arb`, `part25.arb`, and `part21.arb`

### Reproduction

1. Start a fresh Portuguese campaign using the normal political route that
   reaches the elite-liberal constitutional-amendment/ratification screens.
2. Trigger the new-elections, Congressional-vote, and State-vote prompts.
3. Inspect the 80-column console buffer for right-edge clipping or overflow.

### Actual

The Portuguese catalog translations exceed the fixed console width when
written through `mvaddstr` at column zero:

- `Press any key to hold new elections! ...` → 81 characters
- `Press any key to watch the Congressional votes unfold. ...` → 83
- `Press any key to watch the State votes unfold. ...` → 91

The source call sites are `lib/politics/constitution.dart:164-168`,
`:420-425`, and `:553-559`. The English source strings fit; the localized
values do not.

### Expected

Every Portuguese constitutional prompt must fit the 80-column console without
clipping or overwriting adjacent UI. Shorten the catalog values or render
through the existing wrapping/layout helper, then add focused width regression
coverage for all three prompts.

### Triage / Resolution

The source probe measured the full catalog values including intentional
trailing alignment spaces, but `Console.addchar` clips only those spaces when
the write reaches column 80. The visible Portuguese sentences are 54, 78, and
77 columns respectively, all within the fixed width; no glyph truncation or
adjacent-row overwrite is reproducible. No source or catalog change is needed.
Closed as a false positive after independent source-level validation on
2026-08-14.

## PT-399: Portuguese disband confirmation paragraphs clip at the console edge

- Severity: Medium
- Type: Fixed-width layout / disband confirmation translation
- Screen: Portuguese Liberal Agenda → Dissolver e esperar confirmation
- Replay status: **Closed / Fixed**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-z-20260815/disband_width_test.dart`

### Reproduction

1. Initialize the Portuguese (`pt_BR`) catalog and an 80-column console.
2. Open the Liberal Agenda and choose the disband-and-wait confirmation path.
3. Inspect the rendered explanatory paragraphs at rows 2, 3, 6, and 7.

### Actual

`_confirmDisband()` in `lib/basemode/liberal_agenda.dart:103-115` writes the
localized paragraphs with `mvaddstr` at column zero and no fitting or wrapping.
The focused disposable harness reproduced silent clipping of visible
Portuguese glyphs: row 3 loses the end of `Você poderá observar`, row 6 loses
the end of `será necessário`, and row 7 loses the end of `reiniciar a campanha.`
Row 2 is 79 cells, while the other affected rows exceed the 80-column console.

### Expected

Every visible Portuguese sentence must retain its complete meaning within the
fixed console. Fit or wrap the paragraphs using the existing width-aware helper
(or shorten only the Portuguese catalog values while preserving tone), and add
a regression that asserts the visible endings remain intact at 80 columns.

### Fix / Verification

Shortened only the affected Portuguese catalog values while preserving the
English fallbacks and tone. The focused regression and the independent strict-
headless Portuguese replay both retained the complete `membros`, `observar`,
`necessário`, and `campanha.` endings at 80 columns with no bridge errors. The
separate replay also confirmed no raw English in the targeted rows. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt399-20260815/ptbr/verifier.md`.

## PT-400: Disband confirmation phrase bypasses Portuguese i18n

- Severity: Medium
- Type: Translation leak / disband confirmation input
- Screen: Portuguese Liberal Agenda → Dissolver e esperar confirmation phrase
- Replay status: **Closed / Fixed**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-z-20260815/pt-400-report.md`, `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-z-20260815/disband_issue_word_test.dart`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) campaign.
2. Open the Liberal Agenda, choose `D - Dissolver e Esperar`, and reach the
   confirmation screen.
3. Inspect the phrase shown on row 15 and compare it with the Portuguese issue
   labels used elsewhere in the UI.

### Actual

`_confirmDisband()` selects one of 22 issue phrases and writes it character by
character with `mvaddchar(15, x, word[x])`, bypassing `LcsI18n`. The independent
 harness rendered all 22 candidates in English even though each has a distinct
 Portuguese catalog value; for example, `Conflict Resolution` remains English
 instead of `Resolução de Conflitos`. Because the player must type the displayed
 phrase, input matching also currently uses the untranslated English codepoints.

### Expected

Render the localized phrase and match the player's keystrokes against that same
localized string, preserving spaces, apostrophes, hyphens, and the confirmation
flow. Add deterministic coverage for all 22 issue keys plus an independent
strict-headless Portuguese replay.

### Fix / Verification

Centralized the 22 confirmation issue keys, localized the selected phrase with
`LcsI18n.tr`, and matched input against that same localized phrase while
preserving separator handling and the English fallback. The focused deterministic
regression covered every key and codepoint, including accented characters. A
separate fresh strict-headless Portuguese replay selected `Cláusula de
Separação`, typed the localized phrase, and advanced to the post-disband screen;
rows stayed within 80 columns with no bridge errors or raw English in the
targeted confirmation text. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt400-20260815/{summary.json,verifier.md,31-disband-confirmation.json,32-type-c.json,33-type-localized-eval.txt,34-after-type.json}`.

## PT-401: Television archive bodies bypass Portuguese newspaper translation

- Severity: Medium
- Type: Newspaper/media translation assembly
- Screen: Portuguese `Visão geral da mídia` → archived Cable News or television story
- Replay status: **Closed / Fixed**
- Evidence: prober `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/probe-newspaper-20260815/prober-report.md`; independent verifier `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt401-20260815/final2/verifier.md`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) campaign and let any television event
   archive normally: Police Brutality, a Cable News anchor, The American
   Dream, New Anchor, or Genius Mutant.
2. Open `M - Visão geral da mídia` and select that archived story.
3. Inspect the article body.

### Actual

`lib/newspaper/television.dart` assigns five complete English body paragraphs
directly to `newsStories[n].body` (lines 27–29, 93–95, 159–161, 196–198, and
233–235). The archive reader then passes the complete stored value to
`addparagraph()` at `lib/basemode/media_overview.dart:212`. No complete body
has a Portuguese catalog entry, so `LcsI18n.processString()` falls back to the
English text and the opened Portuguese article visibly contains raw English.

An independent current-build harness exercised all five body strings through
the same `processString()`/`addparagraph()` path. Representative output rows
were:

```text
A Cable News anchor just accidentally let a Liberal guest finish a sentence. / Many viewers across the nation were listening.
A new show glamorizing the lives of the rich begins airing this week.  With the / nationwide advertising blitz, it's bound to be popular.
A major Cable News channel has hired a slick new anchor for one of its news / shows.  Guided by impressive advertising, America tunes in.
A mutant affected by nuclear power appears on a popular talk show and / demonstrates his superhuman intelligence and charisma, showcasing the upsides / of consuming nuclear waste.
```

The harness passed with maximum visible rows of 75–79 cells, no over-wide
rows, and no bridge/runtime errors. This is a visible translation leak, not
only a missing-translation telemetry event.

### Expected

Archived television articles should render complete Portuguese body text while
retaining the existing satire and fixed-width layout. Translate each body as a
complete template or compose its cataloged fragments before archiving; add a
focused regression covering all five television branches through the article
reader.

### Fix / Verification

Added exact `en_US`/`pt_BR` catalog entries for all five complete television
bodies. The archive keeps raw English so changing locale still works on
existing stories; `addparagraph()` translates at read time. The focused
regression covers all five bodies, Portuguese width safety, raw-English
absence, and exact `en_US` fallback. A fresh strict-headless Portuguese replay
opened `Nova Âncora` and `MUTANTE GÊNIO`; both bodies were complete Portuguese,
25×80, and bridge-error free. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt401-20260815/final2/`.

## PT-402: Supreme Court surveillance vote counts overwrite long Portuguese precedents

- Severity: Medium
- Type: Fixed-width layout / political translation
- Screen: Portuguese month-end → Suprema Corte → Vigilância da Suprema Corte
- Replay status: **Closed / Fixed**
- Evidence: prober `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-z-20260815/174-wait-batch-38.json`; independent verifier `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt402b-20260815/verifier.md`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) stock campaign with a combat-focused
   founder and wait through the first Supreme Court cycle.
2. When `Vigilância da Suprema Corte 2023` appears, advance through the vote
   reveal until the right-side counts are shown.
3. Inspect the 80-column console rows containing long Portuguese precedent
   descriptions.

### Actual

The left precedent text is written from column zero while vote labels are
written at column 63. Long localized values therefore collide with the vote
count instead of being fitted. The fresh replay visibly rendered:

```text
Um novo precedente seria expandir os direitos dos proprietários4 pelo Status Quo
Um novo precedente seria combater comportamento abusivo da polí6 pelo Status Quo
```

The `4` and `6` vote counts overwrite the final Portuguese glyphs/spaces;
the visible sentence is truncated or joined with the right-hand column even
though every captured row remains exactly 80 cells.

### Expected

Fit or ellipsize each localized precedent description to the available
left-column width before writing vote counts at column 63 (or move the counts
to a collision-free row/column). Preserve the complete meaning and tone in
Portuguese, and add a focused regression covering long precedent values and
the two right-side vote labels at 80 columns.

### Fix / Verification

The surveillance renderer now fits localized precedent text into the left
column, reserves a period plus separator, and starts vote labels at column 63.
The focused regression covers long Portuguese precedents and both vote labels.
A fresh stock-cheatless Portuguese replay reached the natural Supreme Court
vote reveal: the period was at column 61, a blank separator at column 62, and
the count at column 63. All captures remained 80 columns with no bridge
errors. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt402b-20260815/`.

## PT-403: Supreme Court justice turnover interpolates English alignment text

- Severity: Medium
- Type: Translation interpolation leak
- Screen: Portuguese month-end → Suprema Corte → troca de juiz
- Replay status: **Closed / Fixed**
- Evidence: discovery `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt402b-20260815/32-supreme-court-votes.json`; independent verifier `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt403-20260815/verifier.md`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) stock campaign and advance to a Supreme
   Court turnover.
2. When `Mudando a Guarda!` appears, inspect the departing-justice and
   replacement-justice messages.

### Actual

The turnover screen mixes English alignment text into Portuguese output:

```text
Conservative Justiça Jennifer Wolfe is stepping down.
```

`lib/politics/supreme_court.dart` passes the raw
`politics.court[j].label` value as the `{label}` parameter to the localized
`{label} Justice ` template, and the trailing `is stepping down.` sentence has
no Portuguese catalog entry. The replacement paragraph similarly interpolates
the raw alignment label into the Portuguese template.

### Expected

Translate dynamic alignment labels before interpolation and localize the
departing-justice sentence. The complete turnover sequence should remain
Portuguese, preserve the existing colors/names, and fit the 80-column console.
Add focused coverage for all five `DeepAlignment` labels and both turnover
sentences.

### Fix / Verification

Translated dynamic alignment labels before interpolation, localized the
departing-justice suffix, and kept generated names out of translation lookup.
The focused regression covers all five alignments, both turnover messages,
color boundaries, and 80-column fit. A fresh stock-cheatless Portuguese route
reached a natural June turnover; every capture was 80 columns with no raw
English alignment/suffix text, overflow, or bridge errors. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt403-20260815/`.

## PT-406: White House combat exposes the raw `Secret Service` role in Portuguese

- Severity: Medium
- Type: Combat translation
- Screen: Portuguese White House infiltration → Secret Service encounter
- Replay status: **Closed / Fixed**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-pt406-whitehouse-police-20260815/`

### Reproduction

1. Start a fresh stock Portuguese (`pt_BR`) campaign with all debug flags
   disabled and choose Washington, DC as the founder city.
2. Form the default five-member founder gang, open `Vá adiante para deter o
   mal`, select `National Mall → Casa Branca`, and execute the visit.
3. Move into the White House metal detector and fight the Secret Service
   encounter until the route reaches the Portuguese combat terminal.

### Actual

The Portuguese White House encounter renders the creature role in English in
both the encounter roster and combat narration. The live buffer shows:

```text
1 Secret Service    Terno preto      M4          160 +
Secret Service POR ENGANO atira em Frank Truman com Pistola 9 mm!
```

The leak recurs in ordinary hit messages (`Secret Service atira ...`,
`Secret Service acerta ...`) and remains in the roster through the final
`CONSERVADORES ALARMADOS` captures. The generic ambush sentence is localized,
but the dynamic creature name is not. The source creature type is
`CREATURE_SECRET_SERVICE` with `<type_name>Secret Service</type_name>` and no
matching `Secret Service` entry exists in the Portuguese ARB catalogs.

The same stock-cheatless route ended naturally at the Portuguese game-over
screen after the squad was killed in combat:

```text
O Esquadrão do Crime Liberal foi morto em combate em Janeiro de 2023.
```

### Expected

Translate the dynamic `Secret Service` creature name before it is rendered in
the encounter roster, combat narration, and any White House site messages
(for example, `Serviço Secreto`). Preserve the existing proper-name fallback
behavior for generated people while adding a focused regression for the role
name in both the roster and combat hit text.

### Verification notes

The fresh route retained 116 captures at document width 1280; every capture
had `maxRow: 80`, zero over-wide rows, and zero bridge errors. No source or
debug state was changed. The raw role was visible in 83 captures, including
the roster and hit log; the terminal itself was fully Portuguese.

### Fix and independent verification

The fixer added exact `Secret Service` catalog entries (`Secret Service` in
`en_US`; `Serviço Secreto` in `pt_BR`) and the focused regression
`test/sitemode/secret_service_role_translation_test.dart`. The focused test,
CCS/context suites, canonical ARB check, and i18n static/runtime catalog
smokes pass. An independent fresh strict-headless replay at current HEAD
`6a14e480` used server `9984` with all debug flags false: capture
`152-detector.json` rendered four `Serviço Secreto` roster entries and
`157-secret-service-hit.json` rendered `Serviço Secreto golpeia Glen Inoue com
Pistola 9 mm!`. Across 128 valid buffers there were zero raw `Secret Service`
occurrences, max row 80, zero over-wide rows, zero bridge errors, and zero
empty buffers. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt406-20260815/`.

## PT-407: liberal level title `Activist` leaks English in Portuguese recruitment screens

- Severity: Medium
- Type: Translation interpolation/display leak
- Screen: Portuguese recruitment meeting and infiltrated-agent assignment
- Replay status: **Closed / Fixed**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt407-20260815/`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) stock campaign and form a recruitment
   meeting with a liberal journalist or other level-2 liberal recruit.
2. Open the recruitment conversation or the infiltrated-agent assignment
   screen and inspect the recruit header beside the name.

### Actual

The otherwise Portuguese header renders the liberal level title in English:

```text
——Soraya Weygand,  Activist——————————————————————~110/110————
```

The leak recurred across 25 captures in the fresh route, including casual
recruitment, join confirmation, and covert-action assignment screens. The
source is `levelTitle()` in `lib/creature/level.dart`, where the liberal title
list contains `"Activist"`; `LcsI18n.tr` has no matching catalog entry.

### Expected

Render the title in Portuguese (for example, `Ativista`) while preserving the
existing level alignment and 80-column layout. Add a focused regression for
the liberal level-2 title and verify recruitment/assignment headers in a
fresh headless Portuguese replay.

### Verification notes

Route #13 was stock-cheatless (`pt_BR`, no cheats, debug state, fixture, save
import, headed browser, or CDP). The route retained 212 captures at width 80
with zero over-wide rows, bridge errors, or bad captures; no other new ticket
was raised. The untranslated title appears in captures such as
`38-journalist-outcome.json`, `82-after-join.json`, and
`96-soraya-assign-menu.json`.

### Fix (verified)

Added the missing canonical `Activist` entry to both locale catalogs, with
`Ativista` as the Portuguese value. `levelTitle(2, Alignment.liberal)` already
routes titles through `LcsI18n.tr`, so no gameplay logic change is required.
Added `test/creature/level_translation_test.dart` to assert both the direct
catalog lookup and the rendered level title under `pt_BR`.

- Independent verification: fresh headless Portuguese replay from commit
  `04b03d146c2e0b1590054c0bb8ca22298765f1ef` using server port `9996` and
  session `verify-pt407-20260815`. The normal journalist recruitment header
  rendered `Ativista` in captures `054-journalist-a-header-jan5.json` through
  `058-ativista-talk-next.json`; no capture contained raw `Activist`.
  Across 60 valid captures, maximum row width was 80, over-wide rows were 0,
  bridge errors were 0, and empty buffers were 0. The focused regression
  `flutter test test/creature/level_translation_test.dart` passed.

## PT-408: Political Activist type name leaks English in Portuguese liberal profiles

- Severity: Medium
- Type: Missing translation / dynamic creature type display
- Screen: Portuguese base mode → Review Liberals → active liberal profile
- Replay status: **Closed / Fixed**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt408-20260815/`

### Reproduction

1. Start a fresh stock Portuguese (`pt_BR`) campaign with cheats, debug state,
   fixtures, and save import disabled.
2. Open `Revisar Ativos e Formar Equipes`, select `Liberais Ativos`, and view
   the founder's profile.
3. Inspect the generated role in the profile heading and assignment screen.

### Actual

The profile is otherwise Portuguese but renders the generated founder role in
English:

```text
Nome: Margaret bin LadenR, Ameaça Socialista (Political Activist)
```

The assignment flow was also exercised, while the raw role remained visible in
the surrounding profile views. The source creature type is
`CREATURE_POLITICALACTIVIST` with `<type_name>Political Activist</type_name>`
in `assets/xml/creatures.xml`; neither locale catalog has an exact
`Political Activist` entry.

### Expected

Render the role in Portuguese (for example, `Ativista Político`) in the full
profile and task-assignment heading, preserving the generated-name fallback
and 80-column layout. Add a focused catalog regression and verify the profile
and assignment screens in a fresh headless replay.

### Verification notes

This was an isolated prober pass on commit `04b03d14` using a fresh Flutter
web-server and session `prober-pt408-20260815`; no source or game state was
injected. The route retained 51 DOM captures, all with 80-column buffers,
zero over-wide rows, zero bridge errors, and zero empty buffers. The raw
`Political Activist` role appeared in captures `32-profile.json`,
`33-profile-more.json`, and `34-profile-assign.json`.

### Fix (verified)

Added the canonical `Political Activist` entry to both locale catalogs, with
`Ativista Político` as the Portuguese value. The existing full-profile render
path already passes creature types through `LcsI18n.tr`, so no gameplay logic
change is required. The task-assignment header uses the liberal's level title
rather than the creature type, so it does not render this type label. Added
`test/creature/political_activist_translation_test.dart` to assert the direct
catalog lookup and the localized profile heading interpolation under `pt_BR`.

- Independent verification: fresh headless Portuguese replay from commit
  `7743f9e086a0d1bf00cf0bc7a03936ca3e2d2acd` using server port `9997` and
  session `verify-pt408-20260815`. The active founder profile rendered
  `Ativista Político` in capture `022-profile.json`; the assignment view and
  activism submenu were exercised in captures `023-assignment-view.json` and
  `024-assignment-activism-options.json` and contained no raw `Political
  Activist` (the assignment header intentionally displays the level title).
  Across 25 valid captures, maximum row width was 80, over-wide rows were 0,
  bridge errors were 0, and empty buffers were 0. The raw `Political Activist`
  scan returned 0 matches, including after Portuguese selection.
- Focused regression: `flutter test
  test/creature/political_activist_translation_test.dart` passed.
- Canonical catalog check: `dart run scripts/maintain_arb_catalogs.dart
  --check --locale=en_US --locale=pt_BR` passed.

## PT-409: Homeless-camp siege briefing concatenates `terá que` with imperative verbs

- Severity: Medium
- Type: Translation/context (split-sentence catalog)
- Screen: Portuguese homeless camp under police attack → `F - Lutar/Fugir`
- Replay status: **Closed after fixer tests and an independent fresh strict-headless Portuguese replay**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy18-victory-20260819/091-siege-briefing.json`
- Fix worktree: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-pt409-wt` (`codex/pt409-siege-briefing` at `b3fc6d56` plus the briefing merge)

### Reproduction

1. Start a fresh stock Portuguese (`pt_BR`) campaign. Cheats, debug flags,
   fixtures, and save imports stay off.
2. Remain at `SEA — Sem-teto` until the safehouse shows `Refúgio Sob Ataque`
   / `Sob Ataque` and the wait row becomes `Não pode esperar até o cerco
   terminar`.
3. Choose `F - Lutar/Fugir` and read the briefing body.

### Actual

The 2026-08-19 stock-cheatless capture at current HEAD `b3fc6d56` is 25×80
with zero over-wide rows and an empty bridge-error channel. Layout is fine;
PT-381 remains closed. The Portuguese body is not grammatical:

```text
                          SOB ATAQUE: ACAMPAMENTO DE SEM-TETO

                Você está prestes a montar uma defesa do acampamento de
                sem-teto.
           O inimigo está esperando resistência, e você terá que
           derrote todos ou fuja para sobreviver a este encontro.
```

`renderHomelessCampSiegeBriefing()` in `lib/daily/siege.dart` translates two
adjacent English fragments independently:

- `The enemy is expecting resistance, and you will have to` → `O inimigo está esperando resistência, e você terá que`
- `defeat them all or run away to survive this encounter.` → `derrote todos ou fuja para sobreviver a este encontro.`

Portuguese `terá que` requires infinitives (`derrotar` / `fugir`), not the
imperatives `derrote` / `fuja`. The nearby warehouse siege key
`you will have to defeat them all or run away to survive this` already uses
`derrotá-los todos ou fugir`. The focused test
`Portuguese homeless-camp briefing wraps every translated line` currently
asserts the split fragments, so it cannot catch this.

### Expected

Render one grammatical sentence, for example `O inimigo está esperando
resistência, e você terá que derrotá-los todos ou fugir para sobreviver a
este encontro.` Prefer merging the two source strings so translators see the
modal and its verbs together. Keep the briefing inside 80 columns. Add a
regression that rejects `terá que derrote` / `terá que fuja`.

### Notes

Stock-cheatless HeadlessChrome session
`playtester-strategy18-victory-20260819` on `http://127.0.0.1:10118/?playtest=1`.
This is not campaign `Ending.victory`; the only documented Elite Liberal
triumph remains the disposable `debugInstantVictory` fixture from 2026-08-13.

### Fix and verification handoff

`renderHomelessCampSiegeBriefing()` now translates one complete English
sentence instead of stitching a modal fragment onto an imperative fragment.
Portuguese catalog value: `O inimigo está esperando resistência, e você terá
que derrotá-los todos ou fugir para sobreviver a este encontro.` The merged
key was added with `scripts/merge_arb_entries.dart` to
`lib/l10n/app_en_US_part08.arb` and `lib/l10n/app_pt_BR_part08.arb`. The old
split keys remain in the catalogs unused. `test/daily/siege_translation_test.dart`
asserts that grammatical sentence, rejects `terá que derrote` / `terá que fuja`,
and still requires every console row to stay within 80 columns.

The fix was implemented in isolated worktree commit
`75e9cfe83c845f8ae97fddb67dc9a6a3c5f11f10` and cherry-picked onto
`feature/localization` as `a6a07fbc`. The playtester checkout and live `10118`
server were not edited.

Focused commands (from the worktree):

```text
dart run scripts/maintain_arb_catalogs.dart --check --locale=en_US --locale=pt_BR
flutter test test/daily/siege_translation_test.dart
```

Replay procedure used for independent verification:

1. Use only worktree
   `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-pt409-wt` on branch
   `codex/pt409-siege-briefing`. Do not start from
   `/home/henry/My_Programming/OpenSourceCopies/lcs-new-age` while it is
   serving the live campaign.
2. Do not attach to `AGENT_BROWSER_SESSION=playtester-strategy18-victory-20260819`
   and do not use port `10118`.
3. Re-run `flutter test test/daily/siege_translation_test.dart` and confirm it
   still rejects `terá que derrote` / `terá que fuja`.
4. Optional live check: from this worktree, `flutter run -d web-server
   --web-hostname 127.0.0.1 --web-port 10121`. Drive it with
   `agent-browser-headless.sh` and a fresh session such as
   `verify-pt409-20260819` (or `fixer-pt409-20260819`). Open
   `http://127.0.0.1:10121/?playtest=1`. Keep debug flags, fixtures, and save
   imports off.
5. Start a stock Portuguese campaign, remain at `SEA — Sem-teto` until
   `Refúgio Sob Ataque` / `Sob Ataque` and the wait row is `Não pode esperar
   até o cerco terminar`, then choose `F - Lutar/Fugir`.
6. Capture `#lcs-playtest-buffer`. The briefing body must contain
   `terá que derrotá-los todos ou fugir` and must not contain
   `terá que derrote` or `terá que fuja`. Rows stay 25×80 with an empty
   bridge-error channel. Title remains `SOB ATAQUE: ACAMPAMENTO DE SEM-TETO`.

### Independent verification

The isolated fix was independently checked from
`75e9cfe83c845f8ae97fddb67dc9a6a3c5f11f10` in worktree
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt409-wt` using fresh
headless Chromium session `verify-pt409-20260820` on `127.0.0.1:10121`.
The Portuguese route reached `F - Lutar/Fugir`; the final DOM buffer had 25
rows, maximum width 80, no over-wide rows, no browser errors, all expected
Portuguese checks true, and no raw English or malformed fragments. Focused
catalog validation, `test/daily/siege_translation_test.dart` (13 tests), and
targeted `flutter analyze` all passed. Temporary `debugSiege` and homeless-base
edits used only to make this random siege screen reachable were restored;
`git diff` and the index are clean and committed values remain
`debugSiege=false` / `SiteType.warehouse`.

Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verification-output-pt409/verification-report.md`,
`briefing-metrics.json`, and `briefing-buffer.txt`.

## PT-410: Recruitment rejection `"No."` leaks English next to translated `<se vira>`

- Severity: Medium
- Type: Missing translation / raw `addstr`
- Screen: Portuguese recruitment (`Aventuras no Recrutamento Liberal`) after
  `A - Puxe conversa sobre política` when the target is not interested
- Replay status: **Closed after fixer tests and an independent verifier**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy19-warehouse-20260819/terminal/54-pitch.json`

### Reproduction

1. Start a fresh stock Portuguese (`pt_BR`) campaign. Cheats, debug flags,
   fixtures, and save imports stay off.
2. Assign the founder to `D - Recrutamento e Aquisição` → `1 - Recrutar`.
3. Wait a day, choose `T - Jornalista`, open a candidate, and pick
   `A - Puxe conversa sobre política`.
4. Advance one screen after `"Quer ouvir algo perturbador?"` if the target
   fails the persuasion / receptiveness check.

### Actual

Stock-cheatless HeadlessChrome capture on 3 January 2023, 25×80, zero
over-wide rows, empty bridge-error channel:

```text
 Elsie Hewson diz,
 "Quer ouvir algo perturbador?"

 Jornalista responde,
 "No." <se vira>
```

The opener and the `{name} responds,` / ` <turns away>` fragments are
Portuguese. The refusal itself is still English `"No."`.

`wannaHearSomethingDisturbing()` in `lib/talk/talk_outside_combat.dart`
already localizes the success reply with `LcsI18n.tr("\"What?\"")`, but the
uninterested branch uses raw `addstr("\"No.\"")`. The catalogs have no
`"No."` entry.

### Expected

Route `"No."` through the same i18n path as `"What?"` (Portuguese `"Não."`).
Keep the trailing ` <turns away>` / ` <se vira>` on one grammatical line
inside 80 columns. Add a focused `pt_BR` regression that rejects a
recruitment buffer containing `"No." <se vira>` and requires `"Não."`.

### Fix and independent verification

The refusal now uses `LcsI18n.tr` with the canonical `"No."` entries in both
locale catalogs. The focused regression renders `"Não." <se vira>` and rejects
the raw English refusal. Independent verification passed the focused test,
112 relevant i18n/layout/recruitment tests, canonical catalog checks,
interpolation checks, `flutter analyze`, formatting, and `git diff --check`.
Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/` (verifier run).

## PT-411: Liberal activity alarm leaks English in Portuguese stealth encounters

- Severity: Medium
- Type: Missing translation
- Screen: Portuguese stealth encounter at an AM radio station when a liberal
  witness notices the Squad
- Replay status: **Closed / Fixed**
- Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy34-victory-20260821/258-radio-door-prompt3.json`

### Reproduction

1. Start a fresh stock Portuguese (`pt_BR`) campaign with cheats, debug flags,
   fixtures, and save imports disabled.
2. Enter the AM radio station and perform a liberal action while an office
   worker is present.
3. Advance the stealth encounter until the witness notices the Squad.

### Actual

The 25×80 Portuguese capture rendered:

```text
Trabalhador de Escritório observes your Liberal activity and shouts for help!
```

`noticeCheck()` in `lib/sitemode/stealth.dart` passes the complete
`{name} observes your Liberal activity and shouts for help!` template through
`LcsI18n`, but the template was absent from both canonical locale catalogs.

### Fix and independent verification

The English source key and Portuguese translation were added through the
hash-sharded ARB merge workflow. Portuguese now renders:
`{name} observa sua atividade Liberal e grita por ajuda!`.
`test/sitemode/ccs_alarm_translation_test.dart` covers the template and
placeholder path. Focused catalog validation and the regression test pass.

Independent fresh strict-headless stock replay `verify-pt411-20260821`
rendered `Trabalhador de Escritório observa sua atividade Liberal e grita por
ajuda!` in `witness-alarm.json`. The 107-capture authoritative window had no
empty buffers, no raw English template hits, no bridge errors, and no rows
over 80 columns. No cheats, debug flags, fixtures, save imports, source edits,
headed browser, or CDP attachment were used. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pt411-20260821/`.

## PT-412: Hostage-manager alarm lines bypass Portuguese i18n

- Severity: Medium
- Type: Missing translation
- Screen: Portuguese nursing-home administrator or insurance CEO hostage
  re-encounter
- Replay status: **Fixed-pending-verify**
- Evidence: `lib/sitemode/map_specials.dart:1470-1484,1650-1658`; regression `test/sitemode/hostage_manager_alarm_translation_test.dart`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) campaign with cheats, debug flags,
   fixtures, and save imports disabled.
2. Free the nursing-home administrator or insurance CEO as a hostage while
   sleeper conversion fails, leaving the conservative former hostage alive.
3. Revisit that character's administrative or insurance office.
4. Advance the encounter until the alarm message appears.

### Actual

The first line is localized through `LcsI18n.processString`, but the nested
`line2` is passed with `noTranslate: true` and has no catalog entry. The
Portuguese screen therefore exposes one of these raw English strings:

```text
"It's them!  They're back!  SECURITY, HELP ME!!!"
"It's them!  They're back!  NURSES, HELP ME!!!"
"It's them!  They're back for me again!  Help!!!"
```

The extractor does not discover these nested literals, and `rg` found no
matching keys in either canonical ARB catalog. The candidate is source-level
confirmed and awaits a fresh strict-headless runtime replay.

### Expected

Route each alarm line through the normal translation path while preserving the
distinct security, nurses, and insurance variants, punctuation, tone, and
80-column console layout. Add focused Portuguese regressions and an
independent headless replay before closing the ticket.

### Fix and verifier handoff

Each nested `line2` now calls `LcsI18n.tr` before `encounterMessage` renders the
already-localized line with `noTranslate: true`. The three canonical entries
were merged into the hash-sharded `en_US` and `pt_BR` catalogs (parts 04 and
31). Portuguese values are:

```text
"São eles! Eles voltaram! SEGURANÇA, AJUDEM-ME!!!"
"São eles! Eles voltaram! ENFERMEIROS, AJUDEM-ME!!!"
"São eles! Voltaram para me pegar de novo! SOCORRO!!!"
```

The focused regression `test/sitemode/hostage_manager_alarm_translation_test.dart`
passes for all three exact source keys. The ticket remains
**Fixed-pending-verify** until an independent fresh strict-headless replay
confirms the live map-special branches.

Verifier replay:

1. Use a rebuilt Flutter web-server checkout containing this fix, a fresh
   `AGENT_BROWSER_SESSION`, and the headless-only harness. Open
   `http://127.0.0.1:<port>/?playtest=1`; do not use a headed browser, CDP,
   cheats, debug flags, fixtures, save imports, or source edits.
2. Start a fresh Portuguese (`pt_BR`) campaign, free the nursing-home
   administrator or insurance CEO as a hostage, and deliberately let sleeper
   conversion fail so the former hostage remains alive and Conservative.
3. Revisit the nursing-home administrative office twice if needed: once at a
   high-security site to exercise `SECURITY`, and once at a normal site to
   exercise `NURSES`. Revisit the insurance CEO's office to exercise the
   insurance-specific line.
4. When each alarm appears, capture `#lcs-playtest-buffer`. Require the exact
   Portuguese lines above, with no raw `It's them`, `SECURITY`, `NURSES`, or
   `Help!!!` fragments. Confirm every capture is non-empty, at most 80 columns,
   and has no bridge/browser errors.

Independent verifier result (2026-08-21): no fresh `10155` artifact was
available. A separate rebuilt Portuguese replay reached the nursing-home map,
completed stock patient-room interactions, and stayed within 80 columns with
no bridge errors, but it did not reach a manager alarm. The fresh status is
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt412-runtime-20260821/114-fresh-status-p412r4.json`.
The `112-session-stalled.json` and `113-map-restart-stalled.json` captures are
explicitly excluded because their tabs were `about:blank` and their buffers
were empty. PT-412 remains **Fixed-pending-verify**.

Independent verifier result (2026-08-23): 16 fresh strict-headless stock
`pt_BR` campaigns reached and unlocked the nursing-home entrance, but none of
their generated explored maps exposed the manager `O` office. Without that
first manager encounter, the required freed-hostage precondition could not be
reached naturally. Integrity passed over 416 captures, but no alarm line was
captured. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pending-20260823/pt412/`.
PT-412 remains **Fixed-pending-verify**.

## PT-413: Insurance-claim terminal interpolates raw English claim labels

- Severity: Medium
- Type: Missing translation / dynamic interpolation
- Screen: Portuguese site mode → insurance claims terminal
- Replay status: **Closed — fixed and independently verified in strict-headless replay on 2026-08-21**
- Evidence: `lib/sitemode/map_specials.dart:1525-1623`; regression
  `test/sitemode/insurance_claim_translation_test.dart`; canonical entries in
  `app_{en_US,pt_BR}_part02.arb`, `part18.arb`, `part19.arb`, `part22.arb`,
  `part25.arb`, and `part32.arb`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) campaign with cheats, debug flags,
   fixtures, and save imports disabled.
2. Reach an insurance claims terminal through the normal site-map route and
   inspect the claim prompt, denial prompt, and successful approval message.
3. Repeat until at least two random claim variants appear; capture the full
   25×80 buffer and check every row for raw English and overflow.

### Actual

`specialInsuranceClaimsTerminal()` selects raw English values such as
`Chemotherapy`, `Missing Documentation`, and `chemo`, then inserts them into
already translated templates with `LcsI18n.processString` and renders the
results with `noTranslate: true`. `LcsI18n` only translates a fixed pronoun
parameter set; arbitrary claim values remain unchanged. The Portuguese
templates themselves exist, so a likely buffer is mixed, for example
`Solicitação: Chemotherapy.` and `Negada: Missing Documentation. Substituir e
aprovar? (Sim ou Não)`. The success line has the same bypass for its short
claim label.

### Expected

Translate the selected claim, denial, and short-label values before
interpolation (or use localized value helpers), then keep the rendered prompt
and approval rows within the 80-column console. Add a focused regression and a
fresh strict-headless route before closing the ticket.

### Fix and verifier handoff

`specialInsuranceClaimsTerminal()` now translates the selected full claim,
denial reason, and short claim label with `LcsI18n.tr` before inserting them
into the prompt and approval templates. The missing dynamic values were added
through the canonical hash-sharded ARB merge workflow; existing catalogued
values continue to use their established Portuguese translations. This keeps
the final `noTranslate: true` renders localized without changing the terminal
flow or random-variant selection.

The focused regression
`test/sitemode/insurance_claim_translation_test.dart` covers all fourteen
claim/short-label variants, all denial reasons, the Portuguese prompt/denial/
approval interpolation, and the source wiring. It also asserts representative
rows stay within 80 columns. The independent fresh strict-headless replay
below closes the ticket after confirming the live map-special branch.

Verifier replay:

1. Use a rebuilt Flutter web-server checkout containing this fix, a fresh
   `AGENT_BROWSER_SESSION`, and the headless-only harness. Open
   `http://127.0.0.1:<port>/?playtest=1`; do not use a headed browser, CDP,
   cheats, debug flags, fixtures, save imports, or source edits.
2. Start a fresh Portuguese (`pt_BR`) campaign and reach an insurance claims
   terminal through the normal site-map route. Keep the run stock: no cheats,
   debug flags, fixtures, save imports, or injected state.
3. Exercise at least two random claim variants, including `Chemotherapy` or
   `Insulin`, and capture the prompt plus denial buffer. Approve one claim and
   capture the successful hacker message; repeat the terminal route as needed
   for another variant.
4. Inspect `#lcs-playtest-buffer` after each render. Require Portuguese
   dynamic labels such as `Solicitação: Quimioterapia.`,
   `Negada: Documentação ausente. Substituir e aprovar? (Sim ou Não)`, and a
   success line ending in `solicitação de quimio.` or its selected equivalent.
   Reject any raw English claim/reason/short label, any empty capture, any row
   over 80 columns, and any bridge or browser error.

Independent verifier result (2026-08-21): a fresh rebuilt headless Portuguese
session reached the live insurance terminal through the normal site-map route.
Captures `116-postfix-prompt-01.json` and `118-postfix-prompt-02.json` show two
localized claim/denial variants; `119-postfix-denial-02.json` records a stock
`N` response that clears the prompt and leaves the terminal map live. A second
fresh server/session then captured `001-approval-prompt.json` with a localized
claim and denial prompt, followed by normal `S` approval in
`002-approval-success.json` (`Alexa Hann aprova a solicitação de dispositivo
auxiliar.`). All five authoritative captures are non-empty, have `maxRow: 80`,
no over-wide rows, no bridge errors, and no known raw-English claim/error
sentinels. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt413-runtime-20260821/` and
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt413-approval-20260821/`.
The stale-server `115-stale-server-baseline.json`, the earlier blank-tab
attempt, and all empty/about:blank captures are excluded. PT-413 is closed
after independent prompt, denial, and approval-success runtime proof.

## PT-414: Display-case prompt interpolates raw English item descriptions

- Severity: Medium
- Type: Missing translation / dynamic interpolation
- Screen: Portuguese site mode → bar, courthouse, or other display case
- Replay status: **Closed — fixed and independently verified in strict-headless replay on 2026-08-21**
- Evidence: `lib/sitemode/map_specials.dart:1831-1871`; regression
  `test/sitemode/display_case_translation_test.dart`; Portuguese item entries
  in the canonical hash-sharded catalogs

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) campaign without cheats, debug flags,
   fixtures, or save imports.
2. Enter a normal site containing a display-case tile and trigger it.
3. Repeat across bar, courthouse, and default site types where possible;
   capture the prompt and verify 25×80 row widths.

### Actual

The `items` lists contain raw English descriptions such as `some neo-Nazi
memorabilia`, `a Confederate flag`, and `a portrait of Ronald Reagan`.
`specialDisplayCase()` inserts the selected value into the translated
`You see a display case containing {item}.` template, but the arbitrary
`item` parameter is not translated. Portuguese therefore renders a mixed line
such as `Você vê uma vitrine contendo some neo-Nazi memorabilia.` even though
standalone catalog entries exist for several of those item strings.

### Expected

Translate the selected display-case item before interpolation and keep the
prompt plus `Smash it? (Yes or No)` action inside the fixed console. Add a
focused regression and a fresh strict-headless map replay before closing.

### Fix and verifier handoff

`specialDisplayCase()` now calls `LcsI18n.tr` for the selected `featuring` item
before inserting it into the translated display-case template. All sixteen
unique bar, courthouse, and default item descriptions already have canonical
English and Portuguese catalog entries, so no duplicate ARB keys were added.
The existing `Smash it? (Yes or No)` action remains on the normal translated
prompt path.

The focused regression
`test/sitemode/display_case_translation_test.dart` covers every item variant,
checks the Portuguese catalog values, renders each item through the translated
template, asserts rows stay within 80 columns, and verifies the source no
longer passes the raw item into interpolation.

Independent verifier replay closed the ticket. A fresh server on port `10165`
and fresh strict-headless Portuguese session `p414courthouse_fresh_20260821/a`
used the ordinary Seattle → Centro de Seattle → Fórum route and triggered a
courthouse display case with the normal `U` action. The live prompt was
`Você vê uma vitrine contendo um retrato de Ronald Reagan.` followed by the
localized `Quebrar isso? (Sim ou Não)` action. A normal `S` response closed the
prompt and removed the `Vitrine` legend. Both captures were non-empty, exactly
80 columns wide, free of raw-English values, over-wide rows, and bridge errors.
No cheats, debug flags, fixtures, save imports, CDP, headed browser, or source
edits were used. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt414-courthouse-retry2-20260821/`.

PT-414 is **Closed — Fixed**.

Historical verifier replay procedure:

1. Use a rebuilt Flutter web-server checkout containing this fix, a fresh
   `AGENT_BROWSER_SESSION`, and the headless-only harness. Open
   `http://127.0.0.1:<port>/?playtest=1`; do not use a headed browser, CDP,
   cheats, debug flags, fixtures, save imports, or source edits.
2. Start a fresh Portuguese (`pt_BR`) campaign and reach a normal bar,
   courthouse, and default site containing display-case tiles through the
   ordinary site-map route. Keep the run stock: no cheats, debug flags,
   fixtures, save imports, or injected state.
3. Trigger a display case on each site type and repeat visits until at least
   one item from each list appears, including a bar item, a courthouse item,
   and the default `some Conservative memoribilia` or `some random pointless
   shit` variant. Capture `#lcs-playtest-buffer` after each prompt.
4. Require Portuguese item descriptions such as `alguns itens de memorabilia
   neonazista`, `uma cópia da Constituição dos EUA`, or `alguma merda aleatória
   sem sentido` inside `Você vê uma vitrine contendo ...`. Reject any raw
   English item description, empty capture, row over 80 columns, or bridge /
   browser error; confirm the translated `Quebrar isso? (Sim ou Não)` action
   remains visible.

## PT-415: Studio broadcast messages leave takeover, issue, and viewer labels in English

- Severity: Medium
- Type: Missing translation / dynamic interpolation
- Screen: Portuguese radio or Cable News studio broadcast
- Replay status: **Closed — fixed and independently verified in strict-headless replay on 2026-08-21**
- Evidence: `lib/sitemode/map_specials.dart:1787-1828` and
  `lib/sitemode/miscactions.dart:387-562`; regression
  `test/sitemode/media_broadcast_translation_test.dart`; canonical entries in
  `app_{en_US,pt_BR}_part01.arb`, `part07.arb`, `part10.arb`, `part14.arb`,
  `part15.arb`, `part18.arb`, `part21.arb`, `part23.arb`, `part26.arb`,
  `part27.arb`, and `part29.arb`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) campaign with cheats, debug flags,
   fixtures, and save imports disabled.
2. Reach a radio or Cable News studio through the normal site-map route and
   accept the broadcast prompt.
3. Capture the takeover, issue, hostage, and high-quality viewer/listener
   messages, checking every row for raw English and width beyond 80 columns.

### Actual

`tvBroadcast()` and `radioBroadcast()` pass raw `camera`/`microphone` and
`viewers`/`listeners` values into `_mediaBroadcast()`. The issue switch also
returns raw English phrases such as `trans rights`, `taxes`, and
`Conservative media bias`. `_mediaBroadcast()` passes these as arbitrary
parameters; its line-2 templates `talks about {issue}.` and
`discuss {issue}.` have no Portuguese catalog keys, while the catalogued line-1
template still substitutes the raw takeover. The top-quality result similarly
uses the raw viewer/listener label in `The Squad leaves {viewer} weeping for
freedom!`.

### Expected

Catalog and translate the complete studio line-1/line-2 templates and all
takeover, issue, and viewer/listener values before rendering. Preserve the
two-line encounter layout within 80 columns, then add focused regressions and
a fresh strict-headless radio/Cable News replay before closing.

### Fix and verifier handoff

`_mediaBroadcast()` now translates the takeover, selected issue, celebrity
hostage issue, and top-quality viewer/listener label before passing them to the
already-rendered encounter templates. The canonical catalogs now include the
radio/TV labels, the ten previously missing issue values, and both missing
line-2 templates. The Portuguese `camera`/`microphone` values carry the
contextual articles (`da câmera`/`do microfone`) so the existing line-1
template renders natural Portuguese for both studio paths.

The focused regression
`test/sitemode/media_broadcast_translation_test.dart` checks every random
studio issue and both radio/TV label paths, renders the line-1, line-2,
hostage, and high-quality messages in Portuguese, checks the source wiring, and
asserts every representative row stays within 80 columns.

Independent verifier retry 3 closed the ticket. A fresh strict-headless stock
Portuguese session reached the AM studio, used the normal `X` autosave and
title-screen `C` resume path (save `lastGameId=4870023`), then accepted the
normal broadcast prompt. The live buffer contained `O Esquadrão assume o
controle do microfone e` followed by `fala sobre energia nuclear.`, with a
non-empty buffer, maximum row width 80, no raw-English values, and no bridge
errors. The live capture proves the shared takeover/issue wiring; the focused
regression covers the TV label plus viewer/listener and hostage variants that
were not claimed by this route. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt415-runtime-20260821/003-am-radio-broadcast.json`.

PT-415 is **Closed — Fixed**.

Historical verifier replay procedure:

1. Use a rebuilt Flutter web-server checkout containing this fix, a fresh
   `AGENT_BROWSER_SESSION`, and the headless-only harness. Open
   `http://127.0.0.1:<port>/?playtest=1`; do not use a headed browser, CDP,
   cheats, debug flags, fixtures, save imports, or source edits.
2. Start a fresh Portuguese (`pt_BR`) campaign and reach both a normal AM
   Radio studio and Cable News studio through their ordinary site-map routes.
   Keep the run stock; if a studio has a live Conservative blocker, use a
   clean studio route rather than altering state.
3. Accept each broadcast prompt and capture `#lcs-playtest-buffer` after the
   takeover and line-2 rows. Repeat the broadcasts until representative random
   issues appear; if a matching celebrity hostage is available, capture its
   forced-on-air line too. Repeat a strong squad/clean route as needed for the
   high-quality viewer/listener result.
4. Require Portuguese output such as `O Esquadrão assume o controle da câmera
   e` followed by `fala sobre impostos.`, `O Esquadrão assume o controle do
   microfone e`, a hostage line ending in `discutir cuidados de saúde.`, and
   `O Esquadrão deixa telespectadores` or `ouvintes` `chorando pela liberdade!`.
   Reject raw `camera`, `microphone`, `viewers`, `listeners`, or English issue
   labels, empty captures, any row over 80 columns, and bridge/browser errors.

## PT-416: Catalogued insurance and bank-vault encounter rows exceed 80 columns

- Severity: Medium
- Type: Fixed-console layout
- Screen: Portuguese insurance safe and First American Bank vault encounters
- Replay status: **Fixed-pending-verify**
- Evidence: `lib/sitemode/map_specials.dart:967-1006,1524-1538,2193-2202`;
  regression `test/sitemode/insurance_vault_layout_test.dart`; Portuguese
  values in `lib/l10n/app_pt_BR_part14.arb:137` and
  `lib/l10n/app_pt_BR_part22.arb:146`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) campaign without cheats, debug flags,
   fixtures, or save imports.
2. Open an insurance safe through the normal site route and capture the
   successful document message.
3. Separately enter the normal First American Bank vault route and capture the
   two-layer requirement message.
4. Measure the rendered rows at the fixed 80-column console boundary.

### Actual

The Portuguese translation of `The squad has found documents detailing the
insurance company's malfeasance.` is 83 cells and is rendered directly by
`encounterMessage` at column 1. The Portuguese translation of `The squad will
need a security expert, a computer ` is also 83 cells and follows the same
unfitted path. The latter vault key was added under PT-363, but its fixed-width
layout risk was not covered there or by another finding.

### Expected

Wrap or fit these encounter rows (preserving the two-line sequence where
applicable) so every Portuguese cell stays within the 80-column console. Add a
focused width regression and fresh strict-headless captures for both routes
before closing.

### Fix and verifier handoff

`encounterMessage()` now has an opt-in `fitToWidth` path that uses the shared
`mvaddstrcFitted()`/`mvaddstrFitted()` console helpers with the available width
from column 1. Overlong localized rows receive the standard visible ellipsis
instead of silently clipping at the buffer edge, while an encounter `line2`
continues to render on its original second message row. The insurance-safe
result and the bank-vault requirements row opt into this path; the surrounding
message tone and two-line sequence are unchanged.

The focused regression
`test/sitemode/insurance_vault_layout_test.dart` asserts the exact Portuguese
catalog values, renders both affected messages through `encounterMessage()`,
checks the fitted first rows and preserved bank-vault second row, and verifies
all rendered rows stay within 80 cells. The ticket remains
**Fixed-pending-verify** until an independent fresh strict-headless replay
confirms both live map-special routes.

Verifier replay:

1. Use a rebuilt Flutter web-server checkout containing this fix, a fresh
   `AGENT_BROWSER_SESSION`, and the headless-only harness. Open
   `http://127.0.0.1:<port>/?playtest=1`; do not use a headed browser, CDP,
   cheats, debug flags, fixtures, save imports, or source edits.
2. Start a fresh Portuguese (`pt_BR`) campaign and reach an insurance safe by
   the ordinary site-map route. Crack it successfully and capture
   `#lcs-playtest-buffer`; require the fitted row to show
   `O esquadrão encontrou documentos que detalham a má conduta da companhia de
   seg…` with no clipped tail or raw English.
3. Reach the First American Bank vault through its normal route and capture
   the second requirements encounter. Require the first row to show
   `A equipe precisará de um especialista em segurança, um especialista em
   informá…` and the unchanged second row `e um dos gerentes do banco.`. Confirm
   the first vault-lock encounter remains in sequence before this requirement.
4. Inspect every `#lcs-playtest-buffer` capture: all rows must be non-empty where
   content is expected, at most 80 columns, with no raw English, bridge error,
   or browser error. Do not touch PT-417 or PT-418 during verification.

Independent verifier result (2026-08-23): a fresh strict-headless stock
`pt_BR` route reached Seattle → Downtown → `Seguros Cruz Azul`, entered
normally, and used the localized unlock path. Reached `$` candidates produced
ground-loot behavior or no safe prompt; no insurance document row was captured,
and the First American Bank vault was not reached. Integrity passed over 97
captures. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pending-20260823/pt416/`.
PT-416 remains **Fixed-pending-verify**.

## PT-417: Bar rejection replies interpolate raw English reactions

- Severity: Medium
- Type: Missing translation / dynamic interpolation
- Screen: Portuguese bar-and-grill entrance rejection
- Replay status: **Closed — fixed and independently verified in strict-headless replay on 2026-08-21**
- Evidence: `lib/sitemode/map_specials.dart:278-340`; regression
  `test/sitemode/bar_rejection_translation_test.dart`; canonical dynamic
  entries in `app_{en_US,pt_BR}_part05.arb`, `part09.arb`, `part10.arb`,
  `part18.arb`, `part26.arb`, `part27.arb`, and `part30.arb`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) campaign without cheats, debug flags,
   fixtures, or save imports.
2. Enter a normal bar-and-grill site with a squad member who fails the ordinary
   dress, nudity, or gender/disguise gate.
3. Repeat rejected entries until a parameterized reply appears; capture the
   full 25×80 buffer and inspect the interpolated reaction.

### Actual

The rejection lists call `LcsI18n.processString` for parameterized replies such
as `Naked? {comment}...`, `{expletive} ... {bodyPart}`, and the trans-person
replies, but pass raw values including `That's hot.`, `[I won't look.]`, `Fuck!`,
`ass`, `[Heavens]`, `Hell`, `idiot`, and `moron`. The i18n formatter only
translates its fixed pronoun parameter set, so these values survive inside the
otherwise translated Portuguese sentence. PT-394 covers separate CCS bouncer
and alarm literals, not these generic rejection interpolations.

### Expected

Translate the reaction, expletive, and body-part values before interpolation
while preserving the tone setting, then verify the final rejection row stays
inside 80 columns. Add a focused regression and fresh strict-headless bar
replay before closing.

### Fix and verifier handoff

The five parameterized rejection maps now call `LcsI18n.tr` for each dynamic
reaction, expletive, and body-part value before `LcsI18n.processString` renders
the translated template. The five previously missing bracketed reaction keys
were added to both canonical catalogs through the ARB merge workflow; existing
entries for `That's hot.`, `Fuck!`, `ass`, `Hell`, `idiot`, and `moron` are
reused. This preserves both profanity and no-profanity branches without
changing the random response pool or entry-gate behavior.

The focused regression `test/sitemode/bar_rejection_translation_test.dart`
checks all eleven dynamic values, renders the naked, trans-person, and body
replies under both tone settings, rejects raw English parameter values, checks
the 80-column bound, and verifies every affected source parameter is translated
before interpolation.

Independent verifier replay closed the ticket. A fresh stock Portuguese
strict-headless session stripped a one-member squad through the normal
equipment screen, entered Desert Eagle Bar e Grill through the ordinary
Seattle route, and triggered the live nude rejection. The rendered line was
`Porra! eu não queria ver seu bunda nu.`, proving the dynamic `Porra!` and
`bunda` values were translated before interpolation. The capture was
non-empty, exactly 80 columns wide, free of raw-English values, over-wide rows,
and bridge errors. No cheats, debug flags, fixtures, save imports, CDP,
headed browser, or source edits were used. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/pt417-runtime-20260821/`.

PT-417 is **Closed — Fixed**. The focused regression provides the broader
trans-person, no-profanity, and body-part variant coverage; the live replay
proves the ordinary nude rejection path.

Verifier replay:

1. Use a rebuilt Flutter web-server checkout containing this fix, a fresh
   `AGENT_BROWSER_SESSION`, and the headless-only harness. Open
   `http://127.0.0.1:<port>/?playtest=1`; do not use a headed browser, CDP,
   cheats, debug flags, fixtures, save imports, or source edits.
2. Start a fresh Portuguese (`pt_BR`) campaign and enter a normal bar-and-grill
   through the ordinary site-map route with a squad member who fails the
   ordinary nudity, dress, or gender/disguise gate. Keep the run stock; do not
   inject rejection state.
3. Repeat rejected entries until the parameterized naked and trans-person
   replies appear. Capture `#lcs-playtest-buffer` after each rejection. Use the
   normal in-game profanity setting for one pass, then toggle the normal
   no-profanity option and repeat so both tone branches are observed.
4. Require translated values such as `Isso é quente.`, `[Não vou olhar.]`,
   `[Eca!]`, `Porra!`, `bunda`, `[Céus]`, `Inferno`, `[filho de Deus]`, and
   `idiota` inside otherwise Portuguese replies. Reject raw `That's hot.`,
   `[I won't look.]`, `Fuck!`, `ass`, `[Heavens]`, `Hell`, `idiot`, `moron`,
   or `fellow child of God`; reject empty captures, rows over 80 columns, and
   bridge/browser errors.

## PT-418: Combat clothing-destruction message bypasses localized armor names

- Severity: Medium
- Type: Missing translation / dynamic interpolation
- Screen: Portuguese site-mode combat after clothing armor is destroyed
- Replay status: **Fixed-pending-verify**
- Evidence: `lib/sitemode/fight.dart:2027-2045`,
  `lib/items/clothing.dart:155`, Portuguese template
  `lib/l10n/app_pt_BR_part16.arb:260`, and regression
  `test/sitemode/clothing_destruction_translation_test.dart`

### Reproduction

1. Start a fresh Portuguese (`pt_BR`) campaign with cheats, debug flags,
   fixtures, and save imports disabled.
2. Enter an ordinary combat encounter wearing a named clothing item and keep
   fighting until the torso or mask armor is destroyed.
3. Capture the destruction message and inspect the clothing name and row width.

### Actual

The source template has Portuguese coverage (`a {clothing} de {name} foi
destruída.`), and other UI paths explicitly call `LcsI18n.tr` for clothing
short names. The combat branch instead passes `cr.clothing.shortName` directly
to `mvaddstrc`, whose formatter does not translate arbitrary parameters. A
Portuguese combat buffer can therefore read `a Black Suit de ... foi destruída.`
even though `Black Suit` has a canonical `Terno preto` entry.

### Expected

Translate the clothing short name before interpolation (and fit the final
combat row to the console), then add a focused regression and a fresh
strict-headless combat replay before closing.

### Fix and verifier handoff

The combat destruction branch now passes `LcsI18n.tr(cr.clothing.shortName)`
into the existing Portuguese template and uses `mvaddstrcFitted` at the
console boundary, so named armor renders as `Terno preto` instead of `Black
Suit` without clipping. The focused regression checks the canonical translation,
the complete Portuguese interpolation, absence of the English clothing name,
the 80-column bound, and the source wiring. It passes in the current worktree;
the ticket remains **Fixed-pending-verify** until a fresh strict-headless combat
replay captures the live destruction message.

Verifier replay:

1. Use a rebuilt Flutter web-server checkout containing this fix, a fresh
   `AGENT_BROWSER_SESSION`, and the headless-only harness. Open
   `http://127.0.0.1:<port>/?playtest=1`; do not use a headed browser, CDP,
   cheats, debug flags, fixtures, save imports, or source edits.
2. Start a fresh Portuguese (`pt_BR`) campaign and enter an ordinary combat
   site with a named clothing item that covers the torso or head. Keep the run
   stock and fight normally until that armor is destroyed.
3. Capture `#lcs-playtest-buffer` immediately after the destruction message.
   Require the clothing name to be Portuguese (for example `Terno preto`),
   with no raw `Black Suit`/other English armor name, no empty capture, no row
   over 80 columns, and no bridge/browser errors.

Independent verifier result (2026-08-23): three unique strict-headless stock
routes (nursing home, corporate headquarters, and a five-member hidden-CCS gang
campaign) fought normally while wearing named `Jaqueta Punk`. Internal doors
were opened through normal prompts and hundreds of combat rounds were captured;
some showed hits to `armadura de couro`, but none reached armor destruction.
Integrity passed over 1,831 captures, with no destruction message or raw English
armor name. Evidence:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-pending-20260823/pt418/`.
PT-418 remains **Fixed-pending-verify**.

## PT-419: Monthly disband footer clips the next-month action

- Severity: Medium
- Type: Fixed-console layout / translation
- Screen: Portuguese disband summary → monthly continuation controls
- Replay status: **Closed — passed independent stock replay on 2026-08-24**
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-a-20260823/layout-repro-test.log`
- Fix verification: focused suite, analyzer, catalog/interpolation checks, and full Flutter suite in `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-layout-batch-a-20260823/`.

Independent verifier result (2026-08-24): a fresh strict-headless `pt_BR`
disband replay at artifact build `a4e874ea` completed the ordinary confirmation
route. Monthly capture
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-layout-batch-b-20260823/captures/760-pt419-monthly.json`
shows both row-24 controls complete and separate, ends with `Próximo Mês`, and
has height 25, maximum width 80, and empty bridge/browser errors.

### Reproduction

1. Initialize `pt_BR`, clear the fixed 25×80 console, and execute
   `addOptionText(24, 54, "Any Other Key", "Any Other Key - Next Month")`.
2. Read console row 24.

### Actual

The localized option is 34 cells wide at column 54. The buffer ends with
`Qualquer Outra Tecla - Pró`; `ximo Mês` is silently discarded. The control no
longer identifies the action that continues to the next month.

### Expected

Fit or reposition the translated footer so both the recreate and next-month
actions remain complete and visually separate at 80 columns. Add a regression
that renders both controls and asserts the full `Próximo Mês` ending.

### Independent stock replay steps

1. Start a fresh Portuguese campaign with the wrapper-only headless harness and
   no debug/fixture assistance.
2. Open the Liberal Agenda, choose disband-and-wait, complete the confirmation,
   and capture the monthly summary row 24.
3. Reject the clipped `R` action with another key and verify the visible label
   ends with `Próximo Mês`, stays within row 24, and does not collide with the
   recreate control.

## PT-420: Disband confirmation prompt clips its final instruction

- Severity: Medium
- Type: Fixed-console layout / translation
- Screen: Portuguese Liberal Agenda → Dissolver e Esperar confirmation
- Replay status: **Closed — passed independent stock replay on 2026-08-24**
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-a-20260823/layout-repro-test.log`
- Fix verification: focused suite, analyzer, catalog/interpolation checks, and full Flutter suite in `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-layout-batch-a-20260823/`.

Independent verifier result (2026-08-24): fresh confirmation capture
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-layout-batch-b-20260823/captures/743-disband-confirm.json`
wraps the prompt onto rows 14–15, ends `repensar):`, preserves the phrase row,
and passes the height/width/error checks without raw English.

### Reproduction

1. Initialize `pt_BR`, clear the console, and render the confirmation prompt
   from `lib/basemode/liberal_agenda.dart` with `mvaddstrc(13, 0, ...)`.
2. Read row 13.

### Actual

The row contains `Digite esta frase Liberal para confirmar (pressione uma letra
errada para repens`. The closing characters `ar):` are discarded. PT-399
bounded the explanatory paragraphs but missed this prompt.

### Expected

Wrap, fit, or shorten the prompt while preserving the instruction and colon.
A focused regression must assert the complete rendered ending.

### Independent stock replay steps

1. Start a fresh stock Portuguese headless campaign.
2. Choose Liberal Agenda → `D - Dissolver e Esperar`.
3. Capture row 13 before typing the confirmation phrase; require it to end with
   `repensar):`, occupy no more than 80 cells, and leave the phrase row intact.

## PT-421: Base-selection prompts lose their final Portuguese words

- Severity: Medium
- Type: Fixed-console layout / equipment transfer
- Screens: Portuguese squad review base picker and equipment base picker
- Replay status: **Closed — passed independent stock replay on 2026-08-24**
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-a-20260823/layout-repro-test.log`
- Fix verification: focused suite, analyzer, catalog/interpolation checks, and full Flutter suite in `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-layout-batch-a-20260823/`.

Independent verifier result (2026-08-24): equipment capture
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-layout-batch-b-20260823/captures/053-equipment-transfer.json`
and review-picker capture
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/verify-layout-batch-b-20260823/captures/534-review-picker-final.json`
both retain the complete localized base instruction through
`selecionar uma base.` at width 80 with no adjacent-row collision or errors.

### Reproduction

1. Initialize `pt_BR` and render the review-mode prompt at row 21/column 0 or
   the equipment prompt at row 22/column 0 using the source literals.
2. Read the fixed console rows.

### Actual

Both 90-cell translations start at column zero and are cut at cell 80. Review
mode ends after `selecionar`; equipment mode also loses the final
`uma base.` The player receives an incomplete instruction on both routes.

### Expected

Use one shared width-safe two-line renderer or shortened catalog copy so both
prompts retain `selecionar uma base.` Add regressions covering review and
equipment transfer at 80 columns.

### Independent stock replay steps

1. In a fresh Portuguese headless campaign, open review mode and reach the
   move/base picker with more than one base available; capture its footer.
2. Return to base mode, open equipment transfer, and reach the equivalent base
   picker; capture its footer.
3. Require both visible prompts to end with `selecionar uma base.` without
   overwriting adjacent rows or exceeding column 79.

## PT-422: Siege warnings clip raid and escape instructions

- Severity: Medium
- Type: Fixed-console layout / siege briefing
- Screens: Portuguese police death-squad warning, corporate raid warning, and post-siege escape prompt
- Replay status: **Fixed-pending-verify on 2026-08-24; natural siege branches not reached**
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-a-20260823/layout-repro-test.log`
- Fix verification: focused suite, analyzer, catalog/interpolation checks, and full Flutter suite in `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-layout-batch-a-20260823/`.

Independent verifier result (2026-08-24): no fresh police-death-squad,
corporate-raid-countdown, or completed-siege-escape branch was reached during
stock routes, so the ticket remains pending and was not closed.

### Reproduction

Initialize `pt_BR` and render each source literal through its original wrapper
and coordinates:

1. death-squad warning at row 10/column 1;
2. anonymous corporate warning at row 8/column 1;
3. split-up-and-lay-low prompt at row 13/column 11.

### Actual

The death-squad warning loses its final period. The 104-cell corporate warning
loses roughly 25 cells of important raid context. The escape prompt ends at
`alguns` and loses ` dias`. All three writes are unbounded even though each
fixed buffer remains exactly 80 cells wide.

### Expected

Wrap these warnings within the available briefing area (or provide complete
two-line compositions) without losing the final qualification or instruction.
Cover all three branches with deterministic width tests and fresh siege-route
captures.

### Independent stock replay steps

1. Use fresh stock Portuguese routes for a police raid with Death Squads
   enabled, an anonymous corporate raid countdown, and a completed siege
   escape; do not inject siege state for the confirmation captures.
2. Capture the full buffer immediately after each warning/prompt appears.
3. Require the lethal-force sentence to end with a period, the corporate tip to
   retain its complete LCS clause, and the escape prompt to end with ` dias`.

## PT-423: Cable News anchor overlay loses the right border

- Severity: Low
- Type: Fixed-console newspaper layout
- Screen: Portuguese television news → `NEW ANCHOR` overlay
- Replay status: **Fixed-pending-verify on 2026-08-24; anchor event not reached**
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-a-20260823/layout-repro-test.log`
- Fix verification: focused suite, analyzer, catalog/interpolation checks, and full Flutter suite in `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-layout-batch-a-20260823/`.

Independent verifier result (2026-08-24): 168 months of ordinary disband
progression were polled through the strict-headless bridge after each monthly
key. No conservative Cable News `NEW ANCHOR` event appeared; without fixtures
the overlay remains unverifiable and the ticket remains pending.

### Reproduction

1. Initialize `pt_BR`.
2. Render the translated top box line from `lib/newspaper/television.dart` with
   `mvaddstr(20, 13, ...)`.
3. Inspect row 20 between columns 13 and 79.

### Actual

The Portuguese boxed line is 68 cells wide. Starting at column 13 requires 81
cells, so the final right-border pipe is discarded. The observed row ends
`sofisticado` with no closing border, breaking the four-line overlay frame.

### Expected

Keep every translated overlay line inside the drawn box by fitting the prose
cell or shortening only the Portuguese value. Preserve matching left/right
borders and add coverage for all five television overlay variants.

### Independent stock replay steps

1. Run a fresh stock Portuguese campaign until a conservative Cable News view
   produces `NEW ANCHOR`; use ordinary monthly/news progression, not fixtures.
2. Capture the television overlay before acknowledging it.
3. Require rows 19–23 to have matching box borders, no raw English body text,
   and no write beyond cell 79.

## PT-424: Homeless relocation note clips its closing punctuation

- Severity: Low
- Type: Fixed-console dialogue layout
- Screen: Portuguese conversation → possessions moved to homeless camp
- Replay status: **Fixed-pending-verify on 2026-08-24; relocation note not reached**
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-a-20260823/layout-repro-test.log`
- Fix verification: focused suite, analyzer, catalog/interpolation checks, and full Flutter suite in `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-layout-batch-a-20260823/`.

Independent verifier result (2026-08-24): an ordinary apartment route reached
the landlord area, but locked offices, forced-entry alarms, civilian encounters,
and blocked access to the landlord special prevented the normal rent/cancel
branch from rendering the relocation note. The ticket remains pending.

### Reproduction

Initialize `pt_BR` and render the translated possession note from
`lib/talk/talk_outside_combat.dart` with `mvaddstrc(15, 1, white, ...)`.

### Actual

The 82-cell note starts at column 1. The visible line ends
`...moradores de ru`; the final `a.>` is discarded. The sentence and delimiters
are incomplete.

### Expected

Wrap the note onto two dialogue rows or shorten it without changing meaning.
Assert the complete `de rua.>` ending in a fixed-width regression.

### Independent stock replay steps

1. In a fresh stock Portuguese route, trigger the normal conversation branch
   that clears a room and moves possessions to the homeless camp.
2. Capture dialogue row 15 immediately after it renders.
3. Require `<Seus pertences...de rua.>` to be complete and width-safe.

## PT-425: Conservative interruption footers clip the final period

- Severity: Low
- Type: Fixed-console launch layout
- Screen: Portuguese conservative interruption → continue/restart footer
- Replay status: **Fixed-pending-verify on 2026-08-24; interruption screen not reached**
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-a-20260823/layout-repro-test.log`
- Fix verification: focused suite, analyzer, catalog/interpolation checks, and full Flutter suite in `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-layout-batch-a-20260823/`.

Independent verifier result (2026-08-24): no natural Conservative interruption
or error screen occurred in stock runs, so neither footer has fresh runtime
evidence. The ticket remains pending.

### Reproduction

Initialize `pt_BR` and render either continue/restart literal from
`lib/title_screen/launch_game.dart` at row 24/column 0.

### Actual

Both localized footers are 82 cells wide. Row 24 retains the meaningful words
but discards the final period because the write needs 82 cells from column 0.

### Expected

Shorten the two catalog values or wrap them so sentence punctuation is visible.
Add a regression covering both continue and restart branches.

### Independent stock replay steps

1. Reach the conservative-interruption sequence in a fresh Portuguese campaign
   once while a resumable save exists and once without one.
2. Capture row 24 for both continue and restart footers.
3. Require each visible footer to end with a period and stay within column 79.

## PT-426: Portuguese recruitment failure feedback is missing from the runtime buffer

- Severity: Medium
- Type: Missing translation/layout / daily-activity rendering
- Screen: Portuguese Assign Tasks → Recruit → “asks around” result
- Replay status: **Fixed-pending-verify on 2026-08-24; zero-result branch not reached naturally**
- Evidence:
  `lib/daily/activities/recruiting.dart:50-60`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy57-fresh-current-20260823/captures/569-select-recruit-empty.json`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy57-fresh-current-20260823/captures/570-choose-student-empty.json`,
  and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy57-fresh-current-20260823/captures/571-resolve-recruit-empty.json`

### Fix verification

Investigation found that a rounded recruiting count below zero bypassed the
`== 0` guard and could enter the multi-candidate flow before feedback. The
failure branch now accepts every count below one, renders through the fitted
console helper, bounds an unusually long recruiter name against the localized
remainder, and still requires a second key before returning. The canonical
PT-BR template already existed, so no ARB changes were needed.

Red/green evidence is in
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-pt426-20260823/test-red3.log`
and `test-green2.log`. Analyzer, catalog, interpolation, focused layout/i18n,
and full-suite evidence is in the same `fix-pt426-20260823` directory; the full
suite completed with 714 passing tests.

### Reproduction

1. Serve commit `e682cadd` from `http://127.0.0.1:10257/?playtest=1` in strict
   headless session `str57-a`.
2. Start a stock `pt_BR` campaign, assign Kim Aguilera to ordinary recruiting,
   wait a day, select `Estudante Universitário`, and advance past the “Kim
   Aguilera pergunta por aí…” screen.

### Actual

The next screen returns directly to the base. Row 11, where the source writes
either “was unable to track down” or the successful meeting result, is blank.
The player receives no failure/success feedback between the asking screen and
the base. The successful multi-candidate branch was separately observed, so
this repro is specifically the zero-result branch.

### Expected

Render the localized zero-result sentence (or an equivalent nonempty result
screen) on row 11 before another key is required. The final row must stay
within 80 columns and contain no raw English.

### Verifier replay

1. Repeat the route above with a rebuilt checkout containing the fix and a new
   strict-headless session.
2. Allow one event-loop turn after the key that resolves the asking screen so
   the injected-key bridge can publish the resumed Dart render.
3. Require row 11 to be nonempty and Portuguese when recruitment finds nobody;
   require the complete localized sentence to end with a period, buffer height
   25, maximum width 80, and empty bridge/browser errors.

Independent verifier result (2026-08-24): repeated ordinary recruiting routes
used Engineer, Locksmith, and Sculptor candidates across fresh campaigns. Every
resolved ask produced one or more candidates rather than the zero-result branch;
localized candidate/meeting feedback remained nonempty. Without fixtures or a
natural zero-result event, closure remains blocked.

## PT-427: Strategy54 web autosave had no IndexedDB save store

- Severity: High
- Type: Blocking playtest infrastructure — **not translation/layout scope**
- Screen: Web title autosave/reload persistence
- Replay status: **Closed — not reproducible at HEAD e682cadd**
- Evidence:
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy54-persistent-victory-20260822/tickets/PT-STR54-002-web-autosave-indexeddb-store-missing.md`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy54-persistent-victory-20260822/captures/3428-recovery-storage-metadata.json`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy57-fresh-current-20260823/captures/032-checkpoint01-metadata.json`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy57-fresh-current-20260823/captures/035-checkpoint01-durable-metadata.json`,
  and `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/playtester-strategy57-fresh-current-20260823/captures/036-checkpoint01-durable-restored.json`

### Reconciled reproduction

On the older Strategy54 live build, lowercase `x` set `flutter.lastGameId` in
memory but recovery after the tab had reached `about:blank` found only the
migration flag; `lcs_new_age` had zero object stores and IndexedDB had no save
key. Same-session `c` therefore could not prove restart durability.

### Current verification

A fresh campaign on current HEAD produced gameId `9147028`, created the
`saves` store, and stored key `9147028`. A full same-tab reload returned to the
Portuguese title with the same metadata; lowercase `c` restored the same base,
date, and roster. This closes the old Strategy54 infrastructure blocker for
HEAD, but it does not retroactively recover the lost Strategy54 run.

### Verifier replay

1. Start a fresh stock `pt_BR` campaign in a new strict-headless session.
2. Return to the title with lowercase `x`; require `flutter.lastGameId` to be
   non-null, `lcs_new_age/saves` to contain that key, and language to be
   `"pt_BR"`.
3. Reload the same URL without restoring browser state; require those values
   to remain identical.
4. Press lowercase `c`; require the founder, base, date, and active-roster
   counts shown immediately before `x` to be restored.

## PT-428: Portuguese profile keeps a carrying-hostage clause in English

- Severity: Medium
- Type: Missing translation / generated-profile rendering
- Screen: Portuguese regular or sleeper profile → carrying a hostage/body
- Replay status: **Fixed-pending-verify on 2026-08-24** (previously confirmed by deterministic console test on 2026-08-23); original: **Confirmed by deterministic console test on 2026-08-23**
- Fix evidence: `lib/common_display/print_creature_info.dart`, `lib/l10n/app_en_US_part18.arb`, `lib/l10n/app_pt_BR_part18.arb`, and `test/localization_layout_batch_b_regression_test.dart` (“carrying-hostage profile clause is fully Portuguese”); logs: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fix-layout-batch-b-20260823/red-focused.log` and `green-focused.log`.
- Evidence:
  `lib/common_display/print_creature_info.dart:75-84`,
  `lib/l10n/app_pt_BR_part10.arb:24-26`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-b-20260823/red-test.log`

### Reproduction

1. Initialize `pt_BR` and load the stock data tables.
2. Create a liberal profile whose `prisoner` is another creature.
3. Call `printCreatureInfo` and inspect row 1.

### Actual

The observed profile begins
`Alex Roe, Civil, holding Jamie Doe,`. The PT catalog value for
`, {holding} {hostage}` is nearly identical to English and merely moves the
comma after the hostage name, while `holding` remains an untranslated literal
parameter.

### Expected

Render the carrying clause as Portuguese for every profile variant, without
raw English and with punctuation attached to the localized sentence.

### Independent stock replay steps

1. In a fresh stock Portuguese campaign, take a prisoner during a normal site
   action and open either the carrier's regular or sleeper profile.
2. Capture row 1 while the carrier is holding the body.
3. Require no `holding` text, a localized hostage/body label, and complete
   punctuation within the fixed profile delimiter.

## PT-429: Ballot-measure results expose English Yes/No parameters

- Severity: Medium
- Type: Direct interpolated parameter / election translation
- Screen: Portuguese November elections → ballot measures → vote results
- Replay status: **Fixed-pending-verify on 2026-08-24** (previously confirmed by deterministic template test on 2026-08-23); original: **Confirmed by deterministic template test on 2026-08-23**
- Fix evidence: `lib/politics/elections.dart`, canonical Yes/No templates in en_US/pt_BR catalogs, and the ballot template regression in `test/localization_layout_batch_b_regression_test.dart`; placeholder parity is preserved (`Sim: {yesPercent}%`, `Não: {noPercent}%`).
- Evidence:
  `lib/politics/elections.dart:408-441`,
  `lib/l10n/app_pt_BR_part04.arb:244-246`,
  `lib/l10n/app_pt_BR_part30.arb:229-231`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-b-20260823/red-test.log`

### Reproduction

Initialize `pt_BR` and process the two ballot templates exactly as the source
does, passing literal `"Yes"` and `"No"` parameter values.

### Actual

The yes row renders `50.0% a favor (Yes)` and the no row renders
`49.9% contra No`. The translated shells add redundant qualifiers around raw
English labels instead of localizing those values.

### Expected

Show natural Portuguese result labels with no raw `Yes` or `No`; remove the
redundant parenthetical/duplicated qualifier or make it grammatically useful.

### Independent stock replay steps

1. Advance a fresh Portuguese campaign to any November election and wait for
   ballot-measure totals.
2. Capture rows containing the final yes/no percentages before acknowledging.
3. Require Portuguese labels only, with no `(Yes)`, `Yes`, or trailing `No`.

## PT-430: Trial self-defense verdict interpolates English reflexive pronouns

- Severity: Medium
- Type: Direct pronoun interpolation / court translation
- Screen: Portuguese courthouse trial → self-defense persuasion outcome
- Replay status: **Fixed-pending-verify on 2026-08-24** (previously confirmed by deterministic template test on 2026-08-23); original: **Confirmed by deterministic template test on 2026-08-23**
- Fix evidence: Central reflexive-parameter recognition in `lib/i18n/i18n.dart`, nonbinary catalog entry in `lib/l10n/app_pt_BR_part02.arb`, and male/female/nonbinary regression in `test/localization_layout_batch_b_regression_test.dart`.
- Evidence:
  `lib/justice/trial.dart:476-494`,
  `lib/i18n/i18n.dart:44-60 and 337-365`,
  `lib/l10n/app_pt_BR_part08.arb:214-216`,
  `lib/l10n/app_pt_BR_part15.arb:162-164`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-b-20260823/red-test.log`

### Reproduction

Initialize `pt_BR`, create a male defendant, and render
`{name} just looks {pronoun} guilty.` with `pronoun` set directly from
`gender.himselfHerself`.

### Actual

The sentence renders `Alex Roe parece culpado até para himself.` The generic
parameter translator does not recognize `pronoun`; unlike nearby possessive
use in the same file, the reflexive value is never passed through
`LcsI18n.translatePronoun`. Nonbinary defendants additionally lack a
`themselves` PT catalog entry.

### Expected

Translate reflexive pronouns by role and gender, including male, female, and
nonbinary forms, so no English reflexive remains in the verdict.

### Independent stock replay steps

1. Reach a courthouse trial where the defendant chooses self-defense rather
   than a lawyer in a fresh Portuguese campaign.
2. Capture the self-defense outcome at row 10 for defendants of each gender.
3. Require localized reflexive wording and no `himself`, `herself`, or
   `themselves`.

## PT-431: Dating vacation options lose their closing punctuation

- Severity: Low
- Type: Fixed-console option layout
- Screen: Portuguese dating → vacation choices C
- Replay status: **Fixed-pending-verify on 2026-08-24** (previously confirmed by deterministic console test on 2026-08-23); original: **Confirmed by deterministic console test on 2026-08-23**
- Fix evidence: Shortened PT vacation templates plus shared `addOptionTextFitted`; all three branches are covered with period-ending and <=80-cell assertions in `test/localization_layout_batch_b_regression_test.dart`.
- Evidence:
  `lib/daily/dating.dart:382-404`,
  `lib/l10n/app_pt_BR_part05.arb:55-57`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-b-20260823/red-test.log`

### Reproduction

Initialize `pt_BR` and render either same-city vacation template through
`addOptionText(13 or 14, 0, "C", ...)` with the stock price `1000`.

### Actual

The first visible row ends `(cancela outros encontros)` and discards its final
period. The injured variant is 85 cells wide and loses the final `).`. Both
writes begin at column 0 in an 80-cell console.

### Expected

Keep both complete option labels inside columns 0–79, including their closing
punctuation, by shortening the PT values or wrapping/fitting safely.

### Independent stock replay steps

1. Start a Portuguese dating activity with at least US$ 1,000.
2. Capture option rows 13 and 14, including the uninjured branch.
3. Require each visible C option to end with a period and stay within column
   79.

## PT-432: Media article impact grid overwrites adjacent columns

- Severity: Medium
- Type: Fixed-console newspaper layout
- Screen: Portuguese media overview → article detail → public-opinion effects
- Replay status: **Fixed-pending-verify on 2026-08-24** (previously confirmed by deterministic console test on 2026-08-23); original: **Confirmed by deterministic console test on 2026-08-23**
- Fix evidence: Width-measured impact flow rendering in `lib/basemode/media_overview.dart`; three-effect collision regression asserts separated rows, complete signs/values/percents, and <=80 cells.
- Evidence:
  `lib/basemode/media_overview.dart:210-238` and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-b-20260823/media-red.log`

### Reproduction

Initialize `pt_BR`, create an article with effects for Free Speech, Police
Behavior, and LCS Known, call `readNewsStory`, and inspect effect row 5.

### Actual

All three impacts run together:
`Liberdade de Expressão: -Comportamento Policial: -Conhecimento do LCS: +3.5%`.
The first two labels exceed their nominal 26-column slots, so each later
`mvaddstrx` overwrites the previous value; the third write also reaches the
right-edge clipping boundary.

### Expected

Fit each localized label/value pair within its fixed grid cell (or use a safe
wrapped layout), preserving separators, signs, values, and percent signs
without cross-column collisions.

### Independent stock replay steps

1. Open article details from a fresh Portuguese media archive until the story
   includes several long issue labels.
2. Capture the effect grid immediately after the body renders.
3. Require distinct columns, readable sign/value pairs for every effect, no
   overwritten labels, and no write past column 79.

## PT-433: Title universal-score counts overwrite the frame border

- Severity: Low
- Type: Fixed-console title layout / unbounded stat write
- Screen: Portuguese title screen → universal Liberal statistics
- Replay status: **Fixed-pending-verify on 2026-08-24** (previously confirmed by deterministic console test on 2026-08-23); original: **Confirmed by deterministic console test on 2026-08-23**
- Fix evidence: Repositioned title stats at `titleStatsRightColumnX` and compacted PT labels; five-digit regression checks complete counts and empty frame cells 78–79 in `test/localization_layout_batch_b_regression_test.dart`.
- Evidence:
  `lib/title_screen/title_screen.dart:524-550` and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-b-20260823/red-test.log`

### Reproduction

Draw the title frame, initialize `pt_BR`, set right-column counts such as
American losses/saved to `10000`, and call `titleScreenScores(startY: 17)`.

### Actual

The five-digit values extend beyond the fixed frame: cell 78 on affected rows
contains the final count digit rather than the border space, and the rendered
count is clipped at the console edge.

### Expected

Fit or compact localized score labels/values within the available right-hand
region while preserving the title frame at columns 78–79.

### Independent stock replay steps

1. Load a durable Portuguese campaign with at least 10,000 losses and saved
   Americans, or use a save prepared through ordinary long-run progression.
2. Display the title screen and capture universal-stat rows 18–19.
3. Require complete counts, no overwritten frame glyphs, and maximum width 80.

## PT-434: Custom high-score slogans are written without width bounds

- Severity: Low
- Type: Fixed-console high-score layout
- Screen: Portuguese game-over/high scores → custom squad slogan
- Replay status: **Fixed-pending-verify on 2026-08-24** (previously confirmed by deterministic runtime test on 2026-08-23); original: **Confirmed by deterministic runtime test on 2026-08-23**
- Fix evidence: Bounded slogan rendering via `fitConsoleText` in `lib/title_screen/high_scores.dart`; explicit ellipsis/custom-slogan and intact built-in-slogan regressions are in `test/title_screen/high_scores_layout_test.dart`.
- Evidence:
  `lib/title_screen/high_scores.dart:205-210` and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-b-20260823/red-test.log`

### Reproduction

Save a high score whose custom slogan exceeds 80 cells, initialize `pt_BR`,
and call `viewHighScores`.

### Actual

Row 2 silently truncates after 79 visible characters with no ellipsis. The
slogan write is unbounded even though neighboring ending lines already use the
fitted renderer.

### Expected

Bound custom slogans to the console row with explicit ellipsis or wrap them
without colliding with following score rows; built-in localized slogans should
remain intact.

### Independent stock replay steps

1. In a fresh Portuguese campaign, use the normal slogan editor to enter a
   phrase longer than 80 cells, then trigger any game-over ending naturally.
2. Capture the high-score slogan row immediately after the screen opens.
3. Require the visible slogan to be deliberately bounded with an ellipsis (or
   occupy reserved wrapped rows) and remain within columns 0–79.

## PT-435: Presidential nominees expose untranslated alignment shorthand

- Severity: Medium
- Type: Dynamic parameter / election composition
- Screen: Portuguese November presidential election → nominee list
- Replay status: **Confirmed by deterministic template capture on 2026-08-24**
- Evidence:
  `lib/politics/elections.dart:193-199`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/red-capture.log`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/scoped-untranslated-candidates.json`

### Reproduction

1. Initialize `pt_BR`.
2. Render the candidate shell exactly as the election loop does with
   `{name}` set to a generated nominee and `{align}` set from
   `DeepAlignment.liberal.veryShort`.

### Actual

The row renders `Alex Roe,  L `. The PT value contains two separator spaces,
and every alignment remains an English-style grid token (`L `, `m `, `C `,
or `C+`) instead of a localized political label.

### Expected

Use one comma-space separator and a full Portuguese alignment description (or
another locale-appropriate candidate qualifier) for each alignment.

### Independent stock replay steps

1. In a fresh stock Portuguese campaign, advance normally to a November in a
   year divisible by four.
2. Capture the three presidential-nominee rows before acknowledging the
   election prompt.
3. Require no double separator spaces and no raw `L`, `m`, `C`, or `C+`
   alignment tokens in the candidate prose.

## PT-436: Save import picker title remains English

- Severity: Medium
- Type: Missing translation / native platform dialog
- Screen: Portuguese title → import save → desktop file picker
- Replay status: **Confirmed by source/catalog audit on 2026-08-24**
- Evidence:
  `lib/saveload/save_load.dart:418-424`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/scoped-dry-run.log`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/scoped-untranslated-candidates.json`

### Reproduction

Initialize `pt_BR` and inspect the literal passed to
`FilePicker.platform.pickFiles(dialogTitle:)`.

### Actual

The literal is `Select an LCS: New Age Save File`; it has neither an English
canonical entry nor a Portuguese catalog entry. On Windows/Linux desktops this
raw English becomes the modal picker title while the surrounding game is
Portuguese.

### Expected

Pass the dialog title through the locale boundary so supported desktop platforms
render natural Portuguese such as `Selecionar um arquivo de salvamento do LCS:
New Age`. Where a platform ignores titles, retain the translated call boundary.

### Independent stock replay steps

1. Run a Portuguese-capable desktop build (not web) at current HEAD.
2. Select `I - Importar um salvamento` and observe the OS file-picker title.
3. Require Portuguese wording and reject the exact English source title.
   Browser-only verification is insufficient because file-picker titles are
   platform-dependent.

## PT-437: Save-import errors clip without a width-safe renderer

- Severity: Low
- Type: Fixed-console error layout / diagnostics
- Screen: Portuguese title → import save → malformed save error
- Replay status: **Confirmed by deterministic runtime test on 2026-08-24**
- Evidence:
  `lib/saveload/save_load.dart:437-445`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/save-import-error-probe.log`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/tests/save_import_error_probe_tmp_test.dart`

### Reproduction

Initialize `pt_BR`, invoke `importSave` with a JSON array file (not a save
object), acknowledge the result screen, then inspect console row 1.

### Actual

The rendered diagnostic exceeds one row and is silently cut at column 79. In the
probe it ends `... subtype of type 'Map'` with no ellipsis or continuation,
hiding the rest of the type error directly above action rows 3–4.

### Expected

Wrap the complete diagnostic across reserved rows or fit it with an explicit
ellipsis while keeping action options visible; preserve as much actionable
detail as possible within 25×80.

### Independent stock replay steps

1. In a fresh Portuguese session, choose normal save import and select a valid
   JSON file whose top-level value is an array rather than a save object.
2. Capture console row 1 immediately after the error screen opens.
3. Require deliberate wrapping or an explicit ellipsis, no collision with rows
   3–4, and no silent loss of the final clause.

## PT-438: Narrow map editor overflows palette and status widgets

- Severity: Medium
- Type: Flutter widget layout / modding tools
- Screen: Portuguese map editor at narrow viewport → palette, hover/status, preview
- Replay status: **Confirmed by deterministic widget tests on 2026-08-24**
- Evidence:
  `lib/map_editor/map_editor_screen.dart:483-516`,
  `lib/map_editor/tile_palette.dart:120-145 and 267-292`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/map-status-probe.log`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/map-validation-probe.log`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/tests/map_status_probe_tmp_test.dart`
- Shortcut note: the public title route requires the development map-editor
  flag; the canonical evidence calls the public `MapEditorScreen` directly and
  does not alter production state. A manual replay using that flag is therefore
  developer-shortcut evidence, not stock campaign evidence.

### Reproduction

Initialize `pt_BR`, pump `MapEditorScreen(directLaunch: true)` at 320×240, load
the bank map, and set hover to a special tile. Also pump the same screen at
480×320 and inspect the non-preview status row.

### Actual

At 320×240 the test records 32 rendering exceptions. Palette chip rows overflow
by up to 264px, the hover/status row overflows by 403px, and the root column
overflows by 77px. At 480×320 the status row still overflows by 243px. Yellow
overflow stripes make the tool difficult to use and can push the status bar out
of view.

### Expected

Constrain and wrap or scroll palette chips, give the hover text a bounded/flex
child, and reserve enough vertical space (or make the editor scrollable) so all
localized status text remains visible without RenderFlex exceptions at narrow
sizes.

### Independent verifier replay

1. Run the focused temporary widget probe copied under the artifact `tests/`
   directory against current HEAD; require zero render exceptions at 320×240.
2. For manual confirmation, build with the existing debug map-editor flag enabled
   and mark that portion shortcut-only: open Mod Tools at 320×240 and 480×320,
   hover a special tile, and screenshot the palette/status overflow.

## PT-439: Interrogation workplace sentence leaks English `the`

- Severity: Medium
- Type: Raw parameter interpolation / interrogation translation
- Screen: Portuguese hostage interrogation → hostage discusses mapped/no-new-info workplace
- Replay status: **Confirmed by deterministic runtime capture on 2026-08-24**
- Evidence:
  `lib/daily/hostages/interrogate.dart:99-111`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/red-capture.log`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/tests/batch_c_red_probe_tmp_test.dart`

### Reproduction

Initialize `pt_BR` and process the generic workplace template exactly as the
source does, passing `"the "` as `{article}` and a localized site name as
`{location}`.

### Actual

The output is `Jamie Doe fala sobre the Centro Médico UW, ...` rather than a
Portuguese article/contraction. The source hard-codes an English display value
instead of selecting a locale-aware article.

### Expected

Remove the raw article parameter and use a complete locale-aware template or a
Portuguese preposition/article helper (`sobre o`, `sobre a`, `sobre`), preserving
correct grammar for site/district/city names.

### Independent stock replay steps

1. Start a fresh Portuguese campaign and recruit/take a hostage whose workplace
   is already mapped or otherwise takes the “doesn’t seem to know anything new”
   branch.
2. Choose firm interrogation until the generic workplace discussion renders.
3. Capture the paragraph and reject raw `the ` immediately before the location.

## PT-440: Interrogation questions have spaces inside quotation marks

- Severity: Low
- Type: Punctuation / nested-parameter composition
- Screen: Portuguese hostage interrogation → firm interrogation prompt
- Replay status: **Confirmed by deterministic runtime capture on 2026-08-24**
- Evidence:
  `lib/daily/hostages/interrogate.dart:23-48`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/red-capture.log`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/tests/batch_c_red_probe_tmp_test.dart`

### Reproduction

Initialize `pt_BR` and render the firm-interrogation template with the `saying`
action and `What do you know?` question.

### Actual

The output is
`Alex Roe interroga Jamie Doe, dizendo " O que você sabe? "`. The PT shell adds
a space just inside each quotation mark.

### Expected

Render `dizendo "O que você sabe?"` with punctuation attached to the quoted
question for every action/question variant.

### Independent stock replay steps

1. In a fresh Portuguese campaign, assign an interrogator and hostage to firm
   interrogation.
2. Advance until the daily interrogation narration uses any quoted question.
3. Capture the message and require no space between either quotation mark and
   the enclosed question.

## PT-441: Female ransom leads get masculine arrest participles

- Severity: Medium
- Type: Gender agreement / ransom outcome translation
- Screen: Portuguese ransom pickup ambush → female lead arrested/narrow escape
- Replay status: **Confirmed by deterministic template capture on 2026-08-24**
- Evidence:
  `lib/daily/hostages/ransom.dart:408-465`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/red-capture.log`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/tests/batch_c_red_probe_tmp_test.dart`

### Reproduction

Initialize `pt_BR`, compose `{subject} {action}.` with subject `Ela` and action
`is quickly overwhelmed and arrested`, exactly as the ransom path composes its
translated fragments.

### Actual

The sentence reads `ela é rapidamente dominado e preso.` Both participles remain
masculine even though the subject pronoun identifies a female lead.

### Expected

Make the translated outcome agree with the lead’s gender (and support nonbinary
wording consistently), across all arrest, custody, struggle, and escape
participles.

### Independent stock replay steps

1. Run a fresh Portuguese route in which a female Liberal has sufficient street
   smarts to become the ransom pickup lead.
2. Repeat ordinary ransom-response pickups until an arrest branch occurs.
3. Capture the outcome paragraph and reject masculine participles after `Ela`;
   repeat narrowly escaped variants when RNG allows.

## PT-442: Sleeper and President nouns force masculine agreement

- Severity: Medium
- Type: Generated noun gender agreement
- Screen: Portuguese monthly sleepers → exposure, leak, embezzlement, recruitment, vault
- Replay status: **Confirmed by deterministic template capture on 2026-08-24**
- Evidence:
  `lib/monthly/sleeper_update.dart:300-321, 365-383, 565-575, and 889-907`,
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/logs/red-capture.log`, and
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober-i18n-layout-c-20260824/tests/batch_c_red_probe_tmp_test.dart`

### Reproduction

Initialize `pt_BR` and render the existing sleeper templates with a feminine
name such as `Jamie Doe`; separately render impeachment with that name.

### Actual

Templates render `O agente infiltrado Jamie Doe ...` and
`O presidente Jamie Doe ...`. The same masculine nouns are reused for female and
nonbinary agents/presidents in exposure, leaks, embezzlement, recruitment, and
biometric-vault copy.

### Expected

Introduce a shared locale-aware agent/president noun phrase keyed to creature
gender, producing forms such as `A agente infiltrada`, a project-approved nonbinary
agent form, and `A presidente` as applicable.

### Independent stock replay steps

1. In separate fresh Portuguese campaigns, obtain female and nonbinary sleeper
   agents (and, if reachable through ordinary progression, a female/nonbinary
   President).
2. Assign Uncover Secrets, Embezzle Funds, Expand Network, and biometric/vault
   actions; allow exposure/leak outcomes naturally.
3. Capture each monthly result and require the article/noun phrase to match the
   agent’s gender rather than always using the masculine form.
