// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_v.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationV _$GenerationVFromJson(Map<String, dynamic> json) => GenerationV(
      blackWhite: json['black-white'] == null
          ? null
          : BlackWhite.fromJson(json['black-white'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationVToJson(GenerationV instance) =>
    <String, dynamic>{
      'black-white': instance.blackWhite,
    };
