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
  bool isVender = false;
  bool isDeliveryBoy = false;
  bool? isSocial = false;
  bool? isDriverAvailable;

  Account();

  String get fullName =>
      name ?? [firstName ?? '', lastName ?? ''].join(' ').trim();

  ///FluxListing
  String? role;

  Account.fromJson(Map<String, dynamic> json) {
    try {
      var user = json['user'];
      isSocial = true;
      loggedIn = true;
      id = json['wp_user_id'].toString();
      name = user['displayname'];
      cookie = json['cookie'];
      username = user['username'];
      nicename = user['nicename'];
      firstName = user['firstname'];
      lastName = user['lastname'];
      email = user['email'] ?? id;
      isSocial = true;
      userUrl = user['avatar'];
      var roles = user['role'] as List;
      var role = roles.firstWhere(
          (item) => ((item == 'seller') || (item == 'vendor')),
          orElse: () => null);
      if (role != null) {
        isVender = true;
      } else {
        isVender = false;
      }
      if (user['dokan_enable_selling'] != null &&
          user['dokan_enable_selling'].toString().isNotEmpty) {
        isVender = user['dokan_enable_selling'] == 'yes';
      }
      role = roles.firstWhere(
          (item) => ((['delivery_boy', 'driver'].contains(item))),
          orElse: () => null);
      if (role != null) {
        isDeliveryBoy = true;
      }
      if (json['shipping'] != null) {
        shipping = Shipping.fromJson(json['shipping']);
      }
      if (json['billing'] != null) {
        billing = Billing.fromJson(json['billing']);
      }
      if (user['is_driver_available'] != null) {
        isDriverAvailable = user['is_driver_available'] == 'on';
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
      isVender = json['isVender'];
      jwtToken = json['jwtToken'];
      if (json['billing'] != null) {
        billing = Billing.fromJson(json['billing']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
