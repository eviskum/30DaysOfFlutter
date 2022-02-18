import 'package:json_annotation/json_annotation.dart';

part 'species.g.dart';

@JsonSerializable()
class Species {
  String? name;
  String? url;

  Species({this.name, this.url});

  factory Species.fromJson(Map<String, dynamic> json) {
    return _$SpeciesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}
