import 'package:json_annotation/json_annotation.dart';

part 'emerald.g.dart';

@JsonSerializable()
class Emerald {
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_shiny')
  String? frontShiny;

  Emerald({this.frontDefault, this.frontShiny});

  factory Emerald.fromJson(Map<String, dynamic> json) {
    return _$EmeraldFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmeraldToJson(this);
}
