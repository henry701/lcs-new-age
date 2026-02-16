#!/usr/bin/env dart
// ignore_for_file: avoid_print

/* Pre-commit validation script for LCS New Age.
 *
 * Runs all validations that should pass before committing:
 * 1. Runs dart_pre_commit (analyze + test)
 * 2. Validates ARB files are canonical (hash-sharded + recursively sorted)
 *
 * Usage: dart run scripts/validate.dart
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

  // Step 2: Validate ARB layout, sorting, and duplicate-free keyspace
  if (verbose) print('Validating ARB catalog layout...');
  final arbValidationResult = await Process.run('dart', [
    'run',
    'scripts/maintain_arb_catalogs.dart',
    '--check',
  ]);
  if (arbValidationResult.exitCode != 0) {
    print('FAIL: ARB catalogs are not canonical');
    print(arbValidationResult.stdout);
    if ((arbValidationResult.stderr as String).trim().isNotEmpty) {
      print(arbValidationResult.stderr);
    }
    print('\nTo fix, run:');
    print('  dart run scripts/maintain_arb_catalogs.dart --fix');
    print('\n⚠️  Commit has NOT been performed.');
    print('Fix the issues above and try again.');
    exit(1);
  }
  if (verbose) print('  OK: ARB catalogs are canonical\n');

  print('✓ All validations passed');
}
