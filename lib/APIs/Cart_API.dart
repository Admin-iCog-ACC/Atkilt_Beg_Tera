import 'package:http/http.dart' as http;
import 'package:retailer_app/constants/Constants.dart';

import 'package:retailer_app/models/Cart.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/models/intities/Cart_Item.dart';
import 'dart:convert';

import 'dart:async';

import 'package:retailer_app/services/api_services.dart';

class CartApi extends APIService {
  Future<CartItem> addToCart({required CartItem cartItem}) => http
          .post(
        Uri.parse('$baseURL/carts/item'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cartItem.toJson()),
      )
          .then((response) {
        print('[Add Cart Item]' + response.body.toString());
        return CartItem.fromJson(returnResponse(response));
      });

  Future<Cart> getCart() =>
      http.get(Uri.parse('$baseURL/carts')).then((response) {
        print(response.body);
        print('this api' + Cart.fromJson(returnResponse(response)).toString());
        var res = jsonDecode(response.body);
        return Cart.fromJson(returnResponse(response));
      });

  Future<String> deleteCartItem({required CartItem cartItem}) => http.delete(
        Uri.parse('$baseURL/carts/item/${cartItem.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).then((value) {
        print('[Delete Cart Item]' + value.toString());
        return value.body;
      });

  Future<CartItem> updateCartItem({required CartItem cartItem}) => http
          .put(
        Uri.parse('$baseURL/carts/item/${cartItem.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cartItem.toJson()),
      )
          .then((response) {
        print('[Update Cart Item]' + response.body.toString());
        return CartItem.fromJson(returnResponse(response));
      });
}
