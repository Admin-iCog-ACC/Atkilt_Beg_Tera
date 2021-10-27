import 'package:flutter/material.dart';

class ImageLoader extends StatefulWidget {
  final imageUrl;
  final width;
  final height;
  const ImageLoader({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
