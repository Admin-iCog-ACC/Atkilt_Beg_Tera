import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/Cards/OrderCard.dart';
import 'package:retailer_app/widgets/Cards/inventory_prodcut_card.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);
  @override
  OrderListScreenState createState() => OrderListScreenState();
}

class OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
          ),
        ),
        title: Text(
          'Inventory',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    OrderCard(),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
