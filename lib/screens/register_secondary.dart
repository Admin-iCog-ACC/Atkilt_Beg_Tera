import 'package:flutter/material.dart';
import 'package:retailer_app/config/colorPallet.dart';

class RegisterSecondary extends StatelessWidget {
  const RegisterSecondary({Key? key}) : super(key: key);
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
                  'Finish setting up your account',
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 22),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Company Name',
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
                    labelText: 'Business Phone Number',
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Tax Payer Identification Number',
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).accentColor,style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    // prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
MaterialButton( onPressed: () => print("Successul Login."),
child: Text("Skip", style: TextStyle(color: ColorPallet.darkGrey),),),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(value: true, onChanged: null),
                    Text('I agree to the terms and conditions.')
                  ],
                ),


                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    height: 150,
                    onPressed: () => print("Successul Login."),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
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