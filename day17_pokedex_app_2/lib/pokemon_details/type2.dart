import 'package:json_annotation/json_annotation.dart';

part 'type2.g.dart';

@JsonSerializable()
class Type2 {
  String? name;
  String? url;

  Type2({this.name, this.url});

  factory Type2.fromJson(Map<String, dynamic> json) => _$Type2FromJson(json);

  Map<String, dynamic> toJson() => _$Type2ToJson(this);
}
