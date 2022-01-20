import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'exceptions.dart';

class APIService {
  final Uri? url;
  final dynamic body;
  final List<File>? files;
  Function(http.Response response)? parse;
  APIService({this.url, this.body, this.parse, this.files});

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        print('APIservice' + responseJson.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        print('APIservice' + responseJson.toString());
        return responseJson;
      case 204:
        var responseJson = json.decode(response.body);
        print('APIservice' + responseJson.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
