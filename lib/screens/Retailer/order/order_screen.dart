import 'package:flutter/material.dart';

import 'OrderCard.dart';

class RetailerOrderListScreen extends StatefulWidget {
  const RetailerOrderListScreen({Key? key}) : super(key: key);
  @override
  OrderListScreenSate createState() => OrderListScreenSate();
}

class OrderListScreenSate extends State<RetailerOrderListScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('My Orders'),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 40),
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    OrderCard(),
                  ],
                );
              }),
        ));
  }
}
