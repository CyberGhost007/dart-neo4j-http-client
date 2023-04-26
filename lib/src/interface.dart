import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:neo4j_http_client/src/impl/client.dart';
import 'package:neo4j_http_client/src/impl/discovery.dart';

part 'interface.freezed.dart';
part 'interface.g.dart';

/// Represents a Neo4j query with its statement and optional parameters.
class Query {
  /// Creates a new Query instance with the given statement and
  /// optional parameters.
  Query(this.statement, {this.parameters});

  final String statement;
  final Map<String, dynamic>? parameters;
}

/// Provides an interface to interact with a Neo4j database.
abstract class Client {
  /// Creates a new Neo4jClient instance with the given configuration.
  factory Client({
    required Uri url,
    required String database,
    String? username,
    String? password,
    http.Client? httpClient,
  }) {
    return ClientImpl(
      url: url,
      database: database,
      username: username,
      password: password,
      httpClient: httpClient,
    );
  }

  /// The URL of the Neo4j database.
  Uri get url;

  /// The name of the Neo4j database.
  String get database;

  /// The username for authentication (if required).
  String? get username;

  /// The password for authentication (if required).
  String? get password;

  /// An instance of `http.Client` used for making HTTP requests
  /// to the Neo4j server.
  http.Client get httpClient;

  /// Sends an HTTP request to the Neo4j database with the given configuration.
  Future<http.Response> sendRequest({
    required Uri uri,
    String method = 'POST',
    Map<String, String>? headers,
    dynamic body,
  });

  /// Executes queries against the Neo4j database.
  Future<Response> execute(
    List<Query> queries, {
    Uri? targetUrl,
  });

  /// Begins a new transaction with an optional Query.
  Future<Transaction> beginTransaction({
    List<Query>? queries,
    Duration timeout = const Duration(seconds: 60),
    Duration keepAliveInterval = const Duration(seconds: 30),
  });

  void close();
}

/// Represents a Neo4j transaction.
abstract class Transaction {
  /// Executes a Query within the current transaction.
  Future<Response> execute(List<Query> queries);

  /// Commits the current transaction with an optional Query.
  Future<Response> commit({List<Query>? queries});

  /// Rolls back the current transaction.
  Future<void> rollback();
}

/// Represents a response from the Neo4j database.
@freezed
class Response with _$Response {
  const factory Response({
    List<Result>? results,
    List<QueryError>? errors,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    List<String>? columns,
    List<Row>? data,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

extension ResultExtension on Result {
  List<Map<String, dynamic>> toRecords() {
    return data?.map((row) {
          final record = <String, dynamic>{};
          for (var i = 0; i < columns!.length; i++) {
            record[columns![i]] = row.row![i];
          }
          return record;
        }).toList() ??
        [];
  }
}

@freezed
class Row with _$Row {
  const factory Row({
    List<dynamic>? row,
    List<dynamic>? meta,
  }) = _Row;

  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);
}

/// Represents an HTTP error when interacting with the Neo4j database.
abstract class HttpError extends Error {
  /// The HTTP status code of the error.
  int get code;

  /// The error message.
  String get message;
}

/// Represents a client-side error when interacting with the Neo4j database.
@freezed
abstract class QueryError with _$QueryError {
  const factory QueryError({
    required String code,
    required String message,
  }) = _QueryError;

  factory QueryError.fromJson(Map<String, dynamic> json) =>
      _$QueryErrorFromJson(json);
}

abstract class ClientError extends Error {
  String get message;
}

/// An API for fetching root discovery information from the Neo4j server.
abstract class DiscoveryApi {
  /// Creates a new instance of [DiscoveryApi] using the specified [url]
  /// for the Neo4j server root discovery endpoint.
  factory DiscoveryApi({required Uri url}) {
    return DiscoveryApiImpl(url: url);
  }

  /// The URL of the Neo4j server root discovery endpoint.
  Uri get url;

  /// Fetches the root discovery information from the Neo4j server.
  Future<DiscoveryResponse> getRootDiscovery();
}

/// A response object containing the root discovery information
/// from the Neo4j server.
@freezed
class DiscoveryResponse with _$DiscoveryResponse {
  const factory DiscoveryResponse({
    @JsonKey(name: 'neo4j_version') String? neo4jVersion,
    @JsonKey(name: 'neo4j_edition') String? neo4jEdition,
    @JsonKey(name: 'transaction') String? transaction,
    @JsonKey(name: 'bolt_direct') String? boltDirect,
    @JsonKey(name: 'bolt_routing') String? boltRouting,
  }) = _DiscoveryResponse;

  factory DiscoveryResponse.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryResponseFromJson(json);
}
