

import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/screens/Merchant/dashboard.dart';
import 'package:retailer_app/screens/Retailer/dashboard.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.homeRoute:
        return MaterialPageRoute(builder: (_) => const RetailerDashboardScreen());
      case RoutePaths.articleRoute:
        return MaterialPageRoute(builder: (_) => const MerchantDashboardScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}