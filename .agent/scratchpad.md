# Agent Scratchpad

Task: TEMPLATE TASK FOR LCS-NEW-AGE:
1. Read lib/i18n/i18n.dart to understand the LcsI18n translation API
2. Read lib/engine/engine.dart to see the console wrapper functions (addstr, mvaddstr, addstrx, mvaddstrx). Read PLAN.md, README and ETC as well.
FOR REPEAT ITERATION (the instructions above are for you, the summarizer. the below is what each iteration will do)
3. For each addstr/mvaddstr/addstrx/mvaddstrx call:
   - Identify if it uses string interpolation ("Name: $name") or concatenation
   - Convert to parameterized form: addstr("{name} text", params: {"name": name})
   - Use noTranslate: true for player-entered names, numbers, codes
4. For player-named entities (characters, squads, cars, slogans):
   - Translate default names at creation time using LcsI18n.tr()
   - Mark player names as noTranslate: true at print time when printed by themselves; If they are being printed as a template parameters, just call the print methods normally since localization does not automatically translate parameters (intended).
5. Verify changes compile using flutter analyzer or checker for the specific files. LSP if supported.
6. Run tests: flutter test

---

