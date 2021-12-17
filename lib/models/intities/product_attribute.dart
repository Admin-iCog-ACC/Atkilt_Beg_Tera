class ProductAttribute {
  String? id;
  String? name;
  String? slug;
  List? options = [];
  List optionSlugs = [];
  bool? isVisible;

  String? get cleanSlug => slug?.replaceAll('pa_', '');

  ProductAttribute.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'].toString();
    name =
        parsedJson['label'] ?? parsedJson['name']; // name for FluxStore Manager
    slug = parsedJson['name'];

    isVisible = parsedJson['visible'] ?? false;

    if (parsedJson['options'] != null) {
      for (var item in parsedJson['options']) {
        options!.add(item);
      }
    }
    if (parsedJson['slugs'] != null) {
      for (var item in parsedJson['slugs']) {
        optionSlugs.add(item);
      }
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'options': options,
      'visible': isVisible,
    };
  }

  ProductAttribute.fromLocalJson(Map<String, dynamic> json) {
    try {
      id = json['id']?.toString();
      name = json['name'];
      options = json['options'];
    } catch (e) {
      print(e.toString());
    }
  }
}

class Attribute {
  int? id;
  String? name;
  String? option;
  Attribute({
    this.id,
    this.name,
    this.option,
  });

  Attribute.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    option = parsedJson['option'];
  }

  Attribute.fromMagentoJson(Map<String, dynamic> parsedJson) {
    id = int.parse(parsedJson['value']);
    name = parsedJson['attribute_code'];
    option = parsedJson['value'];
  }

  Attribute.fromLocalJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    option = parsedJson['option'];
  }

  Attribute.fromShopifyJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    option = parsedJson['value'];
  }

  Attribute.fromPrestaJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    option = parsedJson['option'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'option': option};
  }

  @override
  String toString() {
    return '${name ?? ""}${option ?? ""}';
  }
}
