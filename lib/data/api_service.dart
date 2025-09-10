import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';
import '../models/marketplace_item.dart';

class MarketplaceApi {
  
  static const String endpoint = '/interview.mplist';

  final http.Client client;

  MarketplaceApi(this.client);

  Future<List<MarketplaceItem>> getMarketplaceItems(int page) async {
    final response = await client.get(
      Uri.parse('${Constants.baseUrl}$endpoint?page=$page'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      // Check if the API response has the expected structure
      if (data['marketplace_requests'] is List) {
        final items = data['marketplace_requests'] as List;
        return items.map((item) => MarketplaceItem.fromJson(item)).toList();
      } else {
        throw Exception('Invalid API response format');
      }
    } else {
      throw Exception('Failed to load marketplace items: ${response.statusCode}');
    }
  }

  Future<MarketplaceItem> getMarketplaceItem(String idHash) async {
    final response = await client.get(
      Uri.parse('${Constants.baseUrl}$endpoint?id_hash=$idHash'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      // Check if the API response has the expected structure
      if (data['data'] is Map<String, dynamic>) {
        return MarketplaceItem.fromJson(data['data']);
      } else {
        throw Exception('Invalid API response format');
      }
    } else {
      throw Exception('Failed to load marketplace item: ${response.statusCode}');
    }
  }
}