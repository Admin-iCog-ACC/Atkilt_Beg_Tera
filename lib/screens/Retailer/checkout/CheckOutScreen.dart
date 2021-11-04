import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  CheckOutScreenState createState() => CheckOutScreenState();
}

class CheckOutScreenState extends State<CheckOutScreen> {
  static String selected = 'EXPRESS';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print('object');
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              ))
        ],
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 8.0,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(15),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Align(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  alignment: Alignment.center,
                                )),
                            Text(
                              'Contact Number',
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          child: Text(
                            '+251936658395',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

//billing Card
                Card(
                  margin: EdgeInsets.only(top: 15),
                  elevation: 8.0,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(15),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Align(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  alignment: Alignment.center,
                                )),
                            Text(
                              'Billing Address',
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          child: Text(
                            'Addis Ababa, Bole, Ring Road, St.1012',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //Shipping Card
                Card(
                  margin: EdgeInsets.only(top: 15),
                  elevation: 8.0,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(15),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Align(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  alignment: Alignment.center,
                                )),
                            Text(
                              'Shipping Address',
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          child: Text(
                            'Addis Ababa, Bole, Ring Road, St.1012',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

//Delivery Schedule Card

                Card(
                  margin: EdgeInsets.only(top: 15),
                  elevation: 8.0,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(15),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                child: Align(
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  alignment: Alignment.center,
                                )),
                            Text(
                              'Delivery Schedule',
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'EXPRESS';
                            });
                          },
                          child: Container(
                              decoration: selected == 'EXPRESS'
                                  ? BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor),
                                    )
                                  : BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      // border: Border.all(
                                      //     color: Theme.of(context).primaryColor),
                                      color: Colors.grey),
                              margin: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              padding: EdgeInsets.all(15),
                              alignment: Alignment.center,
                              child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Express',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '90 min express delivery',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                    ],
                                  ))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'MORNING';
                            });
                          },
                          child: Container(
                            decoration: selected == 'MORNING'
                                ? BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                  )
                                : BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    // border: Border.all(
                                    //     color: Theme.of(context).primaryColor),
                                    color: Colors.grey),
                            margin: EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Morning',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '2:00LT - 5:00LT',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'NOON';
                            });
                          },
                          child: Container(
                            decoration: selected == 'NOON'
                                ? BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                  )
                                : BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    // border: Border.all(
                                    //     color: Theme.of(context).primaryColor),
                                    color: Colors.grey),
                            margin: EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Noon',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '5:00LT - 8:00LT',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'AFTERNOON';
                            });
                          },
                          child: Container(
                            decoration: selected == 'AFTERNOON'
                                ? BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                  )
                                : BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    // border: Border.all(
                                    //     color: Theme.of(context).primaryColor),
                                    color: Colors.grey),
                            margin: EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Afternoon',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '8:00LT - 11:00LT',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'EVENING';
                            });
                          },
                          child: Container(
                            decoration: selected == 'EVENING'
                                ? BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                  )
                                : BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    // border: Border.all(
                                    //     color: Theme.of(context).primaryColor),
                                    color: Colors.grey),
                            margin: EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Evening',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '11:00LT - 2:00LT',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ],
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 2,
                  endIndent: 5,
                  indent: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Total',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            'Br500.00',
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            'Br200.00',
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            'Br700.00',
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 2,
                  endIndent: 5,
                  indent: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  height: 48,
                  minWidth: 350,
                  onPressed: () {
                    print('object');
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Place Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }
}
