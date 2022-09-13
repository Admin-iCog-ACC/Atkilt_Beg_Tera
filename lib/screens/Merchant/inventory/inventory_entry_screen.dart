import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retailer_app/APIs/Product_API.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/models/ProductType.dart';
import 'package:retailer_app/models/intities/ProductTypeAttribute.dart';
import 'package:retailer_app/models/intities/product_attribute.dart';

import 'package:retailer_app/screens/Merchant/inventory/widget/new_attribute.dart';

import 'package:retailer_app/widgets/popups/CustomDialogs.dart';
import 'package:retailer_app/widgets/question_builder/option.dart';

class InventoryEntryScreen extends StatefulWidget {
  const InventoryEntryScreen({Key? key}) : super(key: key);

  @override
  InventoryEntryScreenState createState() => InventoryEntryScreenState();
}

class InventoryEntryScreenState extends State<InventoryEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  XFile? image2;
  List<Widget> litems = [];

  Product myProduct = Product();

  final ProductApi _apiProduct = ProductApi();

  List<ProductType> _productTypes = [];
  List<ProductTypeAttribute> _productTypeAttributes = [];
  ProductType _selectedProductType = ProductType();

  TextEditingController _categoryController = TextEditingController();

  double containerHeight = 0;
  bool _isLoading = false;

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();
  TextEditingController _productQuantityController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _productShortDescriptionController =
      TextEditingController();

  @override
  void initState() {
    myProduct.attributes = [];
    getProductTypes();
    super.initState();
  }

  void getProductTypes() {
    _isLoading = true;
    _apiProduct.getProductTypes().then((value) {
      setState(() {
        _productTypes.addAll(value);
        _isLoading = false;
      });

      print('productTypes: ' + _productTypes.length.toString());
    });
  }

  bool isValid() {
    if (_productNameController.text.isNotEmpty &&
        _productPriceController.text.isNotEmpty &&
        _productQuantityController.text.isNotEmpty &&
        _productShortDescriptionController.text.isNotEmpty &&
        myProduct.images.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void getAttributesQuestion(selectedId) {
    _isLoading = true;
    _apiProduct.getAttributesQuestion(selectedId).then((value) {
      setState(() {
        _productTypeAttributes.addAll(value);
        _isLoading = false;
      });

      print('AttributeQuestions: ' + litems.length.toString());
    });
  }

  void createProduct() {
    setState(() {
      _isLoading = true;
    });

    if (isValid()) {
      myProduct.name = _productNameController.text;
      myProduct.price = _productPriceController.text;
      myProduct.stockQuantity = int.parse(_productQuantityController.text);
      myProduct.description = _productDescriptionController.text;
      myProduct.productTypeId = _selectedProductType.id;
      myProduct.categoryId = _selectedProductType.category?.id;
      myProduct.id = null;
      myProduct.sku = 'NONE';
      myProduct.totalSales = 0;
      myProduct.inStock = false;
      _apiProduct.addProduct(myProduct, _selectedProductType.id!).then((value) {
        setState(() {
          _isLoading = false;
        });

        //  CustomDialogs.showSuccessDialog(context, 'Product Added Successfully');

        print('product created');
      });
    } else {
      print('object: there is no data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Product'),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
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
                          'Upload your product featured image here',
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
                                child: image != null
                                    ? Image.file(
                                        File(image!.path),
                                        // height: 100.h,
                                        // width: 100.w,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(25),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.cloud_upload,
                                              size: 40,
                                              color: Color.fromARGB(
                                                  0XFF, 209, 213, 219),
                                            ),
                                            TextButton(
                                                onPressed: () async {
                                                  image =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  setState(() {
                                                    final bytes =
                                                        File(image!.path)
                                                            .readAsBytesSync();
                                                    String base64Image =
                                                        base64Encode(bytes);
                                                    print(
                                                        "img_pan : $base64Image");
                                                    _apiProduct
                                                        .uploadImage(image)
                                                        .then((value) => {
                                                              myProduct.images
                                                                  .add(value)
                                                            });
                                                  });
                                                },
                                                child: Text(
                                                  'Upload an image',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Theme.of(context)
                                                          .primaryColor),
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
                                child: image2 != null
                                    ? Image.file(
                                        File(image2!.path),
                                        // height: 100.h,
                                        // width: 100.w,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.cloud_upload,
                                              size: 40,
                                              color: Color.fromARGB(
                                                  0XFF, 209, 213, 219),
                                            ),
                                            TextButton(
                                                onPressed: () async {
                                                  image2 =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  setState(() {
                                                    final bytes =
                                                        File(image2!.path)
                                                            .readAsBytesSync();
                                                    String base64Image =
                                                        base64Encode(bytes);
                                                    print(
                                                        "img_pan : $base64Image");
                                                    _apiProduct
                                                        .uploadImage(image2)
                                                        .then((value) => {
                                                              myProduct.images
                                                                  .add(value)
                                                            });
                                                  });
                                                },
                                                child: Text(
                                                  'Upload an image',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Theme.of(context)
                                                          .primaryColor),
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
                          'Type & Category',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(0XFF, 75, 85, 99)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Select product type and category here',
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
                                'Product Type*',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(0XFF, 75, 85, 99)),
                              ),
                            ),
                            DropdownButton(
                              hint: Text('Select Product Type'),
                              items: _productTypes.map((value) {
                                return DropdownMenuItem(
                                  child: Text(value.name!),
                                  value: value.id,
                                );
                              }).toList(),
                              value: _selectedProductType.id,
                              onChanged: (value) {
                                setState(() {
                                  _selectedProductType =
                                      _productTypes.firstWhere(
                                          (element) => element.id == value);
                                  if (_selectedProductType != null) {
                                    _categoryController.text =
                                        _selectedProductType.category!.name!;

                                    getAttributesQuestion(
                                        _selectedProductType.id);
                                  }
                                });
                              },
                              selectedItemBuilder: (context) {
                                return _productTypes.map((value) {
                                  return DropdownMenuItem(
                                    child: Text(value.name!),
                                    value: value.id,
                                  );
                                }).toList();
                              },
                              isExpanded: true,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            //------
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Category',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(0XFF, 75, 85, 99)),
                              ),
                            ),
                            TextField(
                              enabled: false,
                              controller: _categoryController,
                              decoration: InputDecoration(
                                  hintText: 'Category',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(0XFF, 75, 85, 99)),
                                  border: InputBorder.none),
                            ),

                            // DropdownButton(
                            //   items: <String>[].map((String value) {
                            //     return new DropdownMenuItem<String>(
                            //       value: value,
                            //       child: new Text(value),
                            //     );
                            //   }).toList(),
                            //   isExpanded: true,
                            //   borderRadius: BorderRadius.all(Radius.circular(5)),
                            //   onChanged: (value) {},
                            // ),
                            //-------------\
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: 20, top: 20),
                            //   child: Text(
                            //     'Tags',
                            //     style: TextStyle(
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w600,
                            //         color: Color.fromARGB(0XFF, 75, 85, 99)),
                            //   ),
                            // ),
                            // DropdownButton(
                            //   items: <String>[].map((String value) {
                            //     return new DropdownMenuItem<String>(
                            //       value: value,
                            //       child: new Text(value),
                            //     );
                            //   }).toList(),
                            //   isExpanded: true,
                            //   borderRadius: BorderRadius.all(Radius.circular(5)),
                            //   onChanged: (Object? value) {},
                            // ),
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
                              controller: _productNameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                              ),
                            ),
                            //------
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: 20, top: 20),
                            //   child: Text(
                            //     'Unit*',
                            //     style: TextStyle(
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w600,
                            //         color: Color.fromARGB(0XFF, 75, 85, 99)),
                            //   ),
                            // ),
                            // TextField(
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(5.0))),
                            //   ),
                            // ),
                            //-------------\

                            Padding(
                              padding: EdgeInsets.only(bottom: 20, top: 20),
                              child: Text(
                                'Short Description*',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(0XFF, 75, 85, 99)),
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: _productShortDescriptionController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                              ),
                            ),

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
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: _productDescriptionController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                              ),
                            ),

                            // Padding(
                            //   padding: EdgeInsets.only(bottom: 20, top: 20),
                            //   child: Text(
                            //     'Status',
                            //     style: TextStyle(
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w600,
                            //         color: Color.fromARGB(0XFF, 75, 85, 99)),
                            //   ),
                            // ),
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
                                          color:
                                              Color.fromARGB(0XFF, 75, 85, 99)),
                                    ),
                                  ),
                                  TextField(
                                    controller: _productPriceController,
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
                                          color:
                                              Color.fromARGB(0XFF, 75, 85, 99)),
                                    ),
                                  ),
                                  TextField(
                                    controller: _productQuantityController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(bottom: 20),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(bottom: 8),
                            //         child: Text(
                            //           'SKU*',
                            //           style: TextStyle(
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.w600,
                            //               color:
                            //                   Color.fromARGB(0XFF, 75, 85, 99)),
                            //         ),
                            //       ),
                            //       TextField(
                            //         decoration: InputDecoration(
                            //           border: OutlineInputBorder(
                            //               borderRadius: BorderRadius.all(
                            //                   Radius.circular(5.0))),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            if (_productTypeAttributes != null)
                              ..._productTypeAttributes
                                  .map((productTypeAttribut) {
                                bool isChecked = false;
                                return OptionsQueastionState(
                                  isSelected: isChecked,
                                  productTypeAttribute: productTypeAttribut,
                                  onCheckBox: (value, option) {
                                    setState(() {
                                      print(isChecked);
                                      print(option.value);
                                      print(value);
                                      isChecked = value;
                                    });
                                  },
                                );
                              }).toList(),
                            // Checkbox(
                            //     value: isChecked,
                            //     onChanged: (val) {
                            //       setState(() {
                            //         isChecked = val!;
                            //       });
                            //     }),
                            //TODO: Add more fields for product information
                            // if (attributes.isNotEmpty)
                            //   Align(
                            //     alignment: Alignment.center,
                            //     child: Container(
                            //       margin: EdgeInsets.only(top: 10, bottom: 10),
                            //       padding: EdgeInsets.all(20),
                            //       child: Text(
                            //         "Additional Attributes",
                            //         style: TextStyle(
                            //             fontSize: 16,
                            //             fontWeight: FontWeight.w600,
                            //             color: Color.fromARGB(0XFF, 75, 85, 99)),
                            //       ),
                            //     ),
                            //   ),
                            // Container(
                            //   height: containerHeight,
                            //   child: new ListView.builder(
                            //       itemCount: attributes.length,
                            //       itemBuilder: (BuildContext ctxt, int index) =>
                            //           NewAttribute(attributes, index)),
                            // ),
                            // Align(
                            //   alignment: Alignment.center,
                            //   child: MaterialButton(
                            //     color: Theme.of(context).primaryColor,
                            //     child: Text('+ Add more attribute'),
                            //     textColor: Colors.white,
                            //     onPressed: () {
                            //       setState(() {
                            //         containerHeight += 98;
                            //         attributes.add(Attribute('lable', 'value'));
                            //       });
                            //     },
                            //   ),
                            // ),
                            // if (attributes.isNotEmpty)
                            //   Align(
                            //     alignment: Alignment.center,
                            //     child: MaterialButton(
                            //       color: Colors.grey,
                            //       child: Text('- Remove'),
                            //       textColor: Colors.white,
                            //       onPressed: () {
                            //         setState(() {
                            //           attributes.isEmpty
                            //               ? containerHeight = 0
                            //               : containerHeight -= 98;

                            //           attributes.removeLast();
                            //         });
                            //       },
                            //     ),
                            //   )
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
                              color: !isValid()
                                  ? Colors.grey[400]
                                  : Theme.of(context).primaryColor,
                              child: Text('Save'),
                              textColor: Colors.white,
                              onPressed: () {
                                createProduct();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
