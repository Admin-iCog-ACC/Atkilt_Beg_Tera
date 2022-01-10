import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:retailer_app/APIs/Order_API.dart';
import 'package:retailer_app/models/Order.dart';
import 'package:retailer_app/routes/route_path.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);
  @override
  OrderListScreenState createState() => OrderListScreenState();
}

class OrderListScreenState extends State<OrderListScreen> {
  final OrderAPI _apiOrder = OrderAPI();
  List<Order> _orders = [];
  @override
  void initState() {
    getOrderItems();
    super.initState();
  }

  void getOrderItems() {
    _apiOrder.getOrder().then((value) {
      setState(() {
        _orders.addAll(value);
      });
      print('Orders: ' + _orders.length.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
            ),
          ),
          title: Text(
            'Inventory',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 32),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: [
                      Text(
                        'Orders',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Container(
                  child: DataTable2(
                      headingRowColor:
                          MaterialStateProperty.all<Color>(Color(0XFFf7f8f9)),
                      dataRowColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      columnSpacing: 10,
                      horizontalMargin: 10,
                      minWidth: 600,
                      columns: [
                        DataColumn2(
                          label: Text(
                            'Order ID',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: Text('Order Date',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        DataColumn(
                          label: Text('Status',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        DataColumn(
                          label: Text('Action',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          10,
                          (index) => DataRow(cells: [
                                DataCell(
                                  Text(
                                    _orders[index].id.toString(),
                                  ),
                                  onTap: () => Navigator.pushNamed(
                                      context, RoutePaths.merchant_order_detail,
                                      arguments: _orders[index]),
                                ),
                                DataCell(Text(
                                    _orders[index].dateModified.toString())),
                                DataCell(
                                    Text(_orders[index].status.toString())),
                                DataCell(Icon(Icons.delete_outline)),
                              ]))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
