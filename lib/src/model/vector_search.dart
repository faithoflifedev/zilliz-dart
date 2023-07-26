import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'vector_query.dart';

part 'vector_search.g.dart';

@JsonSerializable()
class VectorSearch extends VectorQuery {
  final List<double>? vector;

  VectorSearch({
    required super.collectionName,
    super.filter,
    super.limit,
    super.offset,
    super.outputFields,
    required this.vector,
  });

  factory VectorSearch.fromJson(Map<String, dynamic> json) =>
      _$VectorSearchFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VectorSearchToJson(this);

  @override
  String toString() => json.encode(toJson());
}
