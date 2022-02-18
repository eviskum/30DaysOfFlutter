// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gold _$GoldFromJson(Map<String, dynamic> json) => Gold(
      backDefault: json['back_default'] as String?,
      backShiny: json['back_shiny'] as String?,
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontTransparent: json['front_transparent'] as String?,
    );

Map<String, dynamic> _$GoldToJson(Gold instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'back_shiny': instance.backShiny,
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
      'front_transparent': instance.frontTransparent,
    };
