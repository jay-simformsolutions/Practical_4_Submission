import 'package:flutter/material.dart';

import '../Utils/colors.dart';

ThemeData themeData = ThemeData(
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: CommonColors.lightGreenColor,
      fontSize: 35,
      fontWeight: FontWeight.w500,
      fontFamily: 'NotoSerif',
    ),

    titleLarge: TextStyle(
      color: CommonColors.blackColor,
      fontSize: 50,
      fontFamily: 'NotoSerif',
      fontWeight: FontWeight.bold,
    ),

    //For Sign up and SignIn Text in Button

    titleMedium: TextStyle(
      color: CommonColors.lightGreenColor,
      fontSize: 20,
      fontFamily: 'NotoSerif',
      fontWeight: FontWeight.bold,
    ),

    titleSmall: TextStyle(
      color: CommonColors.lightGreyColor,
      fontSize: 25,
      fontFamily: 'NotoSerif',
    ),

    //For the Below of the Button in Both Screen
    bodySmall: TextStyle(
      fontFamily: 'NotoSerif',
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: CommonColors.lightGreyColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      backgroundColor: CommonColors.lightGreenColor,
      fixedSize: const Size(350, 40),
    ),
  ),
);
