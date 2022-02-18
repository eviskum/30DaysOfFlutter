import 'package:json_annotation/json_annotation.dart';

part 'gold.g.dart';

@JsonSerializable()
class Gold {
  @JsonKey(name: 'back_default')
  String? backDefault;
  @JsonKey(name: 'back_shiny')
  String? backShiny;
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_shiny')
  String? frontShiny;
  @JsonKey(name: 'front_transparent')
  String? frontTransparent;

  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);

  Map<String, dynamic> toJson() => _$GoldToJson(this);
}
