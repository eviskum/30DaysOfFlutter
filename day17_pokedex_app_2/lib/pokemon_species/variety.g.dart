// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variety.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variety _$VarietyFromJson(Map<String, dynamic> json) => Variety(
      isDefault: json['is_default'] as bool?,
      pokemon: json['pokemon'] == null
          ? null
          : Pokemon.fromJson(json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VarietyToJson(Variety instance) => <String, dynamic>{
      'is_default': instance.isDefault,
      'pokemon': instance.pokemon,
    };
