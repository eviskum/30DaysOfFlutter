import 'package:json_annotation/json_annotation.dart';

import 'animated.dart';

part 'black_white.g.dart';

@JsonSerializable()
class BlackWhite {
  Animated? animated;
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

  BlackWhite({
    this.animated,
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory BlackWhite.fromJson(Map<String, dynamic> json) {
    return _$BlackWhiteFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlackWhiteToJson(this);
}
