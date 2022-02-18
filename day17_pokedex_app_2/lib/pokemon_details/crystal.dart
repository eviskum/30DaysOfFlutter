import 'package:json_annotation/json_annotation.dart';

part 'crystal.g.dart';

@JsonSerializable()
class Crystal {
  @JsonKey(name: 'back_default')
  String? backDefault;
  @JsonKey(name: 'back_shiny')
  String? backShiny;
  @JsonKey(name: 'back_shiny_transparent')
  String? backShinyTransparent;
  @JsonKey(name: 'back_transparent')
  String? backTransparent;
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_shiny')
  String? frontShiny;
  @JsonKey(name: 'front_shiny_transparent')
  String? frontShinyTransparent;
  @JsonKey(name: 'front_transparent')
  String? frontTransparent;

  Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) {
    return _$CrystalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CrystalToJson(this);
}
