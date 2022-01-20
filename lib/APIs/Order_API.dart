import 'dart:convert';

import 'package:retailer_app/models/Order.dart';
import 'package:retailer_app/services/api_web.dart' as http;
import 'package:retailer_app/constants/Constants.dart';
import 'package:retailer_app/models/Product.dart';

import 'dart:async';

import 'package:retailer_app/services/api_services.dart';

class OrderAPI extends APIService {
  ConstVals constVals = ConstVals();
  Future<Order> createOrder() => http
          .post(APIService(
              url: Uri.parse('${constVals.getBaseURL()}/carts/checkout'),
              body: jsonEncode({
                "billingAddress": "Addis Ababa",
                "shippingAddress": "Addis Ababa",
                "shippingLatitude": 234,
                "shippingLongitude": 232
                // "deliveryDate":
              })))
          .then((response) {
        print(response.body);
        print('this api' + Order.fromJson(returnResponse(response)).toString());
        return Order.fromJson(returnResponse(response)['order']);
      });

  Future<List<Order>> getOrder() => http
          .get(APIService(url: Uri.parse('${constVals.getBaseURL()}/orders')))
          .then((response) {
        print(response.body);
        return Order().fromJsonList(returnResponse(response));
      });

  Future<Order> updateOrder(Order order) => http
          .post(
        APIService(
          url: Uri.parse(
              '${constVals.getBaseURL()} /orders/${order.id}/progressOrder'),
        ),
      )
          .then((response) {
        print(response.body);
        return Order.fromJson(returnResponse(response));
      });
}
