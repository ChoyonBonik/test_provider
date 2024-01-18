import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/item_model.dart';
class CartProvider extends ChangeNotifier {
  final List<Item> _cartItems = [];

  UnmodifiableListView get cartItems => UnmodifiableListView(_cartItems);


  void addItem(Item item) {
    _cartItems.add(item);
    notifyListeners();
    log("Item Added");
  }

  void reset() {
    _cartItems.clear();
    notifyListeners();
  }
}
