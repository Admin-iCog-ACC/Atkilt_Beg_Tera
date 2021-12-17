import 'package:retailer_app/APIs/Product_API.dart';
import 'package:retailer_app/models/Product.dart';

class ProductRepo {
  final ProductApi _api = ProductApi();
  late Future<List<Product>> _prodcutResponse;

  Future<List<Product>> getProdcuts() {
    return _api.getProducts();
  }
}
