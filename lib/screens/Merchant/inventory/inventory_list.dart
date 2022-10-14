import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retailer_app/APIs/Product_API.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/routes/route_path.dart';

import 'package:retailer_app/widgets/Cards/inventory_prodcut_card.dart';

class InventoryList extends StatefulWidget {
  const InventoryList({Key? key}) : super(key: key);

  @override
  InventoryListState createState() => InventoryListState();
}

class InventoryListState extends State<InventoryList> {
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio(); // for http requests
  String _searchText = "";
  List names = []; // names we get from API
  List filteredNames = []; // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');
  final ProductApi _api = ProductApi();
  List<Product> myProducts = [];
  @override
  void initState() {
    _api.getProducts().then((value) {
      setState(() {
        myProducts.addAll(value);
        print(myProducts.length);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            Navigator.pushNamed(context, RoutePaths.inventory_entry),
        label: Text('Add Product', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: myProducts.isEmpty
          ? Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ))
          : SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(bottom: 32),
                          child: Column(
                            children: [
                              Text(
                                'Products',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              // Container(
                              //     child: Row(
                              //   children: [Icon(Icons.search), TextField()],
                              // ))
                            ],
                          ),
                        ),
                        // Container(
                        //   height: 150,
                        //   child: ListView.builder(
                        //       itemCount: 10,
                        //       itemBuilder: (BuildContext context, int index) {
                        //         return Column(
                        //           children: [
                        //             InventoryProdcutCard(),
                        //             SizedBox(
                        //               height: 10,
                        //             )
                        //           ],
                        //         );
                        //       }),
                        // ),
                        Container(
                          child: DataTable2(
                              headingRowColor: MaterialStateProperty.all<Color>(
                                  Color(0XFFf7f8f9)),
                              dataRowColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              columnSpacing: 10,
                              horizontalMargin: 10,
                              minWidth: 600,
                              columns: [
                                DataColumn2(
                                  label: Text(
                                    'Image',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  size: ColumnSize.L,
                                ),
                                DataColumn(
                                  label: Text('Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ),
                                DataColumn(
                                  label: Text('Price/Unit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ),
                                DataColumn(
                                  label: Text('Quantity',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ),
                                // DataColumn(
                                //   label: Text('Status',
                                //       style:
                                //           TextStyle(fontWeight: FontWeight.w600)),
                                // ),
                                DataColumn(
                                  label: Text('Actions',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                  myProducts.length,
                                  (index) => DataRow(cells: [
                                        DataCell(
                                          Text((index + 1).toString()),
                                          onTap: () => Navigator.pushNamed(
                                              context,
                                              RoutePaths
                                                  .merchant_product_detail),
                                        ),
                                        DataCell(Text(myProducts[index].name!)),
                                        DataCell(
                                            Text(myProducts[index].price!)),
                                        DataCell(Text(myProducts[index]
                                            .stockQuantity
                                            .toString())),
                                        // DataCell(Text(myProducts[index].status!)),
                                        DataCell(Row(
                                          children: [
                                            Icon(Icons.delete_outline),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(Icons.edit)
                                          ],
                                        )),
                                      ]))),
                        ),
                      ],
                    ),
                  ))),
    );
  }

  void _getNames() async {
    final response = await dio.get('https://swapi.co/api/people');
    List tempList = [];
    for (int i = 0; i < response.data['results'].length; i++) {
      tempList.add(response.data['results'][i]);
    }

    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }

  ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }
}
