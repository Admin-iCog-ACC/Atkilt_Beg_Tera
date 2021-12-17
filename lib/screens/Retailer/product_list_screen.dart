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
    // ProductApi().getProducts();

    _api.getProducts().then((value) {
      myProducts.addAll(value);
      print('myProducts' + myProducts.length.toString());
    });

    super.initState();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("homePage"),
      // drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: CustomScrollView(
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
                      title: 'Tomatos',
                      imageUrl:
                          "https://pickbazarlaravel.s3.ap-southeast-1.amazonaws.com/192/steak_okxpjo.jpg",
                      subtitle: 'subtitle',
                      price: 15),
                  SizedBox(
                    height: 12,
                  )
                ],
              ),
              childCount: 5,
            ),
          ),
          //+++++++
        ],
      ),
    );
  }
}
