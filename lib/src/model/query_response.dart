import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'match.dart';
import 'response.dart';

part 'query_response.g.dart';

@JsonSerializable()
class QueryResponse extends Response {
  final List<Match>? data;

  QueryResponse({
    required super.code,
    this.data,
    super.message,
  });

  factory QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QueryResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
