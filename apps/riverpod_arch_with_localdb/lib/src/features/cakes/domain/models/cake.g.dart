// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CakeImpl _$$CakeImplFromJson(Map<String, dynamic> json) => _$CakeImpl(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String,
      yummyness: json['yummyness'] as int,
    );

Map<String, dynamic> _$$CakeImplToJson(_$CakeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'yummyness': instance.yummyness,
    };
