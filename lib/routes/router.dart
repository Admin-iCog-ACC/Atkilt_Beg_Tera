

import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/screens/Merchant/dashboard.dart';
import 'package:retailer_app/screens/Retailer/dashboard.dart';
import 'package:retailer_app/screens/login.dart';
import 'package:retailer_app/screens/register_main.dart';
import 'package:retailer_app/screens/register_secondary.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutePaths.homeRoute:
      //   return MaterialPageRoute(builder: (_) => const RetailerDashboardScreen());
      case RoutePaths.retailer_dashboard:
        return MaterialPageRoute(builder: (_) => const RetailerDashboardScreen());
      case RoutePaths.merchant_dashboard:
        return MaterialPageRoute(builder: (_) => const MerchantDashboardScreen());
      case RoutePaths.signin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutePaths.register_main:
        return MaterialPageRoute(builder: (_) => const RegisterMain());
      case RoutePaths.register_secondary:
        return MaterialPageRoute(builder: (_) => const RegisterSecondary());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}