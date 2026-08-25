# PT-470: Factory and union worker creature labels leak English in Portuguese

- Severity: Medium (P2 localization regression)
- Type: Creature XML role/type labels
- Status: Confirmed deterministic runtime display gap; fixer not started
- Source snapshot: `e5fd92d089cf8c44f76abc55a8d2d4834d6dec36`
- Probe: `/home/henry/tmp/agent-tmp/lcs-new-age-playtest/prober2-20250825-r2/creature-alias-probe.log`

## Reproduction

1. Initialize `LcsI18n` with `pt_BR`.
2. Build a creature from either the `CREATURE_WORKER_FACTORY_NONUNION` or
   `CREATURE_WORKER_FACTORY_UNION` XML type, or render its profile/review row.
3. Inspect the localized creature name.

The XML defines `Factory Worker` as the type name for both factory-worker types
and `Union Worker` as the union encounter alias:

- `assets/xml/creatures.xml:397-399`
- `assets/xml/creatures.xml:436-438`

`creatureBuilder` assigns the encounter name at
`lib/creature/creature_builder.dart:20-23`. The normal profile/review display
uses `localizedCreatureNameValue` at
`lib/common_display/common_display.dart:37-49`, then inserts it into the
profile header at `lib/common_display/print_creature_info.dart:70-76`.

The current Portuguese catalog has no keys for either label. The deterministic
runtime probe prints these raw outputs:

- `localizedCreatureNameValue('Factory Worker', 'Factory Worker')` -> `Factory Worker`
- `localizedCreatureNameValue('Union Worker', 'Factory Worker')` -> `Union Worker`

This is a runtime display-path confirmation, not a static XML-only report. The
same probe also recorded missing adjacent labels `Amateur Magician`, `Cable
News Anchor`, and `Mail Carrier`; those remain triage candidates rather than
being folded into this focused ticket.

## Expected

The Portuguese profile/review display should translate the role labels while
preserving English output in `en_US`. Suggested values are `Trabalhador de
Fábrica` and `Trabalhador Sindicalizado`; confirm wording with the fixer before
catalog changes.

## Verification status

- Isolated `flutter test /tmp/prober2_r2_creature_probe_test.dart`: passed; the
  probe log is the evidence artifact above.
- Isolated clone generated 31 g.dart files locally only; no generated files or
  source edits were made in the shared checkout.
- No natural headless encounter replay was claimed. A fresh route should target
  a factory/union worker profile or talk screen for closure.
