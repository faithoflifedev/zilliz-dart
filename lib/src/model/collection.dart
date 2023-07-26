import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection {
  final String collectionName;

  final int dimension;

  final String? metricType;

  final String? primaryField;

  final String? vectorField;

  final String? description;

  Collection({
    required this.collectionName,
    required this.dimension,
    this.metricType,
    this.primaryField,
    this.vectorField,
    this.description,
  });

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);

  @override
  String toString() => json.encode(toJson());
}
