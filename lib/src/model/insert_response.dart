import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'insert.dart';
import 'response.dart';

part 'insert_response.g.dart';

@JsonSerializable()
class InsertResponse extends Response {
  final Insert? data;

  InsertResponse({
    required super.code,
    this.data,
    super.message,
  });

  factory InsertResponse.fromJson(Map<String, dynamic> json) =>
      _$InsertResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InsertResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
