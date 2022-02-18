import 'package:json_annotation/json_annotation.dart';

import 'diamond_pearl.dart';
import 'heartgold_soulsilver.dart';
import 'platinum.dart';

part 'generation_iv.g.dart';

@JsonSerializable()
class GenerationIv {
  @JsonKey(name: 'diamond-pearl')
  DiamondPearl? diamondPearl;
  @JsonKey(name: 'heartgold-soulsilver')
  HeartgoldSoulsilver? heartgoldSoulsilver;
  Platinum? platinum;

  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  factory GenerationIv.fromJson(Map<String, dynamic> json) {
    return _$GenerationIvFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationIvToJson(this);
}
