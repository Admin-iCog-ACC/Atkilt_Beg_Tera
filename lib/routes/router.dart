import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/screens/Merchant/inventory/inventory_entry_screen.dart';
import 'package:retailer_app/screens/Merchant/order/OrderDetailScreen.dart';
import 'package:retailer_app/screens/Merchant/order/OrderList.dart';
import 'package:retailer_app/screens/Merchant/inventory/ProductDetailScreen.dart';
import 'package:retailer_app/screens/Merchant/dashboard/dashboard.dart';

import 'package:retailer_app/screens/Merchant/inventory/inventory_list.dart';
import 'package:retailer_app/screens/Merchant/shop/my_shop.dart';
import 'package:retailer_app/screens/Retailer/cart_screen.dart';
import 'package:retailer_app/screens/Retailer/checkout/CheckOutScreen.dart';
import 'package:retailer_app/screens/Retailer/dashboard.dart';
import 'package:retailer_app/screens/Retailer/order/order_detail_screen.dart';
import 'package:retailer_app/screens/Retailer/order/order_screen.dart';
import 'package:retailer_app/screens/Retailer/product_details_screen.dart';
import 'package:retailer_app/screens/Retailer/product_list_screen.dart';
import 'package:retailer_app/screens/login.dart';
import 'package:retailer_app/screens/register_main.dart';
import 'package:retailer_app/screens/register_secondary.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutePaths.homeRoute:
      //   return MaterialPageRoute(builder: (_) => const RetailerDashboardScreen());
      case RoutePaths.retailer_dashboard:
        return MaterialPageRoute(
            builder: (_) => const RetailerDashboardScreen());
      case RoutePaths.merchant_dashboard:
        return MaterialPageRoute(
            builder: (_) => const MerchantDashboardScreen());
      case RoutePaths.signin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutePaths.register_main:
        return MaterialPageRoute(builder: (_) => const RegisterMain());
      case RoutePaths.register_secondary:
        return MaterialPageRoute(builder: (_) => const RegisterSecondary());
      case RoutePaths.retailer_cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case RoutePaths.retailer_prodcut_detail:
        return MaterialPageRoute(builder: (_) => const ProductDetailScreen());
      case RoutePaths.retailer_product_list:
        return MaterialPageRoute(builder: (_) => const ProductListScreen());
      case RoutePaths.retailer_checkut:
        return MaterialPageRoute(builder: (_) => const CheckOutScreen());
      case RoutePaths.inventory:
        return MaterialPageRoute(builder: (_) => const InventoryList());
      case RoutePaths.inventory_entry:
        return MaterialPageRoute(builder: (_) => const InventoryEntryScreen());
      case RoutePaths.merchant_product_detail:
        return MaterialPageRoute(builder: (_) => const ProductDetail());
      case RoutePaths.merchant_order_list:
        return MaterialPageRoute(builder: (_) => const OrderListScreen());
      case RoutePaths.merchant_order_detail:
        return MaterialPageRoute(builder: (_) => const OrderDetailScreen());
      case RoutePaths.retailer_order_list:
        return MaterialPageRoute(
            builder: (_) => const RetailerOrderListScreen());
      case RoutePaths.retailer_order_detail_screen:
        return MaterialPageRoute(
            builder: (_) => const RetailerOrderDetailScreen());
      case RoutePaths.myShop:
        return MaterialPageRoute(builder: (_) => const MyShop());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
