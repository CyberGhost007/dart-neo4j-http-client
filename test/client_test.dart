import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:neo4j_http_client/neo4j_http_client.dart';
import 'package:neo4j_http_client/src/impl/transaction.dart';
import 'package:test/test.dart';

void main() {
  group('Client instantiation', () {
    test('Instance is created with the correct parameters', () {
      final url = Uri.parse('http://localhost:7474');
      const database = 'neo4j';
      const username = 'username';
      const password = 'password';

      final client = Client(
        url: url,
        database: database,
        username: username,
        password: password,
      );

      expect(client.url, equals(url));
      expect(client.database, equals(database));
      expect(client.username, equals(username));
      expect(client.password, equals(password));
    });
  });

  group('sendRequest', () {
    test(
        'sends a request with correct parameters and '
        'receives expected response', () async {
      final expectedResponse = jsonEncode({
        'results': <dynamic>[],
        'errors': <dynamic>[],
      });

      final mockClient = MockClient((request) async {
        expect(request.url.toString(), 'http://localhost:7474/db/test/tx');
        expect(request.method, 'POST');
        expect(
          request.headers['Content-Type'],
          'application/json; charset=utf-8',
        );
        expect(request.headers['Accept'], 'application/json;charset=UTF-8');
        expect(request.headers['Custom-Header'], 'CustomValue');
        return http.Response(expectedResponse, 200);
      });

      final client = Client(
        url: Uri.parse('http://localhost:7474/db/test/tx'),
        database: 'test',
        httpClient: mockClient,
      );

      final customHeader = {'Custom-Header': 'CustomValue'};

      final response = await client.sendRequest(
        uri: Uri.parse('http://localhost:7474/db/test/tx'),
        headers: customHeader,
        body: jsonEncode({'statements': <dynamic>[]}),
      );

      expect(response.body, expectedResponse);
      expect(response.statusCode, 200);
    });
  });

  group('execute', () {
    test('executes a query and receives expected Response', () async {
      final expectedResponseJson = {
        'results': [
          {
            'columns': ['name'],
            'data': [
              {
                'row': ['Alice']
              },
              {
                'row': ['Bob']
              }
            ]
          }
        ],
        'errors': <dynamic>[],
      };

      final mockClient = MockClient((request) async {
        expect(
          request.url.toString(),
          'http://localhost:7474/db/test/tx/commit',
        );
        expect(request.method, 'POST');
        return http.Response(jsonEncode(expectedResponseJson), 200);
      });

      final client = Client(
        url: Uri.parse('http://localhost:7474/db/test/tx/commit'),
        database: 'test',
        httpClient: mockClient,
      );

      final query = Query('MATCH (n) RETURN n.name AS name');

      final response = await client.execute([query]);
      final records = response.results![0].toRecords();

      expect(records.length, 2);
      expect(records[0], {'name': 'Alice'});
      expect(records[1], {'name': 'Bob'});
    });
  });

  group('transaction', () {
    test('beginTransaction', () async {
      final client = Client(
        url: Uri.parse('http://localhost:7474'),
        database: 'test',
        httpClient: MockClient((http.Request request) async {
          if (request.method == 'POST' && request.url.path == '/db/test/tx') {
            return http.Response(
              '{"commit": "http://localhost/db/test/tx/1/commit"}',
              201,
            );
          }
          return http.Response('', 404);
        }),
      );

      final transaction = await client.beginTransaction() as TransactionImpl;
      expect(transaction.url.toString(), 'http://localhost/db/test/tx/1');
      expect(
        transaction.commitUrl.toString(),
        'http://localhost/db/test/tx/1/commit',
      );
    });
  });
}
