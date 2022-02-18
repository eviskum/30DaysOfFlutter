import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  String? name;
  String? url;

  Pokemon({this.name, this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return _$PokemonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  int get id {
    return int.parse(url?.split('/')[6] ?? '1');
  }
}
