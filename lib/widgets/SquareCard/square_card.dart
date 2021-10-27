import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:retailer_app/config/theme.dart';

class SqaureCard extends StatefulWidget {
  final String title;
  final String imageUrl;

  final double size;
  final double fontSize;
  final Function? onTap;
  const SqaureCard(
      {Key? key,
      required this.title,
      required this.imageUrl,
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
      child: Container(
        clipBehavior: Clip.hardEdge,
        child: Stack(
          alignment: Alignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Positioned(
              bottom: 0,
              width: widget.size,
              child: Container(
                color: AppTheme.cardBackgroundColor,
                child: Center(
                  child: Text(widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: widget.fontSize)),
                ),
              ),
            ), // _
            if (!_imageLoaded) loadingSpinner
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            image: _imageLoaded
                ? DecorationImage(image: _image, fit: BoxFit.cover)
                : null),
        constraints: BoxConstraints(minHeight: widget.size),
        // width: widget.size,
      ),
    );
  }
}
