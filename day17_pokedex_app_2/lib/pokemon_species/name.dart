import 'package:json_annotation/json_annotation.dart';

import 'language.dart';

part 'name.g.dart';

@JsonSerializable()
class Name {
  Language? language;
  String? name;

  Name({this.language, this.name});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}
