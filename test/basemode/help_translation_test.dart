import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/basemode/activities.dart';
import 'package:lcs_new_age/basemode/help_system.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

String _consoleText() => console.buffer
    .map((row) => row.map((character) => character.glyph).join())
    .join('\n');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    erase();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(() {
    LcsI18n.reset();
    erase();
  });

  test('Portuguese Direct Action help localizes title and guidance', () async {
    console.injectKey('a');

    await helpOnSitemode();

    final text = _consoleText();
    expect(text, contains('=== Ação Direta ==='));
    expect(text, contains('Você está tomando medidas diretas'));
    expect(text, isNot(contains('=== Direct Action ===')));
    expect(text, isNot(contains('You are taking direct action')));
  });

  test('Portuguese activity help localizes the activity title', () async {
    console.injectKey('a');

    await helpOnActivity(ActivityType.recruiting);

    final text = _consoleText();
    expect(text, contains('=== Recrutar ==='));
    expect(text, isNot(contains('=== Recruit ===')));
  });

  test('combat attack phrases are localized in Portuguese', () {
    expect(LcsI18n.tr('shoots at'), equals('atira em'));
    expect(LcsI18n.tr('swings at'), equals('golpeia'));
  });

  test('activity help bodies have Portuguese catalog entries', () {
    const layingLow =
        'Doing nothing is a safe way to avoid trouble. It is not a '
        'particularly effective way to change the world.\n\n'
        'Liberals who hang out at the safehouse will still pitch in and do '
        'some laundry and mending as needed.';
    expect(LcsI18n.tr(layingLow), contains('Não fazer nada'));
    expect(LcsI18n.tr(layingLow), isNot(contains('Doing nothing')));
  });
}
