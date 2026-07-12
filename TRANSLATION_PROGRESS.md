# Translation Status (Canonical)

This is the only status file for localization progress.
Do not commit fixed percentages or counts here; compute them from commands.

## Status Commands

Human-readable status (default: `en_US -> pt_BR`):

```bash
dart run scripts/translation_status.dart
```

Machine-readable status:

```bash
dart run scripts/translation_status.dart --json
```

Alternative locale comparisons:

```bash
dart run scripts/translation_status.dart --locale=de
dart run scripts/translation_status.dart --source-locale=en_US --locale=fr
```

Per-part metrics for shard-level prioritization:

```bash
dart run scripts/translation_status.dart --per-part
```

Single-part status (accepts values like `7`, `07`, `part07`):

```bash
dart run scripts/translation_status.dart --locale=pt_BR --part=part07
```

## Catalog Sync (No Translation Loss)

Refresh catalogs from code with:

```bash
dart run scripts/find_translatable_strings.dart
```

This sync is add-only for missing keys and preserves existing values.
Already translated entries are not overwritten.

## Scope

- Status and coverage: this file + command output.
- Architecture and roadmap: `PLAN.md` (do not edit) + `PLAN_NOTES.md`.
- Source-sweep cleanup, name+fragment templating, and stale-key pruning are separate from the coverage commands above.
- Note: `sourceKeys` in `translation_status --json` reflects keys present in en_US ARB shards (includes historical dead keys). Live extract count from `find_translatable_strings.dart --print-only` is authoritative for current source. Gap = dead keys eligible for prune after confirmation of no live references.

## Interpolation Sweep Verification

The source sweep is complete only when this gate exits successfully:

```bash
dart run scripts/interpolation_status.dart --check --json
```

The command rejects both unclassified wrapper-adjacent interpolation and stale
entries in `scripts/interpolation_allowlist.json`. The allowlist may contain
only documented non-prose output (diagnostics, control markup, numeric/layout
values, and currency values passed into a complete template). Full-corpus
inspection remains available through `dart run scripts/interpolation_status.dart
--all --json`; the static i18n suite independently enforces the priority
gameplay areas.
