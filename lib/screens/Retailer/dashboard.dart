import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailer_app/APIs/Product_API.dart';
import 'package:retailer_app/models/Category.dart';
import 'package:retailer_app/models/Product.dart';
import 'package:retailer_app/models/filter_by.dart';
import 'package:retailer_app/repo/product_repo.dart';
import 'package:retailer_app/widgets/Cards/prodcut_card.dart';
import 'package:retailer_app/widgets/FAB/cart_fab.dart';
import 'package:retailer_app/widgets/appbar/transsion_appbar.dart';
import 'package:retailer_app/widgets/sidebar_drawer/CustomDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetailerDashboardScreen extends StatefulWidget {
  const RetailerDashboardScreen({Key? key}) : super(key: key);
  @override
  RetailerDashboardScreenState createState() => RetailerDashboardScreenState();
}

class RetailerDashboardScreenState extends State<RetailerDashboardScreen> {
  List<Product> myProducts = [];
  List<Category> categories = [];
  List<Product> filteredProducts = [];
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

  Category? _selectedCategory;

  final ProductApi _api = ProductApi();

  late SharedPreferences logindata;
  late String username;

  @override
  void initState() {
    _api.getProducts().then((value) {
      _api.getCategories().then((value) {
        setState(() {
          print(value[0]);
          // Category all = Category.fromJson(parsedJson)
          categories = value;
          categories.add(Category.addAllCategory());
        });
      });
      setState(() {
        myProducts.addAll(value);
        filteredProducts = myProducts;
        print(myProducts.length);
        print(myProducts.where((element) => element.name == "papaya"));
        isLoading = false;
      });
    });

    initial();
    super.initState();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ProductRepository provider =
    //     Provider.of<ProductRepository>(context, listen: false);

    // provider.getAllProducts().then((products) {
    //   setState(() {
    //     myProducts = products;
    //   });
    //   print('*************************$myProducts');
    // });

    return Scaffold(
        key: Key('dashboard'),
        floatingActionButton: CartFAB(),
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text('Welcome'),
          centerTitle: true,
        ),
        body: CustomScrollView(slivers: [
          TransitionAppBar(
            // extent: 100,
            avatar: Container(
              color: Colors.white,
              child: CarouselSlider(
                options: CarouselOptions(height: 193.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  if (i == 2) {
                    return Builder(builder: (BuildContext context) {
                      return Image.network(
                        'https://t3.ftcdn.net/jpg/03/35/74/56/240_F_335745675_MaxYxSsadrviZdThITuHB2oCohYOiwEu.jpg',
                        fit: BoxFit.cover,
                      );
                    });
                  } else {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.network(
                          'https://t3.ftcdn.net/jpg/02/37/13/40/240_F_237134053_mMD2IsElBsFaqYoUpZHy8HAkE2WPIcju.jpg',
                          fit: BoxFit.fill,
                        );
                      },
                    );
                  }
                }).toList(),
              ),
            ),
            title: Container(
              padding: EdgeInsets.only(left: 0, right: 20, top: 12, bottom: 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300)),
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Text(
                  //   'Filter',
                  //   style: TextStyle(
                  //       fontSize: 14, fontWeight: FontWeight.w600),
                  // ),
                  // DropdownButton(
                  //   // value: _selectedCategory?.name ?? 'All',
                  //   value: _selectedCategory,
                  //   hint: Text('Filter By Category'),
                  //   items: categories.map((Category category) {
                  //     return DropdownMenuItem(
                  //       child: Text(category.name!),
                  //       value: category,
                  //     );
                  //   }).toList(),
                  //   onChanged: (Category? value) {
                  //     _selectedCategory = value;
                  //     filterByCategory(value!);

                  //     print('val:' + value.toString());
                  //   },
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                    buttonHeight: 40,
                                    buttonPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    // dropdownWidth: 320,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    isExpanded: true,
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                    ),
                                    hint: Text(_selectedCategory != null
                                        ? _selectedCategory.toString()
                                        : 'All'),
                                    items: categories.map((Category category) {
                                      return DropdownMenuItem(
                                        child: Text(category.name!),
                                        value: category,
                                      );
                                    }).toList(),
                                    value: _selectedCategory,
                                    onChanged: (Category? value) async {
                                      setState(() {
                                        // selectedFilterValues!.clear();
                                        _selectedCategory = value;

                                        isLoading = true;
                                        // category.productTypes!.first.id
                                        // print(value!.productTypes!.first.id);
                                      });
                                      filterByCategory(value!);
                                      // setState(() {
                                      //   // _selectedCategory = value;
                                      //   // myProducts = temp;
                                      //   isLoading = false;
                                      // });
                                    }),
                              ),
                            ),
                            _selectedCategory?.name == 'Livestock'
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
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                                filteredProducts.length <= 0
                                    ? isLoading
                                        ? 'Loading...'
                                        : 'No result'
                                    : '${filteredProducts.length} results',
                                style: TextStyle(
                                    color: Theme.of(context).hintColor)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          filteredProducts.length == 0 && isLoading
              ? SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              : filteredProducts.length == 0 && !isLoading
                  ? SliverFillRemaining(
                      child: Center(child: Text('No Result')),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Column(
                          children: [
                            ProductCard(
                              product: filteredProducts[index],
                            ),
                            SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                        childCount: filteredProducts.length,
                      ),
                    ),
          //   SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //       (context, index) => Column(
          //         children: [
          //           ProductCard(
          //             product: filteredProducts[index],
          //           ),
          //           SizedBox(
          //             height: 12,
          //           )
          //         ],
          //       ),
          //       childCount: filteredProducts.length,
          //     ),
          //   ),
        ])
        // : Center(child: CircularProgressIndicator()),
        );
  }

  void filterByCategory(Category category) {
    if (category.name == "All") {
      setState(() {
        filteredProducts = myProducts;
      });
      return;
    } else {
      List<Product> temp = [];
      for (var i = 0; i < myProducts.length; i++) {
        for (var element in category.productTypes!) {
          if (myProducts[i].productTypeId == element.id)
            temp.add(myProducts[i]);
        }
      }

      setState(() {
        // filteredProducts.clear();

        filteredProducts = temp;
        isLoading = false;
        if (category.name == "Livestock") {
          templivestock.clear();
          templivestock.addAll(filteredProducts);
        }
      });
    }
  }

  // void zfilterByCategory(Category? category) async {
  //   // var products = await _api.getProducts();
  //   // var fruits = ;
  //   // var vegetables = [3];
  //   // var livestock = [10, 11];
  //   // switch (category) {
  //   //   case 'Fruit':
  //   //     return products
  //   //         .where((element) => [2, 6, 4, 5].contains(element.productTypeId))
  //   //         .toList();
  //   //   case 'Vegetable':
  //   //     return products
  //   //         .where((element) => [3].contains(element.productTypeId))
  //   //         .toList();
  //   //   case 'Livestock':
  //   //     products = products
  //   //         .where((element) => [10, 11].contains(element.productTypeId))
  //   //         .toList();

  //   //     templivestock.clear();
  //   //     templivestock.addAll(products);
  //   //     print(templivestock.length);
  //   //     return products;
  //   //   case "All":
  //   //     return products;
  //   //   default:
  //   //     return products;
  //   // }
  //   setState(() {
  //     filteredProducts = myProducts
  //         .where((product) =>
  //             product.productTypeId == category!.productTypes!.first.id)
  //         .toList();
  //   });
  // }

  // int generatePrice(String price) => int.parse(price);
  // double generateAge(String price) => double.parse(price) < 4000
  //     ? 0.5
  //     : double.parse(price) >= 4000 && double.parse(price) <= 8000
  //         ? 2
  //         : 5;
  // double generateWeight(String price) => double.parse(price) < 4000
  //     ? 12
  //     : double.parse(price) >= 4000 && double.parse(price) <= 8000
  //         ? 21
  //         : 32;

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
          filteredProducts.clear();
        });
        Navigator.pop(context);
        setState(() {
          filteredProducts = filterLivestockList(selectedFilterValues!);
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
