import 'package:flutter/material.dart';
import 'package:retailer_app/screens/Merchant/dashboard/dashboard_Card.dart';
import 'package:retailer_app/screens/Merchant/sidedrawer/side_drawer.dart';
import 'package:retailer_app/widgets/sidebar_drawer/CustomDrawer.dart';

class MerchantDashboardScreen extends StatelessWidget {
  const MerchantDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MerchantDrawer(),
        appBar: AppBar(
          title: Text('Welcome'),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                DashBoardCard(
                  header: 'Total Revenu',
                  subTitle: '(Last 30 days)',
                  iconbgColor: Color.fromARGB(0XFF, 167, 243, 208),
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Color.fromARGB(0XFF, 4, 120, 87),
                    size: 24,
                  ),
                ),
                DashBoardCard(
                  header: 'Total Order',
                  subTitle: '(Last 30 days)',
                  iconbgColor: Color.fromARGB(0XFF, 250, 202, 202),
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Color.fromARGB(0XFF, 255, 110, 110),
                    size: 24,
                  ),
                ),
                DashBoardCard(
                  header: 'Todays Revenue',
                  // subTitle: '(Last 30 days)',
                  iconbgColor: Color.fromARGB(0XFF, 255, 232, 178),
                  icon: Icon(
                    Icons.share,
                    color: Color.fromARGB(0XFF, 255, 179, 0),
                    size: 24,
                  ),
                ),
                DashBoardCard(
                  header: 'Total Shops',
                  // subTitle: '(Last 30 days)',
                  iconbgColor: Color.fromARGB(0XFF, 147, 197, 253),
                  icon: Icon(
                    Icons.store,
                    color: Color(0XFF1D4ED8),
                    size: 24,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    padding: EdgeInsets.all(32),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Sale History'),
                    )),
                Container(
                  height: 350,
                  width: 335,
                )
              ],
            ),
          ),
        ));
  }
}
