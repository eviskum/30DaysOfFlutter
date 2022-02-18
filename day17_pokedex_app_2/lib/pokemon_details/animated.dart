import 'package:json_annotation/json_annotation.dart';

part 'animated.g.dart';

@JsonSerializable()
class Animated {
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

  Animated({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Animated.fromJson(Map<String, dynamic> json) {
    return _$AnimatedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimatedToJson(this);
}
