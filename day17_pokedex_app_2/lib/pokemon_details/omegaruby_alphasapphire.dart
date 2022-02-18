import 'package:json_annotation/json_annotation.dart';

part 'omegaruby_alphasapphire.g.dart';

@JsonSerializable()
class OmegarubyAlphasapphire {
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_female')
  dynamic frontFemale;
  @JsonKey(name: 'front_shiny')
  String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  dynamic frontShinyFemale;

  OmegarubyAlphasapphire({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory OmegarubyAlphasapphire.fromJson(Map<String, dynamic> json) {
    return _$OmegarubyAlphasapphireFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OmegarubyAlphasapphireToJson(this);
}
