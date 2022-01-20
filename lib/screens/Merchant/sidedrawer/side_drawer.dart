import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MerchantDrawer extends StatelessWidget {
  late SharedPreferences logindata;

  void logout(context) async {
    logindata = await SharedPreferences.getInstance();
    logindata.clear();
    Navigator.of(context).pushNamedAndRemoveUntil(
        RoutePaths.signin, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 24,
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.merchant_dashboard);
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('My Shop'),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.myShop);
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Products'),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.inventory);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart_outlined,
            ),
            title: Text('Orders'),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.merchant_order_list);
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.send),
          //   title: Text('Order Status'),
          //   onTap: () {},
          // ),
          ListTile(
            leading: Icon(Icons.local_shipping_outlined),
            title: Text('Shippings'),
            onTap: () {},
          ),
          Divider(indent: 20.0),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.help,
            ),
            title: Text('About'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              logout(context);
            },
          ),
        ],
      ),
    ));
  }
}
