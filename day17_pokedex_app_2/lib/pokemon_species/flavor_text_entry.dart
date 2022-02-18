import 'package:json_annotation/json_annotation.dart';

import 'language.dart';
import 'version.dart';

part 'flavor_text_entry.g.dart';

@JsonSerializable()
class FlavorTextEntry {
  @JsonKey(name: 'flavor_text')
  String? flavorText;
  Language? language;
  Version? version;

  FlavorTextEntry({this.flavorText, this.language, this.version});

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) {
    return _$FlavorTextEntryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FlavorTextEntryToJson(this);
}
