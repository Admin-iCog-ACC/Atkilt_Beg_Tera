import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/widgets/Cards/CartCard.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return CartCard();
                  }),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutePaths.retailer_checkut);
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        height: 48,
                        width: 335,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: Theme.of(context).primaryColor),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              alignment: Alignment.center,
                              height: 40,
                              // width: 85,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white),
                              child: Text("Br500.00",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColor)),
                            )
                          ],
                        ),
                      ),
                    )))
          ],
        ));
  }
}
