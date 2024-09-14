// lib/theme.dart
import 'package:flutter/cupertino.dart';

class AppTheme {
  static const CupertinoThemeData lightTheme = CupertinoThemeData(
    primaryColor: CupertinoColors.black,
    barBackgroundColor: CupertinoColors.white,
    scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
    applyThemeToAll: true,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.black,
      textStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 16.0,
        fontFamily: 'Poppins',
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 16.0,
        fontFamily: 'Poppins',
      ),
      tabLabelTextStyle: TextStyle(
        color: CupertinoColors.inactiveGray,
        fontSize: 10.0,
        fontFamily: 'Poppins',
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
      navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
      pickerTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 16.0,
        fontFamily: 'Poppins',
      ),
      dateTimePickerTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 16.0,
        fontFamily: 'Poppins',
      ),
    ),
  );

  static const CupertinoThemeData darkTheme = CupertinoThemeData(
    primaryColor: CupertinoColors.white,
    barBackgroundColor: CupertinoColors.black,
    scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
    applyThemeToAll: true,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
      textStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 16.0,
        fontFamily: 'Poppins',
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 16.0,
        fontFamily: 'Poppins',
      ),
      tabLabelTextStyle: TextStyle(
        color: CupertinoColors.inactiveGray,
        fontSize: 10.0,
        fontFamily: 'Poppins',
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
      navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
      pickerTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 16.0,
        fontFamily: 'Poppins',
      ),
      dateTimePickerTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 16.0,
        fontFamily: 'Poppins',
      ),
    ),
  );
}