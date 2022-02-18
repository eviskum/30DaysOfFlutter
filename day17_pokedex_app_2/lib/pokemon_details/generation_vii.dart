import 'package:json_annotation/json_annotation.dart';

import 'icons.dart';
import 'ultra_sun_ultra_moon.dart';

part 'generation_vii.g.dart';

@JsonSerializable()
class GenerationVii {
  Icons? icons;
  @JsonKey(name: 'ultra-sun-ultra-moon')
  UltraSunUltraMoon? ultraSunUltraMoon;

  GenerationVii({this.icons, this.ultraSunUltraMoon});

  factory GenerationVii.fromJson(Map<String, dynamic> json) {
    return _$GenerationViiFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationViiToJson(this);
}
