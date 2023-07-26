// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionCreateResponse _$CollectionCreateResponseFromJson(
        Map<String, dynamic> json) =>
    CollectionCreateResponse(
      code: json['code'] as int,
      data: json['data'] as Map<String, dynamic>?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CollectionCreateResponseToJson(
        CollectionCreateResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
