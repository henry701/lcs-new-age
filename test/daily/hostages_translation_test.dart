import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await LcsI18n.initialize('pt_BR');
  });

  tearDownAll(LcsI18n.reset);

  test('composed hostage recruitment paragraphs use translated fragments', () {
    final result = LcsI18n.processComposedString(
      "{lead} attempts to recruit {name} to the Liberal Crime Squad. "
      "As the pitch goes on, {gender} {reaction}",
      {
        'lead': 'Alex',
        'name': 'Sam',
        'gender': 'ela',
        'reaction': 'parece pronta para dizer sim.',
      },
    );

    expect(result, startsWith('Alex tenta recrutar Sam'));
    expect(result, contains('À medida que a conversa continua'));
    expect(result, isNot(contains('attempts to recruit')));
  });

  test('composed inner reactions format every placeholder before nesting', () {
    final result = LcsI18n.processComposedString(
      "says {heShe} just wants to go back to {hisHer} "
      "normal life once {leadName} lets {himHer} go.",
      {'heShe': 'ela', 'hisHer': 'her', 'leadName': 'Alex', 'himHer': 'her'},
    );

    expect(result, isNot(contains(RegExp(r'\{\w+\}'))));
    expect(result, contains('Alex'));
    expect(result, isNot(contains('just wants to go back')));
  });

  test('composed lovebomb activities translate and format hostage params', () {
    final result = LcsI18n.processComposedString(
      "raves about how good vegan food is to {hostage}.",
      {'hostage': 'Sam'},
    );

    expect(result, 'delira sobre o quão boa é a comida vegana para Sam.');
    expect(result, isNot(contains('{hostage}')));
  });

  test('composed release sleeper paragraphs stay localized and formatted', () {
    final result = LcsI18n.processComposedString(
      "{hostage} gets in touch with {lead} later, expressing "
      "a desire to continue their conversations and offering "
      "{possessive} services as a sleeper agent for the "
      "Liberal Crime Squad.",
      {'hostage': 'Sam', 'lead': 'Alex', 'possessive': 'her'},
    );

    expect(result, contains('Sam'));
    expect(result, contains('Alex'));
    expect(result, isNot(contains('gets in touch')));
    expect(result, isNot(contains('sleeper agent')));
    expect(result, isNot(contains(RegExp(r'\{\w+\}'))));
  });

  test('composed psychology paragraphs translate their long fragments', () {
    final result = LcsI18n.processComposedString(
      "{name} plays along but somehow makes everything seem so silly and trivial.",
      {'name': 'Sam'},
    );

    expect(result, contains('Sam'));
    expect(result, isNot(contains('plays along')));
    expect(result, isNot(contains('silly and trivial')));
    expect(result, isNot(contains(RegExp(r'\{\w+\}'))));
  });
}
