import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  @override
  void initState() {
    super.initState();
  }

  int quan = 1;
  bool isCartAdded = false;

  @override
  Widget build(BuildContext context) {
    var selectedProduct = new Product('_product_name', '_product_title',
        '_product_description', 15, 10, '_size', true, 101, 152);
    return Scaffold(
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
                        'https://www.jiomart.com/images/product/420x420/590003517/tomato-per-kg-0-20200710.jpg',
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
                                'https://www.jiomart.com/images/product/420x420/590003517/tomato-per-kg-0-20200710.jpg',
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
                    child: Text(selectedProduct.product_name),
                  ),
                  Text(selectedProduct.product_title),
                  Text('Br ' + selectedProduct.price.toString() + "/Kg"),
                  Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
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
                                      Icons.ac_unit_outlined,
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
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(selectedProduct.category_id.toString())
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      children: [
                        Text(
                          'Seller: ',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(selectedProduct.product_title)
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
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Text(
                    selectedProduct.product_description,
                    softWrap: true,
                  )
                ],
              ),
            )));
  }
}
