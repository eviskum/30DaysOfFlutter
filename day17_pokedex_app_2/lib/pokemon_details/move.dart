import 'package:json_annotation/json_annotation.dart';

import 'move2.dart';
import 'version_group_detail.dart';

part 'move.g.dart';

@JsonSerializable()
class Move {
  @JsonKey(name: 'move')
  Move2? move;
  @JsonKey(name: 'version_group_details')
  List<VersionGroupDetail>? versionGroupDetails;

  Move({this.move, this.versionGroupDetails});

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);
}
