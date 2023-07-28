import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'insert.dart';
import 'response.dart';

part 'insert_response.g.dart';

/// Represents a response object for an insert operation.
///
/// This class extends the [Response] class and includes additional properties
/// and methods specifically related to insert responses.
@JsonSerializable()
class InsertResponse extends Response {
  /// An instance of [Insert] containing the insert operation result data.
  ///
  /// The [Insert] class should represent the result of the insert operation,
  /// providing information about the success status, inserted document ID, etc.
  /// This property can be null if no data is returned or if there was an error
  /// during the insert operation.
  final Insert? data;

  /// Creates a new instance of [InsertResponse].
  ///
  /// The `code` parameter is required and represents the status code of the response.
  /// The `message` parameter can be used to provide an optional descriptive message
  /// along with the response. The `data` parameter holds the insert operation result
  /// data and can be null if no data is returned or if there was an error during
  /// the insert operation.
  InsertResponse({
    required int code,
    this.data,
    String? message,
  }) : super(code: code, message: message);

  /// Creates a new [InsertResponse] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the response data.
  /// This factory method is typically used to convert the received JSON response
  /// from the server into an [InsertResponse] object for easy manipulation
  /// and access to the response data.
  factory InsertResponse.fromJson(Map<String, dynamic> json) =>
      _$InsertResponseFromJson(json);

  /// Converts this [InsertResponse] instance to a JSON map.
  ///
  /// This method is typically used to convert the [InsertResponse] object
  /// into a JSON map before sending it back to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$InsertResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
