import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/screens/widget.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Cart"),
            centerTitle: true,
           ),
        body: Consumer<CartProvider>(
          builder: (context, provider, child) => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.cartItems.length,
                  itemBuilder: (context, index) => ItemWidget(
                    isCartItem: true,
                    item: provider.cartItems[index],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
