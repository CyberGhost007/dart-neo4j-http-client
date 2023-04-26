import 'package:neo4j_http_client/neo4j_http_client.dart';
import 'package:test/test.dart';

import '../environment.dart';

void main() {
  final client = Client(
    url: Uri.parse(Environment.databaseUrl),
    username: Environment.databaseUsername,
    password: Environment.databasePassword,
    database: Environment.databaseName,
  );

  setUp(() async {
    // Insert test data
    await client.execute([Query('CREATE (:Person {name: "Alice", age: 30})')]);
    await client.execute([Query('CREATE (:Person {name: "Bob", age: 40})')]);
    await client.execute([Query('CREATE (:Person {name: "Cathy", age: 50})')]);
    await client.execute([Query('CREATE (:Person {name: "Dave", age: 60})')]);
    await client.execute([Query('CREATE (:Person {name: "Eve", age: 70})')]);
  });

  tearDown(() async {
    // Remove test data
    await client.execute([Query('MATCH (n:Person) DETACH DELETE n')]);
  });

  test('parameterized multiple queries', () async {
    final query1 = Query(
      r'MATCH (n:Person) RETURN n ORDER BY n.age ASC LIMIT $limit',
      parameters: {'limit': 3},
    );
    final query2 = Query(
      r'MATCH (n:Person) RETURN n ORDER BY n.age DESC LIMIT $limit',
      parameters: {'limit': 2},
    );

    // Execute both queries in a single call
    final response = await client.execute([query1, query2]);

    // Verify the response data
    final records1 = response.results![0].toRecords();
    expect(records1.length, 3);
    expect(records1[0]['n']['name'], 'Alice');
    expect(records1[1]['n']['name'], 'Bob');
    expect(records1[2]['n']['name'], 'Cathy');

    final records2 = response.results![1].toRecords();
    expect(records2.length, 2);
    expect(records2[0]['n']['name'], 'Eve');
    expect(records2[1]['n']['name'], 'Dave');
  });
}
