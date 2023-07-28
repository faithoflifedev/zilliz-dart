import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'collection_create_response.g.dart';

/// Represents a response object for a collection creation request.
///
/// This class extends the [Response] class and adds additional properties
/// and methods specifically related to collection creation responses.
@JsonSerializable()
class CollectionCreateResponse extends Response {
  /// A Map containing the data associated with the collection creation response.
  ///
  /// This Map can hold any kind of data that was returned by the server in response
  /// to the collection creation request. It can be null if no data is returned.
  final Map? data;

  /// Creates a new instance of [CollectionCreateResponse].
  ///
  /// The `code` parameter is required and represents the status code of the response.
  /// The `message` parameter can be used to provide an optional descriptive message
  /// along with the response. The `data` parameter holds any returned data from
  /// the server and can be null if no data is returned.
  CollectionCreateResponse({
    required int code,
    this.data,
    String? message,
  }) : super(code: code, message: message);

  /// Creates a new [CollectionCreateResponse] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the response data.
  /// This factory method is typically used to convert the received JSON response
  /// from the server into a [CollectionCreateResponse] object for easy manipulation
  /// and access to the response data.
  factory CollectionCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionCreateResponseFromJson(json);

  /// Converts this [CollectionCreateResponse] instance to a JSON map.
  ///
  /// This method is typically used to convert the [CollectionCreateResponse] object
  /// into a JSON map before sending it back to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$CollectionCreateResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
