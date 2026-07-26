import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/common_actions/equipment.dart';
import 'package:lcs_new_age/creature/creature.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/gamestate/squad.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/items/ammo.dart';
import 'package:lcs_new_age/items/ammo_type.dart';
import 'package:lcs_new_age/items/clothing.dart';
import 'package:lcs_new_age/items/clothing_type.dart';
import 'package:lcs_new_age/items/item_type.dart';
import 'package:lcs_new_age/items/weapon.dart';
import 'package:lcs_new_age/items/weapon_type.dart';
import 'package:lcs_new_age/sitemode/shop.dart';
import 'package:lcs_new_age/title_screen/world.dart';

import '../test_support.dart';

String _consoleLine(int y) =>
    console.buffer[y].map((character) => character.glyph).join().trimRight();

String _consoleCells(int y, int start, int end) => console.buffer[y]
    .sublist(start, end)
    .map((character) => character.glyph)
    .join();

KeyDownEvent get _enterKey => const KeyDownEvent(
  physicalKey: PhysicalKeyboardKey.enter,
  logicalKey: LogicalKeyboardKey.enter,
  timeStamp: Duration.zero,
);

Map<String, String> _loadCatalog(String locale) {
  final catalog = <String, String>{};
  for (final file in Directory('lib/l10n').listSync().whereType<File>()) {
    if (!file.path.contains('app_${locale}_part')) continue;
    final shard = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    for (final entry in shard.entries) {
      if (!entry.key.startsWith('@') && entry.value is String) {
        catalog[entry.key] = entry.value as String;
      }
    }
  }
  return catalog;
}

Iterable<Shop> _allShops(Shop shop) sync* {
  yield shop;
  for (final department in shop.departments) {
    yield* _allShops(department);
  }
}

Set<String> _purchasableMetadataKeys() {
  final keys = <String>{};
  for (final rootShop in shopTypes.values) {
    for (final shop in _allShops(rootShop)) {
      if (shop.description case final description?
          when description.isNotEmpty) {
        keys.add(description);
      }
      if (shop.exitText.isNotEmpty) keys.add(shop.exitText);
      for (final item in shop.items) {
        if (item.description case final description?
            when description.isNotEmpty) {
          keys.add(description);
        }
        final type = itemTypes[item.itemId]!;
        keys.add(type.name);
        if (type is WeaponType) {
          keys.add(type.shortName);
          if (type.description case final description?
              when description.isNotEmpty) {
            keys.add(description);
          }
        } else if (type is ClothingType) {
          keys
            ..add(type.shortName)
            ..add(type.description);
        }
      }
    }
  }
  return keys;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(ensureGameDataLoaded);

  setUp(() async {
    gameState = GameState();
    pool.clear();
    squads.clear();
    activeSquad = null;
    await LcsI18n.initialize('pt_BR');
    erase();
    move(0, 0);
  });

  tearDown(() {
    pool.clear();
    squads.clear();
    activeSquad = null;
    LcsI18n.reset();
    erase();
  });

  test(
    'pawn-shop department categories use their Portuguese catalog entries',
    () {
      final pawnShop = shopTypes['PAWNSHOP']!;

      expect(
        pawnShop.departments.map(
          (department) => department.halfscreenDescription(),
        ),
        equals([
          'Armas Conservadoras',
          'Caixas de Munição',
          'Ferramentas Liberais',
        ]),
      );
    },
  );

  test(
    'weapon shop page translates prompts, metadata, and key prefixes',
    () async {
      final pawnShop = shopTypes['PAWNSHOP']!;
      final weaponDepartment = pawnShop.departments.first;
      final buyer = Creature()..name = 'Joana';
      final customers = Squad.temporary()..members.add(buyer);

      console.keyEvent(_enterKey);

      await weaponDepartment.browseWeapons(customers, buyer);

      expect(_consoleLine(9), equals('O que Joana vai comprar?'));
      expect(_consoleLine(10), contains('NOME'));
      expect(_consoleLine(10), contains('TIPO DE MUNIÇÃO'));
      expect(_consoleLine(10), contains('DANO'));
      expect(_consoleLine(10), contains('PREÇO'));
      expect(_consoleLine(11), contains('A – Revólver .22'));
      expect(_consoleLine(11), contains('.22 LR'));
      expect(
        _consoleLine(12),
        contains(
          'Estilo do Velho Oeste. Mas será que os caubóis usavam balas tão pequenas?',
        ),
      );
      expect(
        _consoleLine(23),
        equals(
          'Pressione uma letra para comprar uma Arma Suficientemente Liberal',
        ),
      );
      expect(_consoleCells(24, 40, 80).trim(), equals('Enter - Voltar'));
    },
  );

  test(
    'ammo shop page translates every visible field without overlap',
    () async {
      final ammoDepartment = shopTypes['PAWNSHOP']!.departments[1];
      final buyer = Creature()..name = 'Joana';
      final customers = Squad.temporary()..members.add(buyer);

      console.keyEvent(_enterKey);
      await ammoDepartment.browseAmmo(customers, buyer);

      expect(_consoleLine(9), equals('O que Joana vai comprar?'));
      expect(_consoleCells(10, 4, 24), startsWith('NOME'));
      expect(_consoleCells(10, 24, 39), startsWith('DANO'));
      expect(_consoleCells(10, 39, 59), startsWith('TAMANHO DA CAIXA'));
      expect(_consoleCells(10, 59, 80), startsWith('PREÇO'));
      expect(_consoleCells(11, 0, 24).trim(), equals('A – Cartucho 12ga 00'));
      expect(_consoleCells(11, 24, 39).trim(), equals('25x8'));
      expect(
        _consoleLine(21),
        equals('Pressione uma letra para comprar munição'),
      );
      expect(_consoleLine(22), equals('Enter - Voltar'));
    },
  );

  test('clothing shop page translates names, traits, and columns', () async {
    final clothingDepartment = shopTypes['DEPARTMENT_STORE']!.departments.first;
    final buyer = Creature()..name = 'Joana';
    final customers = Squad.temporary()..members.add(buyer);

    console.keyEvent(_enterKey);
    await clothingDepartment.browseClothes(customers, buyer);

    expect(_consoleLine(9), equals('O que Joana vai comprar?'));
    expect(_consoleCells(10, 4, 24), startsWith('NOME'));
    expect(_consoleCells(10, 24, 59), startsWith('CARACTERÍSTICAS ESPECIAIS'));
    expect(_consoleCells(10, 59, 80), startsWith('PREÇO'));
    expect(_consoleCells(11, 0, 24).trim(), equals('A – Roupas'));
    expect(_consoleCells(12, 0, 24).trim(), equals('B – Gola alta preta'));
    expect(_consoleCells(12, 24, 59).trim(), equals('Furtiva'));
    expect(_consoleLine(21), equals('Pressione uma letra para comprar roupas'));
    expect(_consoleLine(22), equals('Enter - Voltar'));
  });

  test('equipment title helpers preserve localized short and full forms', () {
    final ammo = Ammo('AMMO_22');
    final clothing = Clothing('CLOTHING_BLACKCLOTHES');

    expect(ammo.equipTitle(), equals('Munição .22 LR'));
    expect(ammo.equipTitle(full: true), equals('Munição .22 LR'));
    expect(clothing.equipTitle(), startsWith('Gola alta preta'));
    expect(clothing.equipTitle(full: true), startsWith('Gola alta preta'));
  });

  test('equipment screen translates headers and visible item names', () async {
    final member = Creature()
      ..name = 'Joana'
      ..equippedWeapon = Weapon('WEAPON_22_REVOLVER')
      ..equippedClothing = Clothing('CLOTHING_BLACKCLOTHES');
    final squad = Squad()..members.add(member);
    squads.add(squad);
    activeSquad = squad;
    activeSquadMemberIndex = -1;

    console.keyEvent(_enterKey);
    await equip([
      Weapon('WEAPON_COMBATKNIFE'),
      Ammo('AMMO_22'),
      Clothing('CLOTHING_CHEAPDRESS'),
    ]);

    expect(_consoleLine(0), equals('Equipar a Equipe'));
    expect(_consoleCells(1, 2, 23), startsWith('NOME DE CÓDIGO'));
    expect(_consoleCells(1, 23, 29), startsWith('HABIL.'));
    expect(_consoleCells(1, 29, 44), startsWith('ARMA'));
    expect(_consoleCells(1, 44, 59), startsWith('ROUPA'));
    expect(_consoleCells(2, 29, 44).trim(), startsWith('Rev. .22'));
    expect(_consoleCells(2, 44, 59).trim(), equals('Gola alta preta'));
    expect(_consoleCells(10, 1, 27).trim(), equals('A - Faca de combate'));
    expect(_consoleCells(10, 27, 53).trim(), equals('B - Vestido barato'));
    expect(_consoleCells(10, 53, 80).trim(), equals('C - Munição .22 LR'));
    expect(
      _consoleCells(19, 1, 80).trimRight(),
      equals('Pressione uma letra para equipar um item Liberal'),
    );
    expect(
      _consoleCells(20, 1, 80).trimRight(),
      equals(
        'Pressione um número para largar a arma Conservadora daquele membro do esquadrão',
      ),
    );
    expect(_consoleCells(24, 1, 80).trimRight(), equals('Enter - Concluído'));
  });

  test('pawn-shop status actions fit the full console width', () async {
    makeWorld();
    final pawnShop = shopTypes['PAWNSHOP']!;
    final buyer = Creature()
      ..name = 'Joana'
      ..base = sites.first;
    final customers = Squad.temporary()..members.add(buyer);
    activeSquad = customers;

    console.keyEvent(_enterKey);
    await pawnShop.sellLoot(customers);

    expect(_consoleLine(15), contains('Mostrar o status Liberal do esquadrão'));
    expect(
      _consoleLine(16),
      contains('Verificar o status de um Liberal do esquadrão'),
    );
    expect(_consoleLine(17), contains('Enter - Terminar de penhorar'));
  });

  test(
    'all XML-backed purchasable metadata has EN and PT catalog coverage',
    () {
      final en = _loadCatalog('en_US');
      final pt = _loadCatalog('pt_BR');
      final metadata = _purchasableMetadataKeys();

      expect(metadata, isNotEmpty);
      expect(
        metadata.where((key) => !en.containsKey(key)),
        isEmpty,
        reason: 'Missing en_US purchasable metadata',
      );
      expect(
        metadata.where((key) => !pt.containsKey(key)),
        isEmpty,
        reason: 'Missing pt_BR purchasable metadata',
      );
    },
  );

  test('Portuguese shop metadata respects fixed console column budgets', () {
    final overBudget = <String>[];

    for (final rootShop in shopTypes.values) {
      for (final shop in _allShops(rootShop)) {
        for (final item in shop.items) {
          final type = itemTypes[item.itemId]!;
          if (type is WeaponType) {
            final name = LcsI18n.tr(type.name);
            if (name.length > 16) {
              overBudget.add(
                'weapon name: ${type.name} -> $name (${name.length})',
              );
            }
            if (type.description case final description?) {
              final translated = LcsI18n.tr(description);
              if (translated.length > 76) {
                overBudget.add(
                  'weapon description: $description -> $translated '
                  '(${translated.length})',
                );
              }
            }
          } else if (type is AmmoType) {
            final name = LcsI18n.tr(type.name);
            if (name.length > 20) {
              overBudget.add(
                'ammo name: ${type.name} -> $name (${name.length})',
              );
            }
          } else if (type is ClothingType) {
            final name = LcsI18n.tr(type.name);
            if (name.length > 20) {
              overBudget.add(
                'clothing name: ${type.name} -> $name (${name.length})',
              );
            }
          }
        }
      }
    }

    expect(overBudget, isEmpty);
  });
}
