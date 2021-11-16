import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/widgets/buttons/buttons.dart';

class InventoryProdcutCard extends StatefulWidget {
  @override
  InventoryProdcutCardState createState() => InventoryProdcutCardState();
}

class InventoryProdcutCardState extends State<InventoryProdcutCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, RoutePaths.merchant_product_detail),
        child: Card(
          elevation: 8,
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/kisspng-ooty-vegetable-fruit-pea-vegflow-vegetable-png-clipart-5a74d157c8de71.5013842015176052078228.png',
                        width: 100,
                        height: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Product name'),
                          Text('price'),
                          Text('quantity')
                        ],
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    text: 'Edit',
                    color: Colors.orange,
                    action: () => Navigator.pushNamed(
                        context, RoutePaths.inventory_entry),
                    height: 35,
                    width: 85,
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ));
  }
}
