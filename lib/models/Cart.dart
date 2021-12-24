import 'package:retailer_app/models/intities/Cart_Item.dart';

class Cart {
  String? id;
  String? totalPrice;
  String? accountid;
  List<CartItem>? cartItems;

  Cart();

  Cart.fromJson(json) {
    id = json["id"].toString();
    cartItems = CartItem().fromJsonList(json["cartItems"]);
    totalPrice = json['total'].toString();
    accountid = json["accountId"] ?? '';
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'quantity': 15,
  //     'total': 500,
  //     'customerId': '58454',
  //     'product': {"id": 7}
  //   };
  // }
}
