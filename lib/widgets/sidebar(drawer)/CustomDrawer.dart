import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text('John T.'),
              accountEmail: Text('*********@gmail.com'),
              currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white))),
              decoration: BoxDecoration(color: Colors.red)),
          ListTile(
            leading: Icon(Icons.person, color: Colors.redAccent),
            title: Text('My Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.redAccent),
            title: Text('My Acount'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.fitness_center, color: Colors.redAccent),
            title: Text('My Workout'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.cancel, color: Colors.redAccent),
            title: Text('My Nutrition'),
            onTap: () {},
          ),
          Divider(color: Colors.red, indent: 20.0),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.green),
            title: Text('About'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
