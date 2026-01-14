#!/usr/bin/env dart
// ignore_for_file: avoid_print

/* Pre-commit validation script for LCS New Age.
 *
 * Runs all validations that should pass before committing:
 * 1. Runs dart_pre_commit (analyze + test)
 * 2. Validates ARB files are clean (no untranslated strings, no duplicates)
 *
 * Usage: dart run scripts/validate_translations.dart
 */

import 'dart:io';

void main(List<String> args) async {
  final verbose = args.contains('--verbose') || args.contains('-v');

  print('=== Pre-commit Translation Validation ===\n');

  // Step 1: Run dart_pre_commit
  if (verbose) print('Running dart_pre_commit...');
  final preCommitResult = await Process.run('dart', ['run', 'dart_pre_commit']);
  if (preCommitResult.exitCode != 0) {
    print('FAIL: dart_pre_commit failed');
    print(preCommitResult.stderr);
    print('\n⚠️  Commit has NOT been performed.');
    print('Fix the issues above and try again.');
    exit(1);
  }
  if (verbose) print('  OK: dart_pre_commit passed\n');

  // Step 2: Validate translation files
  if (verbose) print('Validating ARB files...');
  final validateResult = await Process.run('dart', [
    'run',
    'scripts/maintain_translations.dart',
    '--locale=pt_BR',
    '--extract-untranslated',
    '--dry-run',
  ]);
  if (validateResult.exitCode != 0) {
    print('FAIL: ARB files need maintenance');
    print(validateResult.stdout);
    print('\nTo fix, run:');
    print(
      '  dart run scripts/maintain_translations.dart --locale=pt_BR --extract-untranslated',
    );
    print('\n⚠️  Commit has NOT been performed.');
    print('Fix the issues above and try again.');
    exit(1);
  }
  if (verbose) print('  OK: ARB files are clean\n');

  // Step 3: Check for duplicates
  if (verbose) print('Checking for duplicates...');
  final dupesResult = await Process.run('dart', [
    'run',
    'scripts/clean_arb_duplicates.dart',
  ]);
  if (dupesResult.exitCode != 0) {
    print('FAIL: Duplicate keys found');
    print(dupesResult.stdout);
    print('\n⚠️  Commit has NOT been performed.');
    print('Fix the issues above and try again.');
    exit(1);
  }
  if (verbose) print('  OK: No duplicates\n');

  print('✓ All validations passed');
}
