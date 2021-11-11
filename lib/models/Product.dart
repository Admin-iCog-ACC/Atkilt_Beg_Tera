import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Product {
  String id, categoryid;
  String productname, producttitle, productdescription, image_url;
  double price;
  int quantity;
  String size;
  bool available;

  Product(
      {required this.image_url,
      required this.productname,
      required this.producttitle,
      required this.productdescription,
      required this.price,
      required this.quantity,
      required this.size,
      required this.available,
      required this.categoryid,
      required this.id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      categoryid: json["categoryid"],
      productname: json["productname"],
      producttitle: json["producttitle"],
      productdescription: json["productdescription"],
      image_url: json["image_url"],
      price: double.parse(json["price"]),
      quantity: int.parse(json["quantity"]),
      size: json["size"],
      available: json["available"].toLowerCase() == 'true',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "categoryid": this.categoryid,
      "productname": this.productname,
      "producttitle": this.producttitle,
      "productdescription": this.productdescription,
      "image_url": this.image_url,
      "price": this.price,
      "quantity": this.quantity,
      "size": this.size,
      "available": this.available,
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, categoryid: $categoryid, productname: $productname, producttitle: $producttitle, productdescription: $productdescription, image_url: $image_url, price: $price, quantity: $quantity, size: $size, available: $available}';
  }

//

}
