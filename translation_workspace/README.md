# Translation Workspace

This directory contains generated untranslated strings from gameplay for translation work.

## Files

- `untranslated_strings_0.json` through `untranslated_strings_63.json`
- 64 files total, distributed by string hash for deterministic chunking
- Each file contains strings with similar hash values (same string always goes to same file)

## File Format

Each entry contains:
```json
{
  "original_string": {
    "original": "original_string",
    "locale": "pt_BR", 
    "timestamp": "2026-01-04T16:06:03.163442",
    "file_index": 0
  }
}
```

## Usage

1. **Generate**: Play the game with logging enabled to populate files
2. **Translate**: Pick a file and translate its contents
3. **Import**: Use translation scripts to merge completed translations
4. **Clean**: Delete files when done

## Benefits

- **Deterministic Chunks**: Each translator gets consistent file assignments
- **No Pollution**: Enhanced filtering excludes technical strings
- **Progress Tracking**: Clear timestamps and statistics
- **Parallel Work**: Multiple translators can work on different files simultaneously

## Scripts Integration

The enhanced `find_translatable_strings.dart` script now includes:
- Better ignore patterns that match this system's filtering
- JSON output compatibility with the log format
- Statistics and cleanup utilities

## Notes

- **DO NOT** commit these files to the repository
- **DO NOT** modify files manually - use the provided scripts
- Files are overwritten each time the game runs with logging enabled