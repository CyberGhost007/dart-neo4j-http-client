import 'package:neo4j_http_client/src/interface.dart';
import 'package:test/test.dart';

void main() {
  group('Query', () {
    test('creates a Query instance', () {
      final query = Query('MATCH (n) RETURN n', parameters: {'key': 'value'});
      expect(query, isA<Query>());
      expect(query.statement, 'MATCH (n) RETURN n');
      expect(query.parameters, {'key': 'value'});
    });
  });
}
