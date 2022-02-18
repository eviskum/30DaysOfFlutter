import 'package:json_annotation/json_annotation.dart';

part 'ability2.g.dart';

@JsonSerializable()
class Ability2 {
  String? name;
  String? url;

  Ability2({this.name, this.url});

  factory Ability2.fromJson(Map<String, dynamic> json) {
    return _$Ability2FromJson(json);
  }

  Map<String, dynamic> toJson() => _$Ability2ToJson(this);
}
