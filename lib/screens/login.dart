import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:retailer_app/APIs/Account_API.dart';
import 'package:retailer_app/constants/Constants.dart';
import 'package:retailer_app/models/Account.dart';
import 'package:retailer_app/routes/route_path.dart';
import 'package:retailer_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  Account currentUser = new Account();

  AccountAPI _accountAPI = AccountAPI();

  late SharedPreferences logindata;
  late bool newuser;
  bool obscureText = true;

  ConstVals _constVals = ConstVals();
  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    // newuser = true;
    if (newuser == false) {
      logindata.getBool('isVendor')!
          ? Navigator.pushReplacementNamed(
              context, RoutePaths.merchant_dashboard)
          : Navigator.pushReplacementNamed(
              context, RoutePaths.retailer_dashboard);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 24, bottom: 24, left: 20, right: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 128,
                  child: Placeholder(
                    fallbackHeight: 40,
                    fallbackWidth: 128,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 32, top: 16),
                  child: Text(
                    'Login with your email & password',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextFormField(
                        controller: username_controller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            TextButton(
                              onPressed: () {
                                print('Forgotted Password!');
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ]),
                      TextFormField(
                        controller: password_controller,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () => setState(() {
                              obscureText = !obscureText;
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 335,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      String username = username_controller.text;
                      String password = password_controller.text;
                      if (username != '' && password != '') {
                        _accountAPI.login(username, password).then((value) {
                          print(value);
                          print('Successfull');
                          logindata.setBool('login', false);
                          logindata.setString('username', username);
                          logindata.setString('token', value['token']!);
                          logindata.setString(
                              'refreshToken', value['refreshToken']!);

                          currentUser = Account.fromJson(value['account']);
                          logindata.setBool('isVendor', currentUser.isVendor);
                          logindata.setString('userId', currentUser.id!);
                          currentUser.isVendor
                              ? Navigator.pushReplacementNamed(
                                  context, RoutePaths.merchant_dashboard)
                              : Navigator.pushReplacementNamed(
                                  context, RoutePaths.retailer_dashboard);
                        });
                        // Navigator.pushNamed(
                        //     context, RoutePaths.retailer_dashboard);
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '''Don't have any account? ''',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutePaths.register_main);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
