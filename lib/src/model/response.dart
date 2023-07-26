abstract class Response {
  final int code;

  final String? message;

  Response({
    required this.code,
    this.message,
  });
}
