import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../models/item_model.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item, this.isCartItem = false});
  final Item item;
  final bool isCartItem;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    return ListTile(
      title: Text(item.name),
      subtitle: Text("${item.price} \$"),
      trailing: isCartItem
          ? null
          : ElevatedButton(
              onPressed: () => provider.addItem(item),
              child: const Text("Add")),
    );
  }
}
