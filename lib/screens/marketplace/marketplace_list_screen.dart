import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qoruz_market_app/core/app_theme.dart';

import '../../models/marketplace_item.dart';
import '../../providers/marketplace_provider.dart';
import 'marketplace_item.dart';

class MarketplaceListScreen extends StatefulWidget {
  const MarketplaceListScreen({super.key});

  @override
  State<MarketplaceListScreen> createState() => _MarketplaceListScreenState();
}

class _MarketplaceListScreenState extends State<MarketplaceListScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  // Sample data for different tabs
  int _selectedTabIndex = 0;
  final List<String> _tabTitles = ['For You', 'Recent', 'My Requests', 'Top 1'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabTitles.length, vsync: this);
    final provider = Provider.of<MarketplaceProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.loadItems();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        provider.loadItems();
      }
    });

    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });

    // Listen to search text changes
    _searchController.addListener(() {
      final provider = Provider.of<MarketplaceProvider>(context, listen: false);
      provider.setSearchQuery(_searchController.text);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: AppTheme.appBarGradient),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_rounded, color: AppTheme.textWhite),
            onPressed: () {
              Fluttertoast.showToast(msg: 'Menu clicked');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(16),
            child: Consumer<MarketplaceProvider>(
              builder: (context, provider, child) {
                return TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Type your requirement here...',
                    hintStyle: AppTheme.bodyText,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: CachedNetworkImageProvider(
                          "https://www.gstatic.com/webp/gallery/1.jpg",
                        ),
                      ),
                    ),
                    suffixIcon: provider.searchQuery.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              provider.clearSearch();
                            },
                          )
                        : null,
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 4),
          // Custom Curved Tab Bar
          Container(
            width: double.infinity,
            height: 46,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(_tabTitles.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                          Fluttertoast.showToast(
                            msg: "${_tabTitles[index]} clicked!",
                          );
                          _tabController.animateTo(index);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedTabIndex == index
                              ? AppTheme.buttonColor.withValues(alpha: 0.07)
                              : Colors.transparent,
                          border: Border.all(
                            color: _selectedTabIndex == index
                                ? AppTheme.buttonColor
                                : Colors.grey.shade300,
                            width: _selectedTabIndex == index ? 1.5 : 1,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Row(
                              children: [
                                if (index == 3)
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: Colors.amber,
                                  ),
                                Text(
                                  _tabTitles[index],
                                  style: TextStyle(
                                    color: _selectedTabIndex == index
                                        ? Colors.black
                                        : Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          // Tab Bar View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _tabTitles.map((title) {
                return _buildTabContent(title);
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        icon: Icon(Icons.add),
        onPressed: () {
          Fluttertoast.showToast(msg: 'Close clicked');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFE4545),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(25),
          ),
        ),
        label: Text('Post Request'),
      ),
    );
  }

  Widget _buildTabContent(String tabTitle) {
    return Consumer<MarketplaceProvider>(
      builder: (context, provider, child) {
        // Filter items based on tab selection
        List<MarketplaceItem> filteredItems = _filterItemsByTab(
          provider.items,
          tabTitle,
        );

        if (filteredItems.isEmpty && provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (provider.error.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${provider.error}'),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => provider.refresh(),
                  child: Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (filteredItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  provider.searchQuery.isNotEmpty
                      ? Icons.search_off
                      : Icons.inbox,
                  size: 64,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 16),
                Text(
                  provider.searchQuery.isNotEmpty
                      ? 'No results for "${provider.searchQuery}"'
                      : 'No items found',
                  style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                ),
                SizedBox(height: 8),
                Text(
                  provider.searchQuery.isNotEmpty
                      ? 'Try different keywords'
                      : 'Try changing your search or filters',
                  style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => provider.refresh(),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: filteredItems.length + (provider.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < filteredItems.length) {
                return MarketplaceItemWidget(item: filteredItems[index]);
              } else {
                return provider.hasMore
                    ? Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : SizedBox();
              }
            },
          ),
        );
      },
    );
  }

  List<MarketplaceItem> _filterItemsByTab(
    List<MarketplaceItem> items,
    String tabTitle,
  ) {
    // In a real app, you would implement proper filtering logic based on the tab
    // For now, we'll use simple mock filtering

    switch (tabTitle) {
      case 'For You':
        // Show all items for "For You" tab
        return items;
      case 'Recent':
        // Show items sorted by date (most recent first)
        return List.from(items)
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      case 'My Requests':
        // Show only high-value items for "My Requests" tab
        return items.where((item) => item.isHighValue).toList();
      case 'Top 1':
        // Show only the first item for "Top 1" tab
        return items.isNotEmpty ? [items.first] : [];
      default:
        return items;
    }
  }
}
