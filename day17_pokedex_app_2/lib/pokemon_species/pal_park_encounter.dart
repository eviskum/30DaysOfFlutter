import 'package:json_annotation/json_annotation.dart';

import 'area.dart';

part 'pal_park_encounter.g.dart';

@JsonSerializable()
class PalParkEncounter {
  Area? area;
  @JsonKey(name: 'base_score')
  int? baseScore;
  int? rate;

  PalParkEncounter({this.area, this.baseScore, this.rate});

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) {
    return _$PalParkEncounterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PalParkEncounterToJson(this);
}
