import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_1/screens/shop_list_screen.dart';
import 'package:flutter_app_1/services/shop_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    runApp(
      ChangeNotifierProvider(
        create: (context) => ShopService(),
        child: const MyApp(),
      ),
    );
  } catch (e) {
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Failed to initialize Firebase: $e'),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShopListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}