import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (currentItem) {
          return CartItem(
            id: currentItem.id,
            title: currentItem.title,
            quantity: currentItem.quantity + 1,
            price: currentItem.price,
          );
        },
      );
      notifyListeners();
      return;
    }

    _items.putIfAbsent(
      product.id,
      () => CartItem(
        id: Random().nextDouble().toString(),
        title: product.title,
        quantity: 1,
        price: product.price,
      ),
    );
    notifyListeners();
  }
}
