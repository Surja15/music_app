
import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //light mode first
  ThemeData _themeData = lightMode;

  //get theme
  ThemeData get themeData => _themeData;
  
  //bool for is dark mode

  bool get isDarkMode => _themeData == darkMode;

  //setter for theme

  set themeData(ThemeData themeData)
  {
    _themeData = themeData;
    notifyListeners();
  }
  
  //toggle theme
  void toggleTheme()
  {
    if(_themeData == lightMode)
    {
      themeData= darkMode;
    }else
    {
      themeData= lightMode;
    }
  }

}