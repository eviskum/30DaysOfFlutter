import 'package:json_annotation/json_annotation.dart';

import 'other.dart';
import 'versions.dart';

part 'sprites.g.dart';

@JsonSerializable()
class Sprites {
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
  Other? other;
  Versions? versions;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return _$SpritesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
