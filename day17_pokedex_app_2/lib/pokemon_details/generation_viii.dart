import 'package:json_annotation/json_annotation.dart';

import 'icons.dart';

part 'generation_viii.g.dart';

@JsonSerializable()
class GenerationViii {
  Icons? icons;

  GenerationViii({this.icons});

  factory GenerationViii.fromJson(Map<String, dynamic> json) {
    return _$GenerationViiiFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationViiiToJson(this);
}
