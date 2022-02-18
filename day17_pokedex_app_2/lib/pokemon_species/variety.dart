import 'package:json_annotation/json_annotation.dart';

import '../pokemon/pokemon.dart';

part 'variety.g.dart';

@JsonSerializable()
class Variety {
  @JsonKey(name: 'is_default')
  bool? isDefault;
  Pokemon? pokemon;

  Variety({this.isDefault, this.pokemon});

  factory Variety.fromJson(Map<String, dynamic> json) {
    return _$VarietyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VarietyToJson(this);
}
