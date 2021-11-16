import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/Cards/inventory_prodcut_card.dart';

class InventoryList extends StatefulWidget {
  const InventoryList({Key? key}) : super(key: key);

  @override
  InventoryListState createState() => InventoryListState();
}

class InventoryListState extends State<InventoryList> {
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
        onPressed: () {},
        label: Text('Add Product'),
        icon: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InventoryProdcutCard(),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
