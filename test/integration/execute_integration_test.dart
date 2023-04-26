import 'dart:io';

import 'package:neo4j_http_client/src/interface.dart';
import 'package:test/test.dart';

import '../environment.dart';

void main() {
  // Set up connection information
  final client = Client(
    url: Uri.parse(Environment.databaseUrl),
    database: Environment.databaseName,
    username: Environment.databaseUsername,
    password: Environment.databasePassword,
  ); // Example of getting connection information from environment variables

  setUp(() async {
    // Insert test data
    await client.execute([Query('CREATE (:Person {name: "Alice", age: 30})')]);

    // Adding a short delay to ensure the server-side query execution
    // completes before proceeding to the next test.
    sleep(const Duration(milliseconds: 100));
  });

  tearDown(() async {
    // Delete test data
    await client.execute([Query('MATCH (n:Person) DETACH DELETE n')]);
  });

  test('execute', () async {
    // Execute a query to fetch test data
    final query = Query('MATCH (n:Person {name: "Alice"}) RETURN n');
    final response = await client.execute([query]);

    // Compare expected results with actual results
    final record =
        response.results!.first.toRecords().first['n'] as Map<String, dynamic>;
    expect(record['name'], 'Alice');
    expect(record['age'], 30);

    final records = response.results!.first.toRecords();
    for (final record in records) {
      print('record: $record');
      print('Name: ${record['name']}, Age: ${record['age']}');
    }
  });
}
