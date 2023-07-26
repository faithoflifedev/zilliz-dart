// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Index _$IndexFromJson(Map<String, dynamic> json) => Index(
      fieldName: json['fieldName'] as String,
      indexName: json['indexName'] as String,
      metricType: json['metricType'] as String,
    );

Map<String, dynamic> _$IndexToJson(Index instance) => <String, dynamic>{
      'fieldName': instance.fieldName,
      'indexName': instance.indexName,
      'metricType': instance.metricType,
    };
