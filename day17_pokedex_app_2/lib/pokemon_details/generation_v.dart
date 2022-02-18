import 'package:json_annotation/json_annotation.dart';

import 'black_white.dart';

part 'generation_v.g.dart';

@JsonSerializable()
class GenerationV {
  @JsonKey(name: 'black-white')
  BlackWhite? blackWhite;

  GenerationV({this.blackWhite});

  factory GenerationV.fromJson(Map<String, dynamic> json) {
    return _$GenerationVFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationVToJson(this);
}
