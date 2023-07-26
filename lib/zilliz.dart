/// The Zilliz library.
///
/// This library provides access to the Zilliz client and various model classes used for interacting with the Zilliz server.
library zilliz;

// Export the Zilliz base class
export 'src/zilliz_base.dart';

// Export the model classes
export 'src/model/collection_create_response.dart';
export 'src/model/collection_list_response.dart';
export 'src/model/collection.dart';
export 'src/model/collection_describe_response.dart';
export 'src/model/collection_drop_response.dart';
export 'src/model/describe.dart';
export 'src/model/field.dart';
export 'src/model/index.dart';
export 'src/model/insert_response.dart';
export 'src/model/insert.dart';
export 'src/model/vector_query.dart';
export 'src/model/query_response.dart';
export 'src/model/vector_search.dart';
export 'src/model/response.dart';

// Export the provider class
export 'src/provider/zilliz.dart';

// Export the utility classes
export 'src/util/logging_interceptors.dart';
