import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lcs_new_age/gamestate/game_state.dart';
import 'package:lcs_new_age/i18n/i18n.dart';
import 'package:lcs_new_age/location/site.dart';
import 'package:lcs_new_age/utils/lcsrandom.dart';
import 'package:lcs_new_age/vehicles/vehicle_type.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle {
  Vehicle(this.typeName, {int? id}) : id = id ?? gameState.nextVehicleId++ {
    color = type.colors.random;
    year = type.makeYear();
  }
  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  int id;
  late String typeName;
  late String color;
  late int year;
  int heat = 0;
  int? locationId;
  @JsonKey(includeToJson: false, includeFromJson: false)
  VehicleType get type => vehicleTypes[typeName]!;
  @JsonKey(includeToJson: false, includeFromJson: false)
  Site? get location => sites.firstWhereOrNull((s) => s.id == locationId);
  set location(Site? site) => locationId = site?.id;
  @JsonKey(includeToJson: false, includeFromJson: false)
  String get shortName => type.shortName;

  String fullName({bool extraVerbose = false, bool lowercaseFirst = false}) {
    final vehicle = extraVerbose ? type.longName : type.shortName;
    final stolen = heat > 0;
    final showColor = type.displayColor;
    final showYear = !stolen || !showColor;
    final template = switch ((stolen, showColor, showYear)) {
      (true, true, false) => "Stolen {color} {vehicle}",
      (true, false, true) => "Stolen {year} {vehicle}",
      (false, true, true) => "{color} {year} {vehicle}",
      (false, false, true) => "{year} {vehicle}",
      _ => "{vehicle}",
    };
    final fullName = LcsI18n.processString(template, {
      "color": LcsI18n.tr(color),
      "year": year,
      "vehicle": LcsI18n.tr(vehicle),
    });
    if (!lowercaseFirst || fullName.isEmpty) return fullName;
    return fullName[0].toLowerCase() + fullName.substring(1);
  }
}
