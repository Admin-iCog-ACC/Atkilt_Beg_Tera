import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailer_app/APIs/Product_API.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/repo/product_repo.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';
import 'package:retailer_app/widgets/appbar/transsion_appbar.dart';
import 'package:retailer_app/widgets/sidebar_drawer/CustomDrawer.dart';

class RetailerDashboardScreen extends StatefulWidget {
  const RetailerDashboardScreen({Key? key}) : super(key: key);
  @override
  RetailerDashboardScreenState createState() => RetailerDashboardScreenState();
}

class RetailerDashboardScreenState extends State<RetailerDashboardScreen> {
  List<Product> myProducts = [];

  final ProductApi _api = ProductApi();

  @override
  void initState() {
    _api.getProducts().then((value) {
      setState(() {
        myProducts.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ProductRepository provider =
    //     Provider.of<ProductRepository>(context, listen: false);

    // provider.getAllProducts().then((products) {
    //   setState(() {
    //     myProducts = products;
    //   });
    //   print('*************************$myProducts');
    // });

    return Scaffold(
      key: Key('dashboard'),
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      ),
      body: myProducts != null
          ? CustomScrollView(slivers: [
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Category',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
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
                        product: myProducts[index],
                      ),
                      SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                  childCount: myProducts.length - 1,
                ),
              ),
            ])
          : Center(child: CircularProgressIndicator()),
    );
  }

  void filterByCategory(int category) {
    setState(() {
      myProducts = myProducts
          .where((product) => product.productType!.categoryId == category)
          .toList();
    });
  }
}
