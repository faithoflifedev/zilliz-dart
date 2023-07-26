import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'describe.dart';
import 'response.dart';

part 'collection_describe_response.g.dart';

@JsonSerializable()
class CollectionDescribeResponse extends Response {
  final Describe? data;

  CollectionDescribeResponse({
    required super.code,
    super.message,
    this.data,
  });

  factory CollectionDescribeResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionDescribeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionDescribeResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
