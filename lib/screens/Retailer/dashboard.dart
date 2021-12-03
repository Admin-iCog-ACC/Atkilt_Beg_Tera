import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';
import 'package:retailer_app/widgets/CustomSliverAppBar.dart';
import 'package:retailer_app/widgets/ImageLoader/image_loader.dart';
import 'package:retailer_app/widgets/appbar/transsion_appbar.dart';
import 'package:retailer_app/widgets/sidebar_drawer/CustomDrawer.dart';
import 'dart:math';

class RetailerDashboardScreen extends StatelessWidget {
  const RetailerDashboardScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('dashboard'),
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('Welcome'),
          centerTitle: true,
        ),
        body: CustomScrollView(slivers: [
          TransitionAppBar(
            // extent: 100,
            avatar: Container(
              color: Colors.white,
              child: CarouselSlider(
                options: CarouselOptions(height: 193.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  if (i == 2) {
                    return Builder(builder: (BuildContext context) {
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
            ),
            title: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300)),
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Category',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                children: [
                  ProductCard(
                    imageUrl:
                        'https://pickbazarlaravel.s3.ap-southeast-1.amazonaws.com/192/steak_okxpjo.jpg',
                    price: 25,
                    title: 'Tomato',
                    subtitle: 'subtitle',
                    onTap: null,
                    size: 150,
                  ),
                  SizedBox(
                    height: 12,
                  )
                ],
              ),
              childCount: 5,
            ),
          ),
        ]));
  }
}
