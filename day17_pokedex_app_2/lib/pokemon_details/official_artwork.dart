import 'package:json_annotation/json_annotation.dart';

part 'official_artwork.g.dart';

@JsonSerializable()
class OfficialArtwork {
  @JsonKey(name: 'front_default')
  String? frontDefault;

  OfficialArtwork({this.frontDefault});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) {
    return _$OfficialArtworkFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);
}
