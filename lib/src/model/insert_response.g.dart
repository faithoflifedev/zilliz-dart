// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertResponse _$InsertResponseFromJson(Map<String, dynamic> json) =>
    InsertResponse(
      code: json['code'] as int,
      data: json['data'] == null
          ? null
          : Insert.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InsertResponseToJson(InsertResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
