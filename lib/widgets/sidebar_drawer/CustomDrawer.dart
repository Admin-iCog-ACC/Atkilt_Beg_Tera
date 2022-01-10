import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';

class CustomDrawer extends StatefulWidget {
  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 24,
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.retailer_dashboard);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Products'),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.retailer_product_list);
            },
          ),
          Divider(indent: 20.0),
          ListTile(
            leading: Icon(Icons.history_outlined),
            title: Text('My Orders'),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.retailer_order_list);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text('Checkout'),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.retailer_checkut);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart_outlined,
            ),
            title: Text('Cart'),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.retailer_cart);
            },
          ),
          Divider(indent: 20.0),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text(
              'Profile',
            ),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.retailer_dashboard);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutePaths.signin, (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help,
            ),
            title: Text('About'),
            onTap: () {},
          ),
        ],
      ),
    ));
  }
}
