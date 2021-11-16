import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/widgets/buttons/buttons.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);
  @override
  ProductDetailState createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetail> {
  void ondelete() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('Product name'),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Title')),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Quantity')),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Category')),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Measuring Unit')),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Available')),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Description')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      text: 'Delete',
                      color: Colors.red,
                      action: () => ondelete(),
                      height: 35,
                      width: 100,
                      textStyle: TextStyle()),
                  CustomButton(
                      text: 'Edit',
                      color: Colors.orange,
                      action: () => Navigator.pushNamed(
                          context, RoutePaths.inventory_entry),
                      height: 35,
                      width: 100,
                      textStyle: TextStyle())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
