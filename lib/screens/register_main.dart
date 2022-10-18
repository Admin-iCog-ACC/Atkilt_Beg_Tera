import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:retailer_app/APIs/Account_API.dart';
import 'package:retailer_app/config/colorPallet.dart';
import 'package:retailer_app/routes/route_path.dart';

class RegisterMain extends StatefulWidget {
  const RegisterMain({Key? key}) : super(key: key);

  @override
  State<RegisterMain> createState() => _RegisterMainState();
}

class _RegisterMainState extends State<RegisterMain> {
  final _fullnameFormKey = GlobalKey<FormState>();
  final _phoneNoFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordformKey = GlobalKey<FormState>();
  final _confirmPasswordformKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _fullNameController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;
  TextEditingController? _passwordController;
  TextEditingController? _confirmPasswordController;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool _autoValidate = false;
  bool _wholeSalerSelected = false;
  var selectedrole;
  AccountAPI _accountAPI = AccountAPI();

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    selectedrole = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Create an account',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                // TextFormField(
                //   keyboardType: TextInputType.emailAddress,
                //   decoration: InputDecoration(
                //     labelText: 'Full Name',
                //     border: OutlineInputBorder(
                //         borderSide: BorderSide(
                //             color: Theme.of(context).colorScheme.secondary,
                //             style: BorderStyle.solid),
                //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
                //     // prefixIcon: Icon(Icons.email),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // TextFormField(
                //   keyboardType: TextInputType.phone,
                //   decoration: InputDecoration(
                //     labelText: 'Phone Number',
                //     border: OutlineInputBorder(
                //         borderSide: BorderSide(
                //             color: Theme.of(context).colorScheme.secondary,
                //             style: BorderStyle.solid),
                //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
                //     // prefixIcon: Icon(Icons.email),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // TextFormField(
                //   keyboardType: TextInputType.visiblePassword,
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     floatingLabelBehavior: FloatingLabelBehavior.never,
                //     focusColor: ColorPallet.accentcolor,
                //     labelText: 'Password',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //     ),
                //     suffixIcon: IconButton(
                //       icon: Icon(Icons.remove_red_eye),
                //       onPressed: () => setState(() {
                //         obscureText = !obscureText;
                //       }),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 12),
                //   child: Text(
                //     'Full Name',
                //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                //   ),
                // ),
                TextFormField(
                  controller: _fullNameController,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Full name is required"),
                    PatternValidator(r'(\b \b)',
                        errorText: "Please enter first and last name"),
                  ]),
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                      labelText: "Full Name",
                      labelStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                ),
                SizedBox(
                  height: 30,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 12),
                //   child: Text(
                //     'Phone No',
                //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                //   ),
                // ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Phone No is required"),
                    LengthRangeValidator(
                        min: 9, max: 9, errorText: "Invalid Phone No")
                  ]),
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                      labelText: "Phone No",
                      labelStyle: TextStyle(fontSize: 14),
                      prefixText: "+251 ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: MultiValidator([
                    EmailValidator(errorText: "Invalid Email"),
                    RequiredValidator(errorText: "Email is required")
                  ]),
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: obscurePassword,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'password is required'),
                    MinLengthValidator(8,
                        errorText: 'password less than 8 characters'),
                  ]),
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () => setState(() {
                          obscurePassword = !obscurePassword;
                        }),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: obscureConfirmPassword,
                  validator: ((value) =>
                      MatchValidator(errorText: "Password doesn't match")
                          .validateMatch(
                              value!, _passwordController!.text.toString())),
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () => setState(() {
                          obscureConfirmPassword = !obscureConfirmPassword;
                        }),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                ),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Password',
                //         style: TextStyle(
                //             fontSize: 14, fontWeight: FontWeight.w600),
                //       ),
                //       TextButton(
                //         onPressed: () {
                //           print('Forgotted Password!');
                //         },
                //         child: Text(
                //           'Forgot Password?',
                //           style: TextStyle(
                //             color: Theme.of(context).primaryColor,
                //             fontSize: 12.0,
                //           ),
                //         ),
                //       ),
                //     ]),
                // TextFormField(
                //   controller: _passwordController,
                //   keyboardType: TextInputType.visiblePassword,
                //   obscureText: obscureText,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //     ),
                //     suffixIcon: IconButton(
                //       icon: Icon(Icons.remove_red_eye),
                //       onPressed: () => setState(() {
                //         obscureText = !obscureText;
                //       }),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Register as',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RadioListTile(
                          value: 1,
                          selected: selectedrole == 1,
                          groupValue: selectedrole == 1 ? 1 : 0,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          onChanged: (value) {
                            setState(() {
                              selectedrole = value;
                              // _retailerSelected = true;
                              // _wholeSalerSelected = false;
                              print(value);
                              print(selectedrole);
                              // _value = true;
                            });
                          },
                          title: Text(
                            'Retailer',
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text("Browse and buy different products",
                              style: TextStyle(fontSize: 12)),
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        RadioListTile(
                          value: 2,
                          selected: selectedrole == 2,
                          groupValue: selectedrole == 2 ? 2 : 0,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          onChanged: (value) {
                            setState(() {
                              selectedrole = value;
                              // _retailerSelected = false;
                              // _wholeSalerSelected = true;
                              print(value);
                              print(selectedrole);
                              // _value = true;
                            });
                          },
                          title: Text(
                            'Wholesaler',
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text("Provide products for sell",
                              style: TextStyle(fontSize: 12)),
                          activeColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MaterialButton(
                        minWidth: 100,
                        height: 48,
                        onPressed: () {
                          setState(() {
                            _autoValidate = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            String fullName = _fullNameController!.text;
                            String password = _passwordController!.text;
                            String email = _emailController!.text;
                            String phone = _phoneController!.text;
                            bool isVendor = selectedrole == 2 ? true : false;

                            try {
                              _accountAPI
                                  .signup(email, password, fullName, isVendor)
                                  .then(((value) async {
                                if (value
                                    .toString()
                                    .contains("Signed up successfully")) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration: Duration(seconds: 3),
                                        content: Text(
                                          'Signed up successfully',
                                        )),
                                  );
                                  await Future.delayed(Duration(seconds: 4));
                                  Navigator.popAndPushNamed(
                                      context, RoutePaths.signin);
                                } else if (value.toString().contains(
                                    "Email is registered to an existing account")) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Email is registered to an existing account',
                                      ),
                                    ),
                                  );
                                }
                              }));
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                  'Error: ${e.toString()}',
                                )),
                              );
                            }

                            print(fullName +
                                " " +
                                password +
                                " " +
                                email +
                                " " +
                                phone);
                          }
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // MaterialButton(
                    //   minWidth: 100,
                    //   height: 40,
                    //   onPressed: () => print("Successul Login."),
                    //   color: ColorPallet.darkGrey,
                    //   child: Text(
                    //     'Cancel',
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w600,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                // SizedBox(
                //   height: 30,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '''Already have an Account? ''',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, RoutePaths.signin);
                      },
                      child: Text(
                        'Sign in',
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
