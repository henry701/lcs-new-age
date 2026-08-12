import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/location_type.dart';
import 'package:lcs_new_age/map_editor/map_editor_controller.dart';
import 'package:lcs_new_age/map_editor/map_editor_screen.dart';
import 'package:lcs_new_age/map_editor/tile_palette.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDownAll(LcsI18n.reset);

  testWidgets('Portuguese map editor palette renders translated labels', (
    tester,
  ) async {
    final controller = MapEditorController(SiteType.bank);
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 1000,
            height: 260,
            child: TilePalette(controller),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Terreno'), findsOneWidget);
    expect(find.text('Modificadores da porta'), findsOneWidget);
    expect(find.text('Especiais'), findsOneWidget);
    expect(find.text('Piso'), findsOneWidget);
    expect(find.text('Cofre'), findsOneWidget);
    expect(find.text('Navegação'), findsOneWidget);
    expect(find.text('Trancada'), findsOneWidget);
    expect(find.text('Filtrar especiais…'), findsOneWidget);
    expect(find.text('Terrain'), findsNothing);
    expect(find.text('Specials'), findsNothing);
  });

  testWidgets('Portuguese map editor toolbar renders translated labels', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: MapEditorScreen(directLaunch: true)),
      ),
    );
    await tester.pump();

    expect(find.text('Editor de mapas'), findsOneWidget);
    expect(find.byTooltip('Desfazer'), findsOneWidget);
    expect(find.byTooltip('Validar mapa'), findsOneWidget);
    expect(find.byTooltip('Novo mapa em branco'), findsOneWidget);
    expect(find.byTooltip('Pencil (P)'), findsNothing);
  });
}
