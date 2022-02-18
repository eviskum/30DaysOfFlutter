// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_vi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationVi _$GenerationViFromJson(Map<String, dynamic> json) => GenerationVi(
      omegarubyAlphasapphire: json['omegaruby-alphasapphire'] == null
          ? null
          : OmegarubyAlphasapphire.fromJson(
              json['omegaruby-alphasapphire'] as Map<String, dynamic>),
      xY: json['x-y'] == null
          ? null
          : Xy.fromJson(json['x-y'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationViToJson(GenerationVi instance) =>
    <String, dynamic>{
      'omegaruby-alphasapphire': instance.omegarubyAlphasapphire,
      'x-y': instance.xY,
    };
