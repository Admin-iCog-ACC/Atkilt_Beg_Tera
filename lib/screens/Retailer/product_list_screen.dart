import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/SquareCard/prodcut_card.dart';
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
          padding: const EdgeInsets.all(25),
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
                          title: 'Carrots',
                          imageUrl:
                              'https://www.pngfind.com/pngs/m/680-6809879_bunch-carrots-hd-png-download.png',
                          subtitle: 'subtitle',
                          price: 15)
                    ],
                  ),
                  childCount: 10,
                ),
              ),
            ],
          ),
        ));
  }
}
