import 'package:json_annotation/json_annotation.dart';

part 'habitat.g.dart';

@JsonSerializable()
class Habitat {
  String? name;
  String? url;

  Habitat({this.name, this.url});

  factory Habitat.fromJson(Map<String, dynamic> json) {
    return _$HabitatFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HabitatToJson(this);
}
