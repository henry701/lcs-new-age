import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/sitemode/map_specials.dart';

String _row(int y) => console.buffer[y].map((cell) => cell.glyph).join().trim();
String _message() => '${_row(9)} ${_row(10)}'.trim();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await LcsI18n.initialize('pt_BR');
    console.injectedKeys.clear();
    console.lastKey = null;
    erase();
  });

  tearDown(() {
    console.injectedKeys.clear();
    console.lastKey = null;
    LcsI18n.reset();
    erase();
  });

  test('long patient outcomes remain readable across message pages', () async {
    const description =
        'Angelo Kennedy diz que os comprimidos não parecem certos.';
    const outcome =
        'Scott Childs verifica o prontuário de Angelo e consegue para ele o medicamento correto.';
    final displayed = <String>[];
    final future = encounterMessage(
      description,
      line2: outcome,
      noTranslate: true,
      paginateOverflow: true,
    );
    displayed.add(_message());
    console.injectKey('Enter');
    await Future<void>.delayed(Duration.zero);
    displayed.add(_message());
    console.injectKey('Enter');
    await future;
    final combined = displayed.join(' ').replaceAll(RegExp(r'\s+'), ' ');
    expect(combined, contains(description));
    expect(combined, contains(outcome));
  });
}
