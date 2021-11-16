import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';
import 'package:retailer_app/widgets/CustomSliverAppBar.dart';
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
                            Text(
                              'Top Salers',
                              style: TextStyle(fontSize: 26),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  child: InkWell(
                                    child: Image.asset(
                                        'assets/images/kisspng-ooty-vegetable-fruit-pea-vegflow-vegetable-png-clipart-5a74d157c8de71.5013842015176052078228.png'),
                                  ),
                                  radius: 45,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Text(
                              'Best Selling',
                              style: TextStyle(fontSize: 26),
                            ),
                            Container(
                                height: 300,
                                child: ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Categories',
                                  style: TextStyle(fontSize: 26),
                                ),
                                Text(
                                  'View All',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            )
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
