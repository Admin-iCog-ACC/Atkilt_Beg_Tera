import 'package:flutter/material.dart';
import 'package:retailer_app/routes/route_path.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
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
                        controller: myController,
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
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          suffixIcon: Icon(Icons.remove_red_eye),
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
                      myController.text == 'retailer'
                          ? Navigator.pushNamed(
                              context, RoutePaths.retailer_dashboard)
                          : Navigator.pushNamed(
                              context, RoutePaths.retailer_dashboard);
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
                        print('Register');
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
