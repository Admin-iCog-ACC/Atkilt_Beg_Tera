import 'Product.dart';

class Category {
  int? id;
  String? sku;
  String? name;
  String? image;

  int? totalProduct;
  List<Product>? products;

  Category.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson['slug'] == 'uncategorized') {
      return;
    }

    try {
      id = parsedJson['id'];
      name = parsedJson['name'].toString();

      totalProduct = parsedJson['count'];

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
        'image': {'src': image}
      };

  @override
  String toString() => 'Category { id: $id  name: $name}';
}
