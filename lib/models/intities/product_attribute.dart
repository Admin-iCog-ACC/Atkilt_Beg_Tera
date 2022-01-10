import 'ProductTypeAttribute.dart';

class ProductAttribute {
  int? id;
  String? value;
  int? productID;
  int? productTypeAttributeID;
  ProductTypeAttribute? productTypeAttribute;

  ProductAttribute({
    this.id,
    this.value,
    this.productID,
    this.productTypeAttributeID,
    this.productTypeAttribute,
  });

  ProductAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    productID = json['productId'];
    productTypeAttributeID = json['productTypeAttributeId'];
    productTypeAttribute = json['ProductTypeAttribute'] != null
        ? new ProductTypeAttribute.fromJson(json['ProductTypeAttribute'])
        : null;
  }

  List<ProductAttribute> fromJsonList(jsonlist) {
    var json = jsonlist ?? [];
    return List<ProductAttribute>.from(
        json.map((item) => ProductAttribute.fromJson(item)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['productID'] = this.productID;
    data['productTypeAttributeId'] = this.productTypeAttributeID;
    if (this.productTypeAttribute != null) {
      data['productTypeAttribute'] = this.productTypeAttribute!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ProductAttribute{id: $id, value: $value, productID: $productID, productTypeAttributeID: $productTypeAttributeID, productTypeAttribute: $productTypeAttribute}';
  }
}
