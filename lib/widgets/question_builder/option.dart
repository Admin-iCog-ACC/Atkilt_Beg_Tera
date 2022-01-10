import 'package:flutter/material.dart';
import 'package:retailer_app/models/intities/ProductTypeAttribute.dart';

class OptionsQueastion extends StatelessWidget {
  ProductTypeAttribute? productTypeAttribute;
  final onSetAttribut;
  OptionsQueastion({@required this.productTypeAttribute, this.onSetAttribut});

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
              productTypeAttribute?.name ?? "",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(0XFF, 75, 85, 99)),
            ),
          ),
          productTypeAttribute?.type == "option"
              ? Column(
                  children: [
                    ...productTypeAttribute!.options!.map((option) {
                      return RadioListTile(
                        toggleable: true,
                        // selected: true,
                        title: Text(option.value ?? ""),
                        value: option.value ?? "",
                        groupValue: productTypeAttribute?.id ?? "",
                        onChanged: (value) {
                          // productTypeAttribute!.id = value!.id;
                          onSetAttribut(value);
                        },
                      );
                    }).toList()
                  ],
                )
              : TextField(
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
