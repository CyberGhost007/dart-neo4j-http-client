import 'dart:async';

import 'package:neo4j_http_client/neo4j_http_client.dart';

import 'lib/environment.dart';

Future<void> main() async {
  // Create a Neo4jClient instance
  final client = Client(
    url: Uri.parse(Environment.databaseUrl),
    username: Environment.databaseUsername,
    password: Environment.databasePassword,
    database: Environment.databaseName,
  );

  try {
    // Begin a transaction
    final transaction = await client.beginTransaction();

    // Execute a query within the transaction
    final query1 = Query('CREATE (n:Person {name: "John", age: 25})');
    final response1 = await transaction.execute([query1]);
    if (response1.errors?.isNotEmpty ?? false) {
      // If there are errors, rollback the transaction
      await transaction.rollback();
      print('Transaction rolled back due to errors.');
      return;
    }

    // Execute another query within the transaction
    final query2 = Query('CREATE (n:Person {name: "Jane", age: 28})');
    final response2 = await transaction.execute([query2]);
    if (response2.errors?.isNotEmpty ?? false) {
      // If there are errors, rollback the transaction
      await transaction.rollback();
      print('Transaction rolled back due to errors.');
      return;
    }

    // Commit the transaction
    await transaction.commit();
    print('Transaction committed successfully.');

    // Delete the created data
    final deleteQuery =
        Query('MATCH (n:Person) WHERE n.name IN ["John", "Jane"] DELETE n');
    await client.execute([deleteQuery]);
  } catch (e) {
    print('Error: $e');
  } finally {
    // Close the client
    client.close();
  }
}
