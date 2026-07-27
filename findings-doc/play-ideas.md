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
