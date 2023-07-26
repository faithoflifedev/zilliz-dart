import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:zilliz/zilliz.dart';

part 'zilliz.g.dart';

/// An abstract class representing the Zilliz client API.
///
/// Use this class to interact with the Zilliz server and perform various operations such as managing objects, schema, and metadata.
@RestApi()
abstract class ZillizClient {
  /// Creates an instance of [ZillizClient].
  ///
  /// The [dio] parameter is the instance of the Dio HTTP client used for making requests to the Zilliz server.
  /// The [baseUrl] parameter is an optional parameter representing the base URL of the Zilliz server.
  factory ZillizClient(Dio dio, {String baseUrl}) = _ZillizClient;

  /// Lists all collections in a cluster.
  @GET('/v1/vector/collections')
  Future<CollectionListResponse> collections();

  /// Creates a collection in a cluster.
  @POST('/v1/vector/collections/create')
  Future<CollectionCreateResponse> createCollection(
    @Body() Collection collection,
  );

  /// Describes the details of a collection.
  @GET('/v1/vector/collections/describe')
  Future<CollectionDescribeResponse> describe(
    @Query('collectionName') String collectionName,
  );

  /// Drops a collection. This operation erases your collection data. Exercise caution when performing this operation.
  @POST('/v1/vector/collections/drop')
  Future<CollectionDropResponse> dropCollection(
    @Body() Map<String, String> collection,
  );

  /// Conducts a vector query in a collection.
  @POST('/v1/vector/query')
  Future<QueryResponse> query(
    @Body() VectorQuery query,
  );

  /// Conducts a similarity search in a collection.
  @POST('/v1/vector/search')
  Future<QueryResponse> search(
    @Body() VectorSearch search,
  );

  /// Get a specified entity whose ID is an integer:
  @POST('/v1/vector/get')
  Future<QueryResponse> get(
    @Body() Map<String, dynamic> request,
  );

  /// Inserts one or more entities into a collection.
  @POST('/v1/vector/insert')
  Future<InsertResponse> insert(
    @Body() Map<String, dynamic> request,
  );

  /// Deletes one or more entities from a collection.
  @POST('/v1/vector/delete')
  Future<QueryResponse> delete(
    @Body() Map<String, dynamic> request,
  );
}
