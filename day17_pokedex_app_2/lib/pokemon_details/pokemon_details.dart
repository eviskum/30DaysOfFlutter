import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';
import 'form.dart';
import 'game_index.dart';
import 'held_item.dart';
import 'move.dart';
import 'species.dart';
import 'sprites.dart';
import 'stat.dart';
import 'type.dart';

part 'pokemon_details.g.dart';

@JsonSerializable()
class PokemonDetails {
  List<Ability>? abilities;
  @JsonKey(name: 'base_experience')
  int? baseExperience;
  List<Form>? forms;
  @JsonKey(name: 'game_indices')
  List<GameIndex>? gameIndices;
  int? height;
  @JsonKey(name: 'held_items')
  List<HeldItem>? heldItems;
  int? id;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'location_area_encounters')
  String? locationAreaEncounters;
  List<Move>? moves;
  String? name;
  int? order;
  @JsonKey(name: 'past_types')
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  PokemonDetails({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    return _$PokemonDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonDetailsToJson(this);

  int? get getId => id;
  String? get getName => name;
  String? get getImageUrl => sprites?.frontDefault;
  int? get getHeight => height;
  int? get getWeight => weight;
  List<String>? get getTypeNames => types?.map((e) => e.type?.name ?? 'No type name').toList();
}
