import 'package:json_annotation/json_annotation.dart';

import '../pokemon/pokemon.dart';

part 'pokemon_page.g.dart';

@JsonSerializable()
class PokemonPage {
  int? count;
  String? next;
  String? previous;
  @JsonKey(name: 'results')
  List<Pokemon>? pokemons;

  PokemonPage({this.count, this.next, this.previous, this.pokemons});

  factory PokemonPage.fromJson(Map<String, dynamic> json) {
    return _$PokemonPageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonPageToJson(this);
}
