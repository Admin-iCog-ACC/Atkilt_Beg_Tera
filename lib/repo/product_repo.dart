import 'package:retailer_app/APIs/Product_API.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:flutter/material.dart';

class ProductRepository extends ChangeNotifier {
  final _api = ProductApi();
  // List<Product> getProducts(int categoryID) {}
  Future<List<Product>> getAllProducts() async {
    var products = _api.getProducts();
    return products;
  }
}
