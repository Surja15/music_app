import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(background: Colors.grey.shade700,
  primary: Colors.grey.shade600,
  secondary: Colors.grey.shade700,
   inversePrimary: Colors.grey.shade300),
   dividerTheme: const DividerThemeData(color: Colors.transparent),
   
   appBarTheme: AppBarTheme( //Bug #2 need to set appbar theme manually. 
    backgroundColor: Colors.grey.shade800, 
    titleTextStyle:
    TextStyle(color: Colors.grey.shade200,),
  //Bug #4 need to set appbar text theme manually, as texttheme doesnt apply here somehow.
    iconTheme: IconThemeData(color: Colors.grey.shade200,), //Bug #7 Need to manually change icon color/theme in dark mode.
),
textTheme: TextTheme(
    headline6: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade200),
    bodyText2: TextStyle(color: Colors.grey.shade200), //Bug #3 need to set text theme manually for dark mode, no easy adapt
  ),
);

// Bug #6 Icons, text in drawer dont change color in dark mode. Fixed it manually.