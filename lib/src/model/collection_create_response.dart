import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'collection_create_response.g.dart';

@JsonSerializable()
class CollectionCreateResponse extends Response {
  final Map? data;

  CollectionCreateResponse({
    required super.code,
    this.data,
    super.message,
  });

  factory CollectionCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionCreateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionCreateResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
