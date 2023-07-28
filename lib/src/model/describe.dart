import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'field.dart';
import 'index.dart';

part 'describe.g.dart';

/// Represents the description of a collection.
///
/// This class holds information about a collection, including its name, description,
/// fields, indexes, load information, number of shards, and whether dynamic fields
/// are enabled. A collection description provides valuable insights into the structure
/// and configuration of the collection, aiding in data management and analysis.
@JsonSerializable()
class Describe {
  /// The name of the collection.
  ///
  /// This property represents the name of the collection and serves as a unique
  /// identifier for accessing and managing the collection in the system.
  final String collectionName;

  /// An optional description of the collection.
  ///
  /// This property allows for an optional description of the collection, which
  /// can provide more context and details about the purpose or contents of the collection.
  final String? description;

  /// A list of fields in the collection.
  ///
  /// This property holds a list of [Field] objects that represent the fields within
  /// the collection. Each field object contains information about the field name,
  /// data type, and other field-specific configurations.
  final List<Field> fields;

  /// A list of indexes in the collection.
  ///
  /// This property contains a list of [Index] objects that represent the indexes
  /// defined for the collection. Indexes can improve the performance of queries,
  /// especially for complex searches on specific fields.
  final List<Index> indexes;

  /// The type of data load method used for the collection.
  ///
  /// This property indicates the data loading method used for populating the
  /// collection with data. It can be a string representing a specific loading method
  /// or any other relevant load-related information.
  final String load;

  /// The number of shards used in the collection.
  ///
  /// This property represents the number of shards used to distribute the data
  /// within the collection. Sharding helps in horizontal scaling and distribution
  /// of data across multiple machines for efficient storage and retrieval.
  final int shardsNum;

  /// A boolean value indicating whether dynamic fields are enabled.
  ///
  /// This property specifies whether dynamic fields are allowed in the collection.
  /// Dynamic fields allow adding new fields to documents without modifying the schema
  /// explicitly, providing more flexibility in data handling.
  final bool enableDynamicField;

  /// Creates a new instance of [Describe].
  ///
  /// The `collectionName`, `fields`, `indexes`, `load`, `shardsNum`, and `enableDynamicField`
  /// parameters are required to create a collection description. The `description` parameter
  /// is optional and can be null if not provided.
  Describe({
    required this.collectionName,
    this.description,
    required this.fields,
    required this.indexes,
    required this.load,
    required this.shardsNum,
    required this.enableDynamicField,
  });

  /// Creates a new [Describe] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the collection description data.
  /// This factory method is typically used to convert the received JSON data into a [Describe] object
  /// for easy manipulation and access to the collection information.
  factory Describe.fromJson(Map<String, dynamic> json) =>
      _$DescribeFromJson(json);

  /// Converts this [Describe] instance to a JSON map.
  ///
  /// This method is typically used to convert the [Describe] object into a JSON map
  /// before sending it to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$DescribeToJson(this);

  @override
  String toString() => json.encode(toJson());
}
