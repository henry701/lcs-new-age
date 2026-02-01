# Localization Migration Progress Report

## Summary
Converting console output strings from string interpolation/concatenation to parameterized form for proper internationalization support.

## Infrastructure (Complete - Do Not Modify)
- `lib/engine/engine.dart` - Console wrappers (`addstr`, `mvaddstr`, etc.) support `params` and `noTranslate` parameters
- `lib/i18n/i18n.dart` - `LcsI18n` class with translation + formatting support
- `lib/l10n/*.arb` - Translation files exist (do not touch during Phase 1)

## Remaining Work
The codebase has **~1300 console output calls across 77 files** requiring conversion. Focus on high-priority files first:

### High Priority (many calls with string interpolation):
- `lib/sitemode/fight.dart` - ~159 calls
- `lib/daily/dating.dart` - ~122 calls
- `lib/sitemode/siege.dart` - ~110 calls
- `lib/basemode/review_mode.dart` - ~103 calls
- `lib/politics/elections.dart` - ~86 calls (labels fixed, body text remains)
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
addstr("{name} has been rescued", params: {"name": creatureName});
mvaddstrc(
  y, x, lightGray,
  "{recruiter} shares {topic}",
  params: {"recruiter": p.name, "topic": topic},
);
addOptionText(
  y, x, "A",
  "A - Come to {location}...",
  params: {"location": location},
);
```

## Key Principles
1. **Templates with prose**: Never use `noTranslate: true` when the template contains translatable text
2. **Player-named entities only**: Use `noTranslate: true` ONLY when printing pure player content (names, numbers) with no translatable prose
3. **Hardcoded text**: Can be translated normally, no parameters needed
4. **Mixed content**: Use params for variables; the template text will be translated
5. **Search for interpolations**: Use `grep -n '\$' lib/<file>.dart` to find patterns needing conversion

## Next Steps
1. Pick a file from High Priority list
2. Search for string interpolation patterns (`$variable`, `${expression}`)
3. Convert each to parameterized form
4. Run `flutter analyze` after each file
5. Run `flutter test` after every 3-5 files
6. Update this document to mark completed files

## Reference Documentation
- `PLAN.md` - Full i18n implementation plan
- `TRANSLATION_WORKFLOW.md` - Translation process (for Phase 2+)
