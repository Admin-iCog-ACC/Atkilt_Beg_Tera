// import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailer_app/APIs/Product_API.dart';
import 'package:retailer_app/models/Category.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/repo/product_repo.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';
import 'package:retailer_app/widgets/FAB/cart_fab.dart';
import 'package:retailer_app/widgets/appbar/transsion_appbar.dart';
import 'package:retailer_app/widgets/sidebar_drawer/CustomDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class LiveStockFilter extends StatefulWidget {
  const LiveStockFilter({Key? key}) : super(key: key);
  @override
  LiveStockFilterState createState() => LiveStockFilterState();
}

class LiveStockFilterState extends State<LiveStockFilter> {
  List<Product> myProducts = [];
  List<Category> categories = [];
  List<Product> filteredProducts = [];
  Category? _selectedCategory;
  List<bool> purchaseType = [false, false, false];
  String propertyType = 'Apartment & Unit';
  var _selectedPrice;
  List<int> price = [];
  final ProductApi _api = ProductApi();
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  late SharedPreferences logindata;
  late String username;

  @override
  void initState() {
    _api.getProducts().then((value) {
      _api.getCategories().then((value) {
        setState(() {
          categories = value;
        });
      });
      setState(() {
        myProducts.addAll(value);
        filteredProducts = myProducts;
      });
    });
    initial();
    super.initState();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filter livestock"),
        ),
        body: Row(children: [
          CustomDropdownButton2(
              hint: 'Select Item',
              dropdownItems: items,
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              }),
          CustomDropdownButton2(
              hint: 'Select Item',
              dropdownItems: items,
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              })
        ]));
  }

  void filterByPrice(int price) {
    setState(() {
      filteredProducts = myProducts
          .where((product) => int.parse(product.price.toString()) < price)
          .toList();
    });
  }
}
