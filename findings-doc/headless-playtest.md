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

```js
JSON.parse(document.querySelector('#lcs-playtest-buffer').dataset.options)
document.querySelector('#lcs-playtest-buffer').textContent
```

Use screenshots only when investigating glyph rendering or fixed-width layout.
For translation checks, assert against the DOM buffer and option list instead
of OCR.
