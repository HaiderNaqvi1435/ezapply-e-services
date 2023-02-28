import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xFFF243665),
    colorScheme: ColorScheme.light(
        primary: Color(0xFFF243665),
        onPrimary: Colors.white,
        secondary: Color(0xFFF8BD8BD),
        //old secondary  Color.fromARGB(255, 176, 190, 197),
        onSecondary: Colors.white,
        error: const Color.fromARGB(255, 195, 44, 33),
        onError: Colors.red,
        background: const Color.fromARGB(255, 236, 239, 241),
        onBackground: Colors.black,
        surface: const Color.fromARGB(255, 224, 224, 224),
        onSurface: Colors.black),
  );
}
