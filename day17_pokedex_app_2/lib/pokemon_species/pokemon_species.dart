import 'package:json_annotation/json_annotation.dart';

import 'color.dart';
import 'egg_group.dart';
import 'evolution_chain.dart';
import 'flavor_text_entry.dart';
import 'generation.dart';
import 'genus.dart';
import 'growth_rate.dart';
import 'habitat.dart';
import 'name.dart';
import 'pal_park_encounter.dart';
import 'pokedex_number.dart';
import 'shape.dart';
import 'variety.dart';

part 'pokemon_species.g.dart';

@JsonSerializable()
class PokemonSpecies {
  @JsonKey(name: 'base_happiness')
  int? baseHappiness;
  @JsonKey(name: 'capture_rate')
  int? captureRate;
  Color? color;
  @JsonKey(name: 'egg_groups')
  List<EggGroup>? eggGroups;
  @JsonKey(name: 'evolution_chain')
  EvolutionChain? evolutionChain;
  @JsonKey(name: 'evolves_from_species')
  dynamic evolvesFromSpecies;
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntry>? flavorTextEntries;
  @JsonKey(name: 'form_descriptions')
  List<dynamic>? formDescriptions;
  @JsonKey(name: 'forms_switchable')
  bool? formsSwitchable;
  @JsonKey(name: 'gender_rate')
  int? genderRate;
  List<Genus>? genera;
  Generation? generation;
  @JsonKey(name: 'growth_rate')
  GrowthRate? growthRate;
  Habitat? habitat;
  @JsonKey(name: 'has_gender_differences')
  bool? hasGenderDifferences;
  @JsonKey(name: 'hatch_counter')
  int? hatchCounter;
  int? id;
  @JsonKey(name: 'is_baby')
  bool? isBaby;
  @JsonKey(name: 'is_legendary')
  bool? isLegendary;
  @JsonKey(name: 'is_mythical')
  bool? isMythical;
  String? name;
  List<Name>? names;
  int? order;
  @JsonKey(name: 'pal_park_encounters')
  List<PalParkEncounter>? palParkEncounters;
  @JsonKey(name: 'pokedex_numbers')
  List<PokedexNumber>? pokedexNumbers;
  Shape? shape;
  List<Variety>? varieties;

  PokemonSpecies({
    this.baseHappiness,
    this.captureRate,
    this.color,
    this.eggGroups,
    this.evolutionChain,
    this.evolvesFromSpecies,
    this.flavorTextEntries,
    this.formDescriptions,
    this.formsSwitchable,
    this.genderRate,
    this.genera,
    this.generation,
    this.growthRate,
    this.habitat,
    this.hasGenderDifferences,
    this.hatchCounter,
    this.id,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.names,
    this.order,
    this.palParkEncounters,
    this.pokedexNumbers,
    this.shape,
    this.varieties,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) {
    return _$PokemonSpeciesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PokemonSpeciesToJson(this);

  String get getDescription {
    return flavorTextEntries?[0].flavorText ?? '';
  }
}
