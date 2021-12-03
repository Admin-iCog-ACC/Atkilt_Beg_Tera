import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:retailer_app/config/theme.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/routes/route_path.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String subtitle;

  final double size;
  final double fontSize;
  final Function? onTap;
  const ProductCard(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.subtitle,
      required this.price,
      this.size = 150,
      this.fontSize = 20,
      this.onTap})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProdcutCardState();
}

class _ProdcutCardState extends State<ProductCard> {
  var _image;
  var loadingSpinner;
  var _imageLoaded = false;

  @override
  void initState() {
    _image = NetworkImage(widget.imageUrl);

    _image
        .resolve(ImageConfiguration())
        ?.addListener(ImageStreamListener((_, __) {
      if (mounted) {
        setState(() {
          _imageLoaded = true;
        });
      }
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadingSpinner = SpinKitRipple(
      color: Theme.of(context).primaryColor,
    );
    return Container(
        child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.retailer_prodcut_detail,
            arguments: new Product(
              id: '12',
              categoryid: '25',
              productname: '_product_name',
              producttitle: '_product_title',
              productdescription: '_product_description',
              image_url: '',
              price: double.parse('50'),
              quantity: int.parse('10'),
              size: 'M',
              available: true,
            ));
      },
      child: Card(
        child: Container(
            width: 341,
            height: 306,
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(
                    height: 192,
                    child: _imageLoaded
                        ? Image(image: _image, fit: BoxFit.scaleDown)
                        : loadingSpinner),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Br' + widget.price.toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        widget.title,
                        style: TextStyle(fontSize: 12, color: Colors.black38),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            child: Container(
                          width: 289,
                          height: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0),
                            ),
                            color: Colors.grey[100],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(),
                                child: Text(
                                  'Add',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black45),
                                ),
                              ),
                            ],
                          ),
                        )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 28,
                            width: 28,
                            child: Icon(
                              Icons.add,
                              size: 14,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(0XFF, 229, 231, 235),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                // MaterialButton(
                //     height: 28,
                //     minWidth: 342,
                //     onPressed: () => print("Successul Btn."),
                //     color: Color.fromARGB(0XFF, 243, 244, 246),
                //     child: Row(
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.only(),
                //           child: Text(
                //             'Add',
                //             style: TextStyle(
                //               fontSize: 12,
                //               color: Color.fromARGB(0XFF, 229, 231, 235),
                //             ),
                //           ),
                //         ),
                //         // Material(
                //         //   color: Colors.orange,
                //         //   child: Icon(
                //         //     Icons.add,
                //         //     size: 16,
                //         //     color: Color.fromARGB(0XFF, 229, 231, 235),
                //         //   ),
                //         // ),
                //       ],
                //     )),
              ],
            )),
      ),
    ));
  }
}
