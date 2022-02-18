import 'package:json_annotation/json_annotation.dart';

part 'ultra_sun_ultra_moon.g.dart';

@JsonSerializable()
class UltraSunUltraMoon {
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_female')
  dynamic frontFemale;
  @JsonKey(name: 'front_shiny')
  String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  dynamic frontShinyFemale;

  UltraSunUltraMoon({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory UltraSunUltraMoon.fromJson(Map<String, dynamic> json) {
    return _$UltraSunUltraMoonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UltraSunUltraMoonToJson(this);
}
