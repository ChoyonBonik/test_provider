import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/providers/menu_provider.dart';
import 'package:test_provider/screens/cart_screen.dart';
import 'package:test_provider/screens/catalog_screen.dart';
import 'package:test_provider/screens/home_page.dart';

import 'providers/cart_provider.dart';

void main() {
  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuProvider(),
      child: MaterialApp(
        title: 'Provider API Call',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
  }

