import 'package:json_annotation/json_annotation.dart';

part 'shape.g.dart';

@JsonSerializable()
class Shape {
  String? name;
  String? url;

  Shape({this.name, this.url});

  factory Shape.fromJson(Map<String, dynamic> json) => _$ShapeFromJson(json);

  Map<String, dynamic> toJson() => _$ShapeToJson(this);
}
