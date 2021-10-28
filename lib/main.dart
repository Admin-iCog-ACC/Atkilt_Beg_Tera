import 'package:flutter/material.dart';
import 'package:retailer_app/config/theme.dart';
import 'package:retailer_app/screens/Retailer/dashboard.dart';
import 'package:retailer_app/screens/login.dart';
import 'package:retailer_app/screens/register_main.dart';
import 'package:retailer_app/screens/register_secondary.dart';
import 'package:retailer_app/widgets/ImageLoader/image_loader.dart';
import 'package:retailer_app/widgets/SquareCard/prodcut_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      color: Colors.white,
      theme: CustomTheme.lightTheme,
      home: RetailerDashboardScreen()
    );
  }
}
