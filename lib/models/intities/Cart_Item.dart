import 'package:json_annotation/json_annotation.dart';
import 'package:retailer_app/models/Product.dart';

@JsonSerializable()
class CartItem {
  String? cartid;
  Product? product;
  int? quantity;
  double? total;
  String? customerId;

  CartItem(
      {this.cartid, this.customerId, this.product, this.quantity, this.total});

  CartItem.fromJson(json) {
    cartid = json["cartid"];
    product = Product.fromJson(json["Product"]) ?? new Product();
    quantity = json["quantity"];
    total = double.parse(json["total"].toString());
    customerId = json["customerId"];
  }

  Map<String, dynamic> toJson() {
    return {
      'cartid': 'cartid',
      'quantity': 15,
      'total': 500,
      'customerId': '58454',
      'product': {"id": 7}
    };
  }

  List<CartItem> fromJsonList(jsonlist) {
    var json = jsonlist ?? [];
    return List<CartItem>.from(json.map((item) => CartItem.fromJson(item)));
  }
}
