import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
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
                    'Tomatos',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Br35',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '3Kg',
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
              'Br105.0',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
            IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          ],
        ),
      ),
    );
  }
}
