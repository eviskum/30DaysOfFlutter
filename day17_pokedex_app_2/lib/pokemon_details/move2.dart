import 'package:json_annotation/json_annotation.dart';

part 'move2.g.dart';

@JsonSerializable()
class Move2 {
  String? name;
  String? url;

  Move2({this.name, this.url});

  factory Move2.fromJson(Map<String, dynamic> json) => _$Move2FromJson(json);

  Map<String, dynamic> toJson() => _$Move2ToJson(this);
}
