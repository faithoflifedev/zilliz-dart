import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'vector_query.dart';

part 'vector_search.g.dart';

/// Represents a vector search query for finding similar documents in a collection.
///
/// This class extends the [VectorQuery] class and adds an additional property `vector`,
/// representing the vector representation of the query to find similar documents. The
/// vector search query is used to search for documents in a collection that are similar
/// to the provided vector representation and return matching documents that satisfy
/// the specified criteria.
@JsonSerializable()
class VectorSearch extends VectorQuery {
  /// The vector representation used for similarity search.
  ///
  /// This property holds the vector representation used for the similarity search.
  /// The query searches for documents in the collection that are similar to this vector.
  /// The vector should be a list of double values representing the multi-dimensional
  /// vector space for similarity comparison.
  final List<double>? vector;

  /// Creates a new instance of [VectorSearch].
  ///
  /// The `collectionName` and `vector` parameters are required to create a vector search query.
  /// The `filter`, `limit`, `offset`, and `outputFields` parameters are optional and can be null
  /// if not provided. The constructor makes use of the `super` keyword to invoke the constructor
  /// of the superclass [VectorQuery] with the provided parameters.
  VectorSearch({
    required String collectionName,
    String? filter,
    int? limit,
    int? offset,
    List<String>? outputFields,
    required this.vector,
  }) : super(
          collectionName: collectionName,
          filter: filter,
          limit: limit,
          offset: offset,
          outputFields: outputFields,
        );

  /// Creates a new [VectorSearch] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the vector search data.
  /// This factory method is typically used to convert the received JSON data into a
  /// [VectorSearch] object for easy manipulation and execution of the vector search query.
  factory VectorSearch.fromJson(Map<String, dynamic> json) =>
      _$VectorSearchFromJson(json);

  /// Converts this [VectorSearch] instance to a JSON map.
  ///
  /// This method is typically used to convert the [VectorSearch] object into a JSON map
  /// before sending it to the server for executing the vector search query.
  @override
  Map<String, dynamic> toJson() => _$VectorSearchToJson(this);

  @override
  String toString() => json.encode(toJson());
}
