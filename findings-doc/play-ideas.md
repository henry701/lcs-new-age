# Portuguese Playtest Scratch Pad

Persistent route ideas for the playtester. Mark each route with evidence in
`play-log.md` after completing it; promote only confirmed defects to
`findings.md`.

## Current residuals to verify after fixes

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
  at 480×320; hide the development `DEBUG` ribbon in playtest/release builds.
- PT-084: reserve a date column in the newspaper header so the final section
  tab cannot collide with `7 de jan de 2023` (and other two-digit dates).
- PT-085: audit the random newspaper catalog/article templates for untranslated
  words (`rapist`, `himself`) and malformed Portuguese grammar.

## Recruitment/police replay follow-ups (2026-07-29)

- PT-086 withdrawn after source/replay review: the Felix meeting was the
  founder's own session, so the recruiter-name mismatch was not reproduced.
- PT-087: clear the prior activity banner before drawing the next result; the
  police-station travel replay left `Recrutando.o.` after a shorter message.
- PT-088: audit gender agreement in recruitment acceptance prose (`ansioso` for
  female Ariana; prefer `ansiosa` or a neutral phrasing).
- PT-089: route all generic profession labels in pickup-line responses through
  `localizedCreatureName` (`College Student` leaked while the profile was
  `Estudante Universitário`).
- Re-run a deterministic police alarm fixture for Chief of Police, surrender,
  arrest, injury/body-part, and post-combat screens; normal police-station
  arrival was localized but did not spawn an encounter.
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
- PT-094: complete the remaining composed help fragments. Runtime evidence
  still includes `out of style`, `cause`, `They donating to politicians`,
  `risks`, `on Street Smarts and Business`, and `out to get you` in Portuguese
  help bodies even after the complete Guardian/Disobedience paragraph fix.
- Re-run the police fixture with a deterministic arrest outcome and inspect
  arrest-specific summary text; surrender and victory were localized, but
  arrest was not reached in this pass.
- The intercity travel branch still needs a funded fixture (or deterministic
  travel harness) to visit every city; this replay could verify only Seattle
  districts/sites because the founder had $7 versus the $100 ticket.

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

## Follow-up routes from the 2026-07-26 broad sweep

- Restart the headless web server after the fixes, then replay Veículos, city
  travel, high scores, and save-detail management for clipping and English leaks.
- Seed a save with a two-digit in-game day and confirm the compact date is fully
  visible in both date columns.
- Trigger a car chase and tooth injury once the combat harness can inject a
  deterministic encounter; capture the composed sentence, not only fragments.
- Keep changelog English-only unless product scope changes; its localized notice
  currently documents the limitation for players.

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
