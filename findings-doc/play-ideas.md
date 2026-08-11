# Portuguese Playtest Scratch Pad

Persistent route ideas for the playtester. Mark each route with evidence in
`play-log.md` after completing it; promote only confirmed defects to
`findings.md`.

- PT-325 fixed and verified (2026-08-11): generated newspaper locations now
  spell `San Bernardino, CA` correctly. Keep the proper-name regression beside
  the city table when adding or reweighting locations.

- PT-326 fixed and verified (2026-08-11): the singular police-surrender alias
  now localizes generated role names (`Oficial de Polícia`) and avoids the
  awkward `preso(a)` construction with a neutral `As autoridades prendem...`
  sentence. Keep the alias interpolation regression beside future siege
  terminal changes.

- PT-327 fixed and verified (2026-08-11): the singular rescued-hostage
  terminal now localizes generated role names and uses neutral custody prose
  (`As autoridades colocam Oficial de Polícia sob custódia para
  reabilitação.`). Keep the hostage interpolation regression beside future
  siege terminal changes.

- PT-328/PT-329 fixed and verified (2026-08-11): daily unoccupied police raids
  now localize rescued-role names and render generated site names without a
  hard-coded article. Width-aware opening rows preserve their final period at
  the fixed console boundary; keep the daily-siege regressions beside future
  raid-template changes.

- PT-248 fixed and verified (2026-08-09): the Portuguese `Novo Esquadrão`
  header now right-aligns from its localized width instead of clipping at
  column 71. Keep the focused layout regression and narrow replay evidence.
- PT-249 fixed and verified (2026-08-09): Portuguese yes/no prompts now accept
  `S` as well as the legacy `Y` affirmative key. The clean police-station
  replay advanced `Tentar arrombar a fechadura? (Sim ou Não)` with `S`; keep
  the alias regression when adding additional localized prompts.
- PT-251 fixed and verified (2026-08-09): the Portuguese siege footer no longer
  merges `R:Reorganizar` with `Saque no chão!`. The loot indicator is drawn on
  row 22 after encounter clearing, and the focused fixed-width regression
  covers the relocated label and intact row-24 action footer.
- PT-252 fixed and verified (2026-08-09): successful interview news now
  translates its two cataloged sentences independently instead of falling back
  to the concatenated English key.
- PT-253 fixed and verified (2026-08-09): standalone combat injuries now use
  natural Portuguese past tense and sentence capitalization, including `A
  língua de {name} foi arrancada!`.
- PT-254 fixed and verified (2026-08-09): long safehouse names are fitted to
  the 16-cell security-box interior, keeping the frame and `O - Reordenar`
  action separate.
- PT-255 fixed and verified (2026-08-09): fleeing creature names now lowercase
  only their first character, preserving acronyms such as `SWAT`.
- PT-256 fixed and verified (2026-08-09): an under-attack safehouse with no
  active squad now explains `Não há Liberais disponíveis para defender este
  esconderijo.` and returns safely. The base action guard, last-second empty
  squad guard, focused regression, and fresh strict-headless replay cover the
  former `Bad state: No element` crash at `lib/sitemode/sitemode.dart:211`.
- PT-257/PT-258 fixed and verified (2026-08-09): the strict-headless terminal
  combat replay now preserves a visible armor marker in the six-cell enemy
  health column and wraps long Portuguese hit descriptions over rows 9–10.
  Keep the compact-status and combat-message regressions with future roster or
  localization changes.
- PT-260/PT-261 fixed and verified (2026-08-09): the restarted Portuguese
  medical-debt replay now translates `Actuary`/`Claims Adjuster` as
  `Atuário`/`Regulador de Sinistros`, handles
  case-variant generated role names, and preserves the `CPA` acronym while
  applying flee styling. Keep the role-label and acronym regressions with
  future encounter rendering changes.
- PT-262 is now fixed and verified: the 17-cell encounter-name column uses
  the compact cataloged `Funcionário` label for generated Office Worker rows,
  while the full `Trabalhador de Escritório` label remains available elsewhere.
- PT-264 fixed and verified (2026-08-09): direct police sieges now derive the
  foot-chase surrender flag from alive enemy law-enforcement pursuers. The
  strict-headless replay accepts `G - Desistir` and renders `Você para e é
  preso.`; the focused chase-policy regression covers police versus mercenary
  pursuers.
- PT-265 fixed and verified (2026-08-09): the medical-debt raid now uses
  complete cataloged templates for all three announcement pages. The fresh
  strict-headless replay rendered the office-worker and finance speeches in
  Portuguese without overflow.
- PT-266 fixed and verified (2026-08-09): the medical-debt receipt now passes
  the localized site name into its title template, rendering `PARA
  ACAMPAMENTO SEM-TETO:` while preserving the existing amount alignment.
- 2026-08-09 responsive/options follow-up: the 480×320 Portuguese title,
  game-options, interface-options, and content/tone screens stayed bounded and
  localized. The version footer remains the accepted PT-083 narrow-viewport
  enhancement; no new defect was confirmed. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/responsive-followup-20260809/`.

## Current residuals to verify after fixes

- PT-224/PT-225/PT-226 fixed and verified (2026-08-09): the strict-headless
  shop/education/graffiti/newspaper sweep corrected the graffiti pickup
  context, the education skill-column separator, and the Justice Amok
  possessive clause. Keep their focused regressions with future catalog or
  fixed-width changes.
- PT-227 fixed and verified (2026-08-09): the strict-headless police-siege
  combat replay found a Portuguese final-words death message clipped at the
  80-column edge. The shared death-message renderer now wraps across its two
  reserved rows; `test/sitemode/fight_death_layout_test.dart` guards the full
  `Melhor morrer do que ser liberal...` output. Keep broader live-combat
  death/post-fight-summary coverage open under PT-048/PT-148.
- PT-259 fixed and verified (2026-08-09): dead combat rows are omitted during
  the death redraw, so negative health values cannot flash beside armor
  markers. The focused renderer regression and fresh 34-turn strict-headless
  replay both passed with fixed 80-column rows and no browser errors.
- PT-285 fixed and verified (2026-08-11): the police-siege death reflection
  now uses `respira com dificuldade, tossindo sangue... e então fica em
  silêncio`; the focused catalog regression and the fresh police-terminal
  replay cover the complete interpolation.
- PT-070 fixed and verified (2026-08-11): switching activity categories now
  clears an unrelated preview footer until a valid sub-option is selected.
  The 480×320 strict-headless replay and focused core-layout regression cover
  both the blank transition and the restored `Recrutar` preview.
- PT-071 fixed and verified (2026-08-11): the Portuguese review-profile
  footer now preserves the separator between `CIMA` and `BAIXO - Mais Info`.
  The 480×320 strict-headless profile replay and vocabulary regression cover
  the localized prefixes and reject the old merged `CIMA BAIXO` form.
- PT-243 fixed and verified (2026-08-09): compact Portuguese health/armor
  values, the localized volunteer biography answer, and city short codes no
  longer pass through translation a second time. The fresh strict-headless
  founder/status replay keeps the visible output Portuguese and removes the
  corresponding false missing-translation warnings.
- PT-131 fixed (2026-07-30): the high-score rank now renders `A Elite Liberal`
  instead of the source-emphasis form `A ELITE Liberal`. A strict-headless
  seeded-score replay and localized layout regression verify the final casing.
- PT-048: the 2026-08-09 strict-headless ordinary police route now covers the
  live `T - Falar` menu, target-name interpolation, `D - Render-se`, arrest,
  newspaper, and court flow. The 2026-08-09 corporate siege replay now also
  covers the live combat death reflection and high-score transition. Keep the
  broader finding open only for random police-alarm variants; the 2026-08-11
  deterministic plural arrest surrender route rendered `5 Liberais são
  presos.` cleanly, and PT-326 covers the singular name-alias branch. The
  separate siege foot-chase and non-police terminal sweeps remain useful
  evidence.
- Police-station rescue fixture: the strict-headless route reached a locked
  door and the translated `Sim ou Não` prompt, verified the `S` alias, and
  confirmed the 20 debug liberals appear under `Liberais no Sistema Judiciário`.
- PT-145/PT-146/PT-147 fixed and verified (2026-08-01): the party roster now
  separates `HABIL.—ARMA`, four-digit pressure values retain a gap before
  `Sigilo`, and the founder bonus preserves `Artes Marciais` capitalization.
- PT-148 source/catalog fix verified on 2026-08-09: combat interpolation now
  localizes generated officer names, the ordinary live route reaches the
  in-encounter surrender and Portuguese court flow, and the corporate siege
  replay reaches the live death reflection and high-score transition. Keep
  future coverage focused on new generated creature types and random alarm
  variants; non-police terminal endings were already swept on 2026-08-10.
- PT-253/PT-254/PT-255 are fixed and verified in the latest strict-headless
  replay; keep their focused regressions with future combat catalog or
  safehouse-layout changes.
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
- PT-188 fixed (2026-08-08): character profiles now translate the transgender
  status token as `Transgênero`; keep the profile identity route in the
  vocabulary regression suite.
- PT-190 fixed (2026-08-08): the Health and Support help paragraph now uses
  natural Portuguese (`Médicos capacitados... para si ou para outros`) rather
  than the literal `... ou outro` wording.
- PT-191 fixed (2026-08-08): profile and activity wound displays now localize
  all special injuries and runtime wound codes (`Tir,Con,Cor,Ras,Que`). Keep
  the injury fixture regression when adding new body states.
- PT-192 fixed (2026-08-08): compact activity details fit the translated
  `Habilidades Principais` heading and body-part labels before the status
  column; replay the route if the compact profile layout changes.
- PT-193 fixed (2026-08-08): hospital discharge now passes `Site.getName()`
  into the translated bill template, keeping `Centro Médico UW` localized.
- PT-210 fixed (2026-08-08): recruitment and profile screens translated
  `Highschool Dropout` as the false friend `Evadido do Ensino Médio`. It now
  uses the contextual Portuguese label `Desistente do Ensino Médio`.
- PT-211 fixed (2026-08-08): a generated newspaper article leaked `(man)` and
  `He provavelmente` through dynamic gender interpolation. Catalog entries now
  cover `man`, `woman`, and `friend`; sentence-start pronouns capitalize after
  translation.
- PT-194 fixed and verified (2026-08-09): profiles with many special injuries
  now show a bounded `+N outras — BAIXO` hint and a localized paged detail
  screen. Keep the page-count helper shared between review mode and standalone
  profile screens.
- PT-189 fixed and verified (2026-08-09): the full profile now uses two wider
  skill columns and dedicated crime-label cells; keep the captured page buffers
  and layout regressions when changing profile widths.
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
- PT-125 fixed (2026-07-29): generated military country names now translate
  `Islands` as `Ilhas`; retain the deterministic article regression when
  changing country-name composition.

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
- PT-151 fixed and verified (2026-08-09): the compact flag table now gives the
  issue column 24 cells and keeps heat/cost at fixed boundaries; recheck the
  column budget if more flag categories are added.
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
- PT-164 fixed and verified (2026-08-09): oversized debug/import rosters now
  render five members plus a `+N…` overflow marker, preserving the delimiter
  and combat frame; retain the regression if the squad cap changes.

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
- PT-174 fixed and verified (2026-08-02): founder biography rewards and the
  training description now use the canonical `Computadores` label consistently.
- PT-175 fixed and verified (2026-08-02): agenda polling fragments now render
  `do Presidente` and `com a violência armada` with the required articles.
- PT-176 fixed and verified (2026-08-02): sorting descriptions are translated
  before interpolation; the `hostages` description is now cataloged as
  `reféns`.
- PT-177 fixed and verified (2026-08-02): the flag-selection footer was
  shortened to a grammatical single-row Portuguese sentence so its final
  `LCS.` is not overwritten by paging controls.
- PT-178 fixed and verified (2026-08-02): sleeper and justice short site names
  now resolve `WhiteHouse`/`Police` to `Casa Branca`/`Polícia`.
- PT-179 fixed and verified (2026-08-02): the full skill sheet translates
  `NOW`/`MAX` to `ATUAL`/`MÁX.` and preserves a separator before `HABIL.`.
- PT-180 fixed and verified (2026-08-02): review-mode profile navigation now
  uses the shared fitted footer and the Portuguese `DIREITA` prefix.
- PT-181 fixed and verified (2026-08-02): the sleeper location cell is fitted
  before `Mantendo Discrição`, so `Casa Branca` cannot overwrite activity.
- PT-182 fixed and verified (2026-08-02): flag status keys are cataloged and
  long names are fitted before the issue column.
- PT-183 fixed and verified (2026-08-02): police-siege safehouse compound
  status now translates `BOLLARDS`/`GENERATOR` as `POSTES`/`GERADOR` in both
  siege and post-surrender screens.
- PT-184 fixed and verified (2026-08-02): daily injury-treatment prompts now
  clear and fit row 8 before rendering the Portuguese sentence, so stale
  safehouse/location tails cannot remain after the message.
- PT-185 fixed and verified (2026-08-02): squad assembly now right-aligns the
  translated `Esquadrão:` header by visible width, keeping the full default
  squad name on the 80-column console.
- PT-186 fixed and verified (2026-08-02): the CIA raid opening has a canonical
  full-template Portuguese entry instead of falling back to English from two
  translated fragments.
- PT-187 fixed and verified (2026-08-02): CIA compound-suspense and darkness
  messages now wrap long Portuguese lines with `addparagraph`; camera and
  final-period clipping no longer occur.
- Residuals remain PT-048/PT-148 (deterministic terminal combat variants),
  PT-083 (narrow viewport), and accepted PT-049 (English changelog body).
  After these fixes, no additional translation or layout issue was confirmed
  in the replayed routes.

## Strict-headless follow-up — 2026-08-08

- PT-195–PT-207 fixed and verified: replay the roster, equipment, profile,
  sleeper, media, finance, and assignment routes after any future catalog
  reshards; the compact columns now have explicit separators and localized
  headers/actions.
- PT-208 fixed: keep the compact health/armor code catalog entries in the
  short-label regression so a future translation pass does not reintroduce
  raw `Crit`, `OK`, `+Lgt`, or `+Hvy` into site-mode rosters.
- PT-209 fixed: treat split adjacent string literals as one complete
  translation template; search for other concatenated `mvaddstr` literals in
  daily advance and succession/death screens.
- PT-194 remains the next concrete UI enhancement: page or scroll the full
  special-injury list instead of silently dropping rows below the console.
- The police-siege route now reaches a complete Portuguese briefing and combat
  roster in headless mode; next sweep should target the terminal death/arrest
  variants (PT-048/PT-148) with a deterministic combat fixture.

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

# 2026-08-02 strict-headless combat follow-up

The headless combat fixture reached a Portuguese siege briefing, combat roster,
victory screen, and surrender path. The compound row initially leaked the raw
English labels `BOLLARDS` and `GENERATOR`; PT-183 adds `POSTES` and `GERADOR`
and a fresh server restart verified the translations in the live buffer. Death
and arrest variants were not reproduced; keep them open with save/import and
narrow-layout coverage.

## Strict-headless bulk-task follow-up — 2026-08-08

- PT-212 fixed: bulk regular-task choices now pass their labels through the
  Portuguese catalog, including `Vender Brownies` and `Roubo de Carros`.
- PT-213 fixed: the long `Fraude de Cartão de Crédito` option now uses the
  fitted renderer and displays an ellipsis inside the right-hand column.
- PT-214 fixed: `CURRENT ACTIVITY` now renders as `ATIVIDADE ATUAL`.
- PT-215 fixed (2026-08-08): the police-siege under-attack briefing now uses
  one complete Portuguese template and wraps inside the console. Keep the
  terminal death/arrest/surrender combat branches open; the briefing itself is
  covered by the saved before/after buffers under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/under-attack-briefing-20260808/`.
- Keep PT-194, PT-048/PT-148, PT-083, and accepted PT-049 in the residual
  queue; no new open issue was confirmed in this route after the fixes.
- PT-216 fixed (2026-08-09): the siege wait warning now uses natural Portuguese
  and stays inside the left column without colliding with the exit action.
- PT-217 fixed (2026-08-09): the single-arrest police result now uses a
  complete Portuguese sentence (`A polícia deteve {name}.`).
- PT-218 fixed (2026-08-09): high-score rendering localizes built-in slogans
  while preserving custom player slogans.
- PT-219 fixed (2026-08-09): medical-debt receipt labels are cataloged and
  aligned from their rendered Portuguese width so amounts stay in column 50.
- PT-220 fixed (2026-08-09): live combat bluff responses now clear the prior
  talk header before drawing the shorter Portuguese result; the strict-headless
  replay no longer leaves a target-name suffix on row 9.
- PT-221 fixed (2026-08-09): the sweatshop major-event picture caption now
  fits the localized text before centering, preventing the negative-x
  `RangeError` reproduced during the month-end newspaper sweep. The focused
  regression covers the Portuguese caption and visible ellipsis. A fresh
  strict-headless sweep then reached 13 Feb 2023, including January/February
  newspaper and agenda screens, without another runtime failure.

## Strict-headless ordinary police follow-up — 2026-08-09

- PT-228 fixed: the female combat death branch now uses `dela` instead of the
  subject pronoun `ela`; the focused deterministic death regression covers the
  exact sentence.
- PT-229 fixed: ordinary encounter health/armor status is capped before the
  map preview, and a fresh headless police route shows the map boundary intact
  after the roster is drawn. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-combat-layout-20260809/`.
- Keep PT-048/PT-148, PT-083, and accepted PT-049 in the residual queue.

## 2026-08-09 — Headquarters and dynamic-name telemetry follow-up

- PT-244/PT-245 are fixed: the Portuguese Washington travel menu and HQ
  headers now use `Sede de Inteligência`, `Sede Corporativa`, and the security
  creature label `Cão de Guarda`.
- PT-246/PT-247 are fixed: generated site names and numeric display shells no
  longer pollute missing-translation telemetry. Keep the logger allowlist
  tests when adding other runtime-composed labels.
- The residual playtest queue remains PT-048/PT-148 (deterministic terminal
  combat/post-fight coverage), PT-083 (broader narrow-console coverage), and
  accepted PT-049 (historical changelog English).

## Strict-headless education-picker follow-up — 2026-08-10

- The strict-headless route reached the Portuguese education skill picker and
  confirmed PT-230: max values and descriptions were concatenated at the
  fixed-width boundary. The production column shift and fitted renderer are
  fixed, replayed, and protected by a focused regression.
- Durable before/after buffers live under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/education-skill-layout-20260810/`.
- Next useful routes are a deterministic terminal combat death/post-fight
  branch for PT-048/PT-148 and a 480×320 title/save-manager sweep for PT-083;
  keep the accepted English changelog body PT-049 out of the fix queue.

## Strict-headless narrow-title follow-up — 2026-08-10

- PT-231 was reproduced at 480×320: the right-aligned Portuguese version line
  overwrote the title frame border. A two-column margin and a focused title
  regression now keep the version metadata inside the frame.
- Before/after screenshots live under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/` with the
  `title-narrow-pt-480x320-20260810` prefix.
- Continue the next pass with a deterministic non-police live-combat death
  and post-fight-summary route for PT-048/PT-148, then recheck title/save
  management at the same narrow viewport.

## Strict-headless save-manager sweep — 2026-08-10

- A Portuguese 480×320 campaign was saved, reopened through the save manager,
  and loaded again. Headers, action labels, and the `Entre -` return prompt
  fit the fixed console and preserved their key prefixes.
- The same viewport covered `Opções de Jogo`, `Opções de Interface`, and
  `Conteúdo e Tom`; wrapped Portuguese copy stayed within the console.
- No new issue was confirmed. Keep the next pass focused on a deterministic
  non-police terminal combat/post-fight route for PT-048/PT-148, followed by
  broader narrow-console coverage for PT-083.

## 2026-08-10 — Combat possessive articles

- PT-232 is fixed: generated Portuguese combat role labels now contract
  possessive articles (`do Policial da SWAT` / `da ...`), while named
  characters use `de ...`.
- The strict-headless siege route reached the live combat loop and Portuguese
  victory screen after the fix; the focused context regression protects both
  role-label and proper-name forms.
- Keep PT-048/PT-148 open until a deterministic terminal death/post-fight
  summary is captured, then continue the PT-083 narrow-console sweep.

## Strict-headless management and site-map replay — 2026-08-10

- PT-233 fixed: the skill picker now calls Tailoring `Alfaiataria`, matching
  founder rewards and help text instead of the isolated `Costura` label.
- PT-234 fixed: latte-stand name fragments now produce noun phrases such as
  `Caneca de Leite` and `Caneca de Espuma`, avoiding the adjective misuse in
  `Caneca de Leitoso`.
- PT-235 fixed: the full site map clears stale roster/command content and
  reserves a complete Portuguese continue prompt on row 24.
- Durable before/after captures live under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/site-controls-overflow-20260810/`;
  the generated latte-name replay is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/latte-name-20260810/`.
- Keep PT-048/PT-148, PT-083, and accepted PT-049 in the residual queue.

## 2026-08-09 — Vehicle assignment and review-profile replay

- Keep the strict-headless route for vehicle assignment: inspect both lower- and
  upper-case vehicle keys so passenger and driver prompts remain cataloged and
  fit alongside the completion action.
- Use a badly injured debug Liberal in review-mode details to exercise the
  compact special-injury overflow marker. The footer must remain on its own
  row; the retained route is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/fixed-route-20260809/`.
- The next high-value branch is still a deterministic non-police terminal death
  and post-fight summary for PT-048/PT-148, followed by the broader 480×320
  responsive-console sweep for PT-083.

## 2026-08-09 — CIA safehouse status and title statistics

- PT-238 fixed and verified: a strict-headless CIA siege exposed translated
  compound-status labels overwriting their English-width columns. Keep the
  fitted status-cell regression when adding upgrades or changing the 80-column
  base layout.
- PT-239 fixed and verified: universal title statistics now distinguish people
  (`Americanos`) from continents (`Américas`) in Portuguese, with corrected
  canonical English keys. Recheck the title-score column if new counters are
  added.
- The next high-value branch remains a deterministic non-police terminal death
  and post-fight summary for PT-048/PT-148, then a 480×320 responsive-console
  sweep for PT-083.

## 2026-08-09 — Hospital outcome and investment-menu follow-up

- PT-240 fixed and verified: the injury-death result now clears the longer
  hospital destination message before drawing its shorter Portuguese text.
  Keep the shared clearing helper for new day-result branches.
- PT-241 fixed and verified: investment options now fit the translated 80-column
  menu, the bollard label avoids the literal automated wording and invisible
  spacing, and all Portuguese costs use the same `US$` convention.
- The strict-headless pawn-shop route (guns, ammo, tools, equipment, and sell)
  found no additional translation or layout issue.
- Keep PT-048/PT-148, PT-083, and accepted PT-049 in the residual queue.

## Strict-headless CIA-siege follow-up — 2026-08-09

- PT-263 is fixed and verified: the CIA raid opening now says
  `cerca o local chamado {location}`, avoiding masculine/feminine article
  agreement problems for generated site names. Focused tests cover
  `Antigo Motel` and `Estação Esquecida`; the fresh live replay rendered
  `Frigorífico Abandonado` with the neutral phrase and no browser errors.
- The strict-headless route also covered the Portuguese fortification status,
  siege briefing, encounter roster, and map controls with no browser errors.
- PT-259 is fixed and verified: dead combat rows are omitted during the death
  redraw, so negative health values cannot flash beside armor markers. The
  focused renderer regression and fresh 34-turn strict-headless replay both
  passed with fixed 80-column rows and no browser errors.
- Temporary CIA debug hooks were restored. Keep PT-262,
  PT-048/PT-148, PT-083, and accepted PT-049 in the residual queue.

## Strict-headless responsive-console follow-up — 2026-08-09

- A fresh Portuguese route was replayed at 320×240 and 200×150, including
  title/language selection, founder creation, base management, review/profile
  detail, game options, interface options, and content/tone. A font-size-20
  title capture was also checked at 200×150.
- The fixed 80×25 buffer stayed complete, bounded profile ellipses remained
  intentional, Portuguese labels stayed localized, and the browser error
  channel remained empty. No new issue was confirmed.
- Keep PT-083 as a future responsive-readability enhancement, PT-048/PT-148
  as broader random-combat coverage, and accepted PT-049 (historical English
  changelog) out of the fix queue.

## 2026-08-09 — Vegan bar label follow-up

- PT-250 is fixed and verified: the live Portuguese site header changed from
  `SEA — Barra Vegan` to `SEA — Bar Vegano`, with a focused `Site.getName`
  regression protecting the short-label translation.
- The strict-headless before/after captures live under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/vegan-bar-20260809/`.
- Continue with the existing PT-048/PT-148 terminal combat/post-fight route,
  then broaden PT-083 narrow-console coverage; keep accepted PT-049 historical
  changelog English out of the fix queue.

## Strict-headless corporate terminal-death sweep — 2026-08-09

- PT-048/PT-148 coverage advanced: a fresh Portuguese mercenary-siege replay
  exercised randomized final-words and death-reaction templates after 140 live
  combat inputs. `Militar Privado` and `Policial da SWAT` remained localized;
  the browser error channel stayed empty.
- The temporary mercenary fixture and debug flags were restored before
  validation. Keep the broader police-alarm surrender/arrest variants open,
  then continue the PT-083 narrow-console sweep and accepted PT-049 review.

## Strict-headless ultranarrow options follow-up — 2026-08-09

- The Portuguese title, game options, interface options, and content/tone
  screens were replayed at 320×240 and 240×160 with the browser forced into
  Chromium headless mode. A font-size increase to 24 at 240×160 still kept the
  complete 80×25 buffer, controls, and fixed viewport bounds; no browser
  errors or stale English labels appeared.
- No new defect was confirmed. Keep PT-083 as the broader responsive-
  readability enhancement, continue PT-048/PT-148 police-alarm
  surrender/arrest variants, and leave accepted PT-049 historical changelog
  English out of the fix queue.

## Strict-headless police-siege surrender follow-up — 2026-08-09

- PT-264 was confirmed as a residual: a Portuguese police-siege foot chase
  showed the grey `G - Desistir` action, but repeated `G` input was ignored
  after the evasive sequence. The localized SWAT roster and 80-column layout
  were otherwise clean.
- The follow-up fix is now verified: the direct siege path sets the chase
  surrender flag from alive enemy law-enforcement candidates, so the same
  route accepts `G` and renders `Você para e é preso.`. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-siege-fixed-20260809/`.
- Keep only the broader PT-048/PT-148 police-alarm variants, PT-083 as the
  responsive-readability enhancement, and PT-049 as accepted historical
  changelog English in the residual queue.

## Strict-headless surrender-path comparison — 2026-08-09

- The same police siege's base-mode `G - Desistir` action works and is fully
  localized, including confiscation, intact-funds, fortification, trap, and
  anti-aircraft-gun results. This comparison helped isolate the now-fixed
  PT-264 control state rather than the shared surrender result.

## Strict-headless medical-debt roster follow-up — 2026-08-09

- PT-262 is fixed and verified: the Portuguese medical-debt encounter roster
  now renders generated Office Worker rows as `Funcionário`, fitting the
  17-cell name budget without touching clothing, weapon, health, or map cells.
  The full `Trabalhador de Escritório` translation remains available outside
  this compact roster context.
- Focused encounter-layout and context tests pass. A fresh strict-headless
  replay after a full Flutter asset-manifest restart shows six compact rows,
  all 80-column lines, and no browser errors. Before/after captures are under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/medical-role-7990/`.
- Temporary medical-siege and encounter fixtures were restored before
  validation. Keep PT-048/PT-148 random police-alarm variants and PT-083
  narrow-console readability in the residual queue; accepted PT-049 remains
  historical changelog English.

## 2026-08-09 — Police terminal-combat follow-up

- The deterministic Portuguese police-siege route now has live coverage for
  direct fight, randomized injury/death/final-word text, post-fight victory,
  surrender/confiscation, and court defense branches. No new translation or
  layout issue was confirmed; the 80-column buffer and browser error channel
  stayed clean.
- The 480×320 title/options sweep also found no actionable defect. Keep PT-083
  as a future responsive-readability enhancement, retain PT-048/PT-148 for
  broader random police-alarm variants, and leave accepted PT-049 historical
  changelog English out of the fix queue.

## 2026-08-09 — Liberal Agenda context follow-up

- PT-267 is fixed and replayed headlessly across agenda pages 2, 4, and 5:
  the opinion fragment now uses `sobre`, “big money” now uses
  `grandes fortunas`, and the nuclear/death-penalty lines have the required
  Portuguese article and comma.
- The active-law sentence now fits on the 80-column page; intentionally
  bounded ellipses remain on longer policy rows and are not new defects.
- Continue with the broader PT-048/PT-148 police-alarm variants and PT-083
  responsive-readability enhancement. Keep PT-049 historical changelog
  English accepted and out of the fix queue.

## 2026-08-09 — Los Angeles generated-site follow-up

- PT-268 is fixed and verified. The strict-headless LA sweep caught a
  false-friend nursing-home name, two raw-English Hollywood labels, and a
  missing `de` in a vegan co-op name.
- The new nursing-home helper keeps the phrase natural for every random noun
  by inflecting Portuguese adjectives for gender and number. Full Cable News,
  CEO, and nursing-home labels now resolve through the catalog, and the vegan
  co-op template keeps its linking preposition.
- Downtown and Hollywood replay buffers stayed within 80 columns and the
  browser error channel was empty. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/city-sites-7995/`.
- Continue with the broader PT-048/PT-148 police-alarm variants and PT-083
  responsive-readability enhancement. Keep accepted PT-049 historical
  changelog English out of the fix queue.

## Strict-headless New York Oubliette follow-up — 2026-08-09

- PT-269 is fixed and verified: the New York commerce menu and active Oubliette
  route now use `O Calabouço` / `Calabouço` instead of leaking the English full
  and short names through activity and arrival messages.
- The fixed route reached the Oubliette purchase menu with Portuguese action
  labels, no browser errors, and no rows wider than the 80-column console.
- Keep PT-048/PT-148 broader police-alarm variants, PT-083 responsive
  readability, and accepted PT-049 historical changelog English in the residual
  queue.

## Strict-headless Seattle juice-bar follow-up — 2026-08-09

- PT-270 is fixed and verified: generated Portuguese juice bars now use
  `Bar de Sucos`, with the noun/adjective order and `Harmonious` agreement
  checked by focused tests and a fresh University District replay.
- The replay also kept the generated nursing-home, vegan-co-op, and
  internet-café rows inside the 80-column console with no browser errors.
- Continue exploring dynamic site-name families and daily/news events, while
  retaining PT-048/PT-148 police-alarm variants, PT-083 responsive readability,
  and accepted PT-049 historical changelog English in the residual queue.

## Strict-headless Washington National Mall follow-up — 2026-08-09

- PT-271 reproduced a full-site-label gap: the Portuguese National Mall menu
  showed `B - White House` while the compact `WhiteHouse` key was already
  localized.
- Adding the canonical `White House` → `Casa Branca` pair fixed the route;
  the post-restart capture shows `B - Casa Branca`, with no English control
  leak, no browser errors, and no rows beyond 80 columns.
- Continue the daily/news sweep and dynamic site-name families. Keep
  PT-048/PT-148 police-alarm variants and PT-083 responsive readability open;
  accepted PT-049 historical changelog English remains out of the fix queue.

## Strict-headless White House action follow-up — 2026-08-09

- The fixed route was replayed from a fresh Portuguese Washington, DC game.
  It reached `DC — Casa Branca, Nível 2`, the direct-action help page, and the
  exit path without exposing another English site label.
- The roster/header truncation remains bounded by the 80-column console, and
  the browser error channel stayed empty. No new defect was confirmed.
- Keep PT-048/PT-148 police-alarm variants and PT-083 responsive readability
  open; accepted PT-049 historical changelog English remains out of the fix
  queue.

## Strict-headless monthly Guardian coverage — 2026-08-09

- Add monthly-event replay checkpoints to the headless playtester so each
  Guardian source family can be selected deterministically after a fresh save.
- Keep capturing the buffer text and row widths; this caught both the English
  fallback and the 80-column layout risk without a headed browser.
- The AM Radio family is now clean on the exercised route. Continue with the
  remaining monthly source families and the residual police-alarm variants.

## 2026-08-10 — monthly contextual-join follow-up

- When a monthly prompt has multiple loot families, select the same source
  family in successive months so a random story branch can be checked without
  headed UI automation. Preserve the selected-row buffer and max-width result.
- For adjacent translation literals, compose the exact production fragments in
  a focused test as well as replaying a random branch. This catches agreement
  and preposition errors that a single branch may not exercise.
- The remaining high-value play ideas are police-alarm/surrender/terminal
  combat variants (PT-048/PT-148), then a narrow-width option-layout sweep
  (PT-083). Keep all sessions strictly headless and close them after capture.

## 2026-08-10 — police alarm follow-up

- Reconfirm the full police route after each combat-localization change: alarm,
  loudspeaker, siege briefing, foot chase, evasive message, surrender, and
  return to base. Consume every blocking result page before judging the next
  action; combat can queue several enemy messages.
- Current replay found no additional Portuguese defect. If another pass is
  useful, vary the site type to force a car chase and test `P - Pare e
  renda-se`, then return to the residual narrow-layout sweep.

## 2026-08-10 — bank encounter follow-up

- Add deterministic bank-site fixtures to the headless playtester so the teller
  tile, robbery prompt, alarm branch, and return-to-base result can be replayed
  without depending on random map generation.
- Keep a catalog fallback assertion for short encounter messages: the teller
  prompt was easy to miss because the surrounding bank map and controls were
  already translated.
- After the bank branch, return to the residual police car-chase/surrender
  route and the narrow-console option-layout sweep. Keep every browser session
  strictly headless and close named sessions after captures.

## 2026-08-10 — car-chase layout follow-up

- Keep a deterministic car fixture in a disposable local-only hook when
  testing `soloChaseSequence`; it exposes the intro and every action branch
  without relying on random traffic or a headed window. Remove the hook before
  validation and commit.
- Assert both the translated text and maximum row width after each chase action;
  the intro was the only row that failed because it bypassed the paragraph
  renderer while the option and obstacle rows were already bounded.
- Repeat the matrix with a narrow console once PT-083 is scheduled, especially
  `D - Acelere para despistá-los`, `F - Lutar`, `B - Pular fora e correr`, and
  `P - Pare e renda-se`. Keep the strict-headless DOM bridge and close each
  named session after saving one high-signal capture.

## 2026-08-10 — clothing crafting follow-up

- Keep the clothing-crafting route in the focused vocabulary suite: selector
  names, armor descriptions, traits, numeric penalty shells, and the fullest
  armor preview all exercise different translation paths.
- Preserve the fixed-width assertion around the split armor stats. Portuguese
  `Armadura` is longer than the English source label and can silently collide
  with the right-side Dodge/Accuracy/Complexity columns if their origin moves.
- The strict-headless replay is clean after PT-276/PT-277. Residual work stays
  limited to PT-048/PT-148 police-alarm branch coverage and PT-083 narrow-layout
  exploration; keep accepted PT-049 historical changelog English out of the
  queue.

## 2026-08-11 — siege/news/repair follow-up

- Keep the police-siege newspaper composition assertion in the focused suite;
  its plural subject and trailing join space are easy to regress when a source
  fragment is retranslated.
- Retain a deterministic one-day repair route in the headless playtester or a
  focused fixture. Dynamic clothing names must be translated before being
  passed into wash, recycle, and repair messages, and the Portuguese article
  phrase must remain gender-neutral.
- The current replay is clean for PT-278–PT-281. Continue only with the
  remaining PT-048/PT-148 surrender/terminal branches and the PT-083
  narrow-console option-layout sweep. Keep all browser sessions headless.

## 2026-08-11 — all-items/mod-tools follow-up

- Keep composed title-screen explanations on the independent-fragment path;
  the Mod Tools paragraph had complete fragment catalog entries but still fell
  back because the source concatenated them before translation.
- The all-item equipment, review, rescue, and profile sweep was clean after
  PT-282. Continue with random PT-048/PT-148 combat variants and the PT-083
  narrow-console readability sweep; do not treat proper names such as Black
  Bloc as untranslated English without checking their intended Portuguese
  usage.

## 2026-08-11 — CIA siege follow-up

- The deterministic CIA fixture reached the opening suspense, fortified
  safehouse status, flee-or-fight briefing, and live combat screen cleanly in
  Portuguese. Keep the route under the playtester’s strict-headless matrix so
  future CIA text changes are checked at the 80-column boundary.
- No new CIA issue was confirmed. Leave the residual queue focused on random
  PT-048/PT-148 alarm/terminal variants and the PT-083 narrow-console
  readability enhancement.

## 2026-08-11 — infiltrated-title/help-spacing follow-up

- Keep a deterministic infiltrated-agent fixture with a level-four liberal in
  the headless matrix; it exercises dynamic `levelTitle` catalog keys that
  ordinary base-roster screens may not reach.
- Preserve exact-spacing assertions for fixed-width activity help fragments;
  source double spaces can survive translation and become visible typography
  defects even when the row still fits the console.
- PT-283 and PT-284 are fixed. Continue with PT-048/PT-148 random
  alarm/terminal combat variants and the PT-083 narrow-console readability
  sweep, using only strict-headless sessions.

## 2026-08-12 — activity/header follow-up

- Keep the clothing-crafting selector assertion in the Portuguese management
  sweep: a long translated header can lose its suffix even when every option
  row fits the console.
- The compact cost note now renders completely; the activity, skill, paid-class,
  travel, vehicle, and investment screens were clean in the fresh headless
  replay.
- PT-285 and PT-286 are fixed. Continue only with PT-048/PT-148 random
  police-alarm terminal variants and the PT-083 narrow-console readability
  exploration.

## 2026-08-11 — police-terminal context follow-up

- Recheck dynamic site-name joins whenever a siege terminal says that everyone
  was killed; avoid assuming a fixed `no`/`na` contraction for generated names.
- PT-287 is catalog-fixed and regression-covered; perform the fresh-server
  replay before closing it.

## 2026-08-11 — generated street-site follow-up

- Keep phrase-level tests for every `{name} St. ...` site template; translating
  the pieces independently can preserve English street order or leave `St.`
  visible in Portuguese.
- PT-288 is fixed and live-verified. Continue with police/terminal variants and
  other city/district site families rather than assuming one generated-name
  template covers all locations.

## 2026-08-11 — generated apartment/commerce-name follow-up

- Keep phrase-level tests for generated `{name} Condominiums` and composed
  juice-bar names; random district seeds can hide a broken combination.
- Treat parenthetical translations such as `Panda (animal)` and `Nano
  (escala)` as context defects when the source is a generated brand fragment,
  not as useful player-facing explanations.
- PT-289–PT-291 are fixed and verified/covered in strict-headless runs. Sweep
  the remaining city/district families, but keep all temporary debug fixtures
  disabled before validation.

## 2026-08-11 — generated gloss and destination-row follow-up

- PT-292 and PT-293 are fixed. Keep the phrase-level vegan-co-op regression and
  deterministic long-LCS destination-row regression in the focused suite.
- PT-294 and PT-295 are also fixed: generated Internet Café fragments now avoid
  glosses, lowercase brand casing, `Cabeado`, and duplicated `Café`; drug and
  gang proper names no longer carry explanatory parentheses into prose.
- PT-296 and PT-297 are fixed: generated `Emo`, `Hippie`, and `Punk` labels,
  recursive court/combat fragments, and the three gender-sensitive LGBT
  pickup-line templates no longer expose translator-note or slash-style
  wording. Keep the article-bearing helper covered if more rejection lines are
  added.
- Keep the only browser path as the strict-headless CLI harness documented in
  `findings-doc/headless-playtest.md`; do not use the pre-existing headed Chrome
  MCP for future runs.

## 2026-08-11 — founder/activity wording and fixed-column follow-up

- PT-298 is fixed: the bulk activity instruction now fits completely in the
  Portuguese 80-column console and is asserted on both regular and sleeper
  screens.
- PT-299 is fixed: `O destino decide` is a compact, natural founder fate label
  that leaves the `(D para...)` hint untouched. Keep this value short if the
  founder row is retranslated.
- PT-300 and PT-301 are fixed: the biography header and activity-sorting
  description now read naturally in context. The focused title, vocabulary,
  and catalog regressions should remain alongside future translation changes.
- The fresh route stayed within 80 columns and had no playtest errors. Continue
  only with PT-048/PT-148 random police-terminal variants and the PT-083
  narrow-console sweep, using the strict-headless CLI harness.

## 2026-08-11 — narrow activity-header follow-up

- PT-302 is fixed: the Portuguese activity header now uses the compact
  `O que {name} fará hoje?` wording and a width-aware renderer, leaving a
  separator before the funds label even for long generated names.
- Keep the 480×320 activity-header assertion in the strict-headless matrix;
  dynamic names are the useful stress case. Continue through the remaining
  management, travel, media, agenda, and site/combat screens before closing
  the PT-083 narrow-console queue.

## 2026-08-11 — profile date follow-up

- PT-303 is catalog-fixed and regression-covered: use `Nascimento: {day} de
  {month} de {year}` in Brazilian Portuguese, not the English comma before
  the year.
- The rebuilt strict-headless replay is clean. Keep the full profile
  pagination in the narrow-screen matrix because date and identity text share
  the fixed header row.

## 2026-08-11 — route-completion follow-up

- The rebuilt 480×320 Portuguese matrix now covers management, profiles,
  skills/crimes, finance, promotion, squad assembly, agenda/media/news,
  travel/location/site lists, pawn-shop/investment screens, activity/help
  pickers, daily messages, and police-terminal variants.
- PT-302 and PT-303 stayed fixed across the replay; all rows were at most 80
  columns and the playtest-error channel remained empty.
- Keep only future random-seed coverage for already-covered PT-048/PT-148
  terminals and the optional PT-083 responsive-console enhancement in the
  findings backlog.

## 2026-08-11 — agenda/CIA follow-up

- PT-304 is fixed: active-law copy now uses the current Brazilian Portuguese
  compound `semiautomáticas`, with a catalog regression and a live 480×320
  agenda replay.
- The CIA alarm/status/briefing/combat/map route stayed within 80 columns and
  produced no playtest errors. The temporary siege fixture is disabled again.
- Continue only with random terminal-seed variation for PT-048/PT-148 and the
  optional PT-083 responsive-console enhancement; do not reopen the accepted
  English changelog body.

## 2026-08-11 — media/security follow-up

- A strict-headless AM Radio route finally exercised a generated
  `Security Guard` roster. Keep exact-capitalization coverage for generated
  creature type names; lower-case fragments used in newspaper prose are a
  separate translation context.
- PT-305 and PT-306 are fixed and covered. Continue the remaining police
  terminal seed variation and narrow-console exploration, and exercise a
  successful broadcast result when a deterministic media fixture is available.

## 2026-08-11 — contextual/layout follow-up

- PT-307–PT-316 are fixed and replayed in a fresh strict-headless Portuguese
  bundle. Keep the exact-context regressions beside the catalogs: generated
  founder choices, siege fragments, agenda levels, vehicle instructions, and
  undercover prompts are all sensitive to capitalization, grammatical number,
  or the surrounding screen.
- PT-317 confirms that destination names need the same width-aware treatment
  as other daily messages. When adding new generated-name templates, exercise
  the longest site name at 480×320 and require an ellipsis rather than silent
  truncation.
- The fresh arrival route stayed at or below 80 columns with no bridge errors.
  Continue strict-headless random-seed variation for PT-048/PT-148 police
  terminals and keep PT-083's responsive-console idea optional.

## 2026-08-11 — dealership interpolation follow-up

- PT-318 confirms that XML-backed vehicle names, colors, and choice labels
  need explicit translation at the interpolation call site; catalog coverage
  alone does not translate ordinary parameters.
- PT-319 confirms that biography translations must remain valid for every
  runtime gender supplied to a `{pronoun}` placeholder. Keep neutral noun
  phrasing when the source does not expose a gendered noun parameter.
- Preserve the headless-only browser profile and keep the raw/fixed dealership
  captures under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/` for future
  regression replay.

## 2026-08-11 — narrow and police-terminal verification follow-up

- A strict-headless Portuguese matrix at 240×160 through 480×320 covered the
  founder, management, travel, media, direct-action help, and site-map routes;
  all rows stayed within 80 columns and the browser-error channel stayed empty.
- A temporary police-siege fixture covered warning, loudspeaker, surrender,
  confiscation/cleanup, SWAT combat briefing, foot-chase, and arrest. No new
  translation or layout defect was reproduced. Temporary fixture edits were
  restored before handoff.
- Residuals are limited to future random-seed PT-048/PT-148 terminal variation
  and the optional PT-083 responsive-console readability enhancement.

## 2026-08-11 — site-map label follow-up

- PT-320 is fixed: full and compact site-map overlays now lay out translated
  special labels using the localized width, fitting or ellipsizing them inside
  their map regions. Keep the focused `pt_br_map_overlay_test.dart` beside any
  future map-label changes.
- The fresh police-station route remained strict-headless and clean but ended
  on a random police encounter before a lockup-special tile could be held for a
  screenshot. The deterministic renderer test covers that missing tile state.
- Two additional fresh roster seeds kept the police labels and locked-door
  prompt Portuguese, with no bridge errors or width violations. Keep the raw
  route summary in the durable playtest scratchpad for future comparisons.
- The only open playtest ideas remain future random-seed PT-048/PT-148 police
  terminal variation and PT-083's optional responsive-console enhancement.

## 2026-08-11 — trial-language follow-up

- Strict-headless month-end replay reached multiple court notices and exposed
  source-only `{name}` templates whose Portuguese agreement assumed a male
  defendant. PT-323 and PT-324 are fixed and covered; keep future trial routes
  seeded with female and nonbinary names so new catalog edits do not reintroduce
  the same class of error.
- Continue random PT-048/PT-148 police-terminal variation and the optional
  PT-083 responsive-console enhancement.

## 2026-08-11 — month-end amendment/election follow-up

- PT-321 is fixed: constitutional-amendment fragments now compose grammatical
  Brazilian Portuguese across their line boundaries.
- PT-322 is fixed: election-result prompts clear the previous screen row before
  writing the shorter Portuguese text, preventing stale suffixes.
- The strict-headless founder-debt/sleeper route covered the remaining slow
  month-end and sleeper-agent surfaces through February with no new defect.
- Keep random PT-048/PT-148 police-terminal seed variation and PT-083's
  optional responsive-console enhancement as the only open playtest ideas.

## 2026-08-11 — police combat variation

- Keep the strict-headless siege fixture able to exercise both surrender and
  fight branches at 480×320. The combat roster intentionally lowercases a
  conservative role when its health makes it flee; preserve that state marker
  while checking that the generated role remains localized.
- The fresh variation stayed clean. Continue only with future random terminal
  seeds and the optional PT-083 responsive-console sweep.

## 2026-08-11 — rescued-hostage terminal follow-up

- A strict-headless Portuguese police-siege fixture reached the singular
  rescued-hostage terminal. Before the fix it rendered the raw English role
  name and masculine agreement: `Police Officer é levado para custódia e
  reabilitado.`
- PT-327 is fixed and verified in a rebuilt 480×320 headless replay. The
  terminal now renders `As autoridades colocam Oficial de Polícia sob
  custódia para reabilitação.`, with no rows wider than 80 columns and an empty
  `#lcs-playtest-errors` channel. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-hostage-20260811/`.
- Singular arrested and rescued-hostage branches are now covered. The only
  open playtest ideas are future random PT-048/PT-148 police-terminal seeds
  and the optional PT-083 responsive-console readability enhancement.

## 2026-08-11 — unoccupied daily police-raid follow-up

- A strict-headless Portuguese route forced an empty `Escola Velha` warehouse
  with one conservative `Police Officer` so the daily no-Liberal police-raid
  branch ran. Before the fix it showed `Conseguiram resgatar Police Officer.`
  and `Os policiais invadiram o Escola Velha, um esconderijo desocupado.`;
  the latter also lost its final period at the 80-column edge.
- PT-328 and PT-329 are fixed and verified in a rebuilt 480×320 replay. The
  route now shows `Conseguiram resgatar Oficial de Polícia.` and
  `Os policiais invadiram o local chamado Escola Velha, um esconderijo vazio.`
  with no rows wider than 80 columns, intact punctuation, and an empty
  `#lcs-playtest-errors` channel. Evidence is under
  `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/police-unoccupied-20260811/`.
- Both daily no-Liberal raid branches now use localized creature names and
  width-aware opening messages. The only open playtest ideas are future random
  PT-048/PT-148 police-terminal seeds and optional PT-083 responsive-console
  readability work.
