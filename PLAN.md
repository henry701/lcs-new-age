# LCS-New-Age Localization Implementation Plan

## Overview
This document outlines a phased approach to implementing internationalization (i18n) and localization (l10n) for Liberal Crime Squad: New Age, preserving the existing curses-style architecture while enabling multi-language support.

## Critical Principle: Templating Before Translation

**Translation cannot work without proper templating first.** The translation system uses named placeholders (`{key}`) that are replaced at runtime. If strings use string interpolation (`"$name has been rescued"`) or concatenation, they cannot be translated properly because:
1. The placeholders get embedded in the English text
2. Translators cannot rearrange word order for their language
3. Parameters like names get stuck in the middle of text

**Therefore, Phase 0 (Templating) must complete before any translation work begins.**

## Architecture Decisions

### Translation Format
- **Primary**: ARB (Application Resource Bundle) format for Dart/Flutter compatibility
- **Export**: PO (Portable Object) format for translator tooling compatibility
- **Tools**: Dart `intl` package with custom ARB→PO conversion scripts

### Message Key Strategy
- **Source Text Keys**: Use English strings as identifiers for codebase readability
- **Test Coverage**: Create analyzers to detect i18n coverage breakage during testing
- **Fallback**: English text as ultimate fallback for missing translations

### Scope & Approach
- **Phase 0**: Template all console output strings (REQUIRED before translation)
- **Phase 1**: Console wrapper pattern implementation (COMPLETE)
- **Phase 2**: Translation files creation (AFTER Phase 0)
- **Phases 3-5**: Advanced features, comprehensive coverage, production readiness

### Language Support
- Left-to-right languages only (current)
- Dynamic language switching
- Manual translation management, community-ready architecture

## Phase 0: String Templating (CRITICAL - DO NOT SKIP)

**Objective:** Convert ALL console output to use parameterized API.

**Status:** IN PROGRESS - Blocking prerequisite for all translation work.

### 0.1 Identify All Console Output Calls

```bash
cd /home/henry/My_Programming/OpenSourceCopies/lcs-new-age
dart run scripts/find_translatable_strings.dart --print-only > all_console_strings.txt
```

### 0.2 Pattern Conversion Rules

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
addstr("You have {count} health", params: {"count": count}, noTranslate: true);
```

### 0.3 Special Cases

**Player-Provided Names:**
```dart
// At creation time - translate default names
final defaultNames = [LcsI18n.tr("Smash"), LcsI18n.tr("Reve"), LcsI18n.tr("Blood")];

// At print time - use noTranslate for player-entered names
addstr("{name} has been rescued.", params: {"name": creature.name}, noTranslate: true);
```

**Plural Handling (game code keeps logic):**
```dart
if (count == 1) {
  addstr("One member escaped.", params: {});
} else {
  addstr("{count} members escaped.", params: {"count": count}, noTranslate: true);
}
```

### 0.4 Anti-Pattern: Lone Replacement

**DO NOT** wrap a single value in a template when it could be printed directly:

```dart
// ANTI-PATTERN - Unnecessary template
addstr("{name}", params: {"name": creature.name}, noTranslate: true);

// CORRECT - Direct print
addstr(creature.name, noTranslate: true);
```

The template `"{name}"` serves no purpose when there's no other text to translate. Only use templates when there's actual prose text that needs translation.

### 0.5 noTranslate Decision Tree

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

### 0.6 Files to Process

Starting with high-frequency modules:
1. `lib/sitemode/fight.dart` (296 console calls)
2. All remaining modules systematically

### 0.7 Validation

```bash
# Verify all strings use params
dart run scripts/find_translatable_strings.dart --print-only | head -50

# Verify no interpolation patterns remain
grep -r '\".*\$' lib/ --include="*.dart" | grep -v params || echo "No interpolation found"

flutter test
```

## Phase 1: Foundation ✅ COMPLETE

- Console wrapper functions (`addstr`, `mvaddstr`, `addstrx`, `mvaddstrx`) with params support
- `LcsI18n` class with `processString()` for translation + formatting
- ARB file structure (`lib/l10n/` with `app_en.arb`, `app_pt.arb`)
- Runtime language switching (`setLocale()`)
- Language selection UI in title screen

## Phase 2: Core Content (AFTER PHASE 0)

- Create comprehensive ARB template from templated code
- Add placeholder metadata for all parameters
- Implement ARB→PO export scripts
- Create translation guidelines document

## Phase 3-5: Advanced Features, Coverage, Production

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
mvaddstr(11, 0, "The police confiscate everything", params: {});
mvaddstr(11, 0, ", including vehicles", params: {});
```

## Refactoring Approach

1. Convert string interpolation → params **only when adding translations**
2. Keep manual plurals in game code (translation layer handles lookup, not logic)
3. Add translations to ARB files as strings are encountered
4. No mass refactoring - incremental, transparent approach

## Notes on Locale-Specific Content

1. Some strings (names, jokes, cultural references) only make sense in specific locales
2. **Goal for future:** Properly localize these instead of literal translation
3. **For now:** Translate literally, or keep English when locale-specific
4. **Do not add generic plural contexts** - let game logic handle complexity
5. When locale-specific humor doesn't translate, accept literal translation

## Current Status

### Phase 0: String Templating (IN PROGRESS)
**CRITICAL:** All console output must use parameterized API BEFORE translation can work.

**Why This Blocks Everything:**
- 1464 untranslated strings in Portuguese ARB file
- Most use string interpolation/concatenation - NOT TRANSLATABLE
- Must convert to params API first

**Recommended starting modules:**
- `lib/basemode/help_system.dart` (1 console call)
- `lib/creature/sort_creatures.dart` (1 console call)
- `lib/daily/hostages/release.dart` (1 console call)
- `lib/items/item.dart` (1 console call)
- `lib/newspaper/major_event.dart` (1 console call)
- `lib/utils/interface_options.dart` (1 console call)
- `lib/title_screen/title_screen.dart` (2 console calls)
- `lib/title_screen/new_game.dart` (1 console call)

### Phase 1: Complete ✅

- Core i18n infrastructure (`LcsI18n` class)
- Console wrapper functions with params support
- Translation system initialization
- ARB file structure and loading
- Runtime language switching
- Language selection UI

## Implementation Checklist

### Phase 0: String Templating
- [ ] Run string finder to identify all console output
- [ ] Process lib/sitemode/fight.dart (296 calls)
- [ ] Process all remaining modules
- [ ] Verify no interpolation patterns remain
- [ ] Run full test suite

### Phase 2: Translation Files (After Phase 0)
- [ ] Generate comprehensive ARB template from templated code
- [ ] Add placeholder metadata for all parameters
- [ ] Create translation guidelines for translators
- [ ] Begin actual translation work

---

*This plan is designed to be iterative and adaptable. Each phase builds upon the previous one while maintaining the ability to adjust based on lessons learned and stakeholder feedback.*
