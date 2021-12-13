import 'package:flutter/material.dart';

class MyShop extends StatefulWidget {
  const MyShop({Key? key}) : super(key: key);

  @override
  MyShopState createState() => MyShopState();
}

class MyShopState extends State<MyShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 24),
                    padding: EdgeInsets.only(
                        left: 24, right: 24, bottom: 32, top: 32),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.brown,
                          radius: 142 / 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8, top: 20),
                          child: Text(
                            'My Shop',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 24),
                          child: Text(
                            'The furniture shop is the best shop around the city. This is being run under the store owner and our aim is to provide quality product and hassle free customer service.',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(0XFF, 107, 114, 128)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.pin_drop,
                                size: 16,
                                color: Color.fromARGB(0XFF, 209, 213, 219),
                              ),
                              Container(
                                width: 250,
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  '588 Finwood Road, New Jersey, East Dover, 08753, USA',
                                  softWrap: true,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(0XFF, 107, 114, 128)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone_sharp,
                                size: 16,
                                color: Color.fromARGB(0XFF, 209, 213, 219),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  '21342121221',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(0XFF, 107, 114, 128)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 24),
                    padding: EdgeInsets.only(
                        left: 24, right: 24, bottom: 32, top: 32),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(),
                          child: Text('Registered Since',
                              style: TextStyle(
                                  color: Color.fromARGB(0XFF, 107, 114, 128))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(),
                          child: Text('June 27,2020',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        // Divider(),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 16),
                        //   child: Text('Paymnet Information'),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(),
                        //   child: Text('data'),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(),
                        //   child: Text('data'),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(),
                        //   child: Text('data'),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(),
                        //   child: Text('data'),
                        // ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 24, bottom: 24),
                    padding: EdgeInsets.only(
                        left: 16, right: 16, bottom: 16, top: 16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Prodcuts',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color.fromARGB(0XFF, 209, 213, 219)
                                .withOpacity(0.5),
                          )),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 2),
                                      child: Text(
                                        '55',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(),
                                      child: Text(
                                        'Total Products',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                0XFF, 107, 114, 128)),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color.fromARGB(0XFF, 209, 213, 219)
                                .withOpacity(0.5),
                          )),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 2),
                                      child: Text(
                                        '0',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(),
                                      child: Text(
                                        'Total Orders',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                0XFF, 107, 114, 128)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(),
                          child: Text(
                            'Revenue',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color.fromARGB(0XFF, 209, 213, 219)
                                .withOpacity(0.5),
                          )),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 2),
                                      child: Text(
                                        'Br0',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(),
                                      child: Text(
                                        'Gross Sales',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                0XFF, 107, 114, 128)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
