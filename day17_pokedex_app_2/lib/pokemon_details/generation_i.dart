import 'package:json_annotation/json_annotation.dart';

import 'red_blue.dart';
import 'yellow.dart';

part 'generation_i.g.dart';

@JsonSerializable()
class GenerationI {
  @JsonKey(name: 'red-blue')
  RedBlue? redBlue;
  Yellow? yellow;

  GenerationI({this.redBlue, this.yellow});

  factory GenerationI.fromJson(Map<String, dynamic> json) {
    return _$GenerationIFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationIToJson(this);
}
