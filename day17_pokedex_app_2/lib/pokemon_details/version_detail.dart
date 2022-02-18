import 'package:json_annotation/json_annotation.dart';

import 'version.dart';

part 'version_detail.g.dart';

@JsonSerializable()
class VersionDetail {
  int? rarity;
  Version? version;

  VersionDetail({this.rarity, this.version});

  factory VersionDetail.fromJson(Map<String, dynamic> json) {
    return _$VersionDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VersionDetailToJson(this);
}
