import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/changelog.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test('Portuguese presentation labels English release notes and metadata', () {
    const source = '''
## 1.5.5 - 7/2/2026
* Fixed a bug
''';

    final localized = localizedChangelogMarkdown(source);

    expect(
      localized,
      startsWith(
        '> As notas de versão abaixo estão disponíveis apenas em inglês.',
      ),
    );
    expect(localized, contains('## Versão 1.5.5 — 02/07/2026'));
    expect(localized, contains('* Fixed a bug'));
  });

  testWidgets('Portuguese changelog chrome fits a narrow viewport', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: ChangelogWidget(key: ChangelogWidget.globalKey)),
      ),
    );
    ChangelogWidget.globalKey.currentState?.show('## 1.5.5 - 7/2/2026');
    await tester.pump();

    expect(find.text('Histórico de versões — LCS: Nova Era'), findsOneWidget);
    expect(find.byTooltip('Fechar registro de alterações'), findsOneWidget);
    expect(tester.takeException(), isNull);

    final container = tester.getSize(find.byType(Container).first);
    expect(container.width, lessThanOrEqualTo(320));
    expect(container.height, lessThanOrEqualTo(480));
  });
}
