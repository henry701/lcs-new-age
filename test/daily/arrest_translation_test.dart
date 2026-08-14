import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDownAll(LcsI18n.reset);

  test(
    'Portuguese fundraising arrest actions are localized before interpolation',
    () {
      const actions = {
        'soliciting donations': 'solicitando doações',
        'selling shirts': 'vendendo camisetas',
        'selling art': 'vendendo arte',
        'playing music': 'tocando música',
        'selling brownies': 'vendendo brownies',
      };

      for (final entry in actions.entries) {
        final action = LcsI18n.tr(entry.key);
        final result = LcsI18n.processString(
          '{name} is accosted by police while {action}!',
          {'name': 'Rosa', 'action': action},
        );

        expect(result, 'A polícia aborda Rosa enquanto ${entry.value}!');
        expect(result, isNot(contains(entry.key)));
        expect(result, isNot(contains(RegExp(r'\{\w+\}'))));
      }
    },
  );

  test(
    'localized bury-body action remains localized when arrest is formatted',
    () {
      final action = LcsI18n.processString("burying {body}'s body", {
        'body': 'Pat',
      });
      final result = LcsI18n.processString(
        '{name} is accosted by police while {action}!',
        {'name': 'Rosa', 'action': action},
      );

      expect(action, 'enterrar o corpo de Pat');
      expect(result, 'A polícia aborda Rosa enquanto enterrar o corpo de Pat!');
      expect(result, isNot(contains("burying Pat's body")));
      expect(result, isNot(contains(RegExp(r'\{\w+\}'))));
    },
  );
}
