#!/usr/bin/env dart

import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File('translation_workspace/untranslated_pt_BR.arb');
  final content = await file.readAsString();
  final Map<String, dynamic> data = json.decode(content);

  // State abbreviation mapping
  const stateMap = {
    'CA': 'Califórnia',
    'AZ': 'Arizona',
    'MO': 'Missouri',
    'MI': 'Michigan',
    'OR': 'Oregon',
    'IL': 'Illinois',
    'MA': 'Massachusetts',
    'WA': 'Washington',
    'TX': 'Texas',
    'FL': 'Flórida',
    'KS': 'Kansas',
    'PA': 'Pensilvânia',
    'VA': 'Virgínia',
    'DE': 'Delaware',
    'CO': 'Colorado',
    'GA': 'Geórgia',
    'MT': 'Montana',
    'WI': 'Wisconsin',
    'TN': 'Tennessee',
    'LA': 'Luisiana',
  };

  // Process each entry
  final newData = <String, dynamic>{};
  for (final entry in data.entries) {
    final key = entry.key;
    final value = entry.value as String;

    // Skip metadata entries, we'll copy later
    if (key.startsWith('@')) {
      newData[key] = value;
      continue;
    }

    String newValue = value;

    // Check for location pattern: "City, ST" where ST is two uppercase letters
    final locationMatch = RegExp(r'^([^,]+), ([A-Z]{2})$').firstMatch(key);
    if (locationMatch != null) {
      final city = locationMatch.group(1)!;
      final state = locationMatch.group(2)!;
      final fullState = stateMap[state] ?? state;
      newValue = '$city, $fullState';
    } else if (key == 'Corp.') {
      newValue = 'Emp.';
    } else {
      // Keep other values as they are (no translation attempted in this pass)
      newValue = value;
    }

    newData[key] = newValue;
  }

  // Write back with indentation
  const encoder = JsonEncoder.withIndent('  ');
  final output = encoder.convert(newData) + '\n';
  await file.writeAsString(output);
  print('Batch file updated with translated entries.');
}
