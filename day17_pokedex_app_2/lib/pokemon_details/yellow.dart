import 'package:json_annotation/json_annotation.dart';

part 'yellow.g.dart';

@JsonSerializable()
class Yellow {
  @JsonKey(name: 'back_default')
  String? backDefault;
  @JsonKey(name: 'back_gray')
  String? backGray;
  @JsonKey(name: 'back_transparent')
  String? backTransparent;
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'front_gray')
  String? frontGray;
  @JsonKey(name: 'front_transparent')
  String? frontTransparent;

  Yellow({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  factory Yellow.fromJson(Map<String, dynamic> json) {
    return _$YellowFromJson(json);
  }

  Map<String, dynamic> toJson() => _$YellowToJson(this);
}
