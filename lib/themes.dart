import 'package:flutter/material.dart';

class Themes {
  // Shared Values
  final _fontFamily = 'Nunito';

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromRGBO(22, 22, 22, 1),
        fontFamily: _fontFamily,
      );

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        fontFamily: _fontFamily,
      );
}
