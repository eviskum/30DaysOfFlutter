import 'package:json_annotation/json_annotation.dart';

import 'emerald.dart';
import 'firered_leafgreen.dart';
import 'ruby_sapphire.dart';

part 'generation_iii.g.dart';

@JsonSerializable()
class GenerationIii {
  Emerald? emerald;
  @JsonKey(name: 'firered-leafgreen')
  FireredLeafgreen? fireredLeafgreen;
  @JsonKey(name: 'ruby-sapphire')
  RubySapphire? rubySapphire;

  GenerationIii({this.emerald, this.fireredLeafgreen, this.rubySapphire});

  factory GenerationIii.fromJson(Map<String, dynamic> json) {
    return _$GenerationIiiFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationIiiToJson(this);
}
