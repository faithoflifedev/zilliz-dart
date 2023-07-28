import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';
import 'package:universal_io/io.dart';
import 'package:zilliz/zilliz.dart';

/// A class representing the Zilliz client with logging capabilities.
///
/// The [zillizUrl] parameter is the URL of the Zilliz server.
/// The [logOptions] parameter is an optional parameter representing the log options.
/// The [printer] parameter is an optional parameter representing the log printer to use.
///
///
/// Use this class to interact with the Zilliz server and perform various operations, while logging important events and errors.
class Zilliz with UiLoggy {
  /// The accept header value for JSON.
  static final accept = 'application/json';

  /// The content type header value for JSON with UTF-8 encoding.
  static final contentType = 'application/json; charset=UTF-8';

  /// The URL of the Zilliz server.
  final String zillizUrl;

  /// The REST client used for making HTTP requests to the Zilliz server.
  late final ZillizClient rest;

  /// Creates a new instance of [Zilliz].
  ///
  /// The [zillizUrl] parameter is the URL of the Zilliz server.
  /// The [logOptions] parameter is an optional parameter representing the log options.
  /// The [printer] parameter is an optional parameter representing the log printer to use.
  Zilliz({
    required this.zillizUrl,
    LogOptions logOptions = const LogOptions(
      LogLevel.error,
      stackTraceLevel: LogLevel.off,
    ),
    LoggyPrinter printer = const PrettyPrinter(showColors: false),
  }) {
    final zillizApiKey = Platform.environment['ZILLIZ_API_KEY'];

    if (zillizApiKey == null) {
      loggy.debug(
        'You need to set your Zilliz API key in the ZILLIZ_API_KEY environment variable.',
      );

      exit(1);
    }

    Loggy.initLoggy(logPrinter: printer, logOptions: logOptions);

    final dio = Dio(
      BaseOptions(
        baseUrl: zillizUrl,
        headers: {
          'Authorization': 'Bearer $zillizApiKey',
          'Accept': accept,
          'Content-Type': contentType,
        },
      ),
    );

    dio.interceptors.add(LoggingInterceptors());

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] = 'Bearer $zillizApiKey';
          return handler.next(options);
        },
      ),
    );

    rest = ZillizClient(dio);
  }

  Future<CollectionListResponse> collections() => rest.collections();

  Future<CollectionCreateResponse> createCollection(
    Collection collection,
  ) =>
      rest.createCollection(collection);

  Future<CollectionDescribeResponse> describe(
    String collectionName,
  ) =>
      rest.describe(collectionName);

  Future<CollectionDropResponse> dropCollection(String name) =>
      rest.dropCollection({'collectionName': name});

  Future<List<T>> query<T>({
    required VectorQuery query,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final queryResponse = await rest.query(query);

    if (queryResponse.code != 200) {
      throw Exception(queryResponse.message);
    }

    return queryResponse.data!.map((e) => fromJson(e)).toList();
  }

  Future<QueryResponse> search(VectorSearch search) => rest.search(search);

  Future<QueryResponse> get({
    required String collectionName,
    List<String>? outputFields,
    required Object id,
  }) =>
      rest.get({
        'collectionName': collectionName,
        'outputFields': outputFields,
        'id': id,
      });

  Future<InsertResponse> insert({
    required String collectionName,
    required Map<String, dynamic> data,
  }) =>
      rest.insert({
        'collectionName': collectionName,
        'data': data,
      });

  Future<QueryResponse> delete({
    required String collectionName,
    required Object id,
  }) =>
      rest.delete({
        'collectionName': collectionName,
        'id': id,
      });
}
