import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/buttons/buttons.dart';
import 'package:retailer_app/widgets/popups/delete_warning.dart';

class InventoryEntryScreen extends StatefulWidget {
  const InventoryEntryScreen({Key? key}) : super(key: key);

  @override
  InventoryEntryScreenState createState() => InventoryEntryScreenState();
}

class InventoryEntryScreenState extends State<InventoryEntryScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Product'),
        ),
        body: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Add Product',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Featured Image',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(0XFF, 75, 85, 99)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Upload your prodcut featured image here',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(0XFF, 75, 85, 99)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 144,
                            width: 296,
                            child: Container(
                              padding: EdgeInsets.all(25),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    size: 40,
                                    color: Color.fromARGB(0XFF, 209, 213, 219),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Upload an image',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Theme.of(context).primaryColor),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(top: 32, bottom: 8),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(0XFF, 75, 85, 99)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Upload your prodcut image gallery here',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(0XFF, 75, 85, 99)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 144,
                            width: 296,
                            child: Container(
                              padding: EdgeInsets.all(25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    size: 40,
                                    color: Color.fromARGB(0XFF, 209, 213, 219),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Upload an image',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Theme.of(context).primaryColor),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, top: 20),
                    child: Text(
                      'Group & Categories',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(0XFF, 75, 85, 99)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Select product group and categories from here',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(0XFF, 75, 85, 99)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Group*',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(0XFF, 75, 85, 99)),
                          ),
                        ),
                        DropdownButton(
                          items: [],
                          isExpanded: true,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        //------
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 20),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(0XFF, 75, 85, 99)),
                          ),
                        ),
                        DropdownButton(
                          items: [],
                          isExpanded: true,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        //-------------\
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 20),
                          child: Text(
                            'Tags',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(0XFF, 75, 85, 99)),
                          ),
                        ),
                        DropdownButton(
                          items: [],
                          isExpanded: true,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, top: 20),
                    child: Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(0XFF, 75, 85, 99)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Change your product description and necessary information from here',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(0XFF, 75, 85, 99)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Name*',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(0XFF, 75, 85, 99)),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          ),
                        ),
                        //------
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 20),
                          child: Text(
                            'Unit*',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(0XFF, 75, 85, 99)),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          ),
                        ),
                        //-------------\
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 20),
                          child: Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(0XFF, 75, 85, 99)),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 20),
                          child: Text(
                            'Status',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(0XFF, 75, 85, 99)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, top: 20),
                    child: Text(
                      'Product information',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(0XFF, 75, 85, 99)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Product description and neccessary informations',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(0XFF, 75, 85, 99)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  'Price*',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(0XFF, 75, 85, 99)),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  'Quantity*',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(0XFF, 75, 85, 99)),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  'SKU*',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(0XFF, 75, 85, 99)),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            color: Theme.of(context).primaryColor,
                            child: Text('+ Add more attribute'),
                            textColor: Colors.white,
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          color: Colors.grey,
                          child: Text('Cancel'),
                          textColor: Colors.white,
                          onPressed: () =>
                              CustomDialogs().showDeletDialog(context),
                        ),
                        MaterialButton(
                          color: Theme.of(context).primaryColor,
                          child: Text('Save'),
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))));
  }
}
