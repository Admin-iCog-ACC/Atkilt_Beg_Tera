import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:retailer_app/APIs/Cart_API.dart';
import 'package:retailer_app/APIs/Product_API.dart';
import 'package:retailer_app/models/intities/Cart_Item.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/models/intities/product_attribute.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';

class ProductDetailScreen extends StatefulWidget {
  final dynamic product;

  const ProductDetailScreen({Key? key, this.product}) : super(key: key);

  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isCartAdded = false;
  CartItem? myCartItem = CartItem();

  @override
  Widget build(BuildContext context) {
    final myProduct = ModalRoute.of(context)!.settings.arguments as Product;
    myCartItem!.product = myProduct;
    print(myProduct);
    return Scaffold(
        backgroundColor: Colors.white,
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
          title: Text(
            myProduct.name!,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Image.network(
                            myProduct.images.first,
                            fit: BoxFit.contain,
                            height: 327,
                            width: 327,
                          ),
                          Container(
                            height: 82,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height: 82,
                                      width: 153,
                                      child: Image.network(
                                        myProduct.images.first,
                                        fit: BoxFit.fitHeight,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border:
                                              Border.all(color: Colors.grey)));
                                }),
                          ),
                        ],
                      )),
                  //Image container ends here
                  Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                    ),
                    child: Text(
                      myProduct.name!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      '1Kg',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(0XFF, 107, 114, 128)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                      myProduct.description!,
                      softWrap: true,
                      style: TextStyle(
                          height: 1.7,
                          fontSize: 14,
                          color: Color.fromARGB(0XFF, 107, 114, 128)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text("Br" + myProduct.price!,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor)),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 16),
                      width: 335,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: isCartAdded
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    padding: EdgeInsets.only(left: 10),
                                    onPressed: () {
                                      setState(() {
                                        if (myCartItem != null) {
                                          myCartItem!.quantity =
                                              myCartItem!.quantity! + 1;

                                          print(
                                              ':: myCartItem.tostring() :::: ' +
                                                  myCartItem.toString());

                                          CartApi()
                                              .updateCartItem(
                                                  cartItem: myCartItem!)
                                              .then((value) {
                                            print('UPDATE: $value');
                                          }).catchError((error) {
                                            print('UPDATE ERROR: $error');
                                          });
                                        }
                                        setState(() {});
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 14,
                                    )),
                                Text(
                                  myCartItem!.quantity.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                IconButton(
                                    padding: EdgeInsets.only(right: 10),
                                    onPressed: () {
                                      if (myCartItem != null) {
                                        if (myCartItem!.quantity! > 1) {
                                          myCartItem!.quantity =
                                              myCartItem!.quantity! - 1;
                                        }
                                        print(':: myCartItem.tostring() :::: ' +
                                            myCartItem.toString());
                                        CartApi()
                                            .updateCartItem(
                                                cartItem: myCartItem!)
                                            .then((value) {
                                          print('UPDATE: $value');
                                        });
                                      }
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 14,
                                    ))
                              ],
                            )
                          : MaterialButton(
                              onPressed: () {
                                myCartItem!.quantity = 1;
                                CartApi()
                                    .addToCart(cartItem: myCartItem!)
                                    .then((cartitem) {
                                  print('object: ${cartitem.id}');

                                  myCartItem!.id = cartitem.id;
                                  myCartItem!.cartid = cartitem.cartid;
                                  setState(() {
                                    isCartAdded = true;
                                  });
                                }).catchError((error) {
                                  print(error.toString());
                                });
                              },
                              height: 60,
                              minWidth: MediaQuery.of(context).size.width,
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                'Add To Shopping Cart',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Divider(
                      thickness: 1,
                      endIndent: 0,
                      indent: 0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Text(
                            'Categoty',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          child: Text('Vegetables'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16, top: 16),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 24),
                          child: Text(
                            'Seller',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text('Fresh Corner')
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    endIndent: 0,
                    indent: 0,
                  ),

                  Container(
                    height: myProduct.attributes!.length *
                        (50 - myProduct.attributes!.length * 2),
                    child: ListView.custom(
                      childrenDelegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 24),
                                child: Text(
                                  myProduct.attributes![index]
                                      .productTypeAttribute!.attribute!.name!,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                child:
                                    Text(myProduct.attributes![index].value!),
                              ),
                            ],
                          ),
                        );
                      }, childCount: myProduct.attributes!.length),
                    ),
                  ),

                  Divider(
                    thickness: 1,
                    endIndent: 0,
                    indent: 0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(
                      'Details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    myProduct.description!,
                    softWrap: true,
                    style: TextStyle(
                        height: 1.7,
                        fontSize: 14,
                        color: Color.fromARGB(0XFF, 107, 114, 128)),
                  )
                ],
              ),
            )));
  }

  void loadLocalProduct() async {
    try {
      String response = await rootBundle.loadString('assets/mock/product.json');

      var result = json.decode(response);

      print('###########' + result);
    } catch (e) {
      print('###########' + 'error');
      // throw Text(e.)
    }
  }
}
