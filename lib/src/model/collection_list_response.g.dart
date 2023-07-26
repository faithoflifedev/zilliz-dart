// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionListResponse _$CollectionListResponseFromJson(
        Map<String, dynamic> json) =>
    CollectionListResponse(
      code: json['code'] as int,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CollectionListResponseToJson(
        CollectionListResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
