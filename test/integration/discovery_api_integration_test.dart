import 'package:neo4j_http_client/neo4j_http_client.dart';
import 'package:test/test.dart';

void main() {
  group('Neo4jDiscoveryApi Integration Test', () {
    test('getRootDiscovery returns a valid response', () async {
      final api = DiscoveryApi(url: Uri.parse('http://localhost:7474'));

      final response = await api.getRootDiscovery();

      expect(response, isNotNull);
      expect(response.boltDirect, isNotNull);
      expect(response.transaction, isNotNull);
      expect(response.neo4jVersion, isNotNull);
    });
  });
}
