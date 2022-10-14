class AttributeOption {
  int? id;
  String? value;
  int? productTypeAttributeId;
  bool? isChecked;

  AttributeOption({
    this.id,
    this.value,
    this.productTypeAttributeId,
    this.isChecked = false,
  });

  AttributeOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    productTypeAttributeId = json['productTypeAttributeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['product_type_attribute_id'] = this.productTypeAttributeId;
    return data;
  }
}
