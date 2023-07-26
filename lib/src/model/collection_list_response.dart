import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'collection_list_response.g.dart';

@JsonSerializable()
class CollectionListResponse extends Response {
  final List<String>? data;

  CollectionListResponse({
    required super.code,
    super.message,
    this.data,
  });

  factory CollectionListResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionListResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
