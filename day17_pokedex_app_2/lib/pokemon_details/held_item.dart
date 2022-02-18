import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
import 'version_detail.dart';

part 'held_item.g.dart';

@JsonSerializable()
class HeldItem {
  Item? item;
  @JsonKey(name: 'version_details')
  List<VersionDetail>? versionDetails;

  HeldItem({this.item, this.versionDetails});

  factory HeldItem.fromJson(Map<String, dynamic> json) {
    return _$HeldItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HeldItemToJson(this);
}
