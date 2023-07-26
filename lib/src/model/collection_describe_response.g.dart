// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_describe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionDescribeResponse _$CollectionDescribeResponseFromJson(
        Map<String, dynamic> json) =>
    CollectionDescribeResponse(
      code: json['code'] as int,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Describe.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CollectionDescribeResponseToJson(
        CollectionDescribeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
