// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Insert _$InsertFromJson(Map<String, dynamic> json) => Insert(
      insertCount: json['insertCount'] as int,
      insertIds:
          (json['insertIds'] as List<dynamic>).map((e) => e as Object).toList(),
    );

Map<String, dynamic> _$InsertToJson(Insert instance) => <String, dynamic>{
      'insertCount': instance.insertCount,
      'insertIds': instance.insertIds,
    };
