import 'package:flutter/material.dart';
import 'package:retailer_app/models/Order.dart';
import 'package:retailer_app/routes/route_path.dart';

class OrderCard extends StatelessWidget {
  Order order;
  OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
          context, RoutePaths.retailer_order_detail_screen,
          arguments: order),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Color.fromARGB(0XFF, 243, 244, 246),
          // border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order#' + order.id.toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(0Xff, 219, 234, 254),
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: Text(
                      order.status ?? 'Status Unknown',
                      style:
                          TextStyle(color: Color.fromARGB(0XFF, 59, 130, 246)),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order Date'),
                        Text(order.createdAt.toString())
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Time'),
                          Text('11.00 AM - 2.00 PM')
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Br' + (order.total).toString(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Br' + order.total.toString(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          )
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
