/// Abstract class representing a response from the server or service.
///
/// This class serves as a base class for different types of responses and provides
/// common properties and methods that can be used across response classes. It is
/// meant to be extended by concrete response classes to implement specific responses.
abstract class Response {
  /// The status code of the response.
  ///
  /// This property represents the status code of the response, indicating the result
  /// of the operation. The status code is typically an integer value that helps in
  /// identifying the success or failure of the operation.
  final int code;

  /// An optional descriptive message accompanying the response.
  ///
  /// This property allows for an optional descriptive message that can provide more
  /// context and details about the response. It can be used to convey additional
  /// information about the outcome of the operation or any specific error messages.
  final String? message;

  /// Creates a new instance of [Response].
  ///
  /// The `code` parameter is required and represents the status code of the response.
  /// The `message` parameter is optional and can be null if not provided.
  Response({
    required this.code,
    this.message,
  });
}
