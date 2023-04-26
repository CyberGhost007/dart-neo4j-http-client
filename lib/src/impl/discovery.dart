import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:neo4j_http_client/src/interface.dart';

class DiscoveryApiImpl implements DiscoveryApi {
  DiscoveryApiImpl({required this.url, http.Client? client})
      : _client = client ?? http.Client();

  @override
  final Uri url;
  final http.Client _client;

  @override
  Future<DiscoveryResponse> getRootDiscovery() async {
    final response =
        await _client.get(url, headers: {'Accept': 'application/json'});

    if (response.statusCode == 200) {
      return DiscoveryResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to fetch root discovery information');
    }
  }
}
