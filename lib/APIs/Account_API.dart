import 'package:retailer_app/constants/Constants.dart';
import 'dart:convert';
import 'package:retailer_app/services/api_services.dart';
import 'package:http/http.dart' as http;

class AccountAPI extends APIService {
  Future<Map<String, dynamic>> login(String username, String password) {
    ConstVals _constVals = ConstVals();
    return http.post(
      Uri.parse('${_constVals.getBaseURL()}/auth/login'),
      body: {
        'email': username,
        'password': password,
      },
    ).then((response) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      return responseData.map((String key, dynamic value) {
        return MapEntry(key, value);
      });
    });
  }

  Future<dynamic> signup(
      String email, String password, String fullName, bool isVendor) {
    ConstVals _constVals = ConstVals();
    return http.post(
      Uri.parse('${_constVals.getBaseURL()}/auth/signup'),
      body: {
        'email': email,
        'password': password,
        'firstName': fullName.split(" ")[0],
        'lastName': fullName.split(" ")[1],
        'username': fullName.replaceAll(" ", ""),
        'isVendor': isVendor.toString(),
        'isAgent': (!isVendor).toString(),
        'isDelivery': 'false'
      },
    ).then((response) {
      // final String responseData = response.body.toString();
      // final Map<String, dynamic> responseData = json.decode(response.body);
      try {
        print(returnResponse(response));
        return returnResponse(response);
      } catch (e) {
        return e;
      }
    });
  }
}
