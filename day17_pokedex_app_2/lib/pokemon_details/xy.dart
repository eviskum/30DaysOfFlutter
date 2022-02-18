import 'package:json_annotation/json_annotation.dart';

part 'xy.g.dart';

@JsonSerializable()
class Xy {
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_female')
  dynamic frontFemale;
  @JsonKey(name: 'front_shiny')
  String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  dynamic frontShinyFemale;

  Xy({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Xy.fromJson(Map<String, dynamic> json) => _$XyFromJson(json);

  Map<String, dynamic> toJson() => _$XyToJson(this);
}
