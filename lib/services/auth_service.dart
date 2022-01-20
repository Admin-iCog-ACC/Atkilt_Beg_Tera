import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart';
import 'package:retailer_app/constants/Constants.dart';
import 'package:retailer_app/models/Account.dart';
import 'package:retailer_app/widgets/popups/CustomDialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependency_injection.dart';

class AuthService {
  late SharedPreferences logindata;
  ConstVals _constVals = ConstVals();

  // final _storage = injector<LocalStorage>();

  // Future<void> saveUser(Account? user) async {
  //   try {
  //     // save to Preference
  //     // var prefs = injector<SharedPreferences>();
  //     // await prefs.setBool('loggedIn', true);

  //     // save the user Info as local storage
  //     await _storage.setItem(kLocalKey['userInfo']!, user);
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  Future<bool> isLoggedIn() async {
    logindata = await SharedPreferences.getInstance();
    return logindata.getBool('loggedIn') ?? false;
  }

  Future<Map<String, String>> getHeader() async {
    var header = Map<String, String>();
    logindata = await SharedPreferences.getInstance();
    String token = logindata.getString('token')!;
    if (token != null) {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      print(headers);
      header = headers;
    }
    print('Header in Auth service' + '${header.toString()}');
    return header;
  }

  String getLoggedInUserToken(String username, BuildContext context) {
    var token = (logindata.getString('token'));
    if (token != '' && token != null) {
      return token;
    } else {
      CustomDialogs().showAuthFailedDialog(context);
      return '';
    }
  }
}
