import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

/// Represents a collection in the system.
///
/// This class provides properties to store information about a collection,
/// such as its name, dimension, metric type, primary field, vector field,
/// and an optional description. A collection is typically used to store and
/// manage data points or vectors that can be queried and searched.
@JsonSerializable()
class Collection {
  /// The name of the collection.
  ///
  /// This property represents the name of the collection and serves as a unique
  /// identifier for accessing and managing the collection in the system.
  final String collectionName;

  /// The dimension of the vectors stored in the collection.
  ///
  /// This property indicates the dimensionality of the vectors stored in the
  /// collection. It helps in ensuring consistency and accuracy while working
  /// with the data points or vectors within the collection.
  final int dimension;

  /// The type of the metric used for similarity calculations.
  ///
  /// This property holds the type of metric used for similarity calculations
  /// within the collection. It can be null if the metric type is not specified,
  /// and the default similarity metric is used for vector comparisons.
  final String? metricType;

  /// The primary field of the collection.
  ///
  /// This property represents the primary field associated with each vector
  /// in the collection. It can be used as an additional identifier or to store
  /// any metadata related to the vectors.
  final String? primaryField;

  /// The vector field of the collection.
  ///
  /// This property holds the name of the field that contains the vectors in
  /// the collection. It is used to store the vector data associated with each
  /// data point within the collection.
  final String? vectorField;

  /// An optional description of the collection.
  ///
  /// This property allows for an optional description of the collection, which
  /// can provide more context and details about the purpose or contents of the collection.
  final String? description;

  /// Creates a new instance of [Collection].
  ///
  /// The `collectionName` and `dimension` parameters are required to create a collection.
  /// The `metricType`, `primaryField`, `vectorField`, and `description` parameters are optional
  /// and can be null if not provided.
  Collection({
    required this.collectionName,
    required this.dimension,
    this.metricType,
    this.primaryField,
    this.vectorField,
    this.description,
  });

  /// Creates a new [Collection] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the collection data.
  /// This factory method is typically used to convert the received JSON data into a
  /// [Collection] object for easy manipulation and access to the collection information.
  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  /// Converts this [Collection] instance to a JSON map.
  ///
  /// This method is typically used to convert the [Collection] object into a JSON map
  /// before sending it to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$CollectionToJson(this);

  @override
  String toString() => json.encode(toJson());
}
