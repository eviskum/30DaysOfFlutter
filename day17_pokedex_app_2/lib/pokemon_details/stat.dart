import 'package:json_annotation/json_annotation.dart';

import 'stat.dart';

part 'stat.g.dart';

@JsonSerializable()
class Stat {
  @JsonKey(name: 'base_stat')
  int? baseStat;
  int? effort;
  Stat? stat;

  Stat({this.baseStat, this.effort, this.stat});

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}
