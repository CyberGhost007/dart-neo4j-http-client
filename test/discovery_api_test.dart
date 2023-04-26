import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:neo4j_http_client/src/impl/discovery.dart';
import 'package:test/test.dart';

void main() {
  group('Neo4jDiscoveryApi', () {
    test('getRootDiscovery', () async {
      final mockClient = MockClient((request) async {
        return Response(
          jsonEncode({
            'bolt_direct': 'bolt://localhost:7687',
            'bolt_routing': 'neo4j://localhost:7687',
            'transaction': 'http://localhost:7474/db/{databaseName}/tx',
            'neo4j_version': '4.4.0',
            'neo4j_edition': 'enterprise'
          }),
          200,
        );
      });

      final discoveryApi = DiscoveryApiImpl(
        url: Uri.parse('http://localhost:7474/'),
        client: mockClient,
      );

      final response = await discoveryApi.getRootDiscovery();
      expect(response.boltDirect, 'bolt://localhost:7687');
      expect(response.boltRouting, 'neo4j://localhost:7687');
      expect(
        response.transaction,
        'http://localhost:7474/db/{databaseName}/tx',
      );
      expect(response.neo4jVersion, '4.4.0');
      expect(response.neo4jEdition, 'enterprise');
    });
  });
}
