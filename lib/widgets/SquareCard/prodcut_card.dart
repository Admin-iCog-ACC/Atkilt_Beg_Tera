import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:retailer_app/config/theme.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    loadingSpinner = SpinKitFadingCircle(color: Theme.of(context).primaryColor);
    return GestureDetector(
      onTap: () => print("Successul card."),
      child: Card(
        margin: EdgeInsets.all(10),
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(image: _image, fit: BoxFit.cover)),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Br ' + widget.price.toString() + '/Kg',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  height: 28,
                  minWidth: 355,
                  onPressed: () => print("Successul Btn."),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
