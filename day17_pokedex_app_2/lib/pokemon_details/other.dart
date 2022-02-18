import 'package:json_annotation/json_annotation.dart';

import 'dream_world.dart';
import 'home.dart';
import 'official_artwork.dart';

part 'other.g.dart';

@JsonSerializable()
class Other {
  @JsonKey(name: 'dream_world')
  DreamWorld? dreamWorld;
  Home? home;
  @JsonKey(name: 'official-artwork')
  OfficialArtwork? officialArtwork;

  Other({this.dreamWorld, this.home, this.officialArtwork});

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);
}
