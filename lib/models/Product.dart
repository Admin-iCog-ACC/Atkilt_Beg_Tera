class Product {
  int _id, _category_id;
  String _product_name, _product_title, _product_description;
  double _price;
  int _quantity;
  String _size;
  bool _available;

  Product(this._product_name, this._product_title, this._product_description,
      this._price, this._quantity, this._size, this._available, this._category_id, this._id);

  bool get available => _available;

  set available(bool value) {
    _available = value;
  }

  String get size => _size;

  set size(String value) {
    _size = value;
  }

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  get product_description => _product_description;

  set product_description(value) {
    _product_description = value;
  }

  get product_title => _product_title;

  set product_title(value) {
    _product_title = value;
  }

  String get product_name => _product_name;

  set product_name(String value) {
    _product_name = value;
  }

  get category_id => _category_id;

  set category_id(value) {
    _category_id = value;
  }
}
