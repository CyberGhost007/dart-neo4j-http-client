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

  // Create a Person node
  final createQuery = Query('CREATE (p:Person {name: "Alice", age: 30})');
  await client.execute([createQuery]);
  print('Person node created.');

  // Read the Person node
  final readQuery = Query('MATCH (p:Person {name: "Alice"}) RETURN p');
  final readResult = await client.execute([readQuery]);
  print('Person node read:');
  readResult.results!.first.toRecords().forEach((record) => print(record));

  // Update the Person node
  final updateQuery =
      Query('MATCH (p:Person {name: "Alice"}) SET p.age = 31 RETURN p');
  final updateResult = await client.execute([updateQuery]);
  print('Person node updated:');
  updateResult.results!.first.toRecords().forEach((record) => print(record));

  // Delete the Person node
  final deleteQuery = Query('MATCH (p:Person {name: "Alice"}) DELETE p');
  await client.execute([deleteQuery]);
  print('Person node deleted.');

  client.close();
}
