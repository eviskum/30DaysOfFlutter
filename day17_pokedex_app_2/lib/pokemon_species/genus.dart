import 'package:json_annotation/json_annotation.dart';

import 'language.dart';

part 'genus.g.dart';

@JsonSerializable()
class Genus {
  String? genus;
  Language? language;

  Genus({this.genus, this.language});

  factory Genus.fromJson(Map<String, dynamic> json) => _$GenusFromJson(json);

  Map<String, dynamic> toJson() => _$GenusToJson(this);
}
