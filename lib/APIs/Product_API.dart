import 'package:http/http.dart' as http;
import 'package:retailer_app/constants/Constants.dart';

import 'package:retailer_app/models/Product.dart';

import 'dart:async';

import 'package:retailer_app/services/api_services.dart';

class ProductApi extends APIService {
  Future<List<Product>> getProducts() => http
          .get(
        Uri.parse('$baseURL/products'),
      )
          .then((response) {
        print(response.body);
        print('this api' +
            Product().fromJsonList(returnResponse(response)).length.toString());
        return Product().fromJsonList(returnResponse(response));
      });
}
