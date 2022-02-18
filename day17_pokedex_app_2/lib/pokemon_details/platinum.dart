import 'package:json_annotation/json_annotation.dart';

part 'platinum.g.dart';

@JsonSerializable()
class Platinum {
  @JsonKey(name: 'back_default')
  String? backDefault;
  @JsonKey(name: 'back_female')
  dynamic backFemale;
  @JsonKey(name: 'back_shiny')
  String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  dynamic backShinyFemale;
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_female')
  dynamic frontFemale;
  @JsonKey(name: 'front_shiny')
  String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  dynamic frontShinyFemale;

  Platinum({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Platinum.fromJson(Map<String, dynamic> json) {
    return _$PlatinumFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlatinumToJson(this);
}
