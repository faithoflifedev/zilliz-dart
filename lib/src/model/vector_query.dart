import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'vector_query.g.dart';

@JsonSerializable()
class VectorQuery {
  final String collectionName;

  final String? filter;

  final int? limit;

  final int? offset;

  final List<String>? outputFields;

  VectorQuery({
    required this.collectionName,
    required this.filter,
    this.limit,
    this.offset,
    this.outputFields,
  });

  factory VectorQuery.fromJson(Map<String, dynamic> json) =>
      _$VectorQueryFromJson(json);

  Map<String, dynamic> toJson() => _$VectorQueryToJson(this);

  @override
  String toString() => json.encode(toJson());
}
