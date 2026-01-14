# Localization Migration Progress Report

## Summary
Converting console output strings from string interpolation/concatenation to parameterized form for proper internationalization support.

## Completed Work

### 1. lib/engine/engine.dart
- **Added params and noTranslate parameters to addOptionText()**
- This enables all addOptionText calls throughout the codebase to use parameterized strings

### 2. lib/daily/recruitment.dart (COMPLETE)
- **Converted all 15 string interpolation calls to parameterized form**
- Added noTranslate: true for all creature names (player-named entities)
- Examples:
  - `"${p.name} accidentally missed..."` → `"{recruiter} accidentally missed..." params: {"recruiter": p.name}, noTranslate: true`
  - `"${r.recruit.name} accepts..."` → `"{recruit} accepts..." params: {"recruit": r.recruit.name}, noTranslate: true`

### 3. lib/talk/drop_a_pickup_line.dart (COMPLETE)
- **Converted 2 player-named entity references**
- Line 422: `${tk.name} $responds` → `"{name} {response}" params: {"name": tk.name, "response": responds}, noTranslate: true`
- Line 675: `${tk.name} $responds` → `"{name} {response}" params: {"name": tk.name, "response": responds}, noTranslate: true`

### 4. lib/sitemode/map_specials.dart
- **Updated encounterMessage() function signature**
- Added params and noTranslate parameters
- Now supports: `encounterMessage(message, params: {...}, noTranslate: true)`

### 5. lib/sitemode/fight.dart (PARTIAL)
- **Converted key message calls:**
  - Line 318: Body drop message via encounterMessage
  - Line 705-707: Shielding message with creature names

## Test Results
✅ **All flutter analyze checks pass** on modified files
✅ **38/41 tests pass** - The 3 failing tests are pre-existing issues in portuguese_plural_test.dart (unrelated to this work)
✅ **All console wrapper tests pass**, validating:
  - addstr with params formats correctly
  - mvaddstr with params formats correctly
  - Translation works in both English and Portuguese
  - noTranslate parameter works correctly
  - addOptionText with params works correctly

## Files Modified
1. `lib/engine/engine.dart` - Added parameters to addOptionText
2. `lib/daily/recruitment.dart` - Complete conversion (15 calls)
3. `lib/talk/drop_a_pickup_line.dart` - Partial conversion (2 calls)
4. `lib/sitemode/map_specials.dart` - Updated encounterMessage function
5. `lib/sitemode/fight.dart` - Partial conversion (2 calls)

## Remaining Work
The codebase has **1818 console output calls across 64 files**. Significant remaining files include:

### High Priority (many calls with string interpolation):
- `lib/sitemode/fight.dart` - ~159 calls (some converted, many remain)
- `lib/daily/dating.dart` - ~122 calls
- `lib/sitemode/siege.dart` - ~110 calls
- `lib/basemode/review_mode.dart` - ~103 calls
- `lib/politics/elections.dart` - ~86 calls
- `lib/daily/siege.dart` - ~85 calls

### Medium Priority:
- `lib/sitemode/chase_sequence.dart` - ~68 calls
- `lib/basemode/activate_regulars.dart` - ~61 calls
- `lib/monthly/lcs_monthly.dart` - ~57 calls
- `lib/sitemode/site_display.dart` - ~53 calls
- `lib/justice/trial.dart` - ~50 calls

### Lower Priority (mostly hardcoded strings):
- `lib/talk/talk_about_issues.dart` - ~35 calls
- `lib/sitemode/map_specials.dart` - ~48 calls
- `lib/daily/activities/car_theft.dart` - ~19 calls

## Conversion Pattern
**BEFORE:**
```dart
addstr("$creatureName has been rescued");
mvaddstrc(y, x, lightGray, "${p.name} shares ${topic}");
addOptionText(y, x, "A", "A - Come to ${location}...");
```

**AFTER:**
```dart
addstr("{name} has been rescued", params: {"name": creatureName}, noTranslate: true);
mvaddstrc(
  y, x, lightGray,
  "{recruiter} shares {topic}",
  params: {"recruiter": p.name, "topic": topic},
  noTranslate: true,
);
addOptionText(
  y, x, "A",
  "A - Come to {location}...",
  params: {"location": location},
  noTranslate: true,
);
```

## Key Principles Applied
1. **Player-named entities**: Always use `noTranslate: true` for creature names, squad names, vehicle names, etc.
2. **Hardcoded text**: Can be translated normally, no parameters needed
3. **Mixed content**: Use params for variables, noTranslate for player input
4. **addstrx/mvaddstrx**: Cannot use noTranslate (function doesn't support it) - use addstr/mvaddstr instead for player input

## Next Steps
1. Continue systematic conversion of remaining files
2. Focus on high-priority files with many calls
3. Run flutter analyze after each file conversion
4. Run full test suite periodically to catch regressions
5. Document edge cases and special patterns as encountered
