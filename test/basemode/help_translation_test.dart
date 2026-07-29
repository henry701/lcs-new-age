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

  test('combat hit descriptions are localized in Portuguese', () {
    expect(LcsI18n.tr('hitting'), equals('atingindo'));
    expect(LcsI18n.tr('exploding'), equals('explodindo'));
    expect(LcsI18n.tr('slashing'), equals('cortando'));
    expect(LcsI18n.tr('stabbing'), equals('apunhalando'));
    expect(LcsI18n.tr('savagely biting'), equals('mordendo com ferocidade'));
    expect(LcsI18n.tr('draining'), equals('drenando'));
    expect(LcsI18n.tr('burning'), equals('queimando'));
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

  test('Portuguese community service help translates the full body', () async {
    console.injectKey('a');

    await helpOnActivity(ActivityType.communityService);

    final text = _consoleText();
    expect(text, contains('Serviço comunitário é uma forma segura'));
    expect(text, contains('O outro poder do serviço comunitário'));
    expect(text, isNot(contains('Community service is a safe way')));
  });

  test('Portuguese chase controls translate bare action labels', () {
    addInlineOptionText('F', 'Fight');
    addstr(', ');
    addInlineOptionText('E', 'Equip');
    addstr(', ');
    addInlineOptionText('O', 'Order');

    final text = _consoleText();
    expect(text, contains('Lutar'));
    expect(text, contains('Equipar'));
    expect(text, contains('Ordenar'));
    expect(text, isNot(contains('Fight')));
    expect(text, isNot(contains(' Equip,')));
    expect(text, isNot(contains(' Order')));
  });

  test('Portuguese siege prose localizes dynamic raiders and units', () {
    final confiscation = LcsI18n.tr(
      'The police confiscate everything, including Squad weapons.',
    );

    expect(confiscation, contains('A polícia confisca'));
    expect(LcsI18n.tr('SWAT Officer'), equals('Policial da SWAT'));
    expect(LcsI18n.tr('SWAT Armor'), equals('Armadura da SWAT'));
    expect(LcsI18n.tr('Agent'), equals('Agente'));
    expect(
      LcsI18n.tr(
        'The authorities have been driven back——for now.  While they are regrouping, you might consider abandoning this safe house for a safer location.',
      ),
      contains('As autoridades foram repelidas'),
    );
  });
}
