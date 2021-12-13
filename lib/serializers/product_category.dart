import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'product_category.g.dart';

@JsonSerializable()
class SerializerProductCategory {
  int? id;
  String? name;
  String? description;

  List<SerializerProduct>? products;

  SerializerProductCategory(
      this.id, this.name, this.description, this.products);

  factory SerializerProductCategory.fromJson(Map<String, dynamic> json) =>
      _$SerializerProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SerializerProductCategoryToJson(this);
}
