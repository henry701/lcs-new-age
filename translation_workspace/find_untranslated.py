#!/usr/bin/env python3
import json
import sys


def find_untranslated(filepath):
    with open(filepath, "r") as f:
        data = json.load(f)
    untranslated = []
    for key, value in data.items():
        if key.startswith("@"):
            continue
        if isinstance(value, str) and value == key:
            untranslated.append(key)
        elif isinstance(value, str) and value == "":
            untranslated.append(key)
    return untranslated


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 find_untranslated.py <arb_file>")
        sys.exit(1)
    untranslated = find_untranslated(sys.argv[1])
    for key in untranslated:
        print(key)
    print(f"Total: {len(untranslated)}", file=sys.stderr)
