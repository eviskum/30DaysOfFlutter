import 'package:json_annotation/json_annotation.dart';

part 'growth_rate.g.dart';

@JsonSerializable()
class GrowthRate {
  String? name;
  String? url;

  GrowthRate({this.name, this.url});

  factory GrowthRate.fromJson(Map<String, dynamic> json) {
    return _$GrowthRateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GrowthRateToJson(this);
}
