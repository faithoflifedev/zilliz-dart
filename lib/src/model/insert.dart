import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'insert.g.dart';

@JsonSerializable()
class Insert {
  final int insertCount;

  final List<Object> insertIds;

  Insert({
    required this.insertCount,
    required this.insertIds,
  });

  factory Insert.fromJson(Map<String, dynamic> json) => _$InsertFromJson(json);

  Map<String, dynamic> toJson() => _$InsertToJson(this);

  @override
  String toString() => json.encode(toJson());
}
