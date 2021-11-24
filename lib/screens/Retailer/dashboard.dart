import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';
import 'package:retailer_app/widgets/CustomSliverAppBar.dart';
import 'package:retailer_app/widgets/ImageLoader/image_loader.dart';
import 'package:retailer_app/widgets/sidebar_drawer/CustomDrawer.dart';
import 'dart:math';

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
                              options: CarouselOptions(
                                  height: 200.0, enlargeCenterPage: true),
                              items: [1, 2, 3, 4, 5].map((i) {
                                if (i == 2) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Image.network(
                                      'https://t3.ftcdn.net/jpg/03/35/74/56/240_F_335745675_MaxYxSsadrviZdThITuHB2oCohYOiwEu.jpg',
                                      fit: BoxFit.cover,
                                    );
                                  });
                                } else {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Image.network(
                                        'https://t3.ftcdn.net/jpg/02/37/13/40/240_F_237134053_mMD2IsElBsFaqYoUpZHy8HAkE2WPIcju.jpg',
                                        fit: BoxFit.fill,
                                      );
                                    },
                                  );
                                }
                              }).toList(),
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(height: 30),

                            Divider(
                              thickness: 1,
                            ),

                            Container(
                              height: 1000,
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
                                  }),
                            )
                            // Container(
                            //     height: 300,
                            //     child: ListView.builder(
                            //         itemCount: 5,
                            //         // scrollDirection: Axis.horizontal,
                            //         itemBuilder:
                            //             (BuildContext context, int index) {
                            //           return ProductCard(
                            //             imageUrl:
                            //                 'https://www.jiomart.com/images/product/420x420/590003517/tomato-per-kg-0-20200710.jpg',
                            //             price: 150,
                            //             title: 'Test title',
                            //             subtitle: 'subtitle',
                            //             onTap: null,
                            //             size: 150,
                            //           );
                            //         })),
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
