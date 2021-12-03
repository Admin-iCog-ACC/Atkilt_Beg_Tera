import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';
import 'package:retailer_app/widgets/sidebar_drawer/CustomDrawer.dart';
import 'package:retailer_app/widgets/CustomSliverAppBar.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen();
  @override
  ProductListScreenState createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
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
