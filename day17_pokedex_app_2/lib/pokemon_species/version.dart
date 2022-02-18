import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';

@JsonSerializable()
class Version {
  String? name;
  String? url;

  Version({this.name, this.url});

  factory Version.fromJson(Map<String, dynamic> json) {
    return _$VersionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VersionToJson(this);
}
