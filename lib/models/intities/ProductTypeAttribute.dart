import 'package:retailer_app/models/intities/AttributeOption.dart';

import 'AttributeClass.dart';

class ProductTypeAttribute {
  int? id;
  bool? required;
  int? productTypeID;
  int? attributeID;
  AttributeClass? attribute;
  List<AttributeOption>? options;
  String? name;
  String? type;

  ProductTypeAttribute();

  ProductTypeAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    required = json['required'];
    productTypeID = json['productTypeId'];
    attributeID = json['attributeId'];
    attribute = json['Attribute'] != null
        ? new AttributeClass.fromJson(json['Attribute'])
        : null;
    name = json['name'];
    type = json['type'];
    options = json['options'] != null
        ? (json['options'] as List)
            .map((i) => new AttributeOption.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['required'] = this.required;
    data['productTypeID'] = this.productTypeID;
    data['attributeId'] = this.attributeID;
    if (this.attribute != null) {
      data['attribute'] = this.attribute!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ProductTypeAttribute{id: $id, required: $required, productTypeID: $productTypeID, attributeID: $attributeID, attribute: $attribute}';
  }

  List<ProductTypeAttribute> fromJsonList(jsonlist) {
    List<ProductTypeAttribute> list = [];
    for (var json in jsonlist) {
      list.add(ProductTypeAttribute.fromJson(json));
    }
    return list;
  }
}
