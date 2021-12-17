import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retailer_app/models/Cart.dart';
import 'package:retailer_app/models/intities/Cart_Item.dart';
import 'package:retailer_app/models/Product.dart';
import 'dart:convert';

import 'dart:async';

import 'package:retailer_app/services/api_services.dart';
import 'package:retailer_app/services/exceptions.dart';

class ProductApi extends ApiService {
  String baseURL = 'http://192.168.0.120:3000';

  Future<List<Product>> getProducts() =>
      http.get(Uri.parse('$baseURL/products')).then((response) {
        print(response.body);
        print('this api' +
            Product().fromJsonList(returnResponse(response)).length.toString());
        return Product().fromJsonList(returnResponse(response));
      });

  void addToCart({required CartItem cartItem}) => http
          .post(
        Uri.parse('$baseURL/carts/item'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(CartItem().toJson()),
      )
          .then((value) {
        print('[Add to Cart]' + value.toString());
      });

  Future<Cart> getCart() =>
      http.get(Uri.parse('$baseURL/carts')).then((response) {
        print(response.body);
        print('this api' + Cart.fromJson(returnResponse(response)).toString());
        var res = jsonDecode(response.body);
        return Cart.fromJson(returnResponse(response));
      });
}
