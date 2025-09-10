import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:qoruz_market_app/core/app_theme.dart';
import 'package:qoruz_market_app/screens/main_navigation_screen.dart';
import 'providers/marketplace_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MarketplaceProvider(client: http.Client())..loadItems(),
        ),
      ],
      child: MaterialApp(
        title: 'Marketplace App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: MainNavigationScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}