// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
      autoId: json['autoId'] as bool,
      description: json['description'] as String?,
      name: json['name'] as String,
      primaryKey: json['primaryKey'] as bool,
      type: json['type'] as String,
    );

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
      'autoId': instance.autoId,
      'description': instance.description,
      'name': instance.name,
      'primaryKey': instance.primaryKey,
      'type': instance.type,
    };
