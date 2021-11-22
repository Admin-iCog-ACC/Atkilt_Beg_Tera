import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';
import 'package:retailer_app/widgets/CustomSliverAppBar.dart';
import 'package:retailer_app/widgets/ImageLoader/image_loader.dart';
import 'package:retailer_app/widgets/sidebar_drawer/CustomDrawer.dart';

class RetailerDashboardScreen extends StatelessWidget {
  const RetailerDashboardScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('dashboard'),
        drawer: CustomDrawer(),
        // appBar: AppBar(
        //   title: Text('Home'),
        //   centerTitle: true,
        // ),

        body: Padding(
            padding: const EdgeInsets.only(),
            child: CustomScrollView(slivers: [
              CustomSliverAppBar(
                page_title: 'Welcome',
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CarouselSlider(
                              options: CarouselOptions(height: 200.0),
                              items: [1, 2, 3, 4, 5].map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Card(
                                      child: Container(
                                        width: 200,
                                        child: Image.network(
                                            'https://www.jiomart.com/images/product/420x420/590003517/tomato-per-kg-0-20200710.jpg'),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 30),

                            Container(
                                height: 300,
                                child: ListView.builder(
                                    itemCount: 5,
                                    // scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ProductCard(
                                        imageUrl:
                                            'https://www.jiomart.com/images/product/420x420/590003517/tomato-per-kg-0-20200710.jpg',
                                        price: 150,
                                        title: 'Test title',
                                        subtitle: 'subtitle',
                                        onTap: null,
                                        size: 150,
                                      );
                                    })),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Categories',
                            //       style: TextStyle(fontSize: 26),
                            //     ),
                            //     Text(
                            //       'View All',
                            //       style: TextStyle(
                            //           fontSize: 20,
                            //           color: Theme.of(context).primaryColor),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                  childCount: 1,
                ),
              ),
            ])));
  }
}
