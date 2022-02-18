import 'package:json_annotation/json_annotation.dart';

part 'ruby_sapphire.g.dart';

@JsonSerializable()
class RubySapphire {
  @JsonKey(name: 'back_default')
  String? backDefault;
  @JsonKey(name: 'back_shiny')
  String? backShiny;
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_shiny')
  String? frontShiny;

  RubySapphire({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory RubySapphire.fromJson(Map<String, dynamic> json) {
    return _$RubySapphireFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RubySapphireToJson(this);
}
