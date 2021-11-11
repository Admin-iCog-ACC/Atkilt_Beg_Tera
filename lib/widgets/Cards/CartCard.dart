import 'package:flutter/material.dart';
import 'package:retailer_app/models/Cart.dart';
import 'package:retailer_app/models/Product.dart';

class CartCard extends StatelessWidget {
  static Product myproduct = new Product(
      image_url: 'image_url',
      productname: 'Tomato',
      producttitle: 'Fresh',
      productdescription:
          "It is crunchy, tasty, and highly nutritious. Carrots are a particularly good source of beta carotene, fiber, vitamin K1, potassium, and antioxidants ( 1 ). They also have a number of health benefits. They're a weight-loss-friendly food and have been linked to lower cholesterol levels and improved eye health.",
      price: 20,
      quantity: 50,
      size: 'M',
      available: true,
      categoryid: '12',
      id: '10');
  Cart mycart = new Cart(
      cartid: '11',
      product: myproduct,
      qunatity: 5,
      total: myproduct.price * 5,
      customerId: '425');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: null,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.grey)),
        // margin: EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                  'https://www.jiomart.com/images/product/420x420/590003517/tomato-per-kg-0-20200710.jpg'),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 25),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mycart.product.productname,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    mycart.product.price.toString(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    mycart.qunatity.toString() + 'Kg',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 75,
            ),
            Container(
                child: Text(
              'Br' + mycart.total.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
            IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          ],
        ),
      ),
    );
  }
}
