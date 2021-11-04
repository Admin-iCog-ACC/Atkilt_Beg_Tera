import 'package:flutter/material.dart';
import 'package:retailer_app/config/theme.dart';
import 'package:retailer_app/routes/router.dart';
import 'package:retailer_app/screens/Retailer/checkout/CheckOutScreen.dart';
import 'package:retailer_app/screens/Retailer/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
        title: 'Flutter App',
        theme: CustomTheme.lightTheme,
        home: RetailerDashboardScreen());
  }
}
