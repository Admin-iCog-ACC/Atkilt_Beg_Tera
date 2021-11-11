import 'package:json_annotation/json_annotation.dart';
import 'package:retailer_app/models/Product.dart';

@JsonSerializable()
class Cart {
  String cartid;
  Product product;
  int qunatity;
  double total;
  String customerId;

  Cart(
      {required this.cartid,
      required this.product,
      required this.qunatity,
      required this.total,
      required this.customerId});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      cartid: json["cartid"],
      product: Product.fromJson(json["product"]),
      qunatity: int.parse(json["qunatity"]),
      total: double.parse(json["total"]),
      customerId: json["customerId"],
    );
  }
//

}
