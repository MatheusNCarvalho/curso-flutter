import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['title'] = this.title;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    
    return data;
  }
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (currentItem) {
          return CartItem(
            id: currentItem.id,
            productId: product.id,
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
        productId: product.id,
        title: product.title,
        quantity: 1,
        price: product.price,
      ),
    );
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }

    if (_items[productId].quantity == 1) {
      _items.remove(productId);
    } else {
      _items.update(
        productId,
        (currentItem) {
          return CartItem(
            id: currentItem.id,
            productId: productId,
            title: currentItem.title,
            quantity: currentItem.quantity - 1,
            price: currentItem.price,
          );
        },
      );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
