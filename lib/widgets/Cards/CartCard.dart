import 'package:flutter/material.dart';
import 'package:retailer_app/APIs/Cart_API.dart';
import 'package:retailer_app/models/intities/Cart_Item.dart';
import 'package:retailer_app/models/Product.dart';

class CartCard extends StatelessWidget {
  final CartItem item;
  final onDelete;
  final onUpdate;

  CartCard({Key? key, required this.item, this.onDelete, this.onUpdate})
      : super(key: key);

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
                    onTap: () => {
                      item.quantity = item.quantity! + 1,
                      CartApi().updateCartItem(cartItem: item).then((value) {
                        item.quantity = value.quantity;
                      }).catchError((error) {
                        print(error);
                      }).whenComplete(() => onUpdate())
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                  ),
                  Text(
                    item.quantity.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () => {
                      item.quantity = item.quantity! - 1,
                      CartApi().updateCartItem(cartItem: item).then((value) {
                        item.quantity = value.quantity;
                      }).catchError((error) {
                        print(error);
                      }).whenComplete(() => onUpdate())
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.remove,
                        size: 18,
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
              child: Image.network(item.product!.images.length > 0
                  ? item.product!.images.first
                  : "https://t3.ftcdn.net/jpg/03/35/74/56/240_F_335745675_MaxYxSsadrviZdThITuHB2oCohYOiwEu.jpg"),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.product!.name!,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Br " + item.product!.price!,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    item.quantity.toString() + ' X 1Kg',
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
                    'Br' + item.total.toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        CartApi().deleteCartItem(cartItem: item).then((value) {
                          onDelete();
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        size: 20,
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
