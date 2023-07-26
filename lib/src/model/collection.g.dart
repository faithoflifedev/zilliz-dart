// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      collectionName: json['collectionName'] as String,
      dimension: json['dimension'] as int,
      metricType: json['metricType'] as String?,
      primaryField: json['primaryField'] as String?,
      vectorField: json['vectorField'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'collectionName': instance.collectionName,
      'dimension': instance.dimension,
      'metricType': instance.metricType,
      'primaryField': instance.primaryField,
      'vectorField': instance.vectorField,
      'description': instance.description,
    };
