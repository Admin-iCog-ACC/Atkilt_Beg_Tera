import 'package:flutter/material.dart';
import 'colorPallet.dart';

class CustomTheme with ChangeNotifier {
  static ThemeData get lightTheme {
    return ThemeData(
        fontFamily: 'Signika',
        cardColor: Colors.white,
        scaffoldBackgroundColor: Color.fromARGB(0XFF, 243, 244, 246),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorPallet.accentcolor, width: 2.0),
          ),
        ),
        canvasColor: Colors.white,
        textTheme: TextTheme(
          headline2: TextStyle(fontSize: 18, color: Colors.black),
          headline4: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          headline1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          headline3: TextStyle(fontSize: 26, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        primaryColor: ColorPallet.maincolor,
        accentColor: ColorPallet.accentcolor,
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          buttonColor: ColorPallet.orange_button,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: ColorPallet.maincolor,
        scaffoldBackgroundColor: Colors.grey,
        fontFamily: 'Signika',
        textTheme: TextTheme(
          headline2: TextStyle(fontSize: 18, color: Colors.black),
          headline4: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          headline1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          headline3: TextStyle(fontSize: 26, color: Colors.black),

          // headline5: TextStyle(fontSize: 18),
          // headline6: TextStyle(fontSize: 20),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: ColorPallet.orange_button,
        ));
  }

  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
