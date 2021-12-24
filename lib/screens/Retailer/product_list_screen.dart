import 'package:flutter/material.dart';
import 'package:retailer_app/APIs/Product_API.dart';

import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);
  @override
  ProductListScreenState createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  final ProductApi _api = ProductApi();
  List<Product> myProducts = [];

  @override
  void initState() {
    _api.getProducts().then((value) {
      setState(() {
        myProducts.addAll(value);
      });
    });
    super.initState();
  }

  // var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      key: Key("homePage"),
      // drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: myProducts != null
          ? CustomScrollView(
              slivers: [
                // CustomSliverAppBar(
                //   page_title: 'Title',
                // ),
                //++++++++
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Column(
                      children: [
                        ProductCard(
                          product: myProducts[index],
                        ),
                        SizedBox(
                          height: 12,
                        )
                      ],
                    ),
                    childCount: myProducts.length,
                  ),
                ),
                //+++++++
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
