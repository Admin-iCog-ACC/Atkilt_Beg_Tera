import 'intities/account_address.dart';

class Account {
  String? id;
  bool? loggedIn;
  String? name;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? nicename;
  String? userUrl;
  String? picture;
  String? cookie;
  String? jwtToken;
  Shipping? shipping;
  Billing? billing;
  String? token;
  bool isVendor = false;
  bool isDelivery = false;
  bool? isDriverAvailable;

  Account();
  String get fullName =>
      name ?? [firstName ?? '', lastName ?? ''].join(' ').trim();

  Account.fromJson(Map<String, dynamic> json) {
    try {
      token = json['token'];
      loggedIn = true;
      id = json['id'].toString();
      username = json['username'];
      firstName = json['firstName'];
      lastName = json['lastName'];
      email = json['email'] ?? id;

      userUrl = json['avatar'];
      isDelivery = json['isDelivery'] ?? false;
      isVendor = json['isVendor'] ?? false;

      if (json['shipping'] != null) {
        shipping = Shipping.fromJson(json['shipping']);
      }
      if (json['billing'] != null) {
        billing = Billing.fromJson(json['billing']);
      }
      if (json['isDriverAvailable'] != null) {
        isDriverAvailable = json['isDriverAvailable'] == 'on';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Account.fromLocalJson(Map<String, dynamic> json) {
    try {
      loggedIn = json['loggedIn'];
      id = json['id'].toString();
      name = json['name'];
      cookie = json['cookie'];
      username = json['username'];
      firstName = json['firstName'];
      lastName = json['lastName'];
      email = json['email'];
      picture = json['picture'];
      nicename = json['nicename'];
      userUrl = json['url'];
      isVendor = json['isVender'];
      jwtToken = json['jwtToken'];
      if (json['billing'] != null) {
        billing = Billing.fromJson(json['billing']);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  String toString() {
    return 'Account{id: $id, loggedIn: $loggedIn, name: $name, firstName: $firstName, lastName: $lastName, username: $username, email: $email, nicename: $nicename, userUrl: $userUrl, picture: $picture, cookie: $cookie, jwtToken: $jwtToken, shipping: $shipping, billing: $billing, token: $token, isVendor: $isVendor, isDelivery: $isDelivery, isDriverAvailable: $isDriverAvailable}';
  }
}
