# Headless playtest capture

The Flutter web build exposes an opt-in DOM bridge for automation. Start the
web server as usual, then open:

```text
http://127.0.0.1:7361/?playtest=1
```

When the query flag is present, `#lcs-playtest-buffer` contains the current
80×25 console buffer and its `data-options` attribute contains option-looking
 lines as JSON. This is intended for headless browser inspection; it is
 off-screen and inactive in normal builds. A playtest can capture a stable
 screen with:

```sh
export AGENT_BROWSER_HEADED=0
export AGENT_BROWSER_ARGS='--headless=new,--ozone-platform=headless,--disable-dev-shm-usage,--disable-cache'
```

The repository also includes `agent-browser.json`, which makes headless mode
the project default and supplies the same Chromium flags. Keep the environment
variables above in CI or shell snippets that may run from another directory;
explicit `--headed` remains an opt-in override for non-playtest work.

Keep those variables set for every `agent-browser` invocation. Do not use a
headed Chrome/Edge device for playtesting; the CLI session should remain
headless for the entire replay.

```js
JSON.parse(document.querySelector('#lcs-playtest-buffer').dataset.options)
document.querySelector('#lcs-playtest-buffer').textContent
```

To send a key without relying on browser focus, set the bridge command
attribute and wait for the next buffer update:

```js
document.querySelector('#lcs-playtest-buffer').setAttribute('data-key', 'l')
```

Named keys are accepted as well (`Enter`, `ArrowLeft`, `Escape`, and so on).
The bridge consumes the attribute once and records the last consumed command in
`data-last-key` for diagnostics.

## 2026-08-12 route note

The mass-shooting/founder follow-up used the strict-headless wrapper and DOM
buffer only; no headed browser was opened or focused. Captures and metrics are
under `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/mass-shooting-context-20260812/`.
The live route covered hospital discharge, month-end news, courtroom notices,
and Portuguese newspaper chrome. The article-specific school variants are
validated deterministically in `test/newspaper/herald_translation_test.dart`.

Use screenshots only when investigating glyph rendering or fixed-width layout.
For translation checks, assert against the DOM buffer and option list instead
of OCR.

## 2026-08-12 profile-boundary replay

The rebuilt Portuguese profile route was replayed strictly headless with
`HeadlessChrome/150.0.0.0`. Already-localized weapon, clothing, task, Review,
sleeper, and equipment site values produced no false missing-translation
warnings after the display-boundary fixes. An armored profile row now renders
`Liberal +…` rather than the merged `Liberal+…` form. The final bridge measured
25 rows × 80 columns, no document overflow, and an empty
`#lcs-playtest-errors` channel. Screenshot:
`/home/henry/tmp/agent-tmp/lcs-new-age-playtest/profile-armor-fixed-8901.png`.

## 2026-08-12 CIA briefing telemetry replay

The rebuilt Portuguese CIA fixture was replayed through the opening siege
briefing with strict-headless Chromium (`HeadlessChrome/150.0.0.0`). The
display remained 25×80 with no document overflow and an empty
`#lcs-playtest-errors` channel. A prior run had logged the fully translated
briefing sentence as a missing key because `addparagraph` translated an output
from `LcsI18n.processString` a second time. The corporate and rural variants
shared the same boundary. They now mark those rendered paragraphs
`noTranslate`; the focused regression and clean replay show no warning.

Evidence: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/cia-briefing-fixed-8903.png`.
