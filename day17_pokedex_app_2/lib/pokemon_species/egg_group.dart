import 'package:json_annotation/json_annotation.dart';

part 'egg_group.g.dart';

@JsonSerializable()
class EggGroup {
  String? name;
  String? url;

  EggGroup({this.name, this.url});

  factory EggGroup.fromJson(Map<String, dynamic> json) {
    return _$EggGroupFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EggGroupToJson(this);
}
