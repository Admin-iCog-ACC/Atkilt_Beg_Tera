import 'package:flutter/material.dart';
import 'package:retailer_app/config/colorPallet.dart';
import 'package:retailer_app/config/theme.dart';


class TextBanner extends StatelessWidget {
  final double size;
  final double radius;
  final double fontSize;
  final String text;
  const TextBanner(
      {Key? key,
      this.size = 100,
      this.radius = 24,
      this.fontSize = 32,
      this.text = " "})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      child: Center(
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
                color: Theme.of(context).primaryColor)),
      ),
      decoration: BoxDecoration(
          color: ColorPallet.bannerBackgroundColor,
          borderRadius: BorderRadius.circular(radius)),
    );
  }
}
