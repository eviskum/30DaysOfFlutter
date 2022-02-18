import 'package:json_annotation/json_annotation.dart';

import 'crystal.dart';
import 'gold.dart';
import 'silver.dart';

part 'generation_ii.g.dart';

@JsonSerializable()
class GenerationIi {
  Crystal? crystal;
  Gold? gold;
  Silver? silver;

  GenerationIi({this.crystal, this.gold, this.silver});

  factory GenerationIi.fromJson(Map<String, dynamic> json) {
    return _$GenerationIiFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationIiToJson(this);
}
