import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/widgets/CustomSliverAppBar.dart';
import 'package:retailer_app/widgets/buttons/buttons.dart';

class MerchantDashboardScreen extends StatelessWidget {
  const MerchantDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(),
            child: CustomScrollView(slivers: [
              CustomSliverAppBar(
                page_title: 'Dashboard',
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => Column(children: [
                            Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Card(
                                      elevation: 8,
                                      color: Colors.greenAccent,
                                      child: Container(
                                        height: 30,
                                        width: 250,
                                        child: Text(
                                          '*No new Notification',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 350,
                                      margin: EdgeInsets.only(top: 100),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        children: [
                                          CustomButton(
                                            text: 'Inventory',
                                            color:
                                                Theme.of(context).primaryColor,
                                            action: () => Navigator.pushNamed(
                                                context, RoutePaths.inventory),
                                            height: 50,
                                            width: 300,
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          CustomButton(
                                            text: 'Deliveries',
                                            color:
                                                Theme.of(context).primaryColor,
                                            action: () => {},
                                            height: 50,
                                            width: 300,
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          CustomButton(
                                            text: 'Pendig Orders',
                                            color:
                                                Theme.of(context).primaryColor,
                                            action: () => {},
                                            height: 50,
                                            width: 300,
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          CustomButton(
                                            text: 'Order History',
                                            color:
                                                Theme.of(context).primaryColor,
                                            action: () => {},
                                            height: 50,
                                            width: 300,
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                          ]),
                      childCount: 1))
            ])));
  }
}
