import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'insert.g.dart';

/// Represents the result of an insert operation.
///
/// This class holds information about the insert operation, including the number of
/// successfully inserted documents and a list of the inserted document IDs. It is
/// typically used as part of an [InsertResponse] to convey the outcome of an insert
/// operation on a collection.
@JsonSerializable()
class Insert {
  /// The number of documents successfully inserted.
  ///
  /// This property represents the count of documents that were successfully inserted
  /// as part of the insert operation. It provides information about the number of new
  /// documents added to the collection.
  final int insertCount;

  /// A list of inserted document IDs.
  ///
  /// This property holds a list of IDs of the documents that were inserted into the
  /// collection. Each document ID is associated with a new document added as part of
  /// the insert operation.
  final List<Object> insertIds;

  /// Creates a new instance of [Insert].
  ///
  /// The `insertCount` and `insertIds` parameters are required to create the insert
  /// operation result. The `insertIds` list should contain the IDs of the inserted
  /// documents, and the `insertCount` should represent the number of successful inserts.
  Insert({
    required this.insertCount,
    required this.insertIds,
  });

  /// Creates a new [Insert] instance from a JSON map.
  ///
  /// The `json` parameter should be a valid JSON map representing the insert operation
  /// result data. This factory method is typically used to convert the received JSON data
  /// into an [Insert] object for easy manipulation and access to the result information.
  factory Insert.fromJson(Map<String, dynamic> json) => _$InsertFromJson(json);

  /// Converts this [Insert] instance to a JSON map.
  ///
  /// This method is typically used to convert the [Insert] object into a JSON map before
  /// sending it to the server or when saving it locally.
  Map<String, dynamic> toJson() => _$InsertToJson(this);

  @override
  String toString() => json.encode(toJson());
}
