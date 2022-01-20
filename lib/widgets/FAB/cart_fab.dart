import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';

class CartFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(RoutePaths.retailer_cart);
      },
    );
  }
}
