
import 'package:flutter/material.dart';
import 'package:retailer_app/config/config.dart';
import 'colorPallet.dart';

class CustomTheme with ChangeNotifier{
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
        primaryColor: ColorPallet.maincolor,
        accentColor: ColorPallet.accentcolor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Signika',
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: ColorPallet.orange_button,
        )
    );
  }


  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: ColorPallet.darkGrey,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Signika',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: ColorPallet.orange_button,
        )
    );
  }

  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}




