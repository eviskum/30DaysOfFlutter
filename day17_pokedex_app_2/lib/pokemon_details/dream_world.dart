import 'package:json_annotation/json_annotation.dart';

part 'dream_world.g.dart';

@JsonSerializable()
class DreamWorld {
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_female')
  dynamic frontFemale;

  DreamWorld({this.frontDefault, this.frontFemale});

  factory DreamWorld.fromJson(Map<String, dynamic> json) {
    return _$DreamWorldFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DreamWorldToJson(this);
}
