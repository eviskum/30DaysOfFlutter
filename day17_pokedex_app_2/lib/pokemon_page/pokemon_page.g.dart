// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonPage _$PokemonPageFromJson(Map<String, dynamic> json) => PokemonPage(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pokemons: (json['results'] as List<dynamic>?)
          ?.map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonPageToJson(PokemonPage instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.pokemons,
    };
