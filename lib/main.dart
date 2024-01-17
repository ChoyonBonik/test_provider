import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/screens/cart_screen.dart';
import 'package:test_provider/screens/catalog_screen.dart';

import 'cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=> CartProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
     initialRoute: "/products",
      routes: {
        "/products": (context) => CatalogScreen(),
        "/cart": (context) => CartScreen(),
      },
    );
  }
}
