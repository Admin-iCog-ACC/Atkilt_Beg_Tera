import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:retailer_app/mock_data/products_mock_services.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/widgets/QuantityBar.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product? product;

  const ProductDetailScreen({Key? key, this.product}) : super(key: key);

  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductsMock _loadProduct = new ProductsMock();

  @override
  void initState() {
    loadLocalProduct();
    // super.initState();
  }

  int quan = 1;
  bool isCartAdded = false;

  @override
  Widget build(BuildContext context) {
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
            'Carrot',
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
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Vegetable-Carrot-Bundle-wStalks.jpg/220px-Vegetable-Carrot-Bundle-wStalks.jpg',
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
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Vegetable-Carrot-Bundle-wStalks.jpg/220px-Vegetable-Carrot-Bundle-wStalks.jpg',
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
                      'Carrot',
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
                      "It is crunchy, tasty, and highly nutritious. Carrots are a particularly good source of beta carotene, fiber, vitamin K1, potassium, and antioxidants ( 1 ). They also have a number of health benefits. They're a weight-loss-friendly food and have been linked to lower cholesterol levels and improved eye health.",
                      softWrap: true,
                      style: TextStyle(
                          height: 1.7,
                          fontSize: 14,
                          color: Color.fromARGB(0XFF, 107, 114, 128)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text("Br15",
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
                                        quan++;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 14,
                                    )),
                                Text(
                                  quan.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                IconButton(
                                    padding: EdgeInsets.only(right: 10),
                                    onPressed: () {
                                      setState(() {
                                        quan - 1 <= 0
                                            ? isCartAdded = false
                                            : quan--;
                                      });
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
                                setState(() {
                                  isCartAdded = true;
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
                          child: Text('Fresh'),
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(
                      'Details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "It is crunchy, tasty, and highly nutritious. Carrots are a particularly good source of beta carotene, fiber, vitamin K1, potassium, and antioxidants ( 1 ). They also have a number of health benefits. They're a weight-loss-friendly food and have been linked to lower cholesterol levels and improved eye health.",
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
