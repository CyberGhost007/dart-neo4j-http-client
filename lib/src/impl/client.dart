import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:neo4j_http_client/src/impl/error.dart';
import 'package:neo4j_http_client/src/impl/transaction.dart';
import 'package:neo4j_http_client/src/interface.dart';

class ClientImpl implements Client {
  ClientImpl({
    required this.url,
    required this.database,
    this.username,
    this.password,
    http.Client? httpClient,
  })  : httpClient = httpClient ?? http.Client(),
        _authHeader = {
          if (username != null && password != null)
            'Authorization':
                'Basic ${base64.encode(utf8.encode('$username:$password'))}'
        };

  @override
  final Uri url;

  @override
  late final http.Client httpClient;

  final Map<String, String> _authHeader;

  @override
  final String database;

  @override
  final String? username;

  @override
  final String? password;

  @override
  Future<Response> execute(
    List<Query> queries, {
    Uri? targetUrl,
  }) async {
    final requestBody = _createQueryRequestBody(queries);
    final response = await sendRequest(
      uri: targetUrl ?? url.resolve('/db/$database/tx/commit'),
      body: json.encode(requestBody),
    );

    return Response.fromJson(
      json.decode(response.body) as Map<String, dynamic>,
    );
  }

  static Map<String, dynamic> _createQueryRequestBody(List<Query>? queries) {
    return {
      'statements': queries?.map((query) {
            return {
              'statement': query.statement,
              'parameters': query.parameters ?? {}
            };
          }).toList() ??
          [],
    };
  }

  @override
  Future<http.Response> sendRequest({
    required Uri uri,
    String method = 'POST',
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final requestHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json;charset=UTF-8',
      ..._authHeader,
      if (headers != null) ...headers,
    };

    switch (method.toUpperCase()) {
      case 'GET':
        return httpClient.get(uri, headers: requestHeaders);
      case 'POST':
        return httpClient.post(uri, headers: requestHeaders, body: body);
      case 'PUT':
        return httpClient.put(uri, headers: requestHeaders, body: body);
      case 'DELETE':
        return httpClient.delete(uri, headers: requestHeaders);
      default:
        throw ArgumentError('Unsupported HTTP method: $method');
    }
  }

  @override
  Future<Transaction> beginTransaction({
    List<Query>? queries,
    Duration timeout = const Duration(seconds: 60),
    Duration keepAliveInterval = const Duration(seconds: 30),
  }) async {
    final requestBody = _createQueryRequestBody(queries);

    final response = await sendRequest(
      uri: url.resolve('/db/$database/tx'),
      body: json.encode(requestBody),
    );

    if (response.statusCode != 201) {
      throw HttpErrorImpl(
        code: response.statusCode,
        message: 'Failed to create a new transaction.',
      );
    }

    final responseBody = json.decode(response.body) as Map<String, dynamic>;
    final commitUrl = Uri.parse(responseBody['commit'] as String);

    return TransactionImpl(
      client: this,
      commitUrl: commitUrl,
      timeout: timeout,
      keepAliveInterval: keepAliveInterval,
    );
  }

  @override
  void close() {
    httpClient.close();
  }
}
