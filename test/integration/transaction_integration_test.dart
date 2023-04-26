import 'package:neo4j_http_client/neo4j_http_client.dart';
import 'package:test/test.dart';

import '../environment.dart';

void main() {
  // Set up connection information
  final client = Client(
    url: Uri.parse(Environment.databaseUrl),
    database: Environment.databaseName,
    username: Environment.databaseUsername,
    password: Environment.databasePassword,
  );

  setUp(() async {
    // Delete any existing test data
    await client.execute([Query('MATCH (n:Person) DETACH DELETE n')]);
  });

  group('Transaction', () {
    test('begin, commit, rollback', () async {
      // Begin a new transaction
      final transaction = await client.beginTransaction();

      // Insert test data within the transaction
      await transaction
          .execute([Query('CREATE (:Person {name: "Alice", age: 30})')]);

      // Query the test data within the transaction
      final query = Query('MATCH (n:Person {name: "Alice"}) RETURN n');
      final response = await transaction.execute([query]);

      // Check if test data is fetched within the transaction
      final record = response.results!.first.toRecords().first['n']
          as Map<String, dynamic>;
      expect(record['name'], 'Alice');
      expect(record['age'], 30);

      // Commit the transaction
      await transaction.commit();

      // Verify that the test data is persisted after committing the transaction
      final committedResponse = await client.execute([query]);
      final committedRecord = committedResponse.results!.first
          .toRecords()
          .first['n'] as Map<String, dynamic>;
      expect(committedRecord['name'], 'Alice');
      expect(committedRecord['age'], 30);

      // Begin a new transaction
      final rollbackTransaction = await client.beginTransaction();

      // Insert test data within the transaction
      await rollbackTransaction
          .execute([Query('CREATE (:Person {name: "Bob", age: 40})')]);

      // Rollback the transaction
      await rollbackTransaction.rollback();

      // Verify that the test data is not persisted after rolling back the transaction
      final rollbackQuery = Query('MATCH (n:Person {name: "Bob"}) RETURN n');
      final rollbackResponse = await client.execute([rollbackQuery]);
      expect(rollbackResponse.results!.first.data!.isEmpty, true);
    });
  });
}
