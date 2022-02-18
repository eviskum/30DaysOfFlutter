// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokedexNumber _$PokedexNumberFromJson(Map<String, dynamic> json) =>
    PokedexNumber(
      entryNumber: json['entry_number'] as int?,
      pokedex: json['pokedex'] == null
          ? null
          : Pokedex.fromJson(json['pokedex'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokedexNumberToJson(PokedexNumber instance) =>
    <String, dynamic>{
      'entry_number': instance.entryNumber,
      'pokedex': instance.pokedex,
    };
