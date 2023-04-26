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

  // Test the connection and authentication
  try {
    final response = await client.execute([Query('RETURN "Hello, World!"')]);
    print('Connection and authentication successful!');
    print('Response: ${response.results!.first.toRecords().first}');
  } on Exception catch (error) {
    print('Failed to connect or authenticate: $error');
  } finally {
    // Close the client after use
    client.close();
  }
}
