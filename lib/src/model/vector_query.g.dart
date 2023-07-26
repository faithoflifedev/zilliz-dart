// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VectorQuery _$VectorQueryFromJson(Map<String, dynamic> json) => VectorQuery(
      collectionName: json['collectionName'] as String,
      filter: json['filter'] as String?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      outputFields: (json['outputFields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$VectorQueryToJson(VectorQuery instance) =>
    <String, dynamic>{
      'collectionName': instance.collectionName,
      'filter': instance.filter,
      'limit': instance.limit,
      'offset': instance.offset,
      'outputFields': instance.outputFields,
    };
