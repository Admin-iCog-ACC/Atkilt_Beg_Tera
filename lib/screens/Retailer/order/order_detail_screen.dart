import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:retailer_app/models/Order.dart';

class RetailerOrderDetailScreen extends StatefulWidget {
  final order;
  const RetailerOrderDetailScreen({Key? key, required this.order})
      : super(key: key);
  @override
  RetailerOrderDetailScreenState createState() =>
      RetailerOrderDetailScreenState();
}

class RetailerOrderDetailScreenState extends State<RetailerOrderDetailScreen> {
  int _processIndex = 0;
  double kTileHeight = 50.0;
  Color inProgressColor = Colors.black87;
  Color todoColor = Color(0xffd1d2d7);

  int activeStep = 5; // Initial step set to 5.

  int upperBound = 6;

  Order myOrder = Order();

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  @override
  void initState() {
    print('Order is here' + widget.order.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order#' + widget.order.id.toString()),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Order Details',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          ' Status: ' + widget.order.status,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(0XFF, 107, 114, 128)))),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Shpping Address',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text('Yeka, Addiss Ababa, Ethiopia',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(0XFF, 107, 114, 128))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Billing Address',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text('Yeka, Addiss Ababa, Ethiopia',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(0XFF, 107, 114, 128))),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(0XFF, 107, 114, 128)))),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sub Total',
                                style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Color.fromARGB(0XFF, 107, 114, 128))),
                            Text(widget.order.subtotal.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(0XFF, 107, 114, 128)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Discount',
                                style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Color.fromARGB(0XFF, 107, 114, 128))),
                            Text('Br0.0',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(0XFF, 107, 114, 128)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery Fee',
                                style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Color.fromARGB(0XFF, 107, 114, 128))),
                            Text(widget.order.totalShipping.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(0XFF, 107, 114, 128)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tax',
                                style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Color.fromARGB(0XFF, 107, 114, 128))),
                            Text(widget.order.totalTax.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(0XFF, 107, 114, 128)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              widget.order.total.toString(),
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //     height: 300,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         border: Border(
                //             top: BorderSide(
                //                 width: 0.5,
                //                 color: Color.fromARGB(0XFF, 107, 114, 128)))),
                //     child: Column(
                //       children: [
                //         IconStepper(
                //           direction: Axis.horizontal,
                //           icons: [
                //             Icon(Icons.supervised_user_circle),
                //             Icon(Icons.flag),
                //             Icon(Icons.access_alarm),
                //             Icon(Icons.supervised_user_circle),
                //             Icon(Icons.flag),
                //             Icon(Icons.access_alarm),
                //             Icon(Icons.supervised_user_circle),
                //           ],
                //           activeStep: activeStep,
                //           onStepReached: (index) {
                //             setState(() {
                //               activeStep = index;
                //             });
                //           },
                //         )
                //       ],
                //     )),
                Container(
                  height: 300,
                  padding: EdgeInsets.only(),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(0XFF, 107, 114, 128)))),
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(0XFF, 234, 244, 246)),
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                'Item',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                'Quantity',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            // Padding(
                            //     padding: EdgeInsets.only(),
                            //     child: Text(
                            //       'Price',
                            //       style: TextStyle(fontWeight: FontWeight.w700),
                            //     )),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                            itemCount: widget.order.cart.cartItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  padding: EdgeInsets.only(
                                      top: 12, bottom: 12, left: 16, right: 16),
                                  height: 88,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 64,
                                              // width: 64,
                                              // child: Image.network(widget
                                              //     .order
                                              //     .cart
                                              //     .cartItems[index]
                                              //     .product
                                              //     .images
                                              //     .first),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(),
                                                    child: Text(widget
                                                        .order
                                                        .cart
                                                        .cartItems[index]
                                                        .product
                                                        .name),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 4),
                                                      child: Text(
                                                        'Br' +
                                                            widget
                                                                .order
                                                                .cart
                                                                .cartItems[
                                                                    index]
                                                                .product
                                                                .price,
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(16),
                                        child: Text(widget.order.cart
                                            .cartItems[index].quantity
                                            .toString()),
                                      )
                                    ],
                                  ));
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final _processes = [
  'Order Signed',
  'Order Processed',
  'Shipped ',
  'Out for delivery ',
  'Delivered ',
];

final _content = [
  '20/18',
  '20/18',
  '20/18',
  '20/18',
  '20/18',
];
