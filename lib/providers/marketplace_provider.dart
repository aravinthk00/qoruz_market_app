import 'package:flutter/material.dart';
import '../data/api_service.dart';
import '../models/marketplace_item.dart';
import 'package:http/http.dart' as http;

class MarketplaceProvider with ChangeNotifier {
  final http.Client client;
  late MarketplaceApi api;

  MarketplaceProvider({required this.client}) {
    api = MarketplaceApi(client);
  }

  List<MarketplaceItem> _allItems = []; // Store all items
  List<MarketplaceItem> _items = []; // Store filtered items
  List<MarketplaceItem> get items => _items;

  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String _error = '';
  String get error => _error;
  
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  Future<void> loadItems() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final newItems = await api.getMarketplaceItems(_currentPage);
      _allItems.addAll(newItems);
      _items = _filterItemsBySearch(_allItems, _searchQuery);
      _currentPage++;
      
      // For now, we'll assume there are more pages if we get a full page of items
      // In a real app, you would check the pagination info from the API response
      _hasMore = newItems.length >= 20;
    } catch (e) {
      _error = e.toString();
      print('Error loading items: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _items = _filterItemsBySearch(_allItems, _searchQuery);
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _items = List.from(_allItems);
    notifyListeners();
  }

  List<MarketplaceItem> _filterItemsBySearch(List<MarketplaceItem> items, String query) {
    if (query.isEmpty) return List.from(items);
    
    final lowercaseQuery = query.toLowerCase();
    return items.where((item) {
      return item.postTitle.toLowerCase().contains(lowercaseQuery) ||
             item.description.toLowerCase().contains(lowercaseQuery) ||
             item.userName.toLowerCase().contains(lowercaseQuery) ||
             item.userCompany.toLowerCase().contains(lowercaseQuery) ||
             item.tags.any((tag) => tag.toLowerCase().contains(lowercaseQuery));
    }).toList();
  }

  Future<MarketplaceItem> getItem(String id) async {
    try {
      return await api.getMarketplaceItem(id);
    } catch (e) {
      print('Error loading item: $e');
      rethrow;
    }
  }

  void refresh() {
    _allItems = [];
    _items = [];
    _currentPage = 1;
    _hasMore = true;
    _error = '';
    _searchQuery = '';
    loadItems();
  }
}