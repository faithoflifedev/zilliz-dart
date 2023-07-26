import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'field.dart';
import 'index.dart';

part 'describe.g.dart';

@JsonSerializable()
class Describe {
  final String collectionName;

  final String? description;

  final List<Field> fields;

  final List<Index> indexes;

  final String load;

  final int shardsNum;

  final bool enableDynamicField;

  Describe({
    required this.collectionName,
    this.description,
    required this.fields,
    required this.indexes,
    required this.load,
    required this.shardsNum,
    required this.enableDynamicField,
  });

  factory Describe.fromJson(Map<String, dynamic> json) =>
      _$DescribeFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeToJson(this);

  @override
  String toString() => json.encode(toJson());
}
