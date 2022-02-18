// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pal_park_encounter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PalParkEncounter _$PalParkEncounterFromJson(Map<String, dynamic> json) =>
    PalParkEncounter(
      area: json['area'] == null
          ? null
          : Area.fromJson(json['area'] as Map<String, dynamic>),
      baseScore: json['base_score'] as int?,
      rate: json['rate'] as int?,
    );

Map<String, dynamic> _$PalParkEncounterToJson(PalParkEncounter instance) =>
    <String, dynamic>{
      'area': instance.area,
      'base_score': instance.baseScore,
      'rate': instance.rate,
    };
