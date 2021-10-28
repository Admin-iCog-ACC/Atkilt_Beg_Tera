import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:retailer_app/config/theme.dart';

class SqaureCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String subtitle;

  final double size;
  final double fontSize;
  final Function? onTap;
  const SqaureCard(
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
  State<SqaureCard> createState() => _SqaureCardState();
}

class _SqaureCardState extends State<SqaureCard> {
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
      onTap: () {
        // widget.onTap!();
      },
      child: Card(
        child:Container(
          height: 250,
          child: Stack(
            alignment: Alignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Positioned(
              //   bottom: 0,
              //   width: 50,
              //   height: 5,
              //   child: Card(
              //     color: Theme.of(context).cardColor,
              //     child: Center(
              //       child: Text(widget.title,
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               color: Theme.of(context).primaryColor,
              //               fontSize: widget.fontSize)),
              //     ),
              //   ),
              // ), // _
              if (!_imageLoaded) loadingSpinner
            ],
          ),

          // width: 150,
        ),
      ),
    );
  }
}
