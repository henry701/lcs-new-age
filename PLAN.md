# LCS-New-Age Localization Implementation Plan

## Overview
This document outlines a phased approach to implementing internationalization (i18n) and localization (l10n) for Liberal Crime Squad: New Age, preserving the existing curses-style architecture while enabling multi-language support.

## Critical Principle: Templating Before Translation

**Translation cannot work without proper templating first.** The translation system uses named placeholders (`{key}`) that are replaced at runtime. If strings use string interpolation (`"$name has been rescued"`) or concatenation, they cannot be translated properly because:
1. The placeholders get embedded in the English text
2. Translators cannot rearrange word order for their language
3. Parameters like names get stuck in the middle of text

**Phase 1 (Templating) must complete before translation work begins.**

## Architecture Decisions

### Translation Format
- **Primary**: ARB (Application Resource Bundle) format for Dart/Flutter compatibility
- **Export**: PO (Portable Object) format for translator tooling compatibility
- **Tools**: Dart `intl` package with custom ARB→PO conversion scripts

### Message Key Strategy
- **Source Text Keys**: Use English strings as identifiers for codebase readability
- **Test Coverage**: Create analyzers to detect i18n coverage breakage during testing
- **Fallback**: English text as ultimate fallback for missing translations

### Language Support
- Left-to-right languages only (current)
- Dynamic language switching
- Manual translation management, community-ready architecture

## Phase 1: String Templating (CRITICAL)

**Objective:** Convert ALL console output to use parameterized API.

### Pattern Conversion Rules

**BEFORE (Not Translatable):**
```dart
addstr("$name has been rescued.");
mvaddstr(10, 5, "${cr.name} asks around for a $name...");
addstr("You have " + count + " health");
```

**AFTER (Translatable):**
```dart
addstr("{name} has been rescued.", params: {"name": name});
mvaddstr(10, 5, "{squad} asks around for a {location}", params: {"squad": cr.name, "location": name});
addstr("You have {count} health", params: {"count": count});
```

### noTranslate Decision Tree

Use `noTranslate: true` when the ENTIRE output is player-generated content with no translatable text:

```dart
// YES - Pure player content, nothing to translate
addstr(playerName, noTranslate: true);
addstr("0", noTranslate: true);
addstr(someNumber.toString(), noTranslate: true);

// NO - Template with prose, should translate
addstr("{name} has been rescued.", params: {"name": playerName});
// ^ Template "has been rescued" should translate to other languages

// NO - Template with prose, wrong use of noTranslate
addstr("{name} has been rescued.", params: {"name": playerName}, noTranslate: true);
// ^ WRONG! This prevents the template from translating!
```

**When `noTranslate: true` is set, the entire string is returned as-is** - both the template AND all parameters skip translation lookup. Use it only when nothing in the output needs translation.

**Do not pass empty params maps.** If a string has no parameters, omit the `params` argument entirely:

```dart
// CORRECT - No params, no params argument
addstr("The police confiscate everything");

// ANTI-PATTERN - Don't do this (params: {})
addstr("The police confiscate everything", params: {});
```

### Special Cases

**Player-Provided Names:**
```dart
// At print time - use noTranslate for player-entered names
addstr("{name} has been rescued.", params: {"name": creature.name}, noTranslate: true);
```

**Lone Replacement Anti-Pattern:**

```dart
// ANTI-PATTERN - Unnecessary template
addstr("{name}", params: {"name": creature.name}, noTranslate: true);

// CORRECT - Direct print
addstr(creature.name, noTranslate: true);
```

The template `"{name}"` serves no purpose when there's no other text to translate. Only use templates when there's actual prose text that needs translation.

## Phase 2: Foundation ✅ COMPLETE

- Console wrapper functions (`addstr`, `mvaddstr`, `addstrx`, `mvaddstrx`) with params support
- `LcsI18n` class with `processString()` for translation + formatting
- ARB file structure (`lib/l10n/` with `app_en.arb`, `app_pt.arb`)
- Runtime language switching (`setLocale()`)
- Language selection UI in title screen

## Phase 3: Core Content (AFTER PHASE 1)

- Create comprehensive ARB template from templated code
- Add placeholder metadata for all parameters
- Implement ARB→PO export scripts
- Create translation guidelines document

## Phase 4-5: Advanced Features, Coverage, Production

- Complex grammar (gender, possessives)
- Tooling enhancement (automated extraction, validation)
- Remaining modules (74+ files with console output)
- Advanced ICU features (select, ordinals, date/time)
- Performance optimization, comprehensive testing

## Technical Implementation Details

### Core API

```dart
// Simple strings
addstr("text");

// With parameters
addstr("{name} has {count} health", params: {"name": name, "count": count});

// Player input - no translate
addstr("{name}", params: {"name": playerName}, noTranslate: true);

// Translate dynamic values at call site
final target = LcsI18n.tr(creature.type.name);
addstr("You hit the {target}!", params: {"target": target});
```

### Console Wrapper Pattern

All wrappers use `LcsI18n.processString(template, params?, noTranslate)`:
1. Translate template (with placeholders intact) unless noTranslate=true
2. Replace {placeholders} with values from params

```dart
void addstr(String s, {Map<String, dynamic>? params, bool noTranslate = false}) {
  final result = LcsI18n.processString(s, params, noTranslate: noTranslate);
  console.addstr(result);
}
```

### LcsI18n Class

```dart
class LcsI18n {
  static Future<void> initialize([String locale = 'en_US']);
  static Future<void> setLocale(String locale);
  static String translate(String template, {bool noTranslate = false});
  static String format(String template, Map<String, dynamic>? params);
  static String processString(String template, Map<String, dynamic>? params, {bool noTranslate = false});
  static Set<String> getMissingTranslations();
  static void reset();
}
```

### Implementation Directives

1. **No generic plural contexts** - Game code keeps business logic
2. **Minimal code changes** - Transparent API means most strings work unchanged
3. **Add translations incrementally** - No mass refactoring needed
4. **Parameters required** for any string with variables

## Example Demonstrations

**lib/daily/activities/recruiting.dart:**
```dart
// BEFORE
mvaddstr(11, 0, "${cr.name} asks around for a $name...");

// AFTER
mvaddstr(11, 0, "{squad} asks around for a {location}", params: {"squad": cr.name, "location": name});
```

```dart
// BEFORE
mvaddstr(11, 0, "${p.name}'s corpse has been recovered.");
mvaddstr(11, 0, "The police confiscate everything");
mvaddstr(11, 0, ", including vehicles");

// AFTER
mvaddstr(11, 0, "{p.name}'s corpse has been recovered.", params: {"p": p.name});
mvaddstr(11, 0, "The police confiscate everything");
mvaddstr(11, 0, ", including vehicles");
```

## Notes on Locale-Specific Content

1. Some strings (names, jokes, cultural references) only make sense in specific locales
2. **Goal for future:** Properly localize these instead of literal translation
3. **For now:** Translate literally, or keep English when locale-specific
4. **Do not add generic plural contexts** - let game logic handle complexity
5. When locale-specific humor doesn't translate, accept literal translation

## Implementation Checklist

### Phase 1: String Templating
- [ ] Run string finder to identify all console output
- [ ] Process all modules systematically
- [ ] Verify no interpolation patterns remain
- [ ] Run full test suite

### Phase 2: Translation Files (After Phase 1)
- [ ] Generate comprehensive ARB template from templated code
- [ ] Add placeholder metadata for all parameters
- [ ] Create translation guidelines for translators
- [ ] Begin actual translation work

---

*This plan is designed to be iterative and adaptable. Each phase builds upon the previous one while maintaining the ability to adjust based on lessons learned and stakeholder feedback.*
