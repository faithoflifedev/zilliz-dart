// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vector_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VectorSearch _$VectorSearchFromJson(Map<String, dynamic> json) => VectorSearch(
      collectionName: json['collectionName'] as String,
      filter: json['filter'] as String?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      outputFields: (json['outputFields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vector: (json['vector'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$VectorSearchToJson(VectorSearch instance) =>
    <String, dynamic>{
      'collectionName': instance.collectionName,
      'filter': instance.filter,
      'limit': instance.limit,
      'offset': instance.offset,
      'outputFields': instance.outputFields,
      'vector': instance.vector,
    };
