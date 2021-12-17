import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/widgets/Cards/inventory_prodcut_card.dart';
import 'package:retailer_app/widgets/buttons/buttons.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  OrderDetailScreenState createState() => OrderDetailScreenState();
}

class OrderDetailScreenState extends State<OrderDetailScreen> {
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
  @override
  Widget build(BuildContext context) {
    double prodcutContainerHeight = MediaQuery.of(context).size.height / 2;
    return Scaffold(
        appBar: AppBar(
          title: Text('VF2S3VS45V'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 24, top: 24),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 32),
                            child: Text(
                              'Order ID: VF2S3VS45V',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton(
                              hint: Text('Order Status'),
                              items: <String>[
                                'Messaging',
                                'Chating',
                                'No Longer Interested',
                                'Document Request'
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {},
                            ),
                            MaterialButton(
                              height: 40,
                              onPressed: () {},
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: DataTable2(
                            headingRowColor: MaterialStateProperty.all<Color>(
                                Color(0XFFf7f8f9)),
                            dataRowColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            columnSpacing: 10,
                            horizontalMargin: 10,
                            minWidth: 150,
                            columns: [
                              DataColumn2(
                                label: Text(
                                  'Product',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                size: ColumnSize.L,
                              ),
                              DataColumn(
                                label: Text('Total',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                                5,
                                (index) => DataRow(cells: [
                                      DataCell(Container(
                                        height: 50,
                                      )),
                                      DataCell(Text('Br50')),
                                    ]))),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                top: BorderSide(
                                    width: 0.5,
                                    color:
                                        Color.fromARGB(0XFF, 107, 114, 128)))),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sub Total',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              0XFF, 107, 114, 128))),
                                  Text('Br450',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              0XFF, 107, 114, 128)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Discount',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              0XFF, 107, 114, 128))),
                                  Text('Br50',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              0XFF, 107, 114, 128)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Delivery Fee',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              0XFF, 107, 114, 128))),
                                  Text('Br100',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              0XFF, 107, 114, 128)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tax',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              0XFF, 107, 114, 128))),
                                  Text('Br50',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              0XFF, 107, 114, 128)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Br550',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Billing Address',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 24),
                        child: Text('Yeka, Addiss Ababa, Ethiopia',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(0XFF, 107, 114, 128))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Shpping Address',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 24),
                        child: Text('Yeka, Addiss Ababa, Ethiopia',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(0XFF, 107, 114, 128))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
