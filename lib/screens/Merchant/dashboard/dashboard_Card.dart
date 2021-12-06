import 'package:flutter/material.dart';

class DashBoardCard extends StatelessWidget {
  final String header;
  final String? subTitle;
  final Color iconbgColor;
  final Icon icon;

  DashBoardCard({
    required this.header,
    this.subTitle,
    required this.iconbgColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 144,
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          height: 80,
          margin: EdgeInsets.only(bottom: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        header,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      subTitle ?? '',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              ),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: iconbgColor,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: icon,
              )
            ],
          ),
        ));
  }
}
