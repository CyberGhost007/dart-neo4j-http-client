import 'dart:async';
import 'dart:convert';

import 'package:neo4j_http_client/src/impl/error.dart';
import 'package:neo4j_http_client/src/interface.dart';

enum TransactionStatus { active, terminated }

class TransactionImpl extends Transaction {
  TransactionImpl({
    required this.client,
    required this.commitUrl,
    required this.timeout,
    required this.keepAliveInterval,
  }) : url = Uri.parse(
          commitUrl.toString().replaceFirst('/commit', ''),
        ) {
    _startTimeoutCount();
  }

  final Client client;

  final Uri url;

  final Uri commitUrl;

  final Duration timeout;
  final Duration keepAliveInterval;
  TransactionStatus status = TransactionStatus.active;

  Timer? _keepAliveTimer;
  Timer? _timeoutTimer;

  void _startTimeoutCount() {
    _resetTimeoutTimer();
    _startKeepAliveTimer();
  }

  void _resetTimeoutTimer() {
    _timeoutTimer?.cancel();
    _timeoutTimer = Timer(timeout, () {
      if (status == TransactionStatus.active) {
        rollback();
        status = TransactionStatus.terminated;
      }
    });
  }

  void _startKeepAliveTimer() {
    _keepAliveTimer = Timer.periodic(keepAliveInterval, (Timer timer) async {
      if (status == TransactionStatus.active) {
        await client.sendRequest(
          uri: url,
          body: json.encode({'statements': <dynamic>[]}),
        );
      } else {
        timer.cancel();
      }
    });
  }

  void _checkStatus() {
    if (status == TransactionStatus.terminated) {
      throw ClientErrorImpl(
        message: 'Transaction has already been terminated.',
      );
    }
  }

  @override
  Future<Response> execute(List<Query> queries) async {
    _checkStatus();
    _resetTimeoutTimer();
    return client.execute(queries, targetUrl: url);
  }

  @override
  Future<Response> commit({List<Query>? queries}) async {
    _checkStatus();
    final response = await client.execute(
      queries ?? [],
      targetUrl: commitUrl,
    );
    status = TransactionStatus.terminated;
    return response;
  }

  @override
  Future<void> rollback() async {
    _checkStatus();
    _timeoutTimer?.cancel();
    _keepAliveTimer?.cancel();

    // Send a DELETE request to the transaction URL
    final response = await client.sendRequest(
      method: 'DELETE',
      uri: url,
    );

    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200) {
      status = TransactionStatus.terminated;
      return;
    } else {
      // Handle errors, for example, throw an exception
      throw HttpErrorImpl(
        code: response.statusCode,
        message: 'Failed to rollback the transaction.',
      );
    }
  }
}
