import 'package:flutter/material.dart';
import 'package:retailer_app/APIs/Order_API.dart';
import 'package:retailer_app/models/Order.dart';

import 'OrderCard.dart';

class RetailerOrderListScreen extends StatefulWidget {
  const RetailerOrderListScreen({Key? key}) : super(key: key);
  @override
  OrderListScreenSate createState() => OrderListScreenSate();
}

class OrderListScreenSate extends State<RetailerOrderListScreen> {
  final OrderAPI _apiOrder = OrderAPI();
  List<Order> _orders = [];

  @override
  void initState() {
    getOrderItems();
    super.initState();
  }

  void getOrderItems() {
    _apiOrder.getOrder().then((value) {
      setState(() {
        _orders.addAll(value);
      });
      print('Orders: ' + _orders.length.toString());
    });
  }

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
              itemCount: _orders.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    OrderCard(
                      order: _orders[index],
                    ),
                  ],
                );
              }),
        ));
  }
}
