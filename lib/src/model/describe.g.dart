// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'describe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Describe _$DescribeFromJson(Map<String, dynamic> json) => Describe(
      collectionName: json['collectionName'] as String,
      description: json['description'] as String?,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      indexes: (json['indexes'] as List<dynamic>)
          .map((e) => Index.fromJson(e as Map<String, dynamic>))
          .toList(),
      load: json['load'] as String,
      shardsNum: json['shardsNum'] as int,
      enableDynamicField: json['enableDynamicField'] as bool,
    );

Map<String, dynamic> _$DescribeToJson(Describe instance) => <String, dynamic>{
      'collectionName': instance.collectionName,
      'description': instance.description,
      'fields': instance.fields,
      'indexes': instance.indexes,
      'load': instance.load,
      'shardsNum': instance.shardsNum,
      'enableDynamicField': instance.enableDynamicField,
    };
