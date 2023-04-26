import 'package:neo4j_http_client/src/interface.dart';

class HttpErrorImpl extends HttpError {
  HttpErrorImpl({required this.code, required this.message});

  @override
  final int code;

  @override
  final String message;

  @override
  String toString() => 'HttpError: $code, $message';
}

class ClientErrorImpl extends ClientError {
  ClientErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() => 'ClientError: $message';
}
