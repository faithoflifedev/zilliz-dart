import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'vector_query.g.dart';

/// Represents a vector query for searching documents in a collection.
///
/// This class holds information about a vector query, including the collection
/// name, filter criteria, result limit, result offset, and output fields. A vector
/// query is used to search for documents in a collection based on their vector
/// representations and return matching documents that satisfy the specified criteria.
@JsonSerializable()
class VectorQuery {
  /// The name of the collection to perform the vector query on.
  ///
  /// This property represents the name of the collection where the vector query
  /// will be executed. The query searches for documents within this collection based
  /// on their vector representations.
  final String collectionName;

  /// A string representing the filter criteria for the vector query.
  ///
  /// This property holds the filter criteria in a string format that defines the
  /// conditions for the vector query. The filter criteria restrict the search to
  /// specific documents that satisfy the provided conditions.
  final String? filter;

  /// The maximum number of results to return from the vector query.
  ///
  /// This property indicates the maximum number of matching documents to be
  /// returned as results from the vector query. It allows for pagination of results
  /// when dealing with a large number of matching documents.
  final int? limit;

  /// The starting offset for the vector query results.
  ///
  /// This property represents the starting offset for the results of the vector query.
  /// It is used in conjunction with the `limit` property to paginate the results and
  /// skip a specified number of documents before returning the results.
  final int? offset;

  /// A list of field names to be included in the query result.
  ///
  /// This property holds a list of field names that should be included in the result
  /// of the vector query. It allows for the selection of specific fields to be included
  /// in the query result, reducing the amount of data returned from the query.
  final List<String>? outputFields;

  /// Creates a new instance of [VectorQuery].
  ///
  /// The `collectionName` and `filter` parameters are required to create a vector query.
  /// The `limit`, `offset`, and `outputFields` parameters are optional and can be null
  /// if not provided.
  VectorQuery({
    required this.collectionName,
    required this.filter,
    this.limit,
    this.offset,
    this.outputFields,
  });

  /// Creates a new [VectorQuery] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the vector query data.
  /// This factory method is typically used to convert the received JSON data into a
  /// [VectorQuery] object for easy manipulation and execution of the vector query.
  factory VectorQuery.fromJson(Map<String, dynamic> json) =>
      _$VectorQueryFromJson(json);

  /// Converts this [VectorQuery] instance to a JSON map.
  ///
  /// This method is typically used to convert the [VectorQuery] object into a JSON map
  /// before sending it to the server for executing the vector query.
  Map<String, dynamic> toJson() => _$VectorQueryToJson(this);

  @override
  String toString() => json.encode(toJson());
}
