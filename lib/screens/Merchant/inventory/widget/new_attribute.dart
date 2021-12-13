import 'package:flutter/material.dart';
import 'package:retailer_app/models/new_attribute.dart';

class NewAttribute extends StatelessWidget {
  final int index;
  final List<Attribute> attributes;
  NewAttribute(this.attributes, this.index);

  @override
  Widget build(BuildContext context) {
    Attribute attribute = attributes[index];

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              attribute.lable + index.toString(),
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
