import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'describe.dart';
import 'response.dart';

part 'collection_describe_response.g.dart';

/// Represents a response object for describing a collection.
///
/// This class extends the [Response] class and includes additional properties
/// and methods specifically related to collection description responses.
@JsonSerializable()
class CollectionDescribeResponse extends Response {
  /// An instance of [Describe] containing the collection description data.
  ///
  /// The [Describe] class should represent the structure of the collection's
  /// description data. It can hold various information about the collection,
  /// such as its name, ID, metadata, etc. This property can be null if no data
  /// is returned or if there was an error in retrieving the collection's details.
  final Describe? data;

  /// Creates a new instance of [CollectionDescribeResponse].
  ///
  /// The `code` parameter is required and represents the status code of the response.
  /// The `message` parameter can be used to provide an optional descriptive message
  /// along with the response. The `data` parameter holds the collection's description
  /// data and can be null if no data is returned or if there was an error in retrieving
  /// the collection's details.
  CollectionDescribeResponse({
    required int code,
    String? message,
    this.data,
  }) : super(code: code, message: message);

  /// Creates a new [CollectionDescribeResponse] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the response data.
  /// This factory method is typically used to convert the received JSON response
  /// from the server into a [CollectionDescribeResponse] object for easy manipulation
  /// and access to the response data.
  factory CollectionDescribeResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionDescribeResponseFromJson(json);

  /// Converts this [CollectionDescribeResponse] instance to a JSON map.
  ///
  /// This method is typically used to convert the [CollectionDescribeResponse] object
  /// into a JSON map before sending it back to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$CollectionDescribeResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
