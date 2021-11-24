import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, RoutePaths.merchant_order_detail),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Order ID'),
                    Text('Order Date'),
                    Text('Total Price')
                  ],
                ),
                Text('Status')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
