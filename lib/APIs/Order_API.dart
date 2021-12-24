import 'dart:convert';

import 'package:retailer_app/models/Order.dart';
import 'package:http/http.dart' as http;
import 'package:retailer_app/constants/Constants.dart';
import 'package:retailer_app/models/Product.dart';

import 'dart:async';

import 'package:retailer_app/services/api_services.dart';

class OrderAPI extends APIService {
  Future<Order> createOrder() => http
          .post(
        Uri.parse('$baseURL/carts/checkout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            '“shippingAddress”: “Addis Ababa”,“billingAddress”: “Addis Ababa”'),
      )
          .then((response) {
        print(response.body);
        print('this api' +
            Product().fromJsonList(returnResponse(response)).length.toString());
        return Order.fromJson(returnResponse(response));
      });
}
