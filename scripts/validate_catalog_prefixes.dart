#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:lcs_new_age/i18n/catalog_audit.dart';

void main(List<String> args) {
  if (args.contains('--help') || args.contains('-h')) {
    print('Validate translated ARB control prefixes.');
    print('Usage: dart run scripts/validate_catalog_prefixes.dart [options]');
    print('  --source-locale=LOCALE  Source locale (default: en_US)');
    print('  --locale=LOCALE        Target locale (default: pt_BR)');
    print('  --json                 Emit JSON');
    print('  --help, -h             Show this help');
    return;
  }

  final sourceLocale = _arg(args, 'source-locale', 'en_US');
  final targetLocale = _arg(args, 'locale', 'pt_BR');
  final audit = auditArbCatalogs(
    sourceLocale: sourceLocale,
    targetLocale: targetLocale,
  );
  final mismatches = audit.prefixMismatches;

  if (args.contains('--json')) {
    print(
      const JsonEncoder.withIndent('  ').convert({
        'sourceLocale': sourceLocale,
        'targetLocale': targetLocale,
        'count': mismatches.length,
        'mismatches': mismatches.map((mismatch) => mismatch.toJson()).toList(),
      }),
    );
  } else if (mismatches.isEmpty) {
    print('No translated control-prefix mismatches found.');
  } else {
    for (final mismatch in mismatches) {
      print(
        '${mismatch.key}: expected "${mismatch.sourcePrefix}"; '
        'found "${mismatch.targetPrefix}"',
      );
    }
  }

  if (mismatches.isNotEmpty) exitCode = 1;
}

String _arg(List<String> args, String name, String fallback) {
  final prefix = '--$name=';
  for (final arg in args) {
    if (arg.startsWith(prefix)) return arg.substring(prefix.length);
  }
  return fallback;
}
