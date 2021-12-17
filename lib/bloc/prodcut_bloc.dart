import 'package:retailer_app/APIs/Product_API.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/repo/product_repo.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final ProductRepo _productRepo = ProductRepo();
  final ProductApi _api = ProductApi();
  var _productsSubject = BehaviorSubject<List<Product>>();
  ValueStream<List<Product>> get prodcuts => _productsSubject.stream;

  Future<List<Product>> getProducts() {
    Future<List<Product>> mypro;
    mypro = _api.getProducts();
    mypro.then((value) => _productsSubject.add(value));
    print('Bloc' + mypro.toString());
    return mypro;
  }
}
