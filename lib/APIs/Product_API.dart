import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:retailer_app/constants/Constants.dart';

import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/models/ProductType.dart';
import 'package:retailer_app/models/intities/ProductTypeAttribute.dart';
import 'package:retailer_app/models/intities/product_attribute.dart';

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

  Future<List<ProductType>> getProductTypes() {
    return http
        .get(
      Uri.parse('$baseURL/productTypes'),
    )
        .then((response) {
      print(response.body);
      print('this api' +
          ProductType()
              .fromJsonList(returnResponse(response))
              .length
              .toString());
      return ProductType().fromJsonList(returnResponse(response));
    });
  }

  Future<List<ProductTypeAttribute>> getAttributesQuestion(int productTypeId) {
    return http
        .get(
      Uri.parse('$baseURL/productTypes/$productTypeId/attributes'),
    )
        .then((response) {
      print(response.body);
      print('this api' +
          ProductAttribute()
              .fromJsonList(returnResponse(response))
              .length
              .toString());
      return ProductTypeAttribute().fromJsonList(returnResponse(response));
    });
  }

  Future<List<Product>> getProductsByType(int typeId) => http
          .get(
        Uri.parse('$baseURL/products/type/$typeId'),
      )
          .then((response) {
        print(response.body);
        print('this api' +
            Product().fromJsonList(returnResponse(response)).length.toString());
        return Product().fromJsonList(returnResponse(response));
      });

  Future<List<Product>> getProductsByTypeAndAttribute(
          int typeId, int attributeId) =>
      http
          .get(
        Uri.parse('$baseURL/products/type/$typeId/attribute/$attributeId'),
      )
          .then((response) {
        print(response.body);
        print('this api' +
            Product().fromJsonList(returnResponse(response)).length.toString());
        return Product().fromJsonList(returnResponse(response));
      });

  Future<List<Product>> getProductsByTypeAndAttributeAndValue(
          int typeId, int attributeId, int valueId) =>
      http
          .get(
        Uri.parse(
            '$baseURL/products/type/$typeId/attribute/$attributeId/value/$valueId'),
      )
          .then((response) {
        print(response.body);
        print('this api' +
            Product().fromJsonList(returnResponse(response)).length.toString());
        return Product().fromJsonList(returnResponse(response));
      });

  Future<String> uploadImage(image) async {
    Dio dio = new Dio();
    String fileName = image.path.split('/').last;
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
      ),
    });
    String result = await dio
        .post(
      '$baseURL/upload',
      data: data,
    )
        .then((response) {
      print(response.data);
      return response.data['url'];
    });
    return result;
  }

  Future<Product> addProduct(Product product, int productTypeId) {
    print(product.toJson());
    return http
        .post(Uri.parse('$baseURL/productTypes/$productTypeId/products'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(product.toJson()))
        .then((value) {
      return Product.fromJson(returnResponse(value));
    });
  }
}
