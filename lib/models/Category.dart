import 'dart:convert';

import 'package:retailer_app/models/ProductType.dart';

import 'Product.dart';

class Category {
  int? id;
  String? sku;
  String? name;
  int? totalProduct;
  List<ProductType>? productTypes;

  Category();
  Category.addAllCategory() {
    name = "All";
  }

  Category.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson['slug'] == 'uncategorized') {
      return;
    }

    try {
      id = parsedJson['id'];
      name = parsedJson['name'].toString();
      productTypes = ProductType().fromJsonList(parsedJson['productTypes']);
      totalProduct = parsedJson['totalProducts'];
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  List<Category> fromJsonList(jsonList) {
    var json = jsonList ?? [];
    return List<Category>.from(json.map((e) => Category.fromJson(e)).toList());
  }

  @override
  String toString() => 'Category { id: $id  name: $name}';
}
