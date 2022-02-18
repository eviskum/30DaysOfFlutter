import 'package:json_annotation/json_annotation.dart';

part 'silver.g.dart';

@JsonSerializable()
class Silver {
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

  Silver({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  factory Silver.fromJson(Map<String, dynamic> json) {
    return _$SilverFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SilverToJson(this);
}
