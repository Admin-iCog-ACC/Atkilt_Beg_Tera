import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retailer_app/models/Product.dart';

class ProductsMock {
  Future<List<Product>> loadLocalProducts() async {
    try {
      String response =
          await rootBundle.loadString('assets/mock/products.json');

      List<dynamic> result = json.decode(response);
      return result.map((n) => Product.fromJson(n)).toList();
    } catch (e) {
      throw Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Text('Convert Error'),
        ),
      );
    }
  }
}
