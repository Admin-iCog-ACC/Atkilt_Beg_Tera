import 'package:localstorage/localstorage.dart';

class Address {
  String? firstName;
  String? lastName;
  String? email;
  String? street;
  String? city;
  String? phoneNumber;
  String? mapUrl;

  Address({
    this.firstName,
    this.lastName,
    this.email,
    this.street,
    this.city,
    this.phoneNumber,
    this.mapUrl,
  });

  bool isValid() {
    return firstName!.isNotEmpty &&
        lastName!.isNotEmpty &&
        email!.isNotEmpty &&
        street!.isNotEmpty &&
        city!.isNotEmpty &&
        phoneNumber!.isNotEmpty;
  }

  Address.fromJson(Map<String, dynamic> parsedJson) {
    firstName = parsedJson['first_name'] ?? '';
    lastName = parsedJson['last_name'] ?? '';

    street = parsedJson['address_1'] ?? '';

    city = parsedJson['city'] ?? '';

    email = parsedJson['email'] ?? '';
    // final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    // if (alphanumeric.hasMatch(firstName!)) {
    //   phoneNumber = firstName;
    // }
    phoneNumber = parsedJson['phone'] ?? '';
  }

  Map<String, dynamic> toJson() {
    var address = <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'address_1': street ?? '',
      'city': city,
      'phone': phoneNumber,
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

      city = json['city'];

      email = json['email'];
      phoneNumber = json['phone'];

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
