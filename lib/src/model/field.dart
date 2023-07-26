import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'field.g.dart';

@JsonSerializable()
class Field {
  final bool autoId;

  final String? description;

  final String name;

  final bool primaryKey;

  final String type;

  Field({
    required this.autoId,
    this.description,
    required this.name,
    required this.primaryKey,
    required this.type,
  });

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);

  Map<String, dynamic> toJson() => _$FieldToJson(this);

  @override
  String toString() => json.encode(toJson());
}
