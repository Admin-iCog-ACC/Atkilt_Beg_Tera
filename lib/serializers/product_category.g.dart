// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerializerProductCategory _$SerializerProductCategoryFromJson(
        Map<String, dynamic> json) =>
    SerializerProductCategory(
      json['id'] as int?,
      json['name'] as String?,
      json['description'] as String?,
      (json['products'] as List<dynamic>?)
          ?.map((e) => SerializerProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SerializerProductCategoryToJson(
        SerializerProductCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'products': instance.products,
    };
