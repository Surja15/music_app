import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(background: Colors.grey.shade300,
  primary: Colors.grey.shade500,
  secondary: Colors.grey.shade200,
   inversePrimary: Colors.grey.shade900),
   dividerTheme: const DividerThemeData(color: Colors.transparent),    //Bug fix #1, had a divder appear by default, had to set it to transparent in both themedata
appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade400,
    titleTextStyle:
    TextStyle(color: Colors.grey.shade900,) //Bug #5 somehow textstyle works in light mode. they just hate dark mode i guess. so i had to manually apply it here for uniformity.
),
textTheme: TextTheme(
    headline6: TextStyle(fontWeight: FontWeight.bold),
    bodyText2: TextStyle(color: Colors.black), 
  ),
);