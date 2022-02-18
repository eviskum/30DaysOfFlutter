import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  int? count;
  String? next;
  String? previous;
  List<Result>? results;

  Pokemon({this.count, this.next, this.previous, this.results});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return _$PokemonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
