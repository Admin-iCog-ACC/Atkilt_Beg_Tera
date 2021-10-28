
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailer_app/config/colorPallet.dart';

class RegisterMain extends StatelessWidget {
  const RegisterMain({Key? key}) : super(key: key);
//TODO: revisit input field colors.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 36
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).accentColor,style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
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
                        borderSide: BorderSide(color: Theme.of(context).accentColor,style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
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

                  children: [
                    Text(
                      'Register as',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                    Radio(groupValue: 'register_as', value: 'Wholesaler', onChanged: null),
                    Radio(groupValue: 'register_as', value: 'Retailer', onChanged: null),
                  ],
                )
          ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    MaterialButton(
                      minWidth: 140,
                      height: 50,
                      onPressed: () => print("Successul Login."),
                      color: ColorPallet.darkGrey,
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    MaterialButton(
                      minWidth: 140,
                      height: 50,
                      onPressed: () => print("Successul Login."),
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Sing In',
                        style: TextStyle(
                          fontSize: 20,
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