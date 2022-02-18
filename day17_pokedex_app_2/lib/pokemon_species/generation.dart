import 'package:json_annotation/json_annotation.dart';

part 'generation.g.dart';

@JsonSerializable()
class Generation {
  String? name;
  String? url;

  Generation({this.name, this.url});

  factory Generation.fromJson(Map<String, dynamic> json) {
    return _$GenerationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationToJson(this);
}
