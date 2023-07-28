import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'field.g.dart';

/// Represents a field in a collection.
///
/// This class holds information about a field within a collection, such as its name,
/// description, data type, whether it serves as a primary key, and whether it's an
/// auto-generated ID field. Fields are used to define the structure and schema of
/// documents or data points within the collection.
@JsonSerializable()
class Field {
  /// A boolean value indicating whether the field is an auto-generated ID field.
  ///
  /// This property specifies whether the field serves as an auto-generated ID for
  /// documents within the collection. An auto-generated ID is typically used as a
  /// unique identifier for each document, and its value is automatically assigned by
  /// the system upon document creation.
  final bool autoId;

  /// An optional description of the field.
  ///
  /// This property allows for an optional description of the field, which can provide
  /// more context and details about the purpose or contents of the field.
  final String? description;

  /// The name of the field.
  ///
  /// This property represents the name of the field and serves as a unique identifier
  /// for accessing and working with the field's data within the collection.
  final String name;

  /// A boolean value indicating whether the field is a primary key.
  ///
  /// This property specifies whether the field serves as a primary key for documents
  /// within the collection. A primary key uniquely identifies each document and is
  /// essential for efficient retrieval and updates of specific documents.
  final bool primaryKey;

  /// The data type of the field.
  ///
  /// This property holds the data type of the field, such as "string," "int," "double," etc.
  /// It provides information about the type of data that can be stored in the field.
  final String type;

  /// Creates a new instance of [Field].
  ///
  /// The `autoId`, `name`, `primaryKey`, and `type` parameters are required to create a field.
  /// The `description` parameter is optional and can be null if not provided.
  Field({
    required this.autoId,
    this.description,
    required this.name,
    required this.primaryKey,
    required this.type,
  });

  /// Creates a new [Field] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the field data.
  /// This factory method is typically used to convert the received JSON data into a
  /// [Field] object for easy manipulation and access to the field information.
  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);

  /// Converts this [Field] instance to a JSON map.
  ///
  /// This method is typically used to convert the [Field] object into a JSON map
  /// before sending it to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$FieldToJson(this);

  @override
  String toString() => json.encode(toJson());
}
