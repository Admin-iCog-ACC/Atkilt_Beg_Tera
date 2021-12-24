import 'package:flutter/material.dart';
import 'package:retailer_app/APIs/Cart_API.dart';
import 'package:retailer_app/APIs/Product_API.dart';
import 'package:retailer_app/models/Cart.dart';
import 'package:retailer_app/models/intities/Cart_Item.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/widgets/Cards/CartCard.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  final ProductApi _apiProduct = ProductApi();
  final CartApi _apiCart = CartApi();
  List<CartItem> myCarts = [];
  Cart? cart;
  @override
  void initState() {
    getCartItems();
    super.initState();
  }

  void getCartItems() {
    _apiCart.getCart().then((value) {
      setState(() {
        cart = value;
        myCarts.addAll(value.cartItems!);
      });
      print('MYCARTS ' + myCarts.length.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
          ),
        ),
        body: myCarts.isNotEmpty
            ? Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: myCarts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartCard(
                              item: myCarts[index],
                              onUpdate: () {
                                setState(() {});
                              },
                              onDelete: () {
                                setState(() {
                                  myCarts.removeAt(index);
                                });
                              });
                        }),
                  ),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutePaths.retailer_checkut,
                                  arguments: cart);
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    alignment: Alignment.center,
                                    height: 40,
                                    // width: 85,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        color: Colors.white),
                                    child: Text("Br " + cart!.totalPrice!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                  )
                                ],
                              ),
                            ),
                          )))
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
