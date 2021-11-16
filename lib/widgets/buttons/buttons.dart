import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color color;
  final Function() action;
  final double height;
  final double width;
  final TextStyle textStyle;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.action,
      required this.height,
      required this.width,
      required this.textStyle})
      : super(key: key);

  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.action,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: widget.color),
        child: Text(
          widget.text,
          style: widget.textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
