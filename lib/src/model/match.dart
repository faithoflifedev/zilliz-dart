import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'match.g.dart';

@JsonSerializable()
class Match {
  final Object id;

  final double distance;

  final String data;

  final Map<String, dynamic> metadata;

  Match({
    required this.id,
    required this.distance,
    required this.data,
    required this.metadata,
  });

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  Map<String, dynamic> toJson() => _$MatchToJson(this);

  @override
  String toString() => json.encode(toJson());
}
