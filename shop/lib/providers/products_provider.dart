import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/http_exception.dart';
import 'product.dart';

class ProductsProvider with ChangeNotifier {
  final String _baseUrl = 'https://cod3r-shop-603d1.firebaseio.com/products';
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  Future addOrUpdateProduct(Product product) {
    if (product.id == null) {
      return addProduct(product);
    }
    return updateProduct(product);
  }

  Future<void> loadProducts() async {
    final response = await http.get("$_baseUrl.json");

    Map<String, dynamic> data = json.decode(response.body);
    if (data == null) {
      return Future.value();
    }
    _items.clear();
    data.forEach((productId, product) {
      _items.add(Product(
        id: productId,
        title: product['title'],
        description: product['description'],
        price: product['price'],
        imageUrl: product['imageUrl'],
        isFavorite: product['isFavorite'],
      ));
    });
    notifyListeners();
    return Future.value();
  }

  Future<void> addProduct(Product newProduct) async {
    final body = json.encode({
      'title': newProduct.title,
      'description': newProduct.description,
      'price': newProduct.price,
      'imageUrl': newProduct.imageUrl,
      'isFavorite': newProduct.isFavorite,
    });

    final id = await http.post("$_baseUrl.json", body: body).then((value) {
      return json.decode(value.body)['name'];
    });

    _items.add(Product(
      id: id,
      title: newProduct.title,
      description: newProduct.description,
      price: newProduct.price,
      imageUrl: newProduct.imageUrl,
    ));

    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    if (product == null && product.id != null) {
      return Future.value();
    }

    final index = _items.indexWhere((prod) => prod.id == product.id);
    if (index >= 0) {
      final body = json.encode({
        'title': product.title,
        'description': product.description,
        'price': product.price,
        'imageUrl': product.imageUrl,
      });

      final response = await http.patch(
        "$_baseUrl/${product.id}.json",
        body: json.encode(body),
      );

      if (response.statusCode >= 400) {
        throw HttpException("Ocorreu um erro ao atualizar o produto");
      }

      _items[index] = product;
      notifyListeners();
    }
    return Future.value();
  }

  Future<void> deleteProduct(String id) async {
    final index = _items.indexWhere((prod) => prod.id == id);

    if (index >= 0) {
      final product = _items[index];
      _items.remove(product);
      notifyListeners();

      final response = await http.delete("$_baseUrl/${product.id}.json");

      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException("Ocorreu um erro na exclusão do produto");
      }
    }
  }
}
