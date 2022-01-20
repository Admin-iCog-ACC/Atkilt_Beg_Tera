import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:retailer_app/APIs/Account_API.dart';
import 'package:retailer_app/constants/Constants.dart';
import 'package:retailer_app/models/Account.dart';
import 'package:retailer_app/serializers/user.dart';
import 'package:retailer_app/services/auth_service.dart';
import 'package:retailer_app/services/dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserModelDelegate {
  void onLoaded(Account? user);

  void onLoggedIn(Account user);

  void onLogout(Account? user);
}

class UserModel with ChangeNotifier {
  UserModel() {
    getUser();
  }

  final _storage = injector<LocalStorage>();
  Account? user;
  bool loggedIn = false;
  bool loading = false;
  UserModelDelegate? delegate;

  void updateUser(Account newUser) {
    user = newUser;
    notifyListeners();
  }

  Future<void> saveUser(Account? user) async {
    try {
      // save to Preference
      var prefs = injector<SharedPreferences>();
      await prefs.setBool('loggedIn', true);

      // save the user Info as local storage
      await _storage.setItem(kLocalKey['userInfo']!, user);
      delegate?.onLoaded(user);
    } catch (err) {
      print(err);
    }
  }

  Future<void> getUser() async {
    try {
      final json = _storage.getItem(kLocalKey['userInfo']!);
    } catch (err) {
      print(err);
    }
  }

  void setLoading(bool isLoading) {
    loading = isLoading;
    notifyListeners();
  }

  Future<void> createUser({
    String? username,
    String? password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    bool? isVendor,
    required Function success,
    Function? fail,
  }) async {
    try {
      loading = true;
      notifyListeners();

      loggedIn = true;
      await saveUser(user);
      success(user);

      loading = false;
      notifyListeners();
    } catch (err) {
      fail!(err.toString());
      loading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    delegate?.onLogout(user);
    user = null;
    loggedIn = false;
    try {
      await Future.wait([
        _storage.deleteItem(kLocalKey['userInfo']!),
        _storage.deleteItem(kLocalKey['shippingAddress']!),
        _storage.deleteItem(kLocalKey['recentSearches']!),
        _storage.deleteItem(kLocalKey['opencart_cookie']!),
        _storage.setItem(kLocalKey['userInfo']!, null),
      ]);

      var prefs = injector<SharedPreferences>();
      await prefs.setBool('loggedIn', false);
    } catch (err) {
      print(err);
    }
    notifyListeners();
  }

  // Future<void> login({
  //   required String username,
  //   required String password,
  //   required Function(Account user) success,
  //   required Function(String message) fail,
  // }) async {
  //   try {
  //     loading = true;
  //     notifyListeners();
  //     AccountAPI.login(username, password).then((value) => null);

  //     if (user == null) {
  //       throw 'Something went wrong!!!';
  //     }
  //     loggedIn = true;
  //     await saveUser(user);
  //     success(user!);
  //     loading = false;
  //     notifyListeners();
  //   } catch (err) {
  //     loading = false;
  //     fail(err.toString());
  //     notifyListeners();
  //   }
  // }
}
