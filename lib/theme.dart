// lib/theme.dart
import 'package:flutter/cupertino.dart';

class AppTheme {
  static const CupertinoThemeData cupertinoTheme = CupertinoThemeData(
    primaryColor: CupertinoColors.black,
    barBackgroundColor: CupertinoColors.white,
    scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.black,
      textStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 16.0,
      ),
      actionTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 16.0,
      ),
      tabLabelTextStyle: TextStyle(
        color: CupertinoColors.inactiveGray,
        fontSize: 10.0,
      ),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
      ),
      pickerTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 16.0,
      ),
      dateTimePickerTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 16.0,
      ),
    ),
  );
}