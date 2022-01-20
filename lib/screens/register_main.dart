import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailer_app/config/colorPallet.dart';

class RegisterMain extends StatelessWidget {
  const RegisterMain({Key? key}) : super(key: key);

//TODO: revisit input field colors.
  @override
  Widget build(BuildContext context) {
    var selectedrole;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    // prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    // prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusColor: ColorPallet.accentcolor,
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Register as',
                          style: TextStyle(fontSize: 16),
                        ),
                        RadioListTile(
                          value: 1,
                          selected: selectedrole == 1,
                          groupValue: 0,
                          onChanged: (_) {},
                          title: Text('Retailer'),
                          activeColor: ColorPallet.accentcolor,
                        ),
                        RadioListTile(
                          value: 2,
                          selected: selectedrole == 2,
                          groupValue: 0,
                          onChanged: (val) {
                            selectedrole = val;
                          },
                          title: Text('Wholesaler'),
                          activeColor: ColorPallet.accentcolor,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      minWidth: 100,
                      height: 40,
                      onPressed: () => print("Successul Login."),
                      color: ColorPallet.darkGrey,
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    MaterialButton(
                      minWidth: 100,
                      height: 40,
                      onPressed: () => print("Successul Login."),
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Sing Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
