import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class Index {
  final String fieldName;

  final String indexName;

  final String metricType;

  Index({
    required this.fieldName,
    required this.indexName,
    required this.metricType,
  });

  factory Index.fromJson(Map<String, dynamic> json) => _$IndexFromJson(json);

  Map<String, dynamic> toJson() => _$IndexToJson(this);

  @override
  String toString() => json.encode(toJson());
}
