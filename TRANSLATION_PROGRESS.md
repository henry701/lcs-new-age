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
- Architecture and roadmap: `PLAN.md`.
