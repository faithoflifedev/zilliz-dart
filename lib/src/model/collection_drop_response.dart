import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'collection_drop_response.g.dart';

@JsonSerializable()
class CollectionDropResponse extends Response {
  final Map? data;

  CollectionDropResponse({
    required super.code,
    this.data,
    super.message,
  });

  factory CollectionDropResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionDropResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionDropResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
