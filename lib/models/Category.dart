import 'Product.dart';

class Category {
  String? id;
  String? sku;
  String? name;
  String? image;
  String? parent;
  String? slug;
  int? totalProduct;
  List<Product>? products;

  Category.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson['slug'] == 'uncategorized') {
      return;
    }

    try {
      id = parsedJson['id'].toString();
      name = parsedJson['name'].toString();
      parent = parsedJson['parent'].toString();
      totalProduct = parsedJson['count'];
      slug = parsedJson['slug'];
      final image = parsedJson['image'];
      if (image != null) {
        this.image = image['src'].toString();
      } else {
        this.image = 'kDefaultImage';
      }
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'parent': parent,
        'image': {'src': image}
      };

  @override
  String toString() => 'Category { id: $id  name: $name}';
}
