import 'package:json_annotation/json_annotation.dart';

part 'version_group.g.dart';

@JsonSerializable()
class VersionGroup {
  String? name;
  String? url;

  VersionGroup({this.name, this.url});

  factory VersionGroup.fromJson(Map<String, dynamic> json) {
    return _$VersionGroupFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VersionGroupToJson(this);
}
