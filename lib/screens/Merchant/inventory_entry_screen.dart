import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/buttons/buttons.dart';

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
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://t3.ftcdn.net/jpg/01/86/34/84/240_F_186348441_aqyXOkNyY2dMaPMTH0VcXEt1GIUjY4Zy.jpg',
                height: 250,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Add Image',
                  color: Theme.of(context).primaryColor,
                  action: () {},
                  height: 40,
                  width: 150,
                  textStyle: TextStyle()),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'product name',
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Title',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field is required';
                            }
                            return null;
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Price',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field is required';
                            }
                            return null;
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Quantity',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field is required';
                            }
                            return null;
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Category',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field is required';
                            }
                            return null;
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            focusColor: Colors.orange,
                            fillColor: Colors.orange,
                            hoverColor: Colors.orange,
                            border: OutlineInputBorder(),
                            hintText: 'Measuring Unit',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Available',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field is required';
                            }
                            return null;
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Description',
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field is required';
                            }
                            return null;
                          },
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
