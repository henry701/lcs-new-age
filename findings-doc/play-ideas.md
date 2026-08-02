# Portuguese Playtest Scratch Pad

Persistent route ideas for the playtester. Mark each route with evidence in
`play-log.md` after completing it; promote only confirmed defects to
`findings.md`.

## Current residuals to verify after fixes

- PT-131 fixed (2026-07-30): the high-score rank now renders `A Elite Liberal`
  instead of the source-emphasis form `A ELITE Liberal`. A strict-headless
  seeded-score replay and localized layout regression verify the final casing.
- PT-048: replay deterministic combat and random police-alarm officer variants
  that are broader than the direct chase route; inspect injury, surrender, and
  post-fight summaries for English fragments. The 2026-08-01 siege route now
  verifies localized roster/hit/injury branches and ends in victory before a
  terminal death or surrender variant; keep the remaining branch sweep open.
- PT-145/PT-146/PT-147 fixed and verified (2026-08-01): the party roster now
  separates `HABIL.—ARMA`, four-digit pressure values retain a gap before
  `Sigilo`, and the founder bonus preserves `Artes Marciais` capitalization.
- PT-148 source/catalog fix verified on the same route: combat interpolation
  now localizes generated officer names and supplies the missing death/final-
  words templates. Force a terminal death, surrender, arrest, and post-fight
  summary in a future deterministic harness to close the runtime coverage gap.
- PT-064/PT-134 fixed and verified (2026-08-01): the strict-headless chase
  replay now keeps all Portuguese `D/F/B/P` and `D/F/E/G` prefixes, wraps the
  car legend before the console edge, localizes the car roster, and renders
  `Unidade Policial ainda está no seu encalço!` in the evasive warning. Evidence
  is under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/chase-direct/`.
- PT-138 fixed (2026-07-30): founder biography choices now use neutral
  Portuguese phrasing across the full question set; the focused character
  creation regression covers all rewritten choices. A rebuilt strict-headless
  browser route traversed all nine questions and matched the catalog.
- PT-139/PT-140 fixed (2026-07-30): the Oubliette armour footer now names
  armadura, and the used-car dealer's status actions are fitted independently
  at a 480×640 viewport. Recheck after future shop-layout changes.
- PT-141 fixed (2026-07-30): the conservative-era intro now uses masculine
  agreement for the generated male vice-president while preserving the
  requested `extrema-direita Arqui Conservadora` capitalization.
- Recruitment route: the first profession selector, candidate list, profile,
  political conversation, and response are covered by the latest headless pass;
  continue with a successful recruitment meeting and a conservative target.
- Date formatting: reach January-to-February rollover and inspect every date
  header, event line, and newspaper date.
- Squad naming: inspect the default squad name in base, roster, assets, and
  character profile at the 80-column console width.
- Character profile: inspect profession, education, body-part labels, wounds,
  weapons, armor, and health-state vocabulary.
- Footer and wrapping: revisit review-assets and founder biography with the
  longest Portuguese labels and capture the final row of each screen.

## Broader unexplored routes

- Travel to each available city and inspect destination names, travel prompts,
  and site descriptions.
- Visit every shop category, including clothing, equipment, tools, firearms,
  and pawn-shop status flows.
- Recruit conservatives through dialogue; inspect pronouns, names, persuasion
  prompts, success/failure text, and continuation controls.
- Trigger combat and surrender/arrest paths; inspect action legends, injuries,
  body parts, weapon effects, and post-fight summaries.
- Explore police, court, prison, hospital, and safe-house site actions.
- Advance through several month-end cycles to cover legislative results,
  funding, finance, media, and random newspaper events.
- Exercise save export/import and corrupted-save handling in Portuguese.
- Repeat key screens at a narrow viewport to expose width assumptions.

## Narrow replay follow-ups (2026-07-28)

- PT-083: make the console responsive or provide a narrow viewport mode so
  base/review/profile management columns and footer controls do not disappear
  at 480×320. The `DEBUG` ribbon is fixed (2026-07-29); the modal body/footer
  and title-screen version line still clip at this viewport.
- PT-084 fixed (2026-07-29): populated media rows now separate Portuguese
  dates, publication names, and impacts; the deterministic layout test covers
  the reserved columns.
- PT-085 fixed (2026-07-29): the hostage-slaying article keeps `rapist` and
  `perpPronounSelf` placeholders while using idiomatic Portuguese grammar.
- PT-124 fixed (2026-07-29): article impact labels now cover the previously
  missing `Taxes` and `Drugs` enum names (`Impostos`, `Drogas`).
- PT-125 open: replay the military newspaper branch and replace generated
  country fragments such as `Islands de Korsazistan` with locale-aware names.

## Recruitment/police replay follow-ups (2026-07-29)

- PT-086 withdrawn after source/replay review: the Felix meeting was the
  founder's own session, so the recruiter-name mismatch was not reproduced.
- PT-087 fixed (2026-07-29): daily result rows clear stale text before drawing
  shorter localized messages.
- PT-088 fixed (2026-07-29): dynamic eagerness phrases now use neutral verbs
  instead of gendered `ansioso` agreement.
- PT-089 fixed (2026-07-29): recruitment and pickup-line profile labels route
  through locale-aware creature-name rendering.
- Police alarm fixture replay verified Chief of Police, surrender, arrest,
  injury/body-part, and post-combat screens; keep this route in regression
  coverage because normal police-station arrival is not deterministic.
- PT-090 fixed (2026-07-29): composed activity-help paragraphs now use the
  locale catalog, including complete Guardian writing/streaming bodies; keep
  the focused help regression tests when adding future long help text.
- PT-091 fixed (2026-07-29): the drug-expert newspaper interpolation now maps
  `hell`/`[heaven]` to Portuguese `caramba`; keep the newspaper regression
  test so the raw English fallback cannot return.
- PT-092 fixed (2026-07-29): attack hit-description catalog entries now cover
  `hitting` and the other XML weapon fragments, including the Portuguese
  `atingindo` output used in burst-hit sentences.
- PT-093 fixed (2026-07-29): the encounter roster reserves a separator cell
  between the 16-column armor cell and the weapon cell, then shifts health
  right to preserve the full localized weapon label.
- PT-094 fixed (2026-07-29): complete Portuguese paragraph entries now cover
  the remaining Art, donation, brownie-selling, and prostitution help text
  that previously mixed English fragments into otherwise localized prose.
- PT-095 fixed (2026-07-29): generated warehouse names now use an exact
  full-name catalog entry when available (`Old Church` → `Igreja Antiga`), and
  the police siege sentence uses a gender-neutral site reference.
- PT-096 fixed (2026-07-29): pickup-line failure responses now localize the
  generated profession and response verb.
- PT-097 fixed (2026-07-29): dating follow-up headers now translate profession
  types.
- PT-097 addendum fixed (2026-07-29): CCS article fragments now compose with
  idiomatic Portuguese grammar.
- PT-098 fixed (2026-07-29): The Daily navigation/masthead/subscription copy
  is localized and right-aligned within the 80-column page.
- PT-099 fixed (2026-07-29): newspaper story rendering now consumes inline
  color markers before drawing wrapped article lines, preventing `&R` filler
  markup from leaking into the visible body.
- PT-100 fixed (2026-07-29): the drug-study route translates all dynamic law
  verbs and uses Portuguese article/crasis and plural outcome forms.
- PT-101 fixed (2026-07-29): generated think-tank names use a locale-aware
  Portuguese word-order template rather than independently joined tokens.
- PT-102 fixed (2026-07-29): agenda/origin variants use the requested
  `Arqui Conservadora` capitalization and spacing.
- PT-103 fixed (2026-07-29): invest-in-location fortification variants are
  translated before being inserted into the W option template.
- PT-104 fixed (2026-07-29): failed recruitment rejection lines use explicit
  coordinates so the second sentence cannot concatenate to the first.
- PT-105 fixed (2026-07-29): corrupt-save crash-restart and continue prompts now
  explicitly say `reiniciar/continuar o jogo`.
- PT-106 fixed (2026-07-29): failed recruitment dialogue uses a neutral
  agreement-safe phrase (`não acredita ... entenda`) for every candidate gender.
- PT-107 fixed (2026-07-29): car-theft break-in success messages now translate
  both the bare-window and weapon variants before parameter insertion.
- PT-108 fixed (2026-07-29): all dynamically selected hotwire-failure fragments
  now pass through the locale catalog.
- PT-109 fixed (2026-07-29): key-search expletives and locations now use
  localized/profanity-safe catalog entries.
- PT-110 fixed (2026-07-29): vehicle assignment options are fitted to 38-column
  cells with a two-column gap, and the footer moved below the 18-row page.
- PT-111 fixed (2026-07-29): generated visit activity headers translate known
  site names such as `Plastic Factory` while preserving custom/player names.
- PT-112 fixed (2026-07-29): the conservative-era intro no longer caps the
  translated midterm-election paragraph at the English line budget, preventing
  the following agenda paragraph from overwriting its final Portuguese words.
- PT-113 fixed (2026-07-29): agenda public-interest levels now pass through
  the locale catalog (`Enorme`, `Alto`, `Moderado`, `Baixo`, `Mínimo`,
  `Nenhuma`) before rendering.
- PT-114 fixed (2026-07-29): agenda polling rows and active-law descriptions
  are fitted to the 80-column console with an ellipsis, preserving the
  right-hand interest column instead of clipping at the edge.
- PT-115 fixed (2026-07-29): the four `something swell` pickup variants now
  use the contextual Brazilian Portuguese phrase `uma coisa crescer`,
  avoiding the literal `algo inchar` rendering.
- PT-116 fixed (2026-07-29): recruiting's daily fallback uses a dedicated
  infinitive template (`em vez de recrutar`) rather than inserting the
  activity label `Recrutando` into that grammatical slot.
- PT-118–PT-121 fixed (2026-07-29): media article impact labels, the
  death-penalty dynamic sentence, the shared-filler paragraph boundary, and the
  composed Portuguese pollution think-tank name now have code/catalog coverage.
  Replay the same five-article archive to verify the fixes visually.
- PT-117 fixed (2026-07-29): the long-form Portuguese `May` translation is now
  `Maio`; `mai` remains reserved for short date contexts.
- PT-122 fixed (2026-07-29): the masculine founder's high-school option now
  uses gender-neutral wording (`adotei o estilo gótico`).
- PT-123 fixed (2026-07-29): the generic daily mismatch fallback now uses
  `em vez de cumprir a atividade planejada` instead of a gerund label.
- PT-124 fixed (2026-07-29): article impact labels for `Taxes` and `Drugs` now
  use `Impostos` and `Drogas`.
- PT-126 fixed (2026-07-29): the `Income Inequality` article impact label now
  uses `Desigualdade de Renda`.
- PT-127 fixed (2026-07-29): generated country titles and capital words now
  use Portuguese catalog entries (`Ilhas`, `Forte`, `Colina`, and related
  country-title forms).
- PT-125 fixed (2026-07-29): generated military country names now translate
  `Islands` as `Ilhas` rather than exposing an English fragment.
- PT-128 fixed (2026-07-29): Liberal Agenda opinion-poll fragments now use
  plural finite verbs and natural Portuguese after percentage values.
- PT-129 fixed (2026-07-29): teaching detail rows clear stale activity text and
  translate all teaching cost/skill lines; replay the paid-class route after
  future catalog changes.
- PT-130 fixed (2026-07-29): founder biography firearm-safety wording now uses
  idiomatic Brazilian Portuguese rather than a literal noun phrase.
- PT-132 fixed (2026-07-30): replace the article-dependent arrival preposition
  with `chegou ao destino: {site}` so every dynamic site name remains grammatical.
- PT-133 fixed (2026-07-30): rename the compact hospital label from `UW Médica`
  to `Hospital UW`; the full name remains `Centro Médico UW`.
- PT-134 fixed (2026-07-30): localize enemy creature names in chase warnings so
  `SWAT Officer` cannot bypass the Portuguese catalog.
- PT-135 fixed (2026-07-30): localize encounter creature names in stealth alarm
  messages so `Police Officer` cannot bypass the Portuguese catalog.
- PT-136 fixed (2026-07-30): localize hospital activity site names and the
  `month`/`months` period token before rendering the base activity line.
- PT-137 fixed (2026-07-30): remove the gendered `o` article from the dynamic
  armor target template so `armadura` and `colete` both agree naturally.
- PT-142 fixed (2026-08-01): fit Portuguese equipment options to their cells
  and preserve the `A -`/`B -` key prefixes with a separator column.
- PT-143 fixed (2026-08-01): fit long daily result messages to the console and
  use an ellipsis instead of clipping the translated tail.
- PT-144 fixed (2026-08-01): inflect generic Portuguese warehouse adjectives
  for feminine site types (`Siderúrgica Velha`, not `Siderúrgica Velho`).
- PT-149 fixed (2026-08-01): preserve ASCII ` - ` in dynamic option templates;
  the catalog validator now covers `{letter}`, `{key}`, `{keys}`, `{index}`,
  and `{number}` control prefixes while leaving `{city}`/`{state}` prose free.
- PT-150 fixed (2026-08-01): localize visible XML flag names/descriptions and
  issue labels, reserve the heat column, and avoid duplicating `Custo:` in the
  flag preview footer.
- PT-151 residual (2026-08-01): the compact flag table still ellipsizes long
  Portuguese issue labels; consider a responsive issue/detail layout.
- PT-157 fixed and verified (2026-08-01): the base agenda action now uses
  `O status da agenda Liberal`, matching the agenda detail screen instead of
  the inconsistent `O Estado da Agenda Liberal`.
- PT-158 fixed and verified (2026-08-01): the agenda footer now fits the full
  `Outra tecla - Sair` instruction instead of clipping `Qualquer Outra Tecla - S`
  at the 80-column edge.
- PT-159 fixed and verified (2026-08-01): the gang-member recruitment dialogue
  now translates `D - Buy weapons.` and its naked variant; the strict-headless
  conversation replay no longer exposes the English option.
- PT-152 fixed (2026-08-01): strict-headless crafting now sweeps both pages,
  including `Intersex Progress Pride Flag` and `Variant Labrys Lesbian Flag`,
  with localized names, descriptions, issues, difficulty, cost, and cancel
  controls.
- PT-153 fixed (2026-08-01): acquisition key 4 now visibly means `Fazer uma
  Bandeira`; the wheelchair action is correctly displayed on key 5.
- PT-154 fixed (2026-08-01): craft names/issues are fitted to their fixed
  columns, preventing long Portuguese metadata from overwriting heat values.
- PT-155 fixed (2026-08-01): craft preview measures localized `Pressão:` and
  `Dificuldade:` labels so both values remain visible with a separator.
- PT-156 fixed (2026-08-01): the new-game opening consistently uses
  `extrema-direita Arqui Conservadora`.
- PT-160 fixed and verified (2026-08-01): failed issue-talk responses now
  advance from `console.y`, so the Portuguese row ends cleanly after
  `"Tanto faz." <se vira>`; a focused layout regression guards the fix.
- PT-161 fixed and verified (2026-08-01): newspaper dynamic pronoun
  parameters now translate raw `he`, `she`, `him`, and `they` values as well as
  the possessive/object forms already covered.
- PT-162 fixed and verified (2026-08-01): child-victim newspaper conditions
  now agree with plural feminine `mortas` (`esculpidas`/`mutiladas`).
- PT-163 fixed and verified (2026-08-01): both runtime-selected seasonal
  fashion sentences now have canonical Portuguese catalog entries.
- PT-164 residual (2026-08-01): a deliberately oversized debug siege fixture
  can print a ten-person reserve over the six-row fixed-width frame. No normal
  campaign route reproduced it; add a roster-cap/import guard if the limit is
  ever raised.

## Newly prioritized after the 2026-07-26 sweep

- Use the paid-class selector as a localization sentinel: sample every skill
  description after catalog changes and fail the sweep if any raw English
  sentence appears.
- Exercise title-screen overlays for high scores and changelog, then return to
  the game to catch stale-locale or focus-state regressions.
- Complete one recruitment meeting and one conservative conversion, recording
  every response branch and pronoun combination.
- Advance one full month with a recruited squad, then inspect media overview,
  newspaper detail, finance, and legislative results together.
- Save from Portuguese, reload it, and import the same file in a fresh session;
  compare the first base screen for labels, dates, and squad names.
- Title/save/high-score replay verified Portuguese export, reload, and score
  rendering in strict headless mode. Add a browser-supported file-input fixture
  (or a real user-assisted picker run) to close the remaining import-validation
  gap; retain a 400×300 high-score screenshot in the narrow-layout regression
  set because its return prompt falls below the viewport.
- PT-046/PT-047 reverified (2026-07-29): save actions, compact dates, high-score
  month names, five-score stress rows, and 80-column statistics all stayed
  Portuguese and within bounds.
- PT-103 fixed (2026-07-29): translate the dynamic `fortifyText` parameter in
  `invest_in_location.dart`; the W fortification option still exposes
  `Fortify the compound for a siege` in Portuguese mode.
- PT-104 fixed (2026-07-29): move the failed recruitment follow-up to a fresh
  row so `...Direitos Trabalhistas.` and `Raven Woods acha...` do not
  concatenate.

## Follow-up routes from the 2026-07-26 broad sweep

- Restart the headless web server after the fixes, then replay Veículos, city
  travel, high scores, and save-detail management for clipping and English leaks.
- Seed a save with a two-digit in-game day and confirm the compact date is fully
  visible in both date columns.
- Trigger a car chase and tooth injury once the combat harness can inject a
  deterministic encounter; capture the composed sentence, not only fragments.
- Keep changelog English-only unless product scope changes; its localized notice
  currently documents the limitation for players.
- PT-062 fixed (2026-07-29): the pawn-shop activity header now uses the
  localized compact name (`Visitando Casa de Penhores`) and has a layout
  regression.

## Strict-headless equipment and media replay — 2026-08-01

- PT-165 fixed: sweep every all-item equipment page after catalog changes;
  generic loot, clothing, memos, and flags now resolve through the Portuguese
  item helpers. Keep `Fursuit`, `Tie-dye`, and `Toga` as intentional unchanged
  loanwords unless a product glossary says otherwise.
- PT-166 fixed: media overview source cells now translate and reserve 16
  columns; the AM Radio row and article header rendered `Rádio AM` in the
  fresh browser pass.
- PT-167 fixed: dynamic media impact labels and Guardian memo names now have
  Portuguese catalog coverage; the replay showed `Prisões: -10.0%` and
  `Memorandos das Notícias a Cabo`.
- PT-168 fixed (2026-08-02): fit the localized party armor cell before health;
  the security-uniform replay now renders `Unif. de Segu… ~ 130` with a
  separator instead of `Unif. de Segura~ 130`.
- PT-169 fixed (2026-08-02): high-score detail no longer translates the
  already-localized month a second time; the replay stopped false `Maio`/
  `Novembro` missing-translation telemetry.
- PT-170 fixed and verified (2026-08-02): review-assets rows now fit long
  Portuguese locations before the activity column and preserve a separator.
- PT-171 fixed and verified (2026-08-02): the split siege briefing now joins
  as `sobreviver a este confronto`.
- PT-172 fixed and verified (2026-08-02): a no-crime siege warning now says
  `Você está sendo procurado para interrogatório!` instead of using the
  generic `procurado por interrogatório` construction.
- PT-173 fixed and verified (2026-08-02): already-localized pager labels,
  structural templates, unchanged model/proper-name values, and signed numeric
  deltas no longer pollute missing-translation telemetry.
- Residuals remain PT-048/PT-148 (deterministic terminal combat variants),
  PT-083 (narrow viewport), PT-151 (intentional long-label ellipses), PT-164
  (oversized debug/import roster), and accepted PT-049 (English changelog
  body). No new translation or layout issue was confirmed in this pass.

## Runtime acceleration

`lib/title_screen/title_screen.dart` exposes `megaFounderCheat`, and
`lib/title_screen/new_game.dart` checks it during founder creation. If a route
needs acceleration, enable the flag temporarily in a local playtest build,
record the altered build in `play-log.md`, and do not commit the cheat change.

## Exit condition

Do not mark the localization goal complete until a fresh Portuguese replay
covers the high-risk routes above, every confirmed issue is fixed or explicitly
accepted, focused and full tests pass, and the findings tracker has no open
translation or layout issues backed by current evidence.
