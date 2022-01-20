import 'package:retailer_app/models/intities/Cart_Item.dart';

class Cart {
  int? id;
  String? totalPrice;
  String? accountid;
  List<CartItem>? cartItems;

  Cart();

  Cart.fromJson(json) {
    try {
      id = json["id"];
      cartItems = CartItem().fromJsonList(json["cartItems"]);
      totalPrice = json['total'].toString();
      accountid = json["accountId"] ?? '';
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
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
