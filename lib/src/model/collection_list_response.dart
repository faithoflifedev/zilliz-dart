import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'collection_list_response.g.dart';

/// Represents a response object for listing collections.
///
/// This class extends the [Response] class and includes additional properties
/// and methods specifically related to collection list responses.
@JsonSerializable()
class CollectionListResponse extends Response {
  /// A list of collection names.
  ///
  /// This list contains the names of collections returned by the server in response
  /// to the collection list request. It can be null if no collection names are returned.
  final List<String>? data;

  /// Creates a new instance of [CollectionListResponse].
  ///
  /// The `code` parameter is required and represents the status code of the response.
  /// The `message` parameter can be used to provide an optional descriptive message
  /// along with the response. The `data` parameter holds a list of collection names
  /// and can be null if no collection names are returned.
  CollectionListResponse({
    required int code,
    String? message,
    this.data,
  }) : super(code: code, message: message);

  /// Creates a new [CollectionListResponse] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the response data.
  /// This factory method is typically used to convert the received JSON response
  /// from the server into a [CollectionListResponse] object for easy manipulation
  /// and access to the response data.
  factory CollectionListResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionListResponseFromJson(json);

  /// Converts this [CollectionListResponse] instance to a JSON map.
  ///
  /// This method is typically used to convert the [CollectionListResponse] object
  /// into a JSON map before sending it back to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$CollectionListResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
