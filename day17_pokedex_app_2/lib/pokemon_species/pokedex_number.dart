import 'package:json_annotation/json_annotation.dart';

import 'pokedex.dart';

part 'pokedex_number.g.dart';

@JsonSerializable()
class PokedexNumber {
  @JsonKey(name: 'entry_number')
  int? entryNumber;
  Pokedex? pokedex;

  PokedexNumber({this.entryNumber, this.pokedex});

  factory PokedexNumber.fromJson(Map<String, dynamic> json) {
    return _$PokedexNumberFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokedexNumberToJson(this);
}
