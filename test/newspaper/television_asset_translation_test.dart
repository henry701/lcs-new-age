import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/newspaper/television.dart';

const _estateSlots = [
  (picture: 1, x: 17, y: 7),
  (picture: 1, x: 42, y: 7),
  (picture: 1, x: 67, y: 7),
  (picture: 1, x: 12, y: 8),
  (picture: 1, x: 37, y: 8),
  (picture: 1, x: 62, y: 8),
  (picture: 1, x: 7, y: 9),
  (picture: 1, x: 32, y: 9),
  (picture: 2, x: 2, y: 10),
  (picture: 2, x: 27, y: 10),
  (picture: 2, x: 52, y: 10),
  (picture: 2, x: 77, y: 10),
  (picture: 2, x: 22, y: 11),
  (picture: 2, x: 47, y: 11),
  (picture: 2, x: 72, y: 11),
];

const _diningSlots = [
  (picture: 5, x: 57, y: 9),
  (picture: 5, x: 2, y: 10),
  (picture: 5, x: 27, y: 10),
  (picture: 5, x: 52, y: 10),
  (picture: 5, x: 77, y: 10),
  (picture: 5, x: 22, y: 11),
  (picture: 5, x: 47, y: 11),
  (picture: 5, x: 72, y: 11),
  (picture: 6, x: 42, y: 12),
  (picture: 6, x: 67, y: 12),
  (picture: 6, x: 12, y: 13),
  (picture: 6, x: 37, y: 13),
  (picture: 6, x: 62, y: 13),
  (picture: 6, x: 7, y: 14),
];

const _moneySlots = [
  (picture: 9, x: 8, y: 4),
  (picture: 9, x: 33, y: 4),
  (picture: 9, x: 58, y: 4),
  (picture: 9, x: 3, y: 5),
  (picture: 9, x: 28, y: 5),
];

const _moneyContinuationSlots = [
  (picture: 10, x: 73, y: 11),
  (picture: 10, x: 18, y: 12),
  (picture: 10, x: 43, y: 12),
  (picture: 10, x: 68, y: 12),
  (picture: 10, x: 13, y: 13),
  (picture: 11, x: 3, y: 20),
  (picture: 11, x: 28, y: 20),
  (picture: 11, x: 53, y: 20),
  (picture: 11, x: 78, y: 20),
  (picture: 11, x: 23, y: 21),
];

List<({int picture, int x, int y})> _slotsOnPicture(
  Iterable<({int picture, int x, int y})> template,
  int picture,
) => template.map((slot) => (picture: picture, x: slot.x, y: slot.y)).toList();

Future<List<List<List<int>>>> _moviePictures(String filename) async {
  final bytes = await rootBundle.load('assets/art/$filename');
  final data = bytes.buffer.asByteData(
    bytes.offsetInBytes,
    bytes.lengthInBytes,
  );
  final pictureCount = data.getUint32(0, Endian.little);
  final width = data.getUint32(4, Endian.little);
  final height = data.getUint32(8, Endian.little);
  var offset = 12;
  return List.generate(pictureCount, (_) {
    final picture = List.generate(height, (_) {
      final row = List<int>.generate(width, (_) {
        final glyph = data.getUint8(offset);
        offset += 4;
        return glyph;
      });
      return row;
    });
    return picture;
  });
}

String _slotText(
  List<List<List<int>>> pictures,
  List<({int picture, int x, int y})> slots,
) => slots
    .map((slot) => String.fromCharCode(pictures[slot.picture][slot.y][slot.x]))
    .join();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    LcsI18n.reset();
    await LcsI18n.initialize('pt_BR');
  });

  tearDown(LcsI18n.reset);

  test(
    'PT-465 selects the translated glam-show animation for Brazilian Portuguese',
    () {
      expect(
        televisionMovieAssetFilename('glamshow.cmv'),
        equals('glamshow_pt_BR.cmv'),
      );
      expect(televisionMovieAssetFilename('anchor.cmv'), equals('anchor.cmv'));
    },
  );

  test('PT-465 glam-show animation title glyphs are Portuguese', () async {
    final pictures = await _moviePictures('glamshow_pt_BR.cmv');

    expect(_slotText(pictures, _estateSlots), equals('MoradiasdeElite'));
    expect(_slotText(pictures, _diningSlots), equals('JantarSuntuoso'));
    expect(_slotText(pictures, _moneySlots), equals('GRANA'));

    for (var picture = 1; picture <= 3; picture++) {
      expect(
        _slotText(pictures, _slotsOnPicture(_estateSlots.take(8), picture)),
        equals('Moradias'),
      );
    }
    for (var picture = 2; picture <= 3; picture++) {
      expect(
        _slotText(pictures, _slotsOnPicture(_estateSlots.skip(8), picture)),
        equals('deElite'),
      );
    }
    for (var picture = 5; picture <= 7; picture++) {
      expect(
        _slotText(pictures, _slotsOnPicture(_diningSlots.take(8), picture)),
        equals('JantarSu'),
      );
    }
    for (var picture = 6; picture <= 7; picture++) {
      expect(
        _slotText(pictures, _slotsOnPicture(_diningSlots.skip(8), picture)),
        equals('ntuoso'),
      );
    }
    for (var picture = 9; picture <= 11; picture++) {
      expect(
        _slotText(pictures, _slotsOnPicture(_moneySlots, picture)),
        equals('GRANA'),
      );
    }
    for (var picture = 10; picture <= 11; picture++) {
      expect(
        _slotText(
          pictures,
          _slotsOnPicture(_moneyContinuationSlots.take(5), picture),
        ),
        equals('GRANA'),
      );
    }
    expect(
      _slotText(pictures, _slotsOnPicture(_moneyContinuationSlots.skip(5), 11)),
      equals('GRANA'),
    );

    final titleGlyphs = [
      _slotText(pictures, _estateSlots),
      _slotText(pictures, _diningSlots),
      _slotText(pictures, _moneySlots),
      for (var picture = 1; picture <= 3; picture++)
        _slotText(pictures, _slotsOnPicture(_estateSlots.take(8), picture)),
      for (var picture = 2; picture <= 3; picture++)
        _slotText(pictures, _slotsOnPicture(_estateSlots.skip(8), picture)),
      for (var picture = 5; picture <= 7; picture++)
        _slotText(pictures, _slotsOnPicture(_diningSlots.take(8), picture)),
      for (var picture = 6; picture <= 7; picture++)
        _slotText(pictures, _slotsOnPicture(_diningSlots.skip(8), picture)),
      for (var picture = 9; picture <= 11; picture++)
        _slotText(pictures, _slotsOnPicture(_moneySlots, picture)),
      for (var picture = 10; picture <= 11; picture++)
        _slotText(
          pictures,
          _slotsOnPicture(_moneyContinuationSlots.take(5), picture),
        ),
      _slotText(pictures, _slotsOnPicture(_moneyContinuationSlots.skip(5), 11)),
    ].join(' ');
    expect(titleGlyphs, isNot(contains('Palacial')));
    expect(titleGlyphs, isNot(contains('Estates')));
    expect(titleGlyphs, isNot(contains('Decadent')));
    expect(titleGlyphs, isNot(contains('Dining')));
    expect(titleGlyphs, isNot(contains('MONEY')));
  });

  test('PT-465 keeps the source animation unchanged for English', () async {
    await LcsI18n.setLocale('en_US');
    expect(
      televisionMovieAssetFilename('glamshow.cmv'),
      equals('glamshow.cmv'),
    );
    final pictures = await _moviePictures('glamshow.cmv');
    expect(_slotText(pictures, _estateSlots), equals('PalacialEstates'));
    expect(_slotText(pictures, _diningSlots), equals('DecadentDining'));
    expect(_slotText(pictures, _moneySlots), equals('MONEY'));
    for (var picture = 1; picture <= 3; picture++) {
      expect(
        _slotText(pictures, _slotsOnPicture(_estateSlots.take(8), picture)),
        equals('Palacial'),
      );
    }
    for (var picture = 2; picture <= 3; picture++) {
      expect(
        _slotText(pictures, _slotsOnPicture(_estateSlots.skip(8), picture)),
        equals('Estates'),
      );
    }
    for (var picture = 5; picture <= 7; picture++) {
      expect(
        _slotText(pictures, _slotsOnPicture(_diningSlots.take(8), picture)),
        equals('Decadent'),
      );
    }
    for (var picture = 6; picture <= 7; picture++) {
      expect(
        _slotText(pictures, _slotsOnPicture(_diningSlots.skip(8), picture)),
        equals('Dining'),
      );
    }
    for (var picture = 9; picture <= 11; picture++) {
      expect(
        _slotText(pictures, _slotsOnPicture(_moneySlots, picture)),
        equals('MONEY'),
      );
    }
  });
}
