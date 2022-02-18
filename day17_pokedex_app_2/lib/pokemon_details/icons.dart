import 'package:json_annotation/json_annotation.dart';

part 'icons.g.dart';

@JsonSerializable()
class Icons {
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_female')
  dynamic frontFemale;

  Icons({this.frontDefault, this.frontFemale});

  factory Icons.fromJson(Map<String, dynamic> json) => _$IconsFromJson(json);

  Map<String, dynamic> toJson() => _$IconsToJson(this);
}
