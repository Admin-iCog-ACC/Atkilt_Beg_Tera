import 'dart:convert';

import 'package:retailer_app/models/Order.dart';
import 'package:http/http.dart' as http;
import 'package:retailer_app/constants/Constants.dart';
import 'package:retailer_app/models/Product.dart';

import 'dart:async';

import 'package:retailer_app/services/api_services.dart';

class OrderAPI extends APIService {
  Future<Order> createOrder() => http.post(
        Uri.parse('$baseURL/carts/checkout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        // body: jsonEncode(
        //     '{"billingAddress": "Mikes House",  "shippingAddress": "Mikes House",    "shippingLatitude": 234,    "shippingLongitude": 232}'),
      ).then((response) {
        print(response.body);
        print('this api' + Order.fromJson(returnResponse(response)).toString());
        return Order.fromJson(returnResponse(response)['order']);
      });

  Future<List<Order>> getOrder() => http
          .get(
        Uri.parse('$baseURL/orders/'),
      )
          .then((response) {
        print(response.body);
        return Order().fromJsonList(returnResponse(response));
      });
}
