import 'package:flutter/material.dart';

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
          UserAccountsDrawerHeader(
              accountName: Text('John T.'),
              accountEmail: Text('John.T@gmail.com'),
              currentAccountPicture: GestureDetector(
                  onTap: () => print("Successul Btn."),
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white))),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor)),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.history_outlined),
            title: Text('My Orders'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text('Checkout'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart_outlined,
            ),
            title: Text('Cart'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.hearing_outlined,
            ),
            title: Text('Wishlist'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Logout'),
            onTap: () {},
          ),
          Divider(color: Theme.of(context).accentColor, indent: 20.0),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help, color: Theme.of(context).primaryColor),
            title: Text('About'),
            onTap: () {},
          ),
        ],
      ),
    ));
  }
}
