import 'package:flutter/material.dart';
import 'package:retailer_app/config/theme.dart';
import 'package:retailer_app/screens/Retailer/product_details_screen.dart';
import 'package:retailer_app/screens/Retailer/product_list_screen.dart';

import 'models/Product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        theme: CustomTheme.lightTheme,
        home: ProductDetailScreen(
          product: new Product('_product_name', '_product_title',
              '_product_description', 15, 50, '_size', true, 101, 101),
        ));
  }
}
