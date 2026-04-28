import 'package:flutter/material.dart';

class CartManager extends ChangeNotifier {
  List<Map<String, dynamic>> items = [];

  void addToCart(Map<String, dynamic> product, {int quantity = 1}) {
    final index = items.indexWhere((item) => item["name"] == product["name"]);
    if (index != -1) {
      items[index]["quantity"] += quantity;
    } else {
      items.add({...product, "quantity": quantity});
    }
    notifyListeners();
    }

  void removeItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (var item in items) {
      total += (item["price"] as num) * (item["quantity"] as int);
    }
    return total;
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}