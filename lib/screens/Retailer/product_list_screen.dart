import 'dart:ffi';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:retailer_app/APIs/Product_API.dart';

import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/models/filter_by.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';
import 'package:retailer_app/widgets/FAB/cart_fab.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);
  @override
  ProductListScreenState createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  final ProductApi _api = ProductApi();
  List<Product> myProducts = [];
  List<FilterValue>? filterValues = [
    FilterValue(
        filterLabel: 'Age < 1yr',
        filterType: 'Age',
        filterValue: 1,
        condition: 'isLessThan'),
    FilterValue(
        filterLabel: 'Age 1-3 yr',
        filterType: 'Age',
        filterLowerBound: 1,
        filterUpperBound: 3,
        condition: 'isBetween'),
    FilterValue(
        filterLabel: 'Age > 3yr',
        filterType: 'Age',
        filterValue: 3,
        condition: 'isGreaterThan'),
    FilterValue(filterLabel: 'none'),
    FilterValue(
        filterLabel: 'Weight < 15kg',
        filterType: 'Weight',
        filterValue: 15,
        condition: 'isLessThan'),
    FilterValue(
        filterLabel: 'Weight 15-25 kg',
        filterType: 'Weight',
        filterLowerBound: 15,
        filterUpperBound: 25,
        condition: 'isBetween'),
    FilterValue(
        filterLabel: 'Weight > 25kg',
        filterType: 'Weight',
        filterValue: 25,
        condition: 'isGreaterThan'),
    FilterValue(filterLabel: 'none'),
    FilterValue(
        filterLabel: 'Price < 4k',
        filterType: 'Price',
        filterValue: 4000,
        condition: 'isLessThan'),
    FilterValue(
        filterLabel: 'Price 4-8 k',
        filterType: 'Price',
        filterLowerBound: 4000,
        filterUpperBound: 8000,
        condition: 'isBetween'),
    FilterValue(
        filterLabel: 'Price > 8k',
        filterType: 'Price',
        filterValue: 8000,
        condition: 'isGreaterThan'),
    FilterValue(filterLabel: 'none'),
  ];
  List<FilterValue>? selectedFilterValues = [];
  List<Product> templivestock = [];
  bool isLoading = true;
  String? selectedValue;
  final List<String> items = ['Fruit', 'Vegetable', 'Livestock', 'All'];

  @override
  void initState() {
    _api.getProducts().then((value) {
      setState(() {
        myProducts.addAll(value);
        isLoading = false;
      });
    });
    super.initState();
  }

  // var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key("homePage"),
        // drawer: CustomDrawer(),
        floatingActionButton: CartFAB(),
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 70,
              collapsedHeight: 70,
              pinned: true,
              actions: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomDropdownButton2(
                                  dropdownWidth: 320,
                                  hint: selectedValue != null
                                      ? selectedValue.toString()
                                      : 'All',
                                  dropdownItems: items,
                                  value: selectedValue,
                                  onChanged: (value) async {
                                    setState(() {
                                      myProducts.clear();
                                      selectedFilterValues!.clear();
                                      isLoading = true;
                                    });
                                    var temp = await filterByCategory(value);
                                    setState(() {
                                      selectedValue = value;
                                      myProducts = temp;
                                      isLoading = false;
                                    });
                                  }),
                            ),
                            selectedValue == 'Livestock'
                                ? IconButton(
                                    icon: Icon(Icons.filter_alt),
                                    tooltip: 'Filter Icon',
                                    onPressed: () {
                                      openFilterDialog();
                                    },
                                  )
                                : SizedBox() //IconButton
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                              myProducts.length <= 0
                                  ? isLoading
                                      ? 'Loading...'
                                      : 'No result'
                                  : '${myProducts.length} results',
                              style: TextStyle(
                                  color: Theme.of(context).hintColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            myProducts.length == 0 && isLoading
                ? SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                : myProducts.length == 0 && !isLoading
                    ? SliverFillRemaining(
                        child: Center(child: Text('No Result')),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Column(
                            children: [
                              ProductCard(
                                product: myProducts[index],
                              ),
                              SizedBox(
                                height: 12,
                              )
                            ],
                          ),
                          childCount: myProducts.length,
                        ),
                      ),
            //+++++++
          ],
        ));
  }

  Future<List<Product>> filterByCategory(String? category) async {
    var products = await _api.getProducts();
    // var fruits = ;
    // var vegetables = [3];
    // var livestock = [10, 11];
    switch (category) {
      case 'Fruit':
        return products
            .where((element) => [2, 6, 4, 5].contains(element.productTypeId))
            .toList();
      case 'Vegetable':
        return products
            .where((element) => [3].contains(element.productTypeId))
            .toList();
      case 'Livestock':
        products = products
            .where((element) => [10, 11].contains(element.productTypeId))
            .toList();

        templivestock.clear();
        templivestock.addAll(products);
        print(templivestock.length);
        return products;
      case "All":
        return products;
      default:
        return products;
    }
  }

  // int generatePrice(String price) => int.parse(price);
  double generateAge(String price) => double.parse(price) < 4000
      ? 0.5
      : double.parse(price) >= 4000 && double.parse(price) <= 8000
          ? 2
          : 5;
  double generateWeight(String price) => double.parse(price) < 4000
      ? 12
      : double.parse(price) >= 4000 && double.parse(price) <= 8000
          ? 21
          : 32;

  Future<void> openFilterDialog() async {
    await FilterListDialog.display<FilterValue>(
      context,
      hideSearchField: true,
      hideSelectedTextCount: true,
      headlineText: 'Filter By...',
      listData: filterValues!,
      selectedListData: selectedFilterValues,
      choiceChipLabel: (item) => item!.filterLabel,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (item, query) {
        return item.filterLabel!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedFilterValues = List.from(list!);
          myProducts.clear();
        });
        Navigator.pop(context);
        setState(() {
          myProducts = filterLivestockList(selectedFilterValues!);
        });
      },
      themeData: FilterListThemeData(
        context,
        borderRadius: 5,
        choiceChipTheme: ChoiceChipThemeData(
          selectedBackgroundColor: Theme.of(context).primaryColor,
        ),
        headerTheme: HeaderThemeData(
          headerTextStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        controlButtonBarTheme: ControlButtonBarThemeData(
          context,
          buttonSpacing: 5,
          backgroundColor: Colors.white,
          // padding: EdgeInsets.symmetric(horizontal: 35),
          margin: EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300]!,
            ),
          ),
          controlButtonTheme: ControlButtonThemeData(
            borderRadius: 2,
            primaryButtonBackgroundColor: Theme.of(context).primaryColor,
            textStyle: TextStyle(color: Theme.of(context).primaryColor),
            primaryButtonTextStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      choiceChipBuilder: (context, item, isSelected) {
        return item.filterLabel != 'none'
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected!
                        ? Theme.of(context).primaryColor
                        : Colors.grey[300]!,
                  ),
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                ),
                child: Text(
                  item.filterLabel.toString(),
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey[500]),
                ),
              )
            : SizedBox(
                width: 200,
                height: 20,
              );
      },
    );
  }

  List<Product> filterLivestockList(List<FilterValue> filterlist) {
    List<Product> result = [];
    for (var element in templivestock) {
      result.add(element);
    }
    // print(templivestock.length);
    print(result.length);
    if (filterlist.length == 0) {
      // result.addAll(templivestock);
      return result;
    }
    for (var i = 0; i < filterlist.length; i++) {
      if (filterlist[i].filterType == 'Age')
        result = filterByAge(filterlist[i], result, templivestock);
      else if (filterlist[i].filterType == 'Weight')
        result = filterByWeight(filterlist[i], result, templivestock);
      else if (filterlist[i].filterType == 'Price')
        result = filterByPrice(filterlist[i], result, templivestock);
      else
        continue;
    }
    return result;
  }

  List<Product> filterByAge(
      FilterValue value, List<Product> result, List<Product> temp) {
    // print(result.length);
    switch (value.condition) {
      case 'isLessThan':
        // print(result.length);

        for (var element in temp) {
          if (!result.contains(element)) continue;
          if (double.parse(element.age!) >=
              double.parse(value.filterValue!.toString()))
            result.remove(element);
          print(result.length);
        }
        break;
      case 'isBetween':
        for (var element in temp) {
          if (!result.contains(element)) continue;
          if (!(double.parse(element.age!) >=
                  double.parse(value.filterLowerBound!.toString()) &&
              double.parse(element.age!) <=
                  double.parse(value.filterUpperBound!.toString())))
            result.remove(element);
        }
        break;
      case 'isGreaterThan':
        for (var element in temp) {
          if (!result.contains(element)) continue;
          if (double.parse(element.age!) <=
              double.parse(value.filterValue!.toString()))
            result.remove(element);
        }
        break;
      default:
        return result;
    }

    return result;
  }

  List<Product> filterByWeight(
      FilterValue value, List<Product> result, List<Product> temp) {
    switch (value.condition) {
      case 'isLessThan':
        for (var element in temp) {
          if (!result.contains(element)) continue;
          if (double.parse(element.weight!) >=
              double.parse(value.filterValue!.toString()))
            result.remove(element);
        }
        break;
      case 'isBetween':
        for (var element in temp) {
          if (!result.contains(element)) continue;
          if (!(double.parse(element.weight!) >=
                  double.parse(value.filterLowerBound!.toString()) &&
              double.parse(element.weight!) <=
                  double.parse(value.filterUpperBound!.toString())))
            result.remove(element);
        }
        break;
      case 'isGreaterThan':
        for (var element in temp) {
          if (!result.contains(element)) continue;
          if (double.parse(element.weight!) <=
              double.parse(value.filterValue!.toString()))
            result.remove(element);
        }
        break;
      default:
        return result;
    }
    return result;
  }

  List<Product> filterByPrice(
      FilterValue value, List<Product> result, List<Product> temp) {
    switch (value.condition) {
      case 'isLessThan':
        for (var element in temp) {
          if (!result.contains(element)) continue;
          if (double.parse(element.price!) >
              double.parse(value.filterValue!.toString()))
            result.remove(element);
        }
        break;
      case 'isBetween':
        for (var element in temp) {
          if (!result.contains(element)) continue;
          if (!(double.parse(element.price!) >=
                  double.parse(value.filterLowerBound!.toString()) &&
              double.parse(element.price!) <=
                  double.parse(value.filterUpperBound!.toString())))
            result.remove(element);
        }
        break;
      case 'isGreaterThan':
        for (var element in temp) {
          if (!result.contains(element)) continue;
          if (double.parse(element.price!) <=
              double.parse(value.filterValue!.toString()))
            result.remove(element);
        }
        break;
      default:
        return result;
    }
    return result;
  }
}
