# Neo4j HTTP API Client

A Dart/Flutter library for interacting with the Neo4j HTTP API.

This library allows you to use the Neo4j HTTP API to interact with a Neo4j database. It supports Neo4j v5. More information about the HTTP API can be found in the [official documentation](https://neo4j.com/docs/http-api/current/).

## Features

- Discovery API
- Query execution
- Transactions
- Authentication and authorization

## Installation

### Flutter

```bash
flutter pub add neo4j_http_client
```

### Dart

```bash
dart pub add neo4j_http_client
```

## Usage

### Connecting and sending a single query

```dart
import 'package:neo4j_http_client/neo4j_http_client.dart';

final client = Client(
  url: Uri.parse('http://localhost:7474/db/data'),
  database: 'test',
  username: 'username',
  password: 'password',
);

final query = Query('MATCH (n) RETURN n LIMIT 10');
final response = await client.execute([query]);
client.close();

print(response.results);
```

### Sending multiple queries

```dart
import 'package:neo4j_http_client/neo4j_http_client.dart';

final client = Client(
  url: Uri.parse('http://localhost:7474/db/data'),
  database: 'test',
  username: 'username',
  password: 'password',
);

final query = Query.fromMap({
  'MATCH (n) RETURN n LIMIT $limit': {'limit': 5},
  'MATCH (n) RETURN n SKIP $skip LIMIT $limit': {'skip': 5, 'limit': 5},
});
final response = await client.execute([query]);
client.close();

print(response.results);
```

### Transaction

```dart
import 'package:neo4j_http_client/neo4j_http_client.dart';

final client = Client(
  url: Uri.parse('http://localhost:7474/db/data'),
  database: 'test',
  username: 'username',
  password: 'password',
);

final transaction = await client.beginTransaction();
final query = Query('CREATE (n:Person {name: "John"}) RETURN n');
await transaction.execute([query]);

// Commit the transaction
await transaction.commit();

// Or rollback the transaction
// await transaction.rollback();

client.close();
```

### Fetching data and converting it to a list of records

You can use the `toRecords()` method on a `Result` instance to convert the fetched data into a list of records, where each record is a `Map<String, dynamic>` with column names as keys and corresponding values.

```dart
final query = Query('MATCH (n:Person {name: "Alice"}) RETURN n');
final response = await client.execute([query]);
client.close();
final result = response.results.first;

// Convert the result to a list of records
final records = result.toRecords();
for (final record in records) {
  final node = record['n'];
  print('Name: ${node['name']}, Age: ${node['age']}');
}
```

The `records` variable will contain data in the following format:

```dart
[
  {'n': {'name': 'Alice', 'age': 30}},
  // ...
]
```

In this example, the key `n` is derived from the query's `RETURN n` statement. This makes it easier to work with the fetched data in your application.

## TODO

- `USING PERIODIC COMMIT`
- [Include query statistics](https://neo4j.com/docs/http-api/current/actions/include-query-statistics/)
- [Return results in graph format](https://neo4j.com/docs/http-api/current/actions/return-results-in-graph-format/)

## License

This library is licensed under the Apache License 2.0.

## Author

SUZUKI Tetsuya <tetsuya.suzuki at gmail.com>