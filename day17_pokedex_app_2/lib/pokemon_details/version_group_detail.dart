import 'package:json_annotation/json_annotation.dart';

import 'move_learn_method.dart';
import 'version_group.dart';

part 'version_group_detail.g.dart';

@JsonSerializable()
class VersionGroupDetail {
  @JsonKey(name: 'level_learned_at')
  int? levelLearnedAt;
  @JsonKey(name: 'move_learn_method')
  MoveLearnMethod? moveLearnMethod;
  @JsonKey(name: 'version_group')
  VersionGroup? versionGroup;

  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) {
    return _$VersionGroupDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VersionGroupDetailToJson(this);
}
