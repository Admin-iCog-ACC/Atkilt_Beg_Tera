import 'package:flutter/material.dart';

class NewAttribute extends StatelessWidget {
  final int index;
  NewAttribute(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Lable',
              // attribute.lable + index.toString(),
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(0XFF, 75, 85, 99)),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
          ),
        ],
      ),
    );
  }
}
