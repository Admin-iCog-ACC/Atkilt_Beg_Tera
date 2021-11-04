import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';
import 'package:retailer_app/widgets/sidebar(drawer)/CustomDrawer.dart';
import 'package:retailer_app/widgets/CustomSliverAppBar.dart';

class ProductListScreen extends StatefulWidget {
  @override
  ProductListScreenState createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key("homePage"),
        drawer: CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                page_title: 'Passed Title',
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                    children: [
                      ProductCard(
                          title: 'Tomatos',
                          imageUrl:
                              'https://www.jiomart.com/images/product/420x420/590003517/tomato-per-kg-0-20200710.jpg',
                          subtitle: 'subtitle',
                          price: 15)
                    ],
                  ),
                  childCount: 5,
                ),
              ),
            ],
          ),
        ));
  }
}
