# Translation Templatization TODO

## Overview
This document tracks all locations where `mvaddstrc` and `addstrc` calls need to be refactored
to use parameterized templates for proper translation support.

## Priority 1: Multi-Part Sentences (HIGH)
These locations display entity names followed by actions/descriptions, which currently
prevent translators from reordering subject/verb/object.

### talk/talk_outside_combat.dart
- **Lines 31-36**: ✅ DONE - Refactored to use `mvaddstrcx` with color markers
  - Template: `"&W{name}&w talks to &{targetColor}{target}&w {ageGender}:"`
  - Allows translators to reorder while preserving colors

### talk/talk_in_combat.dart  
- **Lines 27-29**: ✅ DONE - Refactored to use `mvaddstrcx` with color markers
  - Template: `"&W{name}&w talks to &{targetColor}{target}&w:"`
  - Uses target's alignment color dynamically

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

### Color Marker Support (IMPLEMENTED ✅)
The `mvaddstrcx` and `addstrcx` functions now support color markers in templates:

```dart
// Color markers: &X for foreground, ^X for background
// X is a ColorKey character (W=white, R=red, G=lightGreen, etc.)
mvaddstrcx(
  9, 1, white,
  "&W{name}&w talks to &{targetColor}{target}&w {ageGender}:",
  params: {
    "name": a.name,
    "target": tk.name,
    "targetColor": tk.align.colorKey, // "G", "Y", or "R"
    "ageGender": creatureAgeAndGender(tk),
  },
);
```

This allows:
- Translators to reorder the entire sentence
- Dynamic color insertion via parameters
- Multiple color switches within a single translatable string

### ColorKey Reference
- `W` = white (bright)
- `w` = lightGray
- `G` = lightGreen
- `g` = green  
- `R` = red
- `r` = darkRed
- `Y` = yellow
- `B` = blue
- `C` = lightBlue
- `P` = pink
- `p` = purple
- etc.

### Short-term Solution
For now, the approach is:
1. ✅ **Multi-color templates**: Use `mvaddstrcx`/`addstrcx` with color markers
2. **Single-color templates**: Use regular `mvaddstrc` with templates
3. **Entity labels**: Use `noTranslate: true` for standalone names

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
