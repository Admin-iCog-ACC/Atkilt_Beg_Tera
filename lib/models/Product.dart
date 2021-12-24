import 'Category.dart';
import 'intities/product_attribute.dart';
import 'store.dart';

class Product {
  String? id;
  String? sku;
  String? name;
  String? status;
  String? vendor;
  String? description;
  String? shortDescription;
  String? price;
  bool? inStock;
  int? totalSales;
  List<String> images = [];
  List<ProductAttribute>? attributes;
  int? categoryId;
  int? stockQuantity;
  int? minQuantity;
  List<Category> categories = [];
  List<String> categoryIds = [];

  Product.empty(this.id) {
    name = '';
    price = '0.0';
  }

  bool isEmptyProduct() {
    return name == '' && price == '0.0';
  }

  bool isTopUpProduct() {
    return status != null && status == 'private' && name == 'Wallet Topup';
  }

  Product();

  Product.copyWith(Product p) {
    id = p.id;
    sku = p.sku;
    name = p.name;
    description = p.description;

    price = p.price;

    inStock = p.inStock;

    totalSales = p.totalSales;

    images = p.images;

    attributes = p.attributes;

    categoryId = p.categoryId;

    stockQuantity = p.stockQuantity;
    minQuantity = p.minQuantity;

    shortDescription = p.shortDescription;
  }

  Product.fromJson(parsedJson) {
    try {
      id = parsedJson['id'].toString();
      sku = parsedJson['sku'];
      status = parsedJson['status'];
      name = parsedJson['name'];

      description = parsedJson['description'] ?? '';
      shortDescription = parsedJson['short_description'];

      price = parsedJson['price'].toString();

      inStock =
          parsedJson['in_stock'] ?? parsedJson['stock_status'] == 'instock';
      if (inStock == true) {
        if (parsedJson['manage_stock'] == true) {
          inStock = parsedJson['stock_quantity'] > 0;
        }
      }

      totalSales =
          int.tryParse((parsedJson['total_sales'] ?? 0).toString()) ?? 0;

      categoryId = parsedJson['categories'] != null &&
              parsedJson['categories'].length > 0
          ? parsedJson['categories'][0]['id']
          : 0;

      // add stock limit
      if (parsedJson['manage_stock'] == true) {
        stockQuantity = parsedJson['stock_quantity'];
      }

      //minQuantity = parsedJson['meta_data']['']

      /// For Vendor Manager

      var attributeList = <ProductAttribute>[];

      attributes = attributeList.toList();

      var list = <String>[];
      if (parsedJson['images'] != null) {
        for (var item in parsedJson['images']) {
          var image = '';
          if (item is String) {
            image = item;
          }
          if (item is Map) {
            image = item['resourceUrl'];
          }
          if (!list.contains(image)) {
            list.add(image);
          }
        }
      }

      images = list;

      try {
        final _categories = parsedJson['categories'];
        if (_categories != null &&
            _categories is List &&
            _categories.isNotEmpty) {
          for (var category in _categories) {
            if (category['slug'] != 'uncategorized') {
              categories.add(Category.fromJson(category));
            }
          }
        }
      } catch (_) {
        // ignore
      }

      ///------For Merchant Admin------///

      if (parsedJson['category_ids'] != null) {
        if (parsedJson['category_ids'] is Map) {
          parsedJson['category_ids']
              .forEach((k, v) => categoryIds.add(v.toString()));
        }
        if (parsedJson['category_ids'] is List) {
          for (var item in parsedJson['category_ids']) {
            categoryIds.add(item.toString());
          }
        }
      }

      ///------For Vendor Admin------///
      var groupedProductList = <int>[];
      parsedJson['grouped_products']?.forEach((item) {
        groupedProductList.add(item);
      });

      var files = <String?>[];
      parsedJson['downloads']?.forEach((item) {
        files.add(item['file']);
      });
    } catch (e, trace) {
      print(trace);
      print('🔴 Get product $name :${e.toString()}');
    }
  }

  List<Product> fromJsonList(jsonlist) {
    var json = jsonlist ?? [];
    return List<Product>.from(json.map((item) => Product.fromJson(item)));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? '',
      'sku': sku ?? '',
      'name': name ?? '',
      'description': description ?? '',
      'price': price ?? '',
      'inStock': inStock ?? '',
      'total_sales': totalSales ?? '',
      'images': images,
      'attributes': attributes?.map((e) => e.toJson()).toList() ?? '',
      'categoryId': categoryId ?? '',
      'stock_quantity': stockQuantity ?? '',
    };
  }

  Product.fromLocalJson(Map<String, dynamic> json) {
    try {
      id = json['id'].toString();
      sku = json['sku'];
      name = json['name'];
      description = json['description'];

      price = json['price'];

      inStock = json['inStock'];

      totalSales = json['total_sales'];

      var imgs = <String>[];

      if (json['images'] != null) {
        for (var item in json['images']) {
          imgs.add(item);
        }
      }
      images = imgs;

      var attrs = <ProductAttribute>[];

      if (json['attributes'] != null) {
        for (var item in json['attributes']) {
          attrs.add(ProductAttribute.fromLocalJson(item));
        }
      }

      attributes = attrs;
      categoryId = json['categoryId'];
      stockQuantity = json['stock_quantity'];
    } catch (e, trace) {
      print(e.toString());
      print(trace.toString());
    }
  }
}
