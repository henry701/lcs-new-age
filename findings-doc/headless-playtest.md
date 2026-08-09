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

Use screenshots only when investigating glyph rendering or fixed-width layout.
For translation checks, assert against the DOM buffer and option list instead
of OCR.
