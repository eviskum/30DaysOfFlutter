import 'package:json_annotation/json_annotation.dart';

part 'firered_leafgreen.g.dart';

@JsonSerializable()
class FireredLeafgreen {
  @JsonKey(name: 'back_default')
  String? backDefault;
  @JsonKey(name: 'back_shiny')
  String? backShiny;
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_shiny')
  String? frontShiny;

  FireredLeafgreen({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory FireredLeafgreen.fromJson(Map<String, dynamic> json) {
    return _$FireredLeafgreenFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FireredLeafgreenToJson(this);
}
