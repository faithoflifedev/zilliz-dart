import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

/// Represents an index in a collection.
///
/// This class holds information about an index defined for a specific field in a collection.
/// An index is a data structure that improves the speed of data retrieval operations by
/// efficiently mapping the field's values to their corresponding document identifiers.
@JsonSerializable()
class Index {
  /// The name of the field on which the index is defined.
  ///
  /// This property represents the name of the field for which the index is defined. It serves
  /// as the reference to the field on which the index is built, enabling fast data retrieval
  /// based on the values of this field.
  final String fieldName;

  /// The name of the index.
  ///
  /// This property represents the name of the index, which provides a unique identifier for
  /// the index within the collection. The index name is used to access and manage the index
  /// associated with the field.
  final String indexName;

  /// The type of the metric used for similarity calculations.
  ///
  /// This property holds the type of metric used for similarity calculations within the index.
  /// The metric type defines the similarity measure used to compare the values of the field
  /// for effective retrieval of relevant documents.
  final String metricType;

  /// Creates a new instance of [Index].
  ///
  /// The `fieldName`, `indexName`, and `metricType` parameters are required to define an index.
  Index({
    required this.fieldName,
    required this.indexName,
    required this.metricType,
  });

  /// Creates a new [Index] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the index data.
  /// This factory method is typically used to convert the received JSON data into an
  /// [Index] object for easy manipulation and access to the index information.
  factory Index.fromJson(Map<String, dynamic> json) => _$IndexFromJson(json);

  /// Converts this [Index] instance to a JSON map.
  ///
  /// This method is typically used to convert the [Index] object into a JSON map
  /// before sending it to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$IndexToJson(this);

  @override
  String toString() => json.encode(toJson());
}
