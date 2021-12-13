import 'package:flutter/material.dart';
import 'package:retailer_app/models/Cart.dart';
import 'package:retailer_app/models/Product.dart';

class CartCard extends StatelessWidget {
  static Product myproduct = new Product();
  Cart mycart = new Cart(
      cartid: '11',
      product: myproduct,
      qunatity: 5,
      total: 450,
      customerId: '425');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(16),
        height: 129,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.lerp(
                Border(
                    top: BorderSide(
                        width: 1.0,
                        color: Color.fromARGB(0XFF, 229, 231, 235))),
                Border(
                    top: BorderSide(
                        width: 1.0,
                        color: Color.fromARGB(0XFF, 229, 231, 235))),
                0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 32,
              height: 96,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => print('+object'),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.add,
                        size: 14,
                      ),
                    ),
                  ),
                  Text(
                    '1',
                    style: TextStyle(fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () => print('-object'),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.remove,
                        size: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.all(10),
              height: 40,
              width: 40,
              child: Image.network(
                  'https://www.jiomart.com/images/product/420x420/590003517/tomato-per-kg-0-20200710.jpg'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tomato',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Br" + mycart.product.price.toString(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    mycart.qunatity.toString() + ' X 1Kg',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'Br' + mycart.total.toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        size: 12,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
