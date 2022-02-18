// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Xy _$XyFromJson(Map<String, dynamic> json) => Xy(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'],
    );

Map<String, dynamic> _$XyToJson(Xy instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };
