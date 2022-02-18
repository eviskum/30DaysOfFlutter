import 'package:json_annotation/json_annotation.dart';

part 'pokedex.g.dart';

@JsonSerializable()
class Pokedex {
  String? name;
  String? url;

  Pokedex({this.name, this.url});

  factory Pokedex.fromJson(Map<String, dynamic> json) {
    return _$PokedexFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokedexToJson(this);
}
