import 'package:retailer_app/models/Category.dart';
import 'package:retailer_app/models/intities/product_attribute.dart';

class ProductType {
  int? id;
  String? name;
  int? categoryId;
  Category? category;
  ProductType();

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['categoryId'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  List<ProductType> fromJsonList(jsonList) {
    var json = jsonList ?? [];
    return List<ProductType>.from(
        json.map((e) => ProductType.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.categoryId;

    return data;
  }

  @override
  String toString() {
    return 'ProductType{id: $id, name: $name, category: $categoryId}';
  }
}
