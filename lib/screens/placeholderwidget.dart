import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/app_theme.dart';

class PlaceholderWidget extends StatelessWidget {
  final String title;

  const PlaceholderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
      body: Center(child: Text(title)),
    );
  }
}