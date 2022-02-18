import 'package:json_annotation/json_annotation.dart';

part 'red_blue.g.dart';

@JsonSerializable()
class RedBlue {
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

  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) {
    return _$RedBlueFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RedBlueToJson(this);
}
