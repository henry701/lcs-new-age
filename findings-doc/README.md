# Portuguese Playtest Findings

Exploratory translation and layout review of the local `feature/localization`
build, played in Brazilian Portuguese.

## Sessions

- Dates: 2026-07-18 through 2026-07-26
- Build source: local repository
- Locale: `pt_BR`
- Focus: untranslated text, mistranslations, context errors, clipping,
  wrapping, alignment, and unclear controls
- Initial constraint: findings and evidence only. The user later authorized
  fixes, so resolved findings now include regression tests and implementation
  notes.
- Latest replay: 2026-07-26 headless Portuguese verification on
  `feature/localization`; it resolved PT-025–PT-035 and the replay details are
  recorded in `play-log.md`.
- Latest bounded route: 2026-08-24 strict-headless Portuguese Strategy 61 r3
  replay, recorded in `play-log.md`; it reached a durable May 1 checkpoint with
  no natural victory, game-over, or new ticket.

## Lightweight agent method

The playtest uses a hybrid observation/action loop:

1. Prefer semantic keyboard actions for inexpensive, deterministic
   interaction with the turn-based game.
2. Capture screenshots at each materially different screen for visual review.
3. Compare the visible Portuguese against its gameplay context, not only
   against isolated catalog entries.
4. Record state and reproduction steps so findings are verifiable.
5. Stop or change paths when repeated actions no longer expose new UI.

This is deliberately lighter than a vision-only autonomous agent: the game
already exposes reliable keyboard actions, so screenshots are reserved for
observation and visual QA. The approach follows recent work on verifiable game
state and hybrid GUI agents:

- [GameWorld: Towards Standardized and Verifiable Evaluation of Multimodal Game Agents](https://huggingface.co/papers/2604.07429)
- [GUIrilla: A Scalable Framework for Automated Desktop UI Exploration](https://huggingface.co/papers/2510.16051)
- [ShowUI: One Vision-Language-Action Model for GUI Visual Agent](https://huggingface.co/papers/2411.17465)
- [ScreenAgent: A Vision Language Model-driven Computer Control Agent](https://huggingface.co/papers/2402.07945)

## Documents

- `findings.md`: prioritized findings with evidence and reproduction steps
- `play-log.md`: explored paths and observed screens
- `headless-playtest.md`: DOM buffer and option-capture workflow for automation
- `screenshots/`: visual evidence referenced by the findings
