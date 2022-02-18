import 'package:json_annotation/json_annotation.dart';

import 'type2.dart';

part 'type.g.dart';

@JsonSerializable()
class Type {
  int? slot;
  Type2? type;

  Type({this.slot, this.type});

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
