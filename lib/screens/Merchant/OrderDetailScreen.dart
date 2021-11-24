import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/Cards/inventory_prodcut_card.dart';
import 'package:retailer_app/widgets/buttons/buttons.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  OrderDetailScreenState createState() => OrderDetailScreenState();
}

class OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double prodcutContainerHeight = MediaQuery.of(context).size.height / 2;
    return Scaffold(
        appBar: AppBar(
          title: Text('Order_ID'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                // Text('Items'),
                Container(
                  height: prodcutContainerHeight,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InventoryProdcutCard(),
                            SizedBox(
                              height: 2,
                            )
                          ],
                        );
                      }),
                ),
                // SizedBox(
                //   height: 15,
                // ),
                Divider(
                  thickness: 2,
                ),
                Container(
                  height: prodcutContainerHeight - 120,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Customer Name: Michael Alemu'),
                      Text('Customer contact: +251936658395'),
                      Text('Date: 12/12/2021'),
                      Text('Total Price: Br15000'),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                              text: 'Cancel',
                              color: Colors.red,
                              action: () {},
                              height: 40,
                              width: 120,
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                          CustomButton(
                              text: 'Process',
                              color: Colors.green,
                              action: () {},
                              height: 40,
                              width: 120,
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
