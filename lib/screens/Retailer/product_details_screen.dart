import 'dart:convert';

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
  Product selectedProduct = new Product(
      image_url: 'image_url',
      productname: 'Carrot',
      producttitle: 'Fresh',
      productdescription:
          "It is crunchy, tasty, and highly nutritious. Carrots are a particularly good source of beta carotene, fiber, vitamin K1, potassium, and antioxidants ( 1 ). They also have a number of health benefits. They're a weight-loss-friendly food and have been linked to lower cholesterol levels and improved eye health.",
      price: 20,
      quantity: 50,
      size: 'M',
      available: true,
      categoryid: '12',
      id: '10');
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
                  Icons.favorite_border_outlined,
                  color: Colors.red,
                ))
          ],
          title: Text(
            selectedProduct.productname,
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
                      margin: EdgeInsets.only(bottom: 5, top: 5),
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Vegetable-Carrot-Bundle-wStalks.jpg/220px-Vegetable-Carrot-Bundle-wStalks.jpg',
                        fit: BoxFit.contain,
                      )),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 100,
                              width: 150,
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Vegetable-Carrot-Bundle-wStalks.jpg/220px-Vegetable-Carrot-Bundle-wStalks.jpg',
                                fit: BoxFit.fitHeight,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor)));
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      selectedProduct.productname,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Br ' + selectedProduct.price.toString() + "/Kg",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                  // Text(
                  //   selectedProduct.product_title,
                  //   style:
                  //       TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  // ),
                  Container(
                      margin: EdgeInsets.only(top: 20, bottom: 15),
                      height: 60,
                      // padding: EdgeInsets.only(left: 10, right: 10),
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
                                    )),
                                Text(
                                  quan.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
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
                                      Icons.space_bar,
                                      color: Colors.white,
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
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                  Divider(
                    // height: 20,
                    thickness: 2,
                    endIndent: 0,
                    indent: 0,
                    // color: Theme.of(context).primaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          'Categoty: ',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(selectedProduct.categoryid.toString())
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      children: [
                        Text(
                          'Seller: ',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(selectedProduct.producttitle)
                      ],
                    ),
                  ),
                  Divider(
                    // height: 20,
                    thickness: 2,
                    endIndent: 0,
                    indent: 0,
                    // color: Theme.of(context).primaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(
                      'Details',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Text(
                    selectedProduct.productdescription,
                    softWrap: true,
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

      selectedProduct = Product.fromJson(result);
    } catch (e) {
      print('###########' + 'error');
      // throw Text(e.)
    }
  }
}
