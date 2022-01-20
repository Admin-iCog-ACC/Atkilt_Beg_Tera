import 'package:json_annotation/json_annotation.dart';
import 'package:retailer_app/models/Product.dart';

@JsonSerializable()
class CartItem {
  String? id;
  String? cartid;
  Product? product;
  int? quantity;
  double? total;
  String? customerId;

  CartItem(
      {this.id,
      this.cartid,
      this.customerId,
      this.product,
      this.quantity,
      this.total});

  CartItem.fromJson(json) {
    id = json['id'].toString();
    cartid = json["cartId"].toString();
    product = Product.fromJson(json["Product"] ?? {});
    quantity = int.parse(json["quantity"].toString());
    total = double.parse(json["total"].toString());
    customerId = json["customerId"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cartid': cartid,
      'quantity': '$quantity',
      'total': total,
      'customerId': customerId,
      'product': product!.toJson()
    };
  }

  @override
  String toString() {
    return 'CartItem{id: $id, cartid: $cartid, product: $product, quantity: $quantity, total: $total, customerId: $customerId}';
  }

  List<CartItem> fromJsonList(jsonlist) {
    var json = jsonlist ?? [];
    return List<CartItem>.from(json.map((item) => CartItem.fromJson(item)));
  }
}
