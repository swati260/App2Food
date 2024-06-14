import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/menu_model.dart';
import 'package:http/http.dart' as http;

class MenuProvider extends ChangeNotifier {
  List<Category> _categories = [];
  List<Product> _products = [];
  List<Product> _cart = [];
  int? _selectedCategoryId;

  MenuProvider() {
    fetchMenuItems('11002');
  }

  List<Category> get categories => _categories;
  List<Product> get products => _products;
  List<Product> get cart => _cart;
  int? get selectedCategoryId => _selectedCategoryId;

  Future<void> fetchMenuItems(String storeId) async {
    final String apiUrl =
        'https://staging.app2food.com/v30/api/store/menu?store_id=$storeId';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final MenuItem menuItem = MenuItem.fromJson(data);
      _categories = menuItem.categories;
      _products = menuItem.products;

      if (_categories.isNotEmpty) {
        _selectedCategoryId = _categories.first.storeCategoryId;
      }

      notifyListeners();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  void setSelectedCategoryId(int? categoryId) {
    _selectedCategoryId = categoryId;
    notifyListeners();
  }

  List<Product> getProductsForCategory(int? categoryId) {
    return _products.where((product) => product.cid == categoryId).toList();
  }

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  double getTotalAmount() {
    return _cart.fold(
        0, (sum, item) => sum + double.parse(item.productPrice ?? '0'));
  }

  int getTotalItems() {
    return _cart.length;
  }
}
