class Store {
  int? id;
  String? name;
  String? email;
  String? chatEmail;
  double? rating;
  String? image;
  String? address;
  String? banner;
  String? phone;
  String? website;
  bool? isFeatured;
  double? lat;
  double? long;
  Map<String, String>? socials;
  String? link;
  bool isNotBlank(String? s) => s != null && s.trim().isNotEmpty;
  Store.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];

    if (parsedJson['first_name'] != null && parsedJson['last_name'] != null) {
      name = '${parsedJson["first_name"]} ${parsedJson["last_name"]}';
    }

    link = parsedJson['shop_url'];

    if (parsedJson['name'] != null) {
      name = parsedJson['name'];
    }
    if (parsedJson['shop_name'] != null) {
      name = parsedJson['shop_name'];
    }
    if (parsedJson['store_name'] != null) {
      name = parsedJson['store_name'];
    }
    email = parsedJson['email'] ?? '';
    chatEmail = email;
    rating = 0.0;
    if (parsedJson['rating'] != null) {
      if (parsedJson['rating']['rating'] != null &&
          double.tryParse(parsedJson['rating']['rating']) != null) {
        rating = double.parse("${parsedJson["rating"]["rating"]}");
      }
    }

    final String? stringLocation = parsedJson['location'];

    if (stringLocation?.isNotEmpty ?? false) {
      final arrLocation = stringLocation!.split(',');
      lat = arrLocation[0] != '' ? double.parse(arrLocation[0]) : 0;
      long = arrLocation[1] != '' ? double.parse(arrLocation[1]) : 0;
    }

    if (parsedJson['gravatar'] != null) {
      image = parsedJson['gravatar'] is String ? parsedJson['gravatar'] : null;
    }
    address =
        parsedJson['address'] is Map ? parsedJson['address']['street_1'] : '';
    banner = parsedJson['banner'] is String && isNotBlank(parsedJson['banner'])
        ? parsedJson['banner']
        : null;
    phone = parsedJson['phone'];
    isFeatured = parsedJson['featured'] ?? false;

    final time = parsedJson['store_open_close']['time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'rating': rating,
      'image': image,
      'address': address,
      'banner': banner,
      'phone': phone,
      'website': website
    };
  }

  Store.fromLocalJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      name = json['name'];
      email = json['email'];
      rating = json['rating'];
      image = json['image'];
      address = json['address'];
      banner = json['banner'];
      phone = json['phone'];
      website = json['website'];
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
  }
}
