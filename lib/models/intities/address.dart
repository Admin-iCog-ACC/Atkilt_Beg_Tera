import 'package:localstorage/localstorage.dart';

class Address {
  String? firstName;
  String? lastName;
  String? email;
  String? street;
  String? apartment;
  String? block;
  String? city;
  String? state;
  String? country;
  String? countryId;
  String? phoneNumber;
  String? zipCode;
  String? mapUrl;

  Address({
    this.firstName,
    this.lastName,
    this.email,
    this.street,
    this.apartment,
    this.block,
    this.city,
    this.state,
    this.country,
    this.phoneNumber,
    this.zipCode,
    this.mapUrl,
  });

  bool isValid() {
    return firstName!.isNotEmpty &&
        lastName!.isNotEmpty &&
        email!.isNotEmpty &&
        street!.isNotEmpty &&
        city!.isNotEmpty &&
        state!.isNotEmpty &&
        country!.isNotEmpty &&
        phoneNumber!.isNotEmpty;
  }

  Address.fromJson(Map<String, dynamic> parsedJson) {
    firstName = parsedJson['first_name'] ?? '';
    lastName = parsedJson['last_name'] ?? '';
    apartment = parsedJson['company'] ?? '';
    street = parsedJson['address_1'] ?? '';
    block = parsedJson['address_2'] ?? '';
    city = parsedJson['city'] ?? '';
    state = parsedJson['state'] ?? '';
    country = parsedJson['country'] ?? '';
    email = parsedJson['email'] ?? '';
    // final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    // if (alphanumeric.hasMatch(firstName!)) {
    //   phoneNumber = firstName;
    // }
    phoneNumber = parsedJson['phone'] ?? '';
    zipCode = parsedJson['postcode'];
  }

  Map<String, dynamic> toJson() {
    var address = <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'address_1': street ?? '',
      'address_2': block ?? '',
      'company': apartment ?? '',
      'city': city,
      'state': state,
      'country': country,
      'phone': phoneNumber,
      'postcode': zipCode,
      'mapUrl': mapUrl,
    };
    if (email != null && email!.isNotEmpty) {
      address['email'] = email;
    }
    return address;
  }

  Address.fromLocalJson(Map<String, dynamic> json) {
    try {
      firstName = json['first_name'];
      lastName = json['last_name'];
      street = json['address_1'];
      block = json['address_2'];
      apartment = json['company'];
      city = json['city'];
      state = json['state'];
      country = json['country'];
      email = json['email'];
      phoneNumber = json['phone'];
      zipCode = json['postcode'];
      mapUrl = json['mapUrl'];
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> saveToLocal() async {
    final storage = LocalStorage('address');
    try {
      final ready = await storage.ready;
      if (ready) {
        await storage.setItem('', toJson());
      }
    } catch (err) {
      print(err);
    }
  }
}
