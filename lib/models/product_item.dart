import 'Product.dart';
import 'delivery_person.dart';
import 'package:intl/intl.dart';

class ProductItem {
  String? id;
  String? productId;
  String? variationId;
  String? name;
  int? quantity;
  String? total;
  String? totalTax;
  String? featuredImage;
  String? addonsOptions;
  List<String?> attributes = [];
  DeliveryUser? deliveryUser;
  String? storeId;
  String? storeName;
  Product? product;

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'name': name,
      'quantity': quantity,
      'total': total,
      'featuredImage': featuredImage
    };
  }

  ProductItem.fromLocalJson(Map<String, dynamic> parsedJson) {
    productId = "${parsedJson["product_id"]}";
    name = parsedJson['name'];
    quantity = parsedJson['quantity'];
    total = parsedJson['total'].toString();
    featuredImage = parsedJson['featuredImage'];
  }

//fromJsonList
  static List<ProductItem> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => ProductItem.fromLocalJson(item)).toList();
  }

  ProductItem.fromJson(Map<String, dynamic> parsedJson) {
    try {
      productId = parsedJson['product_id'].toString();
      variationId = parsedJson['variation_id'].toString();
      name = parsedJson['name'];
      quantity = int.parse("${parsedJson["quantity"]}");
      total = parsedJson['total'];
      totalTax = parsedJson['total_tax'];
      featuredImage = parsedJson['featured_image'];
      if (parsedJson['featured_image'] != null) {
        featuredImage = parsedJson['featured_image'];
      }

      final productData = parsedJson['product_data'];
      if (productData != null) {
        try {
          product = Product.fromJson(productData);
        } catch (e) {
          print('Error in product_item.dart - $name: $e');
        }
      }

      id = parsedJson['id'].toString();
      if (parsedJson['delivery_user'] != null) {
        deliveryUser = DeliveryUser.fromJson(parsedJson['delivery_user']);
      }
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
  }
}
