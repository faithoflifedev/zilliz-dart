// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_drop_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionDropResponse _$CollectionDropResponseFromJson(
        Map<String, dynamic> json) =>
    CollectionDropResponse(
      code: json['code'] as int,
      data: json['data'] as Map<String, dynamic>?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CollectionDropResponseToJson(
        CollectionDropResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
