import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'collection_drop_response.g.dart';

/// Represents a response object for dropping a collection.
///
/// This class extends the [Response] class and includes additional properties
/// and methods specifically related to collection drop responses.
@JsonSerializable()
class CollectionDropResponse extends Response {
  /// A Map containing the data associated with the collection drop response.
  ///
  /// This Map can hold any kind of data that was returned by the server in response
  /// to the collection drop request. It can be null if no data is returned.
  final Map? data;

  /// Creates a new instance of [CollectionDropResponse].
  ///
  /// The `code` parameter is required and represents the status code of the response.
  /// The `message` parameter can be used to provide an optional descriptive message
  /// along with the response. The `data` parameter holds any returned data from
  /// the server and can be null if no data is returned.
  CollectionDropResponse({
    required int code,
    this.data,
    String? message,
  }) : super(code: code, message: message);

  /// Creates a new [CollectionDropResponse] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the response data.
  /// This factory method is typically used to convert the received JSON response
  /// from the server into a [CollectionDropResponse] object for easy manipulation
  /// and access to the response data.
  factory CollectionDropResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionDropResponseFromJson(json);

  /// Converts this [CollectionDropResponse] instance to a JSON map.
  ///
  /// This method is typically used to convert the [CollectionDropResponse] object
  /// into a JSON map before sending it back to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$CollectionDropResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
