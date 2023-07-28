import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'query_response.g.dart';

/// Represents a response object for a query operation.
///
/// This class extends the [Response] class and includes additional properties
/// and methods specifically related to query responses.
@JsonSerializable()
class QueryResponse extends Response {
  /// A list of maps representing the query results.
  ///
  /// This property holds the results of the query operation as a list of maps,
  /// where each map represents a document or data point in the collection. Each
  /// map contains key-value pairs representing the fields and their corresponding
  /// values for the queried documents. This property can be null if no data is
  /// returned or if there was an error during the query operation.
  final List<Map<String, dynamic>>? data;

  /// Creates a new instance of [QueryResponse].
  ///
  /// The `code` parameter is required and represents the status code of the response.
  /// The `message` parameter can be used to provide an optional descriptive message
  /// along with the response. The `data` parameter holds the query results and can
  /// be null if no data is returned or if there was an error during the query operation.
  QueryResponse({
    required int code,
    this.data,
    String? message,
  }) : super(code: code, message: message);

  /// Creates a new [QueryResponse] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the response data.
  /// This factory method is typically used to convert the received JSON response
  /// from the server into a [QueryResponse] object for easy manipulation and access
  /// to the response data.
  factory QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryResponseFromJson(json);

  /// Converts this [QueryResponse] instance to a JSON map.
  ///
  /// This method is typically used to convert the [QueryResponse] object into a
  /// JSON map before sending it back to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$QueryResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
