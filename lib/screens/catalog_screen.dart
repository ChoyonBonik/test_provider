import 'package:flutter/material.dart';
import 'package:test_provider/screens/widget.dart';

import 'cart_screen.dart';
import 'items_list.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalog"),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    )),
                child: const Icon(Icons.shopping_cart)),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: ListView.builder(
          itemCount: catalog.length,
          itemBuilder: (context, index) => ItemWidget(
            item: catalog[index],
          ),
        ));
  }
}
