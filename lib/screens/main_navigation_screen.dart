
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qoruz_market_app/screens/marketplace/marketplace_list_screen.dart';
import 'package:qoruz_market_app/screens/placeholderwidget.dart';

import '../core/app_theme.dart';

class MainNavigationScreen extends StatefulWidget{
  const MainNavigationScreen({super.key});


  @override
  State<StatefulWidget> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen>{
  int _selectedIndex = 0;

  List<String> pages = ["Explore", "Marketplace", "Search", "Activity", "Profile"];

  static final List<Widget> _pageOptions = <Widget>[
    PlaceholderWidget(title: 'Explore'),
    MarketplaceListScreen(),
    PlaceholderWidget(title: 'Search'),
    PlaceholderWidget(title: 'Activity'),
    PlaceholderWidget(title: 'Profile'),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      Fluttertoast.showToast(msg: "${pages[index]} page clicked!");
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: _pageOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Explore"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Marketplace"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: "Activity"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
            ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.buttonColor,
        selectedLabelStyle: AppTheme.label.copyWith(fontSize: 14),
        unselectedItemColor: AppTheme.textSecondary,
        unselectedLabelStyle: AppTheme.bodyText.copyWith(fontSize: 14),
        showUnselectedLabels: true,
        onTap: _onItemTapped,),
    );
  }
}