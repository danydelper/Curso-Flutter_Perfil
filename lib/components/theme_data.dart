import 'package:flutter/material.dart';

class ThemeDataPerfil {
  static final vColorPri = Color.fromARGB(255, 67, 85, 248);
  static final vColorSec = Color.fromARGB(255, 229, 115, 115);
  static final vColorTer = Color.fromARGB(255, 255, 193, 7);
  static final vColorBlack = Color.fromARGB(138, 0, 0, 0); //black54
  static final vColorWhite = Color.fromARGB(255, 255, 255, 255); //black54

  ThemeDataPerfil._();

  static ThemeData getLight() {
    return ThemeData(
      primaryColorLight: vColorTer,
      primaryColor: vColorPri,
      // primarySwatch: Colors.red,
      appBarTheme: AppBarTheme(
        backgroundColor: vColorPri,
      ),
      scaffoldBackgroundColor: vColorWhite,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: vColorPri,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        bodyText2: TextStyle(
          color: vColorSec,
        ),
      ),
      dividerColor: vColorTer,
      listTileTheme: ListTileThemeData(
        textColor: vColorBlack,
        iconColor: vColorPri,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: vColorTer,
        actionTextColor: vColorPri,
      ),
    );
  }

  static ThemeData getDart() {
    return ThemeData(
      primaryColorLight: vColorWhite,
      primaryColor: vColorPri,
      // primarySwatch: Colors.red,
      appBarTheme: AppBarTheme(
        backgroundColor: vColorBlack,
      ),
      scaffoldBackgroundColor: vColorBlack,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: vColorPri,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        bodyText2: TextStyle(
          color: vColorWhite,
        ),
      ),
      dividerColor: vColorTer,
      listTileTheme: ListTileThemeData(
        textColor: vColorWhite,
        iconColor: vColorPri,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: vColorTer,
        actionTextColor: vColorPri,
      ),
    );
  }
}
