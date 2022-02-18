import 'package:json_annotation/json_annotation.dart';

import 'version.dart';

part 'game_index.g.dart';

@JsonSerializable()
class GameIndex {
  @JsonKey(name: 'game_index')
  int? gameIndex;
  Version? version;

  GameIndex({this.gameIndex, this.version});

  factory GameIndex.fromJson(Map<String, dynamic> json) {
    return _$GameIndexFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameIndexToJson(this);
}
