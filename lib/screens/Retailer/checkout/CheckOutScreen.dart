import 'package:flutter/material.dart';
import 'package:retailer_app/APIs/Cart_API.dart';
import 'package:retailer_app/APIs/Order_API.dart';
import 'package:retailer_app/models/Cart.dart';
import 'package:retailer_app/models/intities/Cart_Item.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/widgets/popups/CustomDialogs.dart';

class CheckOutScreen extends StatefulWidget {
  final cart;
  CheckOutScreen({Key? key, required this.cart}) : super(key: key);
  @override
  CheckOutScreenState createState() => CheckOutScreenState();
}

class CheckOutScreenState extends State<CheckOutScreen> {
  static String selected = 'EXPRESS';
  Cart? cart;
  bool isLoading = true;

  @override
  void initState() {
    if (widget.cart == null) {
      CartApi().getCart().then((value) {
        setState(() {
          cart = value;
          isLoading = false;
        });
      });
    } else {
      setState(() {
        cart = widget.cart;
        isLoading = false;
      });
    }

    // print('------' + cart!.cartItems!.length.toString());

    super.initState();
  }

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
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              ))
        ],
        title: Text(
          'Checkout',
        ),
      ),
      body: !isLoading
          ? cart!.cartItems!.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'No items in cart',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RoutePaths.retailer_dashboard);
                          },
                          child: Text('Go to Home',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 12),
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          child: Align(
                                            child: Text(
                                              '1',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            alignment: Alignment.center,
                                          )),
                                      Text(
                                        'Contact Number',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '+251936658395',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

//billing Card
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 12),
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          child: Align(
                                            child: Text(
                                              '2',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            alignment: Alignment.center,
                                          )),
                                      Text(
                                        'Billing Address',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor)),
                                  padding: EdgeInsets.all(16),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Addis Ababa, Bole, Ring Road, St.1012',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //Shipping Card
                        Card(
                          // margin: EdgeInsets.only(top: 15),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 12),
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          child: Align(
                                            child: Text(
                                              '3',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            alignment: Alignment.center,
                                          )),
                                      Text(
                                        'Shipping Address',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor)),
                                  // margin: EdgeInsets.all(15),
                                  padding: EdgeInsets.all(16),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Addis Ababa, Bole, Ring Road, St.1012',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

//Delivery Schedule Card
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          // margin: EdgeInsets.only(top: 16),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 12),
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          child: Align(
                                            child: Text(
                                              '4',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            alignment: Alignment.center,
                                          )),
                                      Text(
                                        'Delivery Schedule',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected = 'EXPRESS';
                                    });
                                  },
                                  child: Container(
                                      decoration: selected == 'EXPRESS'
                                          ? BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            )
                                          : BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              // border: Border.all(
                                              //     color: Theme.of(context).primaryColor),
                                              color: Color.fromARGB(
                                                  0XFF, 234, 244, 246)),
                                      margin: EdgeInsets.only(
                                          right: 15, bottom: 15),
                                      padding: EdgeInsets.all(15),
                                      alignment: Alignment.center,
                                      child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                'Express Delivery',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '90 min express delivery',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected = 'MORNING';
                                    });
                                  },
                                  child: Container(
                                    decoration: selected == 'MORNING'
                                        ? BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          )
                                        : BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            // border: Border.all(
                                            //     color: Theme.of(context).primaryColor),
                                            color: Color.fromARGB(
                                                0XFF, 234, 244, 246)),
                                    margin:
                                        EdgeInsets.only(right: 15, bottom: 15),
                                    padding: EdgeInsets.all(15),
                                    alignment: Alignment.center,
                                    child: Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              'Morning',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '2:00LT - 5:00LT',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected = 'NOON';
                                    });
                                  },
                                  child: Container(
                                    decoration: selected == 'NOON'
                                        ? BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          )
                                        : BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            // border: Border.all(
                                            //     color: Theme.of(context).primaryColor),
                                            color: Color.fromARGB(
                                                0XFF, 234, 244, 246)),
                                    margin:
                                        EdgeInsets.only(right: 15, bottom: 15),
                                    padding: EdgeInsets.all(15),
                                    alignment: Alignment.center,
                                    child: Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              'Noon',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '5:00LT - 8:00LT',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected = 'AFTERNOON';
                                    });
                                  },
                                  child: Container(
                                    decoration: selected == 'AFTERNOON'
                                        ? BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          )
                                        : BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            // border: Border.all(
                                            //     color: Theme.of(context).primaryColor),
                                            color: Color.fromARGB(
                                                0XFF, 234, 244, 246)),
                                    margin:
                                        EdgeInsets.only(right: 15, bottom: 15),
                                    padding: EdgeInsets.all(15),
                                    alignment: Alignment.center,
                                    child: Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              'Afternoon',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '8:00LT - 11:00LT',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected = 'EVENING';
                                    });
                                  },
                                  child: Container(
                                    decoration: selected == 'EVENING'
                                        ? BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          )
                                        : BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Color.fromARGB(
                                                0XFF, 234, 244, 246)),
                                    margin:
                                        EdgeInsets.only(right: 15, bottom: 15),
                                    padding: EdgeInsets.all(15),
                                    alignment: Alignment.center,
                                    child: Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              'Evening',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '11:00LT - 2:00LT',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Your Order',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          padding: EdgeInsets.only(top: 12, bottom: 12),
                          height: 150,
                          child: ListView.builder(
                              itemCount: cart!.cartItems!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(),
                                              child: Text(
                                                cart!.cartItems![index].quantity
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: Text(
                                                'X',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0XFF6B7280)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(),
                                              child: Text(
                                                cart!.cartItems![index].product!
                                                    .name!,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0XFF6B7280)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                          'Br' +
                                              cart!.cartItems![index].product!
                                                  .price!
                                                  .toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0XFF6B7280),
                                          ))
                                    ],
                                  ),
                                );
                              }),
                        ),
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sub Total',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0XFF6B7280))),
                                    Text('Br' + cart!.totalPrice!.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0XFF6B7280)))
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Tax',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0XFF6B7280))),
                                      Text('Calculated at Checkout',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0XFF6B7280))),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Estimated Shipping',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0XFF6B7280))),
                                      Text('Calculated at Checkout',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0XFF6B7280))),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Divider(),
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text("Br" + cart!.totalPrice.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        ),

                        Container(
                          height: 242,
                          width: 343,
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color.fromARGB(0, 229, 231, 235))),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    'Choose Paymnet Method',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )),
                              Container(
                                // height: 56,
                                width: 142,
                                padding: EdgeInsets.only(top: 12, bottom: 12),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor)),
                                child: Text(
                                  'Cash On Delivery',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: MaterialButton(
                            enableFeedback: true,
                            color: cart!.cartItems!.isEmpty
                                ? Colors.grey[400]
                                : Theme.of(context).primaryColor,
                            onPressed: () {
                              cart!.cartItems!.isEmpty
                                  ? null
                                  : OrderAPI().createOrder().then((value) {
                                      if (value.status == "Order Received") {
                                        CustomDialogs().showOrderRecieved(
                                            context,
                                            () => Navigator.popAndPushNamed(
                                                context,
                                                RoutePaths.retailer_dashboard));
                                      }
                                    });
                            },
                            height: 48,
                            minWidth: 343,
                            child: Text(
                              'Place Order',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        //  Container(
                        //   margin: EdgeInsets.only(top: 20),
                        //   child: MaterialButton(
                        //     height: 48,
                        //     minWidth: 343,
                        //     onPressed: () {
                        //       print('object');
                        //     },
                        //     color: Theme.of(context).primaryColor,
                        //     child: Text(
                        //       'Place Order',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 16,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ))
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
