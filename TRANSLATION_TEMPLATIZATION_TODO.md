# Translation Templatization TODO

## Overview
This document tracks all locations where `mvaddstrc` and `addstrc` calls need to be refactored
to use parameterized templates for proper translation support.

## Priority 1: Multi-Part Sentences (HIGH)
These locations display entity names followed by actions/descriptions, which currently
prevent translators from reordering subject/verb/object.

### talk/talk_outside_combat.dart
- **Lines 31-36**: Multi-color display: `a.name` (white) + " talks to " (lightGray) + `tk.name` (color) + age/gender
  - **Issue**: 3 different colors, complex to template
  - **Solution**: Requires color marker support in templates (e.g., "{name:white} talks to {target:color}")

### talk/talk_in_combat.dart  
- **Lines 27-29**: `liberal.name` (white) + " talks to " + `target.name` (target color) + ":"
  - Similar to talk_outside_combat.dart pattern
  - **Issue**: Target name uses alignment color

### sitemode/fight.dart
- **Lines 229, 251**: `mvaddstrc(9, 1, white, e.name)` - Enemy name display
  - Check if followed by action text that should be combined

### sitemode/site_display.dart
- **Line 1167**: `mvaddstrc(carsy[v], v * 20 + 1, e.align.color, e.name)`
  - Enemy name in encounter list, check context for action suffixes

### basemode/review_mode.dart
- **Line 944**: `mvaddstrc(y, 46, tempp.align.color, tempp.type.name)`
  - Creature type name with alignment color
  
- **Lines 1250-1256**: Multi-color bracket and name display
  - Complex multi-part colored display with brackets

### common_display/print_creature_info.dart
- **Line 744**: `addstrc(white, cr.name)` - Name display
  - Check context for combining with following text

### daily/activities/car_theft.dart
- **Line 329**: `mvaddstrc(y++, 0, white, cr.name, noTranslate: true)`
  - Already uses noTranslate, check if combined with action

## Priority 2: Simple Name Displays (MEDIUM)
These are single name displays that are OK with `noTranslate: true` since they're just
entity labels, not part of sentences.

- **basemode/base_mode.dart:386**: `mvaddstrc(8, 1, lightGray, activeSquad?.name ?? "")`
- **basemode/plan_site_visit.dart:30**: `mvaddstrc(8, 0, lightGray, area.name)`
- **sitemode/chase_sequence.dart:249**: `mvaddstrc(0, 0, lightGray, chaseSequence!.location.name)`
- **sitemode/chase_sequence.dart:1436**: `mvaddstrc(9, 1, red, p.prisoner!.name)` - Check context
- **items/clothing.dart:261**: `addstrc(baseColor, full ? type.name : type.shortName)`

## Priority 3: Already Properly Templated (DONE)
These are good examples of the target pattern:

- **daily/dating.dart:1009**: `addstrc(purple, "{name} has been arrested.", params: {...})`
- **daily/advance_day.dart:684,734**: `mvaddstrc(8, 1, white, "{name} has died.", params: {...})`
- **justice/trial.dart:34,542**: Proper use with templates
- **talk/drop_a_pickup_line.dart**: Multiple proper uses
- **talk/talk_about_issues.dart**: Multiple proper uses
- **sitemode/miscactions.dart:75,198,331**: Proper template usage
- **sitemode/stealth.dart:309,350-410**: REFACTORED - now uses templates

## Implementation Notes

### Color Marker Support (FUTURE)
To properly handle multi-color templates like:
```dart
mvaddstrc(9, 1, white, "{name:white} talks to {target:color} {ageGender}", 
  params: {"name": a.name, "target": tk.name, "ageGender": ...})
```

Would require extending `LcsI18n.processString` to:
1. Parse color markers from parameter names or special syntax
2. Switch colors mid-string during output
3. Or generate ANSI/color codes in the console layer

### Short-term Solution
For now, the approach is:
1. **Single-color templates**: Combine name + action into one color (already done in stealth.dart)
2. **Multi-color displays**: Keep separate calls but ensure translatable parts use templates
3. **Entity labels**: Keep with `noTranslate: true` since they're just identifiers

### Files to Review (In Order of Priority)
1. `talk/talk_outside_combat.dart` - Complex multi-color conversation headers
2. `talk/talk_in_combat.dart` - Similar conversation headers
3. `basemode/review_mode.dart` - Squad/creature name displays
4. `sitemode/fight.dart` - Combat enemy name displays
5. `sitemode/site_display.dart` - Site encounter displays

## Testing
After each refactoring:
- Run `flutter test` to ensure no regressions
- Check that parameterized strings appear correctly in English
- Verify no new "Missing translation" logs for player content

## Related Commits
- Commit 04173b9: Initial noTranslate fixes for custom names/slogans
- Commit 2cb006d: Multi-addstr sequence refactoring
- Commit 26ee7a1: stealth.dart color + template refactoring
