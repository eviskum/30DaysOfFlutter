import 'package:json_annotation/json_annotation.dart';

import 'ability2.dart';

part 'ability.g.dart';

@JsonSerializable()
class Ability {
  @JsonKey(name: 'ability')
  Ability2? ability;
  @JsonKey(name: 'is_hidden')
  bool? isHidden;
  int? slot;

  Ability({this.ability, this.isHidden, this.slot});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return _$AbilityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}
