// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpecies _$PokemonSpeciesFromJson(Map<String, dynamic> json) =>
    PokemonSpecies(
      baseHappiness: json['base_happiness'] as int?,
      captureRate: json['capture_rate'] as int?,
      color: json['color'] == null
          ? null
          : Color.fromJson(json['color'] as Map<String, dynamic>),
      eggGroups: (json['egg_groups'] as List<dynamic>?)
          ?.map((e) => EggGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolutionChain: json['evolution_chain'] == null
          ? null
          : EvolutionChain.fromJson(
              json['evolution_chain'] as Map<String, dynamic>),
      evolvesFromSpecies: json['evolves_from_species'],
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) => FlavorTextEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      formDescriptions: json['form_descriptions'] as List<dynamic>?,
      formsSwitchable: json['forms_switchable'] as bool?,
      genderRate: json['gender_rate'] as int?,
      genera: (json['genera'] as List<dynamic>?)
          ?.map((e) => Genus.fromJson(e as Map<String, dynamic>))
          .toList(),
      generation: json['generation'] == null
          ? null
          : Generation.fromJson(json['generation'] as Map<String, dynamic>),
      growthRate: json['growth_rate'] == null
          ? null
          : GrowthRate.fromJson(json['growth_rate'] as Map<String, dynamic>),
      habitat: json['habitat'] == null
          ? null
          : Habitat.fromJson(json['habitat'] as Map<String, dynamic>),
      hasGenderDifferences: json['has_gender_differences'] as bool?,
      hatchCounter: json['hatch_counter'] as int?,
      id: json['id'] as int?,
      isBaby: json['is_baby'] as bool?,
      isLegendary: json['is_legendary'] as bool?,
      isMythical: json['is_mythical'] as bool?,
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: json['order'] as int?,
      palParkEncounters: (json['pal_park_encounters'] as List<dynamic>?)
          ?.map((e) => PalParkEncounter.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokedexNumbers: (json['pokedex_numbers'] as List<dynamic>?)
          ?.map((e) => PokedexNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      shape: json['shape'] == null
          ? null
          : Shape.fromJson(json['shape'] as Map<String, dynamic>),
      varieties: (json['varieties'] as List<dynamic>?)
          ?.map((e) => Variety.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonSpeciesToJson(PokemonSpecies instance) =>
    <String, dynamic>{
      'base_happiness': instance.baseHappiness,
      'capture_rate': instance.captureRate,
      'color': instance.color,
      'egg_groups': instance.eggGroups,
      'evolution_chain': instance.evolutionChain,
      'evolves_from_species': instance.evolvesFromSpecies,
      'flavor_text_entries': instance.flavorTextEntries,
      'form_descriptions': instance.formDescriptions,
      'forms_switchable': instance.formsSwitchable,
      'gender_rate': instance.genderRate,
      'genera': instance.genera,
      'generation': instance.generation,
      'growth_rate': instance.growthRate,
      'habitat': instance.habitat,
      'has_gender_differences': instance.hasGenderDifferences,
      'hatch_counter': instance.hatchCounter,
      'id': instance.id,
      'is_baby': instance.isBaby,
      'is_legendary': instance.isLegendary,
      'is_mythical': instance.isMythical,
      'name': instance.name,
      'names': instance.names,
      'order': instance.order,
      'pal_park_encounters': instance.palParkEncounters,
      'pokedex_numbers': instance.pokedexNumbers,
      'shape': instance.shape,
      'varieties': instance.varieties,
    };
